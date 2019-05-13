/*
 * 	startup.c
 *  
 */
#include "libGPIO.h"
#include "libdelay.h"
#include "graphics.h"
#include <stdint.h>
#include <stdbool.h>

void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );

void startup ( void )
{
asm volatile(
	" LDR R0,=0x2001C000\n"		/* set stack */
	" MOV SP,R0\n"
	" BL main\n"				/* call main */
	".L1: B .L1\n"				/* never return */
	) ;
}

int main(void)
{
    GPIO_output(GPIO_E);
    graphic_init();
    for (uint8_t x = 0; x < 128; x++) {
        pixel(x, 10, true);
        if (x < 64) {
            pixel(10, x, true);
        }
    }
    delay_millis(1000);
    for (uint8_t x = 0; x < 128; x++) {
        pixel(x, 10, false);
        if (x < 64) {
            pixel(10,x, false);
        }
    }
}

