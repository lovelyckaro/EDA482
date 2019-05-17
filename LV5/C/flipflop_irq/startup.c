/*
 * 	startup.c
 *  
 */
#include "libGPIO.h"
#include <stdint.h>
#include <stdbool.h>

#define SYSCFG_EXTICR1 *((uint32_t*) 0x40013808)
#define EXTI_IMR *((uint32_t*) 0x40013C00)

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

static int count;

void irq_handler(void) {
    count++;
}

void app_init(void) {
    GPIO_output(GPIO_D);
    count = 0;
    // IO-pin PE3 routed to EXTI3
    SYSCFG_EXTICR1 &= ~0xF000; // Clear EXTI3[3:0]
    SYSCFG_EXTICR1 |= 0x4000; // Set bit 14 of SYSCFG_EXTICR1
}

int main(void) {
    app_init();
    while(true) {
        GPIO_D->odr_low = count;
    }
    return 0;
}

