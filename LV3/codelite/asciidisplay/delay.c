#include "delay.h"
#include "STK.h"

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
        u /= 1000;
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