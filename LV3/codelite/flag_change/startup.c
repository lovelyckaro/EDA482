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

__attribute__((naked)) uint32_t getPsrReg(void) {
    asm(
    "MRS R0,APSR\n"
    "BX LR\n"
    );
}

__attribute__((naked)) void setPsrReg(uint32_t apsr) {
    asm(
    "MSR APSR,R0\n"
    "BX LR\n"
    );
}

int main(void) {
    uint32_t psr;
    psr = getPsrReg();
    setPsrReg(0);
    psr = getPsrReg();
    return 0;
}

