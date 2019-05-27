/*
 * 	startup.c
 *  
 */
#include "libGPIO.h"
#include "libdelay.h"
#include <stdint.h>

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

int bitcheck(uint32_t* pp, int32_t* num) {
    uint32_t ret = 0;
    for (uint8_t i = 1; i <= (1<<31); i<<=1) {
        if (*pp && i) {
            ret++;
        }
    }
}

int main(void)
{
    GPIO_output(GPIO_D);
    uint8_t out = 0x80;
    while(out) {
        GPIO_D->odr_low = out;
        out = out >> 1;
        delay_micros(500);
    }
    return 0;
}

