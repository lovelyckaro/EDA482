/*
 * 	libNAME.c
 *	custom static library
 */
 

/* Declare your functions in 'libNANE.h' */
#include "libascii.h"
#include "libGPIO.h"
#include "libdelay.h"


/* Define your functions here */

#define BITMASK_E 0x40
#define BITMASK_SELECT 0x4
#define BITMASK_RW 0x2
#define BITMASK_RS 0x1

void ascii_ctrl_bit_set(unsigned char x) {
    unsigned char c;
    c = GPIO_E->odr_low;
    c |= (BITMASK_SELECT | x);
    GPIO_E->odr_low = c;
}

void ascii_ctrl_bit_clear(unsigned char x) {
    unsigned char c;
    c = GPIO_E->odr_low;
    c &= (BITMASK_SELECT | ~x);
    GPIO_E->odr_low = c;
}

void ascii_write_controller(unsigned char byte) {
    ascii_ctrl_bit_set(BITMASK_E);
    GPIO_E->odr_high = byte;
    ascii_ctrl_bit_clear(BITMASK_E);
    delay_250ns();
}

unsigned char ascii_read_controller(void) {
    ascii_ctrl_bit_set(BITMASK_E);
    delay_250ns();
    delay_250ns();
    unsigned char rv = GPIO_E->idr_high;
    ascii_ctrl_bit_clear(BITMASK_E);
    return rv;
}

void ascii_write_cmd(unsigned char command) {
    ascii_ctrl_bit_clear(BITMASK_RS | BITMASK_RW);
    ascii_write_controller(command);
}

void ascii_write_data(unsigned char data) {
    ascii_ctrl_bit_set(BITMASK_RS);
    ascii_ctrl_bit_clear(BITMASK_RW);
    ascii_write_controller(data);
}

unsigned char ascii_read_status(void) {
    GPIO_E->moder = 0x00005555;
    ascii_ctrl_bit_clear(BITMASK_RS);
    ascii_ctrl_bit_set(BITMASK_RW);
    unsigned char c = ascii_read_controller();
    GPIO_E->moder = 0x55555555;
    return c;
}

unsigned char ascii_read_data(void) {
    GPIO_E->moder = 0x00005555;
    ascii_ctrl_bit_set(BITMASK_RS);
    ascii_ctrl_bit_set(BITMASK_RW);
    unsigned char c = ascii_read_controller();
    GPIO_E->moder = 0x55555555;
    return c;
}

void ascii_write_cmd_delay(unsigned char cmd, unsigned int delay) {
    while((ascii_read_status() & 0x80) == 0x80);
    delay_micros(8);
    ascii_write_cmd(cmd);
    delay_micros(delay);
}

void ascii_write_data_delay(unsigned char data, unsigned int delay) {
    while((ascii_read_status() & 0x80) == 0x80);
    delay_micros(8);
    ascii_write_data(data);
    delay_micros(delay);
}

void ascii_init(void) {
    ascii_write_cmd_delay(1, 2000); // Clear display
    ascii_write_cmd_delay(0x38, 40);// 2 rows, 5x8px chars
    ascii_write_cmd_delay(0xE, 40); // Turn on display, always show cursor
    ascii_write_cmd_delay(0x6, 40); // Adress using increment, no shifting of adress buffer
}


void ascii_gotoxy(unsigned char row, unsigned char column) {
    unsigned char adress = row - 1;
    if (column > 1) {
        adress += 0x40;
    }
    ascii_write_cmd_delay(0x80 | adress, 40);
}

void ascii_write_char(char c) {
    ascii_write_data_delay(c,43);
}

void ascii_write_string(char *c) {
    while(*c) {
        ascii_write_char(*c++);
    }
}