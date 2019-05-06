/*
 * 	startup.c
 *
 */
 #include "libdelay.h"
 #include "libGPIO.h"
 
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

void main(void)
{
    while(1){
        GPIO_output(GPIO_D);
        GPIO_D->odr_low = 0xFF;
        delay_micros(500);
        GPIO_D->odr_low = 0x00;
        delay_micros(500);
    }
}

