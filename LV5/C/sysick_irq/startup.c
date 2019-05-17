/*
 * 	startup.c
 *  
 */
#include <libGPIO.h>
#include <stdint.h>
#include <stdbool.h>

#ifdef SIMULATOR
    #define DELAY_COUNT 100
#else
    #define DELAY_COUNT 100000
#endif

#define SysTick ((volatile STK*) 0xE000E010)

typedef struct{
    uint32_t ctrl;
    uint32_t load;
    uint32_t val;
    uint32_t calib;
}STK;

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

static bool systick_flag;
static int32_t delay_count;

void delay_micro(void) {
    systick_flag = false;
    SysTick->ctrl = 0;
    SysTick->load = 168-1;
    SysTick->val = 0;
    SysTick->ctrl = 7;
}

void systick_irq_handler(void) {
    delay_count--;
    if (delay_count) {
        delay_micro();
    }else {
        systick_flag = true;
    }
}

void delay(uint32_t us) {
    delay_count = us;
    delay_micro();
}



void app_init(void) {
    GPIO_output(GPIO_D);
    *((void (**)(void)) 0x2001C03C) = systick_irq_handler;
    systick_flag = false;
}

int main(void) {
    app_init();
    GPIO_D->odr_low = 0;
    delay(DELAY_COUNT);
    GPIO_D->odr_low = 0xFF;
    while (true) {
        if(systick_flag) {
            break;
        }
    }
    GPIO_D->odr_low = 0;
    return 0;
}

