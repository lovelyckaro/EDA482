/*
 * 	libNAME.c
 *	custom static library
 */
 
 /* Include standard headers */
#include <stdint.h>
#include <stdbool.h>

/* Declare your functions in 'libNANE.h' */
#include	"libGPIO.h"


/* Define your functions here */

#define RCC_AHB1ENR ((volatile uint32_t*) 0x40023830)

void init_GPIO(volatile GPIO* port, uint32_t moder) {
    port->moder = moder;
}

void GPIO_split_mode(volatile GPIO* port, bool output_high, bool output_low) {
    uint32_t moder = 0x00000000; // If not output, then input
    if(output_high) {
        moder |= 0x55550000;
    }
    if(output_low) {
        moder |= 0x00005555;
    }
    port->moder = moder;
}
void GPIO_output(volatile GPIO* port) {
    port->moder = 0x55555555; // entire port as output
}
 
void GPIO_input(volatile GPIO* port) {
    port->moder = 0;
}

void GPIO_clock_start() {
    *RCC_AHB1ENR = 0x18;
}
// init moder, pudpr, and otyper for keypad in a port. If not high, uses low
void GPIO_init_keypad(volatile GPIO* port, bool high) {
    uint32_t moder_mask, pudpr_mask, moder_set, pudpr_set;
    uint16_t otyper_mask, otyper_set;
    
    if (high) {
        moder_mask = 0x0000FFFF;
        moder_set  = 0x55000000;
        otyper_mask = 0x00FF;
        otyper_set  = 0x0F00;
        pudpr_mask = 0x0000FFFF;
        pudpr_set  = 0x00AA0000;
    }else {
        moder_mask = 0xFFFF0000;
        moder_set  = 0x00005500;
        otyper_mask = 0xFF00;
        otyper_set  = 0x000F;
        pudpr_mask = 0xFFFF0000;
        pudpr_set  = 0x000000AA;
    }
    uint32_t moder = port->moder;
    port->moder = (moder & moder_mask) | moder_set; // b31-b24 = 01010101, b23-b16 = 00000000, keep the rest
    uint16_t otyper = port->otyper;
    port->otyper = (otyper & otyper_mask) | otyper_set; // b15-b12 = 0000, b11-b8 = 1111, keep the rest
    uint32_t pudpr = port->pudpr;
    port->pudpr = (pudpr & pudpr_mask) | pudpr_set;
}

void activate_row(volatile GPIO* port, bool high, int8_t row_num) {
    if (high) {
        port->odr_high = (8<<row_num);
    }else {
        port->odr_low = (8<<row_num);
    }
}

int8_t read_column(volatile GPIO* port, bool high) {
    uint8_t idr;
    if (high) {
        idr = port->idr_high & 0x0F;
    }else {
        idr = port->idr_low & 0x0F;
    }
    int8_t col = 0;
    while (idr) {
        col++;
        idr = idr >> 1;
    }
    return col;
}

int8_t key_value(int8_t row, int8_t col) {
    uint8_t keys[4][4] = {{1,2,3,10}
                        ,{4,5,6,11}
                        ,{7,8,9,12}
                        ,{14,0,15,13}
                        };
    if (row > 0 && row <= 4 && col > 0 && col <= 4) {
        return keys[row-1][col-1];
    }else{
        return 0;
    }
}

uint8_t GPIO_read_keypad(volatile GPIO* port, bool high) {
    for (int8_t row = 1; row <= 4; row++) {
        activate_row(port, high, row);
        int8_t column = read_column(port, high);
        if (column) {
            return key_value(row, column);
        }
    }
    return 16;
}

void GPIO_init_seven_seg(volatile GPIO* port, bool high) {
    GPIO_split_mode(port, high, !high);
}

void GPIO_put_seven_seg(volatile GPIO* port, bool high, uint8_t value) {
    int8_t seg_codes[] = {0x3F, 0x6, 0x5B, 0x4F, 0x66, 0x6D, 0x7D, 0x7, 0x7F, 0x6F, 0x77, 0x7C, 0x39, 0x5E, 0x79, 0x71};
    volatile uint8_t* odr;
    if (high) {
        odr = &(port->odr_high);
    }else {
        odr = &(port->odr_low);
    }
    
    if (value<16) {
        *odr = seg_codes[value];
    }else {
        *odr = 0;
    }
}