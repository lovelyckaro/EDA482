/*
 * 	startup.c
 *
 */
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

#define STK_CTRL ((volatile unsigned long *) 0xE000E010)
#define STK_LOAD ((volatile unsigned long *) 0xE000E014)
#define STK_VAL ((volatile unsigned long *) 0xE000E018)
#define GPIO_E (volatile unsigned char *) 0x40021010
#define GPIO_D (volatile unsigned char *) 0x40020C14 // GPIO_D b0-7
#define GPIO_D_MODER (volatile unsigned long *) 0x40020C00 // Config for GPIO_D b0-7

//#define SIMULATOR

void delay_250ns(void) 
{
    *STK_CTRL = 0;
    *STK_LOAD = 168/4 - 1;
    *STK_VAL = 0;
    *STK_CTRL = 5;
    while (!(*STK_CTRL & 0x10000));
    *STK_CTRL = 0;
}

void delay_micros(unsigned int u) {
    #ifdef SIMULATOR
        u /= 1000;
        u++;
    #endif
    while (u--)
    {
        delay_250ns();
        delay_250ns();
        delay_250ns();
        delay_250ns();
    }
}

void delay_millis(unsigned int m) 
{
    delay_micros(m * 1000);
}

void init_app() {
    *GPIO_D_MODER = 0x55555555;
    #ifdef USBDM
        *((unsigned long *) 0x40023830) = 0x18;
        asm volatile("LDR R0,=0x08000209\n BKX R0\n");
    #endif
}


int main(void)
{
    init_app();
    while(1) {
        *GPIO_D = 0xFF;
        delay_micros(500);
        *GPIO_D = 0;
        delay_micros(500);
    }
    return 0;
}

