/*
 * 	startup.c
 *
 */
#include "GPIO.h" 
#include "delay.h"
#include "ascii.h"
 
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
    GPIO_output(GPIO_E); // GPIO_E is output by default
    ascii_init();
    ascii_gotoxy(1,1);
    char test1[] = "I'm a cat, a kitty cat";
    char test2[] = "and i dance dance dance";
    ascii_write_string(test1);
    ascii_gotoxy(1,2);
    ascii_write_string(test2);
    return 0;
}

