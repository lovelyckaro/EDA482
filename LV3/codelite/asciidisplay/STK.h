#include <stdint.h>
#define SysTick ((volatile STK*) 0xE000E010)

typedef struct {
    uint32_t ctrl;
    uint32_t load;
    uint32_t val;
    uint32_t calib;
}STK;
