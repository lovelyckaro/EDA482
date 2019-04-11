#include <stdint.h>
#include <stdbool.h>

#define GPIO_D ((volatile GPIO*) 0x40020C00)
#define GPIO_E ((volatile GPIO*) 0x40021000)

typedef struct gpio {
    uint32_t moder;
    uint16_t otyper;
    uint16_t OT_RESERVED;
    uint32_t ospeedr;
    uint32_t pudpr;
    uint8_t idr_low;
    uint8_t idr_high;
    uint16_t IDR_RESERVED;
    uint8_t odr_low;
    uint8_t odr_high;
    uint16_t ODR_RESERVED;
}GPIO;

void GPIO_mode(GPIO* port, uint32_t moder);
void GPIO_split_mode(GPIO* port, bool output_high, bool output_low); // If not output, then input
void GPIO_output(GPIO* port); // entire port as output
void GPIO_input(GPIO* port); // entire port as input
void GPIO_clock_start();