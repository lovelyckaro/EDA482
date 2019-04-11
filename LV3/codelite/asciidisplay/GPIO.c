#include <stdint.h>
#include <stdbool.h>
#include "GPIO.h"

#define RCC_AHB1ENR ((volatile uint32_t*) 0x40023830)

void init_GPIO(GPIO* port, uint32_t moder) {
    port->moder = moder;
}

void GPIO_split_mode(GPIO* port, bool output_high, bool output_low) {
    uint32_t moder = 0x00000000; // If not output, then input
    if(output_high) {
        moder |= 0x55550000;
    }
    if(output_low) {
        moder |= 0x00005555;
    }
    port->moder = moder;
}
void GPIO_output(GPIO* port) {
    port->moder = 0x55555555; // entire port as output
}
 
void GPIO_input(GPIO* port) {
    port->moder = 0;
}

void GPIO_clock_start() {
    *RCC_AHB1ENR = 0x18;
}

