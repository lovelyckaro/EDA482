#include <stdint.h>

typedef struct {
    uint32_t CPUID; // Information about productNr; revision; variant; and manufacturer
    volatile uint32_t ICSR; // Interrupt control and state register 
    uint32_t VTOR; //Vector table offset register
    uint32_t AIRCR; // Application interrupt and reset control register
    uint32_t SCR; // System control register
    uint32_t CCR; // Configuration and control register
    uint32_t SHPR1; // System handler priority register 1
    uint32_t SHPR2; // System handler priority register 2
    uint32_t SHPR3; // System handler priority register 3
    volatile uint32_t SHCSR; // System handler control and state register
    volatile uint32_t CFSR; // Configurable fault status register
    volatile uint32_t HFSR; // Hard fault status register
    uint32_t RESERVED;
    uint32_t MFAR; // Memory manage fault adress register
    uint32_t BFAR; // Bus fault adress register
    volatile uint32_t AFSR; // Auxiliary fault status register
}SysControlBlock;

#define SCB *((SysControlBlock*) 0xE000ED00)

typedef struct {
    volatile uint32_t ISER0; // Interrupt set-enable register 0
    volatile uint32_t ISER1; // Interrupt set-enable register 1
    volatile uint16_t ISER2; // Interrupt set-enable register 2
    uint16_t RESERVEDISER;
    volatile uint32_t CER0; // Interrupt clear-enable register 0
    volatile uint32_t CER1; // Interrupt clear-enable register 1
    volatile uint16_t CER2; // Interrupt clear-enable register 2
    uint16_t RESERVEDCER;
    volatile uint32_t ISPR0; // Interrupt set-pending register 0
    volatile uint32_t ISPR1; // Interrupt set-pending register 1
    volatile uint16_t ISPR2; // Interrupt set-pending register 2
    uint16_t RESERVEDISPR;
    volatile uint32_t ICPR0; // Interrupt clear-pending register 0
    volatile uint32_t ICPR1; // Interrupt clear-pending register 1
    volatile uint16_t ICPR2; // Interrupt clear-pending register 2
    uint16_t RESERVEDICPR;
    volatile uint32_t IABR0; // Interrupt Active bit register 0
    volatile uint32_t IABR1; // Interrupt Active bit register 1
    volatile uint32_t IABR2; // Interrupt Active bit register 2
    union {
        uint32_t IPR0;
        uint8_t IP[4];
    };
    uint8_t IPR20;
} NestVecIntContr;

#define NVIC (*((NestVecIntContr*) 0xE000E100))

typedef struct {
    union {
        uint16_t MEMRMP; // Memory remap register
        uint32_t MEMRMP_WITH_RESERVED;
    };
    uint16_t RESERVED;
    uint16_t PMC; // Peripheral mode configuration register
    union {
        uint16_t EXTICR1; // External interrupt config register 1
        uint32_t EXTICR1_WITH_RESERVED;
    };
    union {
        uint16_t EXTICR2; // External interrupt config register 2
        uint32_t EXTICR2_WITH_RESERVED;
    };
    union {
        uint16_t EXTICR3; // External interrupt config register 3
        uint32_t EXTICR3_WITH_RESERVED;
    };
    union {
        uint16_t EXTICR4; // External interrupt config register 4
        uint32_t EXTICR4_WITH_RESERVED;
    };
    uint16_t CMPRCR; // Compensation cell control register
    
    
} SystemConfig;

#define SYSCFG (*((SystemConfig*) 0x40013800))

typedef struct {
    uint32_t IMR; // Interrupt mask register
    uint32_t EMR; // Event mask register
    uint32_t RTSR; // Rising trigger selection register
    uint32_t FTSR; // Falling trigger selection register
    volatile uint32_t SWIER; // Software interrupt event register
    volatile uint32_t PR; // Pending register
}ExternInterrupt;

#define EXTI (*((ExternInterrupt*) 0x40013C00))