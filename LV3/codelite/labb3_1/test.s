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
  25              		.file 1 "/home/love/Documents/skola/EDA482/LV3/codelite/labb3_1/startup.c"
   1:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_1/startup.c **** /*
   2:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_1/startup.c ****  * 	startup.c
   3:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_1/startup.c ****  *  
   4:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_1/startup.c ****  */
   5:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_1/startup.c **** #include "libGPIO.h"
   6:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_1/startup.c **** #include "libdelay.h"
   7:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_1/startup.c **** #include "graphics.h"
   8:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_1/startup.c **** #include <stdint.h>
   9:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_1/startup.c **** #include <stdbool.h>
  10:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_1/startup.c **** 
  11:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_1/startup.c **** void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );
  12:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_1/startup.c **** 
  13:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_1/startup.c **** void startup ( void )
  14:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_1/startup.c **** {
  26              		.loc 1 14 1
  27              		.cfi_startproc
  28              		@ Naked Function: prologue and epilogue provided by programmer.
  29              		@ args = 0, pretend = 0, frame = 0
  30              		@ frame_needed = 1, uses_anonymous_args = 0
  15:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_1/startup.c **** asm volatile(
  31              		.loc 1 15 1
  32              		.syntax divided
  33              	@ 15 "/home/love/Documents/skola/EDA482/LV3/codelite/labb3_1/startup.c" 1
  34 0000 0248     		 LDR R0,=0x2001C000
  35 0002 8546     	 MOV SP,R0
  36 0004 FFF7FEFF 	 BL main
  37 0008 FEE7     	.L1: B .L1
  38              	
  39              	@ 0 "" 2
  16:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_1/startup.c **** 	" LDR R0,=0x2001C000\n"		/* set stack */
  17:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_1/startup.c **** 	" MOV SP,R0\n"
  18:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_1/startup.c **** 	" BL main\n"				/* call main */
  19:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_1/startup.c **** 	".L1: B .L1\n"				/* never return */
  20:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_1/startup.c **** 	) ;
  21:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_1/startup.c **** }
  40              		.loc 1 21 1
  41              		.thumb
  42              		.syntax unified
  43 000a C046     		nop
  44              		.cfi_endproc
  45              	.LFE0:
  47              		.text
  48              		.align	1
  49              		.global	main
  50              		.syntax unified
  51              		.code	16
  52              		.thumb_func
  53              		.fpu softvfp
  55              	main:
  56              	.LFB1:
  22:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_1/startup.c **** 
  23:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_1/startup.c **** int main(void)
  24:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_1/startup.c **** {
  57              		.loc 1 24 1
  58              		.cfi_startproc
  59              		@ args = 0, pretend = 0, frame = 8
  60              		@ frame_needed = 1, uses_anonymous_args = 0
  61 0000 80B5     		push	{r7, lr}
  62              		.cfi_def_cfa_offset 8
  63              		.cfi_offset 7, -8
  64              		.cfi_offset 14, -4
  65 0002 82B0     		sub	sp, sp, #8
  66              		.cfi_def_cfa_offset 16
  67 0004 00AF     		add	r7, sp, #0
  68              		.cfi_def_cfa_register 7
  25:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_1/startup.c ****     GPIO_output(GPIO_E);
  69              		.loc 1 25 5
  70 0006 274B     		ldr	r3, .L10
  71 0008 1800     		movs	r0, r3
  72 000a FFF7FEFF 		bl	GPIO_output
  73              	.LBB2:
  26:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_1/startup.c ****     for (uint8_t x = 0; x < 128; x++) {
  74              		.loc 1 26 18
  75 000e FB1D     		adds	r3, r7, #7
  76 0010 0022     		movs	r2, #0
  77 0012 1A70     		strb	r2, [r3]
  78              		.loc 1 26 5
  79 0014 16E0     		b	.L3
  80              	.L5:
  27:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_1/startup.c ****         pixel(x, 10, true);
  81              		.loc 1 27 9
  82 0016 FB1D     		adds	r3, r7, #7
  83 0018 1B78     		ldrb	r3, [r3]
  84 001a 0122     		movs	r2, #1
  85 001c 0A21     		movs	r1, #10
  86 001e 1800     		movs	r0, r3
  87 0020 FFF7FEFF 		bl	pixel
  28:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_1/startup.c ****         if (x < 64) {
  88              		.loc 1 28 12
  89 0024 FB1D     		adds	r3, r7, #7
  90 0026 1B78     		ldrb	r3, [r3]
  91 0028 3F2B     		cmp	r3, #63
  92 002a 06D8     		bhi	.L4
  29:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_1/startup.c ****             pixel(10, x, true);
  93              		.loc 1 29 13
  94 002c FB1D     		adds	r3, r7, #7
  95 002e 1B78     		ldrb	r3, [r3]
  96 0030 0122     		movs	r2, #1
  97 0032 1900     		movs	r1, r3
  98 0034 0A20     		movs	r0, #10
  99 0036 FFF7FEFF 		bl	pixel
 100              	.L4:
  26:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_1/startup.c ****         pixel(x, 10, true);
 101              		.loc 1 26 35 discriminator 2
 102 003a FB1D     		adds	r3, r7, #7
 103 003c 1A78     		ldrb	r2, [r3]
 104 003e FB1D     		adds	r3, r7, #7
 105 0040 0132     		adds	r2, r2, #1
 106 0042 1A70     		strb	r2, [r3]
 107              	.L3:
  26:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_1/startup.c ****         pixel(x, 10, true);
 108              		.loc 1 26 27 discriminator 1
 109 0044 FB1D     		adds	r3, r7, #7
 110 0046 1B78     		ldrb	r3, [r3]
 111 0048 5BB2     		sxtb	r3, r3
  26:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_1/startup.c ****         pixel(x, 10, true);
 112              		.loc 1 26 5 discriminator 1
 113 004a 002B     		cmp	r3, #0
 114 004c E3DA     		bge	.L5
 115              	.LBE2:
  30:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_1/startup.c ****         }
  31:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_1/startup.c ****     }
  32:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_1/startup.c ****     delay_millis(1000);
 116              		.loc 1 32 5
 117 004e FA23     		movs	r3, #250
 118 0050 9B00     		lsls	r3, r3, #2
 119 0052 1800     		movs	r0, r3
 120 0054 FFF7FEFF 		bl	delay_millis
 121              	.LBB3:
  33:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_1/startup.c ****     for (uint8_t x = 0; x < 128; x++) {
 122              		.loc 1 33 18
 123 0058 BB1D     		adds	r3, r7, #6
 124 005a 0022     		movs	r2, #0
 125 005c 1A70     		strb	r2, [r3]
 126              		.loc 1 33 5
 127 005e 16E0     		b	.L6
 128              	.L8:
  34:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_1/startup.c ****         pixel(x, 10, false);
 129              		.loc 1 34 9
 130 0060 BB1D     		adds	r3, r7, #6
 131 0062 1B78     		ldrb	r3, [r3]
 132 0064 0022     		movs	r2, #0
 133 0066 0A21     		movs	r1, #10
 134 0068 1800     		movs	r0, r3
 135 006a FFF7FEFF 		bl	pixel
  35:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_1/startup.c ****         if (x < 64) {
 136              		.loc 1 35 12
 137 006e BB1D     		adds	r3, r7, #6
 138 0070 1B78     		ldrb	r3, [r3]
 139 0072 3F2B     		cmp	r3, #63
 140 0074 06D8     		bhi	.L7
  36:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_1/startup.c ****             pixel(10,x, false);
 141              		.loc 1 36 13
 142 0076 BB1D     		adds	r3, r7, #6
 143 0078 1B78     		ldrb	r3, [r3]
 144 007a 0022     		movs	r2, #0
 145 007c 1900     		movs	r1, r3
 146 007e 0A20     		movs	r0, #10
 147 0080 FFF7FEFF 		bl	pixel
 148              	.L7:
  33:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_1/startup.c ****         pixel(x, 10, false);
 149              		.loc 1 33 35 discriminator 2
 150 0084 BB1D     		adds	r3, r7, #6
 151 0086 1A78     		ldrb	r2, [r3]
 152 0088 BB1D     		adds	r3, r7, #6
 153 008a 0132     		adds	r2, r2, #1
 154 008c 1A70     		strb	r2, [r3]
 155              	.L6:
  33:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_1/startup.c ****         pixel(x, 10, false);
 156              		.loc 1 33 27 discriminator 1
 157 008e BB1D     		adds	r3, r7, #6
 158 0090 1B78     		ldrb	r3, [r3]
 159 0092 5BB2     		sxtb	r3, r3
  33:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_1/startup.c ****         pixel(x, 10, false);
 160              		.loc 1 33 5 discriminator 1
 161 0094 002B     		cmp	r3, #0
 162 0096 E3DA     		bge	.L8
 163              	.LBE3:
 164 0098 0023     		movs	r3, #0
  37:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_1/startup.c ****         }
  38:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_1/startup.c ****     }
  39:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_1/startup.c **** }
 165              		.loc 1 39 1
 166 009a 1800     		movs	r0, r3
 167 009c BD46     		mov	sp, r7
 168 009e 02B0     		add	sp, sp, #8
 169              		@ sp needed
 170 00a0 80BD     		pop	{r7, pc}
 171              	.L11:
 172 00a2 C046     		.align	2
 173              	.L10:
 174 00a4 00100240 		.word	1073876992
 175              		.cfi_endproc
 176              	.LFE1:
 178              	.Letext0:
 179              		.file 2 "/usr/arm-none-eabi/include/machine/_default_types.h"
 180              		.file 3 "/usr/arm-none-eabi/include/sys/_stdint.h"
 181              		.file 4 "/home/love/Documents/skola/EDA482/libs/include/libGPIO.h"
