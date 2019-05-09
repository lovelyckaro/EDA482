#include "graphics.h"
#include <libGPIO.h>
#include <libdelay.h>

#define BITMASK_E 0x40
#define BITMASK_SELECT 0x4
#define BITMASK_RW 0x2
#define BITMASK_RS 0x1
#define BITMASK_RESET 0x20
#define BITMASK_CS1 0x8
#define BITMASK_CS2 0x10

#define LCD_ON 0x3F
#define LCD_OFF 0x3E
#define LCD_SET_ADD 0x40
#define LCD_SET_PAGE 0xB8
#define LCD_DISP_START 0xC0
#define LCD_BUSY 0x80

// choose graphic display, and set the bits from x
void graphic_ctrl_bit_set(uint8_t x) {
    uint8_t c = GPIO_E->odr_low;
    c |= (x & ~BITMASK_SELECT);
    GPIO_E->odr_low = c;
}
// Choose graphic display, and clear the bits from x
void graphic_ctrl_bit_clear(uint8_t x) {
    uint8_t c = GPIO_E->odr_low;
    c &= (~x & ~BITMASK_SELECT); 
    GPIO_E->odr_low = c;
}
// Select chip
void select_controller(uint8_t controller) {
    switch (controller) {
        case 0:
            graphic_ctrl_bit_clear (BITMASK_CS1 | BITMASK_CS2);
            break;
        case BITMASK_CS1:
            graphic_ctrl_bit_set(BITMASK_CS1);
            graphic_ctrl_bit_clear(BITMASK_CS2);
            break;
        case BITMASK_CS2:
            graphic_ctrl_bit_set(BITMASK_CS2);
            graphic_ctrl_bit_clear(BITMASK_CS1);
            break;
        case BITMASK_CS1 | BITMASK_CS2:
            graphic_ctrl_bit_set(BITMASK_CS1 | BITMASK_CS2);
            break;
    }
}

void graphic_wait_ready() {
    graphic_ctrl_bit_clear(BITMASK_E);
    GPIO_E->moder = 0x00005555;
    graphic_ctrl_bit_set(BITMASK_RW);
    graphic_ctrl_bit_clear(BITMASK_RS);
    delay_500ns();
    
    uint8_t c;
    do {
        graphic_ctrl_bit_set(BITMASK_E);
        delay_500ns();
        c = GPIO_E->idr_high & LCD_BUSY;
        graphic_ctrl_bit_clear(BITMASK_E);
        delay_500ns();
    }while(c);
    
    graphic_ctrl_bit_set(BITMASK_E);
    GPIO_E->moder = 0x55555555;
}

uint8_t graphic_read(uint8_t controller) {
    graphic_ctrl_bit_clear(BITMASK_E);
    GPIO_E->moder = 0x00005555;
    graphic_ctrl_bit_set(BITMASK_RS | BITMASK_RW);
    select_controller(controller);
    delay_500ns();
    graphic_ctrl_bit_set(BITMASK_E);
    delay_500ns();
    uint8_t returnvalue = GPIO_E->idr_high;
    graphic_ctrl_bit_clear(BITMASK_E);
    GPIO_E->moder = 0x55555555;
    if(controller & BITMASK_CS1) {
        select_controller(BITMASK_CS1);
        graphic_wait_ready();
    }
    if(controller & BITMASK_CS2) {
        select_controller(BITMASK_CS1);
        graphic_wait_ready();
    }
    return returnvalue;
}

void graphic_write(uint8_t value, uint8_t controller) {
    GPIO_E->odr_high = value;
    select_controller(controller);
    delay_500ns();
    graphic_ctrl_bit_set(BITMASK_E);
    delay_500ns();
    graphic_ctrl_bit_clear(BITMASK_E);
    if(controller & BITMASK_CS1) {
        select_controller(BITMASK_CS1);
        graphic_wait_ready();
    }
    if(controller & BITMASK_CS2) {
        select_controller(BITMASK_CS2);
        graphic_wait_ready();
    }
    GPIO_E->odr_high = 0;
    graphic_ctrl_bit_set(BITMASK_E);
    select_controller(0);
}

void graphic_write_command(uint8_t command, uint8_t controller) {
    graphic_ctrl_bit_clear(BITMASK_E);
    select_controller(controller);
    graphic_ctrl_bit_clear(BITMASK_RS | BITMASK_RW);
    graphic_write(command, controller);
}

void graphic_write_data(uint8_t data, uint8_t controller) {
    graphic_ctrl_bit_clear(BITMASK_E);
    select_controller(controller);
    graphic_ctrl_bit_clear(BITMASK_RW);
    graphic_ctrl_bit_set(BITMASK_RS);
    graphic_write(data, controller);
}

uint8_t graphic_read_data(uint8_t controller) {
    (void) graphic_read(controller);
    return graphic_read(controller);
}

void pixel(uint8_t x, uint8_t y, bool set) {
    // Create bitmask for the pixel
    uint8_t index, mask, controller;
    index = (y-1) / 8;
    mask = 0x1 << ((y-1) % 8);
    if (x > 64) {
        controller = BITMASK_CS2;
        x -= 65;
    }else {
        controller = BITMASK_CS1;
        x--;
    }
    
    graphic_write_command(LCD_SET_ADD | x, controller);
    graphic_write_command(LCD_SET_PAGE | index, controller);
    uint8_t temp = graphic_read_data(controller);
    graphic_write_command(LCD_SET_ADD | x, controller);
    if (set) {
        mask |= temp;
    }else {
        mask = ~mask & temp;
    }
    graphic_write_data(mask, controller);
}

void graphic_clear_screen(void) {
    for (uint8_t page = 0; page < 8; page++ ) {
        graphic_write_command(LCD_SET_PAGE | page, BITMASK_CS1 | BITMASK_CS2);
        graphic_write_command(LCD_SET_ADD  | 0, BITMASK_CS1 | BITMASK_CS2);
        for (uint8_t add = 0; add < 64; add++) {
            graphic_write_data(0, BITMASK_CS1 | BITMASK_CS2);
        }
    }
}


void graphic_init(void) {
    graphic_ctrl_bit_set(BITMASK_E);
    delay_micros(10);
    graphic_ctrl_bit_clear(BITMASK_CS1 | BITMASK_CS2 | BITMASK_RESET | BITMASK_E);
    delay_millis(30);
    graphic_ctrl_bit_set(BITMASK_RESET);
    
    // Toggle display
    graphic_write_command(LCD_OFF, BITMASK_CS1 | BITMASK_CS2);
    graphic_write_command(LCD_ON, BITMASK_CS1 | BITMASK_CS2);
    //Start = 0
    graphic_write_command(LCD_DISP_START, BITMASK_CS1 | BITMASK_CS2);
    // Add = 0
    graphic_write_command(LCD_SET_ADD, BITMASK_CS1 | BITMASK_CS2);
    // Page = 0
    graphic_write_command(LCD_SET_PAGE, BITMASK_CS1 | BITMASK_CS2);
    // Deactivate both CS signals
    select_controller(0);
}