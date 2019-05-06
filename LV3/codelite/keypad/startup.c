/*
 * 	startup.c
 *
 */
#include <libGPIO.h>
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
    GPIO_clock_start();
    GPIO_init_seven_seg(GPIO_D, false);
    GPIO_init_keypad(GPIO_D, true);
    
    while(true) {
        GPIO_put_seven_seg(GPIO_D, false, GPIO_read_keypad(GPIO_D, true));
    }
    return 0;
}

