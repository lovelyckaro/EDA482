/*
 * 	startup.c
 *  
 */
#include "libGPIO.h"
#include "InterruptStructs.h"
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

#define EXTI3_INTERRUPT_NUM 9
#define EXTI3_VECTOR_OFFSET 0x64
#define EXTI3_BIN_POS (1<<3)

#define EXTI_IMR *((uint32_t *) 0x40013C00)
#define EXTI_RTSR *((uint32_t *) 0x40013C00+8)
#define EXTI_FTSR *((uint32_t *) 0x40013C00+0xC)
#define EXTI_PR *((uint32_t *) 0x40013C00+0x14)
#define SYSCFG_EXTICR1 *((uint32_t*) 0x40013808)
#define NVIC_ISER0 *((uint32_t*) 0xE000E100)

volatile int count;

void irq_handler(void) {
    if (EXTI_PR & EXTI3_BIN_POS) {
        count++;
        EXTI_PR |= EXTI3_BIN_POS;
    }
}

void app_init(void) {
    GPIO_output(GPIO_D);
    count = 5;
    // IO-pin PE3 routed to EXTI3
    SYSCFG_EXTICR1 |= 0x4000; // Set bit 14 of SYSCFG_EXTICR1
    
    EXTI_IMR |= EXTI3_BIN_POS; // Set b3 in IMR, turning on EXTI3
    EXTI_FTSR &= ~EXTI3_BIN_POS; // reset b3 in FTSR, turning off falling trigger on EXTI3
    EXTI_RTSR |= EXTI3_BIN_POS; // Set b3 in RTSR, turning on rising trigger on EXTI3
    
    *((void (**)(void)) 0x2001C000+EXTI3_VECTOR_OFFSET) = irq_handler; // setup interrupt vector
    NVIC_ISER0 |= (1<<EXTI3_INTERRUPT_NUM); // enable exti3 in NVIC
}

int main(void) {
    app_init();
    while(true) {
        GPIO_D->odr_low = count;
    }
    return 0;
}

