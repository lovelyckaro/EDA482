/*
 * 	startup.c
 *  
 */
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

/* Anm: EXTI2 har vektornummer 8. */
#define SYSCFG_EXTICR1	0x40013808
#define EXTI_IMR	0x40013C00
#define EXTI_FTSR	0x40013C0C
#define EXTI_PR		0x40013C14
#define EXTI2_IRQ_BPOS  (1<<2)
#define NVIC_ISER0	0xE000E100
#define EXTI2_IRQVEC	0x2001C060
#define NVIC_EXTI2_IRQ_BPOS  (1<<8)

void irq_handler ( void )
{
	/* Om avbrott från EXTI2:
		kvittera avbrott från EXTI2 */
	if(   *((unsigned int *) EXTI_PR) & EXTI2_IRQ_BPOS )
	{
           *((unsigned int *) EXTI_PR) |= EXTI2_IRQ_BPOS;
 	}
}

void app_init ( void )
{
	/* Koppla PE2 till avbrottslina EXTI2 */
  	 *((unsigned int *) SYSCFG_EXTICR1) |= 0x0400;
	/* Konfigurera EXTI2 för att generera avbrott */
  	 *((unsigned int *) EXTI_IMR) |= EXTI2_IRQ_BPOS;
	/* Konfigurera för avbrott på negativ flank */
 	 *((unsigned int *) EXTI_FTSR) |= EXTI2_IRQ_BPOS;		
	/* Sätt upp avbrottsvektor */
  	 *((void (**)(void) ) EXTI2_IRQVEC ) = irq_handler;     
   	/* Konfigurera den bit i NVIC som kontrollerar den avbrottslina som EXTI2 kopplats till */
    	*((unsigned int *) NVIC_ISER0) |= NVIC_EXTI2_IRQ_BPOS; 
}

int main(void) {
    app_init();
    return 0;
}

