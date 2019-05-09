/*
 * 	libNAME.c
 *	custom static library
 */
 
 /* Include standard headers */
#include <stdint.h>

/* Declare your functions in 'libNANE.h' */
#include	"libdelay.h"


/* Define your functions here */


#define SysTick ((volatile STK*) 0xE000E010)

typedef struct {
    uint32_t ctrl;
    uint32_t load;
    uint32_t val;
    uint32_t calib;
}STK;

void delay_250ns(void) 
{
    SysTick->ctrl = 0;
    SysTick->load = 168/4 - 1;
    SysTick->val = 0;
    SysTick->ctrl = 5;
    while (!(SysTick->ctrl & 0x10000));
    SysTick->ctrl = 0;
}

void delay_500ns(void)
{
    SysTick->ctrl = 0;
    SysTick->load = 168 / 2 - 1;
    SysTick->val = 0;
    SysTick->ctrl = 5;
    while (!(SysTick->ctrl & 0x10000));
    SysTick->ctrl = 0;
}

void delay_micros(unsigned int u) 
{
    #ifdef SIMULATOR
        u = u >> 10;
        u++;
    #endif
    while (u--)
    {
        delay_500ns();
        delay_500ns();
    }
}

void delay_millis(unsigned int m) 
{
    delay_micros(m * 1000);
}