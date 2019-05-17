/*
 * 	startup.c
 *  
 */
#include <GPIO.h>
#include <stdint.h>

#define SCB_VTOR (volatile uint32_t*) 0xE000ED08

void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );

void startup ( void ) {
asm volatile(
	" LDR R0,=0x2001C000\n"		/* set stack */
	" MOV SP,R0\n"
	" BL main\n"				/* call main */
	".L1: B .L1\n"				/* never return */
	) ;
}

__attribute__((naked)) uint32_t getControlReg(void) {
    asm(
    "MRS R0,CONTROL\n"
    "BX LR\n"
    );
}

__attribute__((naked)) void setControlReg(uint32_t value) {
    asm(
    "MSR CONTROL,R0\n"
    "BX LR\n"
    );
}

__attribute__((naked)) void enable_interrupt(void) {
    asm volatile(
    "CPSIE I\n"
    "BX LR\n"
    );
}

__attribute__((naked)) void disable_interrupt(void) {
    asm volatile (
    "CPSID I\n"
    "BX LR\n"
    );
}

void setUnPrivileged(void) {
    setControlReg (getControlReg() | 0b10);
}



void app_init(void) {
    *SCB_VTOR = 0x2001C000; // Move exception vectors to 0x2001C000
}

int main(void) {
    
    return 0;
}

