/*
*	libNAME.h
*	Declaration of library functions, constants etc...
*/

#include <stdint.h>
#include <stdbool.h>

#define GPIO_D ((volatile GPIO*) 0x40020C00)
#define GPIO_E ((volatile GPIO*) 0x40021000)

typedef struct gpio {
    uint32_t moder;
    uint16_t otyper;
    uint16_t OT_RESERVED;
    uint32_t ospeedr;
    uint32_t pudpr;
    uint8_t idr_low;
    uint8_t idr_high;
    uint16_t IDR_RESERVED;
    uint8_t odr_low;
    uint8_t odr_high;
    uint16_t ODR_RESERVED;
}GPIO;

void GPIO_mode(volatile GPIO* port, uint32_t moder);
void GPIO_split_mode(volatile GPIO* port, bool output_high, bool output_low); // If not output, then input
void GPIO_output(volatile GPIO* port); // entire port as output
void GPIO_input(volatile GPIO* port); // entire port as input
void GPIO_clock_start();

// Helper functions for different IO-devices

// Keypad
void GPIO_init_keypad(volatile GPIO* port, bool high); // init moder, pudpr, and otyper for keypad in a port. If not high, uses low
uint8_t GPIO_read_keypad(volatile GPIO* port, bool high);

// Seven segment display
void GPIO_init_seven_seg(volatile GPIO* port, bool high);
void GPIO_put_seven_seg(volatile GPIO* port, bool high, uint8_t value); // Print value to seven_seg display, values over 15 clear display