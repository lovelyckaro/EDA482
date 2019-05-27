   1              		.arch armv6-m
   2              		.eabi_attribute 20, 1
   3              		.eabi_attribute 21, 1
   4              		.eabi_attribute 23, 3
   5              		.eabi_attribute 24, 1
   6              		.eabi_attribute 25, 1
   7              		.eabi_attribute 26, 1
   8              		.eabi_attribute 30, 6
   9              		.eabi_attribute 34, 0
  10              		.eabi_attribute 18, 4
  11              		.file	"startup.c"
  12              		.text
  13              	.Ltext0:
  14              		.cfi_sections	.debug_frame
  15              		.section	.start_section,"ax",%progbits
  16              		.align	1
  17              		.global	startup
  18              		.syntax unified
  19              		.code	16
  20              		.thumb_func
  21              		.fpu softvfp
  23              	startup:
  24              	.LFB0:
  25              		.file 1 "/home/love/Documents/skola/EDA482/LV5/C/flipflop_irq/startup.c"
   1:/home/love/Documents/skola/EDA482/LV5/C/flipflop_irq/startup.c **** /*
   2:/home/love/Documents/skola/EDA482/LV5/C/flipflop_irq/startup.c ****  * 	startup.c
   3:/home/love/Documents/skola/EDA482/LV5/C/flipflop_irq/startup.c ****  *  
   4:/home/love/Documents/skola/EDA482/LV5/C/flipflop_irq/startup.c ****  */
   5:/home/love/Documents/skola/EDA482/LV5/C/flipflop_irq/startup.c **** #include "libGPIO.h"
   6:/home/love/Documents/skola/EDA482/LV5/C/flipflop_irq/startup.c **** #include "InterruptStructs.h"
   7:/home/love/Documents/skola/EDA482/LV5/C/flipflop_irq/startup.c **** #include <stdint.h>
   8:/home/love/Documents/skola/EDA482/LV5/C/flipflop_irq/startup.c **** #include <stdbool.h>
   9:/home/love/Documents/skola/EDA482/LV5/C/flipflop_irq/startup.c **** 
  10:/home/love/Documents/skola/EDA482/LV5/C/flipflop_irq/startup.c **** void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );
  11:/home/love/Documents/skola/EDA482/LV5/C/flipflop_irq/startup.c **** 
  12:/home/love/Documents/skola/EDA482/LV5/C/flipflop_irq/startup.c **** void startup ( void )
  13:/home/love/Documents/skola/EDA482/LV5/C/flipflop_irq/startup.c **** {
  26              		.loc 1 13 1
  27              		.cfi_startproc
  28              		@ Naked Function: prologue and epilogue provided by programmer.
  29              		@ args = 0, pretend = 0, frame = 0
  30              		@ frame_needed = 1, uses_anonymous_args = 0
  14:/home/love/Documents/skola/EDA482/LV5/C/flipflop_irq/startup.c **** asm volatile(
  31              		.loc 1 14 1
  32              		.syntax divided
  33              	@ 14 "/home/love/Documents/skola/EDA482/LV5/C/flipflop_irq/startup.c" 1
  34 0000 0248     		 LDR R0,=0x2001C000
  35 0002 8546     	 MOV SP,R0
  36 0004 FFF7FEFF 	 BL main
  37 0008 FEE7     	.L1: B .L1
  38              	
  39              	@ 0 "" 2
  15:/home/love/Documents/skola/EDA482/LV5/C/flipflop_irq/startup.c **** 	" LDR R0,=0x2001C000\n"		/* set stack */
  16:/home/love/Documents/skola/EDA482/LV5/C/flipflop_irq/startup.c **** 	" MOV SP,R0\n"
  17:/home/love/Documents/skola/EDA482/LV5/C/flipflop_irq/startup.c **** 	" BL main\n"				/* call main */
  18:/home/love/Documents/skola/EDA482/LV5/C/flipflop_irq/startup.c **** 	".L1: B .L1\n"				/* never return */
  19:/home/love/Documents/skola/EDA482/LV5/C/flipflop_irq/startup.c **** 	) ;
  20:/home/love/Documents/skola/EDA482/LV5/C/flipflop_irq/startup.c **** }
  40              		.loc 1 20 1
  41              		.thumb
  42              		.syntax unified
  43 000a C046     		nop
  44              		.cfi_endproc
  45              	.LFE0:
  47              		.comm	count,4,4
  48              		.text
  49              		.align	1
  50              		.global	irq_handler
  51              		.syntax unified
  52              		.code	16
  53              		.thumb_func
  54              		.fpu softvfp
  56              	irq_handler:
  57              	.LFB1:
  21:/home/love/Documents/skola/EDA482/LV5/C/flipflop_irq/startup.c **** 
  22:/home/love/Documents/skola/EDA482/LV5/C/flipflop_irq/startup.c **** #define EXTI3_INTERRUPT_NUM 9
  23:/home/love/Documents/skola/EDA482/LV5/C/flipflop_irq/startup.c **** #define EXTI3_VECTOR_OFFSET 0x64
  24:/home/love/Documents/skola/EDA482/LV5/C/flipflop_irq/startup.c **** #define EXTI3_BIN_POS (1<<3)
  25:/home/love/Documents/skola/EDA482/LV5/C/flipflop_irq/startup.c **** 
  26:/home/love/Documents/skola/EDA482/LV5/C/flipflop_irq/startup.c **** #define EXTI_IMR *((uint32_t *) 0x40013C00)
  27:/home/love/Documents/skola/EDA482/LV5/C/flipflop_irq/startup.c **** #define EXTI_RTSR *((uint32_t *) 0x40013C00+8)
  28:/home/love/Documents/skola/EDA482/LV5/C/flipflop_irq/startup.c **** #define EXTI_FTSR *((uint32_t *) 0x40013C00+0xC)
  29:/home/love/Documents/skola/EDA482/LV5/C/flipflop_irq/startup.c **** #define EXTI_PR *((uint32_t *) 0x40013C00+0x14)
  30:/home/love/Documents/skola/EDA482/LV5/C/flipflop_irq/startup.c **** #define SYSCFG_EXTICR1 *((uint32_t*) 0x40013808)
  31:/home/love/Documents/skola/EDA482/LV5/C/flipflop_irq/startup.c **** #define NVIC_ISER0 *((uint32_t*) 0xE000E100)
  32:/home/love/Documents/skola/EDA482/LV5/C/flipflop_irq/startup.c **** 
  33:/home/love/Documents/skola/EDA482/LV5/C/flipflop_irq/startup.c **** volatile int count;
  34:/home/love/Documents/skola/EDA482/LV5/C/flipflop_irq/startup.c **** 
  35:/home/love/Documents/skola/EDA482/LV5/C/flipflop_irq/startup.c **** void irq_handler(void) {
  58              		.loc 1 35 24
  59              		.cfi_startproc
  60              		@ args = 0, pretend = 0, frame = 0
  61              		@ frame_needed = 1, uses_anonymous_args = 0
  62 0000 80B5     		push	{r7, lr}
  63              		.cfi_def_cfa_offset 8
  64              		.cfi_offset 7, -8
  65              		.cfi_offset 14, -4
  66 0002 00AF     		add	r7, sp, #0
  67              		.cfi_def_cfa_register 7
  36:/home/love/Documents/skola/EDA482/LV5/C/flipflop_irq/startup.c ****     if (EXTI_PR & EXTI3_BIN_POS) {
  68              		.loc 1 36 9
  69 0004 094B     		ldr	r3, .L5
  70 0006 1B68     		ldr	r3, [r3]
  71              		.loc 1 36 17
  72 0008 0822     		movs	r2, #8
  73 000a 1340     		ands	r3, r2
  74              		.loc 1 36 8
  75 000c 0AD0     		beq	.L4
  37:/home/love/Documents/skola/EDA482/LV5/C/flipflop_irq/startup.c ****         count++;
  76              		.loc 1 37 14
  77 000e 084B     		ldr	r3, .L5+4
  78 0010 1B68     		ldr	r3, [r3]
  79 0012 5A1C     		adds	r2, r3, #1
  80 0014 064B     		ldr	r3, .L5+4
  81 0016 1A60     		str	r2, [r3]
  38:/home/love/Documents/skola/EDA482/LV5/C/flipflop_irq/startup.c ****         EXTI_PR |= EXTI3_BIN_POS;
  82              		.loc 1 38 17
  83 0018 044B     		ldr	r3, .L5
  84 001a 1A68     		ldr	r2, [r3]
  85 001c 034B     		ldr	r3, .L5
  86 001e 0821     		movs	r1, #8
  87 0020 0A43     		orrs	r2, r1
  88 0022 1A60     		str	r2, [r3]
  89              	.L4:
  39:/home/love/Documents/skola/EDA482/LV5/C/flipflop_irq/startup.c ****     }
  40:/home/love/Documents/skola/EDA482/LV5/C/flipflop_irq/startup.c **** }
  90              		.loc 1 40 1
  91 0024 C046     		nop
  92 0026 BD46     		mov	sp, r7
  93              		@ sp needed
  94 0028 80BD     		pop	{r7, pc}
  95              	.L6:
  96 002a C046     		.align	2
  97              	.L5:
  98 002c 503C0140 		.word	1073822800
  99 0030 00000000 		.word	count
 100              		.cfi_endproc
 101              	.LFE1:
 103              		.align	1
 104              		.global	app_init
 105              		.syntax unified
 106              		.code	16
 107              		.thumb_func
 108              		.fpu softvfp
 110              	app_init:
 111              	.LFB2:
  41:/home/love/Documents/skola/EDA482/LV5/C/flipflop_irq/startup.c **** 
  42:/home/love/Documents/skola/EDA482/LV5/C/flipflop_irq/startup.c **** void app_init(void) {
 112              		.loc 1 42 21
 113              		.cfi_startproc
 114              		@ args = 0, pretend = 0, frame = 0
 115              		@ frame_needed = 1, uses_anonymous_args = 0
 116 0034 80B5     		push	{r7, lr}
 117              		.cfi_def_cfa_offset 8
 118              		.cfi_offset 7, -8
 119              		.cfi_offset 14, -4
 120 0036 00AF     		add	r7, sp, #0
 121              		.cfi_def_cfa_register 7
  43:/home/love/Documents/skola/EDA482/LV5/C/flipflop_irq/startup.c ****     GPIO_output(GPIO_D);
 122              		.loc 1 43 5
 123 0038 164B     		ldr	r3, .L8
 124 003a 1800     		movs	r0, r3
 125 003c FFF7FEFF 		bl	GPIO_output
  44:/home/love/Documents/skola/EDA482/LV5/C/flipflop_irq/startup.c ****     count = 5;
 126              		.loc 1 44 11
 127 0040 154B     		ldr	r3, .L8+4
 128 0042 0522     		movs	r2, #5
 129 0044 1A60     		str	r2, [r3]
  45:/home/love/Documents/skola/EDA482/LV5/C/flipflop_irq/startup.c ****     // IO-pin PE3 routed to EXTI3
  46:/home/love/Documents/skola/EDA482/LV5/C/flipflop_irq/startup.c ****     SYSCFG_EXTICR1 |= 0x4000; // Set bit 14 of SYSCFG_EXTICR1
 130              		.loc 1 46 20
 131 0046 154B     		ldr	r3, .L8+8
 132 0048 1A68     		ldr	r2, [r3]
 133 004a 144B     		ldr	r3, .L8+8
 134 004c 8021     		movs	r1, #128
 135 004e C901     		lsls	r1, r1, #7
 136 0050 0A43     		orrs	r2, r1
 137 0052 1A60     		str	r2, [r3]
  47:/home/love/Documents/skola/EDA482/LV5/C/flipflop_irq/startup.c ****     
  48:/home/love/Documents/skola/EDA482/LV5/C/flipflop_irq/startup.c ****     EXTI_IMR |= EXTI3_BIN_POS; // Set b3 in IMR, turning on EXTI3
 138              		.loc 1 48 14
 139 0054 124B     		ldr	r3, .L8+12
 140 0056 1A68     		ldr	r2, [r3]
 141 0058 114B     		ldr	r3, .L8+12
 142 005a 0821     		movs	r1, #8
 143 005c 0A43     		orrs	r2, r1
 144 005e 1A60     		str	r2, [r3]
  49:/home/love/Documents/skola/EDA482/LV5/C/flipflop_irq/startup.c ****     EXTI_FTSR &= ~EXTI3_BIN_POS; // reset b3 in FTSR, turning off falling trigger on EXTI3
 145              		.loc 1 49 15
 146 0060 104B     		ldr	r3, .L8+16
 147 0062 1A68     		ldr	r2, [r3]
 148 0064 0F4B     		ldr	r3, .L8+16
 149 0066 0821     		movs	r1, #8
 150 0068 8A43     		bics	r2, r1
 151 006a 1A60     		str	r2, [r3]
  50:/home/love/Documents/skola/EDA482/LV5/C/flipflop_irq/startup.c ****     EXTI_RTSR |= EXTI3_BIN_POS; // Set b3 in RTSR, turning on rising trigger on EXTI3
 152              		.loc 1 50 15
 153 006c 0E4B     		ldr	r3, .L8+20
 154 006e 1A68     		ldr	r2, [r3]
 155 0070 0D4B     		ldr	r3, .L8+20
 156 0072 0821     		movs	r1, #8
 157 0074 0A43     		orrs	r2, r1
 158 0076 1A60     		str	r2, [r3]
  51:/home/love/Documents/skola/EDA482/LV5/C/flipflop_irq/startup.c ****     
  52:/home/love/Documents/skola/EDA482/LV5/C/flipflop_irq/startup.c ****     *((void (**)(void)) 0x2001C000+EXTI3_VECTOR_OFFSET) = irq_handler; // setup interrupt vector
 159              		.loc 1 52 5
 160 0078 0C4B     		ldr	r3, .L8+24
 161              		.loc 1 52 57
 162 007a 0D4A     		ldr	r2, .L8+28
 163 007c 1A60     		str	r2, [r3]
  53:/home/love/Documents/skola/EDA482/LV5/C/flipflop_irq/startup.c ****     NVIC_ISER0 |= (1<<EXTI3_INTERRUPT_NUM); // enable exti3 in NVIC
 164              		.loc 1 53 16
 165 007e 0D4B     		ldr	r3, .L8+32
 166 0080 1A68     		ldr	r2, [r3]
 167 0082 0C4B     		ldr	r3, .L8+32
 168 0084 8021     		movs	r1, #128
 169 0086 8900     		lsls	r1, r1, #2
 170 0088 0A43     		orrs	r2, r1
 171 008a 1A60     		str	r2, [r3]
  54:/home/love/Documents/skola/EDA482/LV5/C/flipflop_irq/startup.c **** }
 172              		.loc 1 54 1
 173 008c C046     		nop
 174 008e BD46     		mov	sp, r7
 175              		@ sp needed
 176 0090 80BD     		pop	{r7, pc}
 177              	.L9:
 178 0092 C046     		.align	2
 179              	.L8:
 180 0094 000C0240 		.word	1073875968
 181 0098 00000000 		.word	count
 182 009c 08380140 		.word	1073821704
 183 00a0 003C0140 		.word	1073822720
 184 00a4 303C0140 		.word	1073822768
 185 00a8 203C0140 		.word	1073822752
 186 00ac 90C10120 		.word	536986000
 187 00b0 00000000 		.word	irq_handler
 188 00b4 00E100E0 		.word	-536813312
 189              		.cfi_endproc
 190              	.LFE2:
 192              		.align	1
 193              		.global	main
 194              		.syntax unified
 195              		.code	16
 196              		.thumb_func
 197              		.fpu softvfp
 199              	main:
 200              	.LFB3:
  55:/home/love/Documents/skola/EDA482/LV5/C/flipflop_irq/startup.c **** 
  56:/home/love/Documents/skola/EDA482/LV5/C/flipflop_irq/startup.c **** int main(void) {
 201              		.loc 1 56 16
 202              		.cfi_startproc
 203              		@ args = 0, pretend = 0, frame = 0
 204              		@ frame_needed = 1, uses_anonymous_args = 0
 205 00b8 80B5     		push	{r7, lr}
 206              		.cfi_def_cfa_offset 8
 207              		.cfi_offset 7, -8
 208              		.cfi_offset 14, -4
 209 00ba 00AF     		add	r7, sp, #0
 210              		.cfi_def_cfa_register 7
  57:/home/love/Documents/skola/EDA482/LV5/C/flipflop_irq/startup.c ****     app_init();
 211              		.loc 1 57 5
 212 00bc FFF7FEFF 		bl	app_init
 213              	.L11:
  58:/home/love/Documents/skola/EDA482/LV5/C/flipflop_irq/startup.c ****     while(true) {
  59:/home/love/Documents/skola/EDA482/LV5/C/flipflop_irq/startup.c ****         GPIO_D->odr_low = count;
 214              		.loc 1 59 25 discriminator 1
 215 00c0 024B     		ldr	r3, .L12
 216 00c2 1A68     		ldr	r2, [r3]
 217              		.loc 1 59 15 discriminator 1
 218 00c4 024B     		ldr	r3, .L12+4
 219              		.loc 1 59 25 discriminator 1
 220 00c6 D2B2     		uxtb	r2, r2
 221 00c8 1A75     		strb	r2, [r3, #20]
 222 00ca F9E7     		b	.L11
 223              	.L13:
 224              		.align	2
 225              	.L12:
 226 00cc 00000000 		.word	count
 227 00d0 000C0240 		.word	1073875968
 228              		.cfi_endproc
 229              	.LFE3:
 231              	.Letext0:
 232              		.file 2 "/usr/arm-none-eabi/include/machine/_default_types.h"
 233              		.file 3 "/usr/arm-none-eabi/include/sys/_stdint.h"
 234              		.file 4 "/home/love/Documents/skola/EDA482/libs/include/libGPIO.h"
