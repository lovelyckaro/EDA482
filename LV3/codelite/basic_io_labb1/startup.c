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

#define GPIO_E (unsigned char *) 0x40021010 // GPIO_E b0-7
#define GPIO_D (unsigned char *) 0x40020C14 // GPIO_D b0-7
#define GPIO_D_MODER (unsigned long *) 0x40020C00 // Config for GPIO_D b0-7
#define RCC_AHB1ENR (unsigned long *) 0x40023830 // Reset and clock control

void io_init() 
{
    *RCC_AHB1ENR = 0x18; // Start GPIO clock
    *GPIO_D_MODER = 0x55555555; // Use GPIO_D b0-7 as output
}

unsigned char get_char() {
    return (unsigned char) *GPIO_E;
}

void put_char(unsigned char c) {
    *GPIO_D = c;
}

int main(void)
{
    unsigned char c;
    io_init();
    while(1) {
        c = get_char();
        put_char(c);
    }
    return 0;
}

