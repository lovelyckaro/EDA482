/*
 * 	startup.c
 *  
 */
#include "libGPIO.h"
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

#define SYSCFG_EXTICR1 0x40013808
#define EXTI_RTSR 0x40013C08
#define EXTI_FTSR 0x40013C0C
#define EXTI_IMR 0x40013C00

static volatile int count;

void exti3_irq_handler(void){
	count++;
	*((unsigned int *) 0x40013C14) |= 8;
}

void app_init (void){
	GPIO_clock_start();
	GPIO_D->moder = 0x00005555;
	
	*((unsigned int *) SYSCFG_EXTICR1) &= ~0xF000;
	*((unsigned int *) SYSCFG_EXTICR1) |= 0x4000; //sätt PE3 -> EXTI3
	
	*((unsigned int *) EXTI_IMR) |= 8; //EXTI_IMR
	*((unsigned int *) EXTI_FTSR) &= ~8; //Deaktivera neg. flank
	*((unsigned int *) EXTI_RTSR) |= 8; //Aktivera pos. flank
	
	*((void (**) (void)) 0x2001C064) = exti3_irq_handler;
	
	*((unsigned int *) 0xE000E100) |= (1<<9);
}

int main(void)
{
    app_init();
    while(1) {
        GPIO_D->odr_low = count;
    }
    return 0;
}