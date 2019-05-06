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
  25              		.file 1 "/home/love/Documents/skola/EDA482/LV3/codelite/md407_startup_with_libraries/startup.c"
   1:/home/love/Documents/skola/EDA482/LV3/codelite/md407_startup_with_libraries/startup.c **** /*
   2:/home/love/Documents/skola/EDA482/LV3/codelite/md407_startup_with_libraries/startup.c ****  * 	startup.c
   3:/home/love/Documents/skola/EDA482/LV3/codelite/md407_startup_with_libraries/startup.c ****  *  
   4:/home/love/Documents/skola/EDA482/LV3/codelite/md407_startup_with_libraries/startup.c ****  */
   5:/home/love/Documents/skola/EDA482/LV3/codelite/md407_startup_with_libraries/startup.c **** #include "libGPIO.h"
   6:/home/love/Documents/skola/EDA482/LV3/codelite/md407_startup_with_libraries/startup.c **** #include "libdelay.h"
   7:/home/love/Documents/skola/EDA482/LV3/codelite/md407_startup_with_libraries/startup.c **** #include <stdint.h>
   8:/home/love/Documents/skola/EDA482/LV3/codelite/md407_startup_with_libraries/startup.c **** 
   9:/home/love/Documents/skola/EDA482/LV3/codelite/md407_startup_with_libraries/startup.c **** void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );
  10:/home/love/Documents/skola/EDA482/LV3/codelite/md407_startup_with_libraries/startup.c **** 
  11:/home/love/Documents/skola/EDA482/LV3/codelite/md407_startup_with_libraries/startup.c **** void startup ( void )
  12:/home/love/Documents/skola/EDA482/LV3/codelite/md407_startup_with_libraries/startup.c **** {
  26              		.loc 1 12 1
  27              		.cfi_startproc
  28              		@ Naked Function: prologue and epilogue provided by programmer.
  29              		@ args = 0, pretend = 0, frame = 0
  30              		@ frame_needed = 1, uses_anonymous_args = 0
  13:/home/love/Documents/skola/EDA482/LV3/codelite/md407_startup_with_libraries/startup.c **** asm volatile(
  31              		.loc 1 13 1
  32              		.syntax divided
  33              	@ 13 "/home/love/Documents/skola/EDA482/LV3/codelite/md407_startup_with_libraries/startup.c" 1
  34 0000 0248     		 LDR R0,=0x2001C000
  35 0002 8546     	 MOV SP,R0
  36 0004 FFF7FEFF 	 BL main
  37 0008 FEE7     	.L1: B .L1
  38              	
  39              	@ 0 "" 2
  14:/home/love/Documents/skola/EDA482/LV3/codelite/md407_startup_with_libraries/startup.c **** 	" LDR R0,=0x2001C000\n"		/* set stack */
  15:/home/love/Documents/skola/EDA482/LV3/codelite/md407_startup_with_libraries/startup.c **** 	" MOV SP,R0\n"
  16:/home/love/Documents/skola/EDA482/LV3/codelite/md407_startup_with_libraries/startup.c **** 	" BL main\n"				/* call main */
  17:/home/love/Documents/skola/EDA482/LV3/codelite/md407_startup_with_libraries/startup.c **** 	".L1: B .L1\n"				/* never return */
  18:/home/love/Documents/skola/EDA482/LV3/codelite/md407_startup_with_libraries/startup.c **** 	) ;
  19:/home/love/Documents/skola/EDA482/LV3/codelite/md407_startup_with_libraries/startup.c **** }
  40              		.loc 1 19 1
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
  20:/home/love/Documents/skola/EDA482/LV3/codelite/md407_startup_with_libraries/startup.c **** 
  21:/home/love/Documents/skola/EDA482/LV3/codelite/md407_startup_with_libraries/startup.c **** int main(void)
  22:/home/love/Documents/skola/EDA482/LV3/codelite/md407_startup_with_libraries/startup.c **** {
  57              		.loc 1 22 1
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
  23:/home/love/Documents/skola/EDA482/LV3/codelite/md407_startup_with_libraries/startup.c ****     GPIO_output(GPIO_D);
  69              		.loc 1 23 5
  70 0006 0F4B     		ldr	r3, .L6
  71 0008 1800     		movs	r0, r3
  72 000a FFF7FEFF 		bl	GPIO_output
  24:/home/love/Documents/skola/EDA482/LV3/codelite/md407_startup_with_libraries/startup.c ****     uint8_t out = 0x80;
  73              		.loc 1 24 13
  74 000e FB1D     		adds	r3, r7, #7
  75 0010 8022     		movs	r2, #128
  76 0012 1A70     		strb	r2, [r3]
  25:/home/love/Documents/skola/EDA482/LV3/codelite/md407_startup_with_libraries/startup.c ****     while(out) {
  77              		.loc 1 25 10
  78 0014 0DE0     		b	.L3
  79              	.L4:
  26:/home/love/Documents/skola/EDA482/LV3/codelite/md407_startup_with_libraries/startup.c ****         GPIO_D->odr_low = out;
  80              		.loc 1 26 15
  81 0016 0B4A     		ldr	r2, .L6
  82              		.loc 1 26 25
  83 0018 FB1D     		adds	r3, r7, #7
  84 001a 1B78     		ldrb	r3, [r3]
  85 001c 1375     		strb	r3, [r2, #20]
  27:/home/love/Documents/skola/EDA482/LV3/codelite/md407_startup_with_libraries/startup.c ****         out = out >> 1;
  86              		.loc 1 27 13
  87 001e FB1D     		adds	r3, r7, #7
  88 0020 FA1D     		adds	r2, r7, #7
  89 0022 1278     		ldrb	r2, [r2]
  90 0024 5208     		lsrs	r2, r2, #1
  91 0026 1A70     		strb	r2, [r3]
  28:/home/love/Documents/skola/EDA482/LV3/codelite/md407_startup_with_libraries/startup.c ****         delay_micros(500);
  92              		.loc 1 28 9
  93 0028 FA23     		movs	r3, #250
  94 002a 5B00     		lsls	r3, r3, #1
  95 002c 1800     		movs	r0, r3
  96 002e FFF7FEFF 		bl	delay_micros
  97              	.L3:
  25:/home/love/Documents/skola/EDA482/LV3/codelite/md407_startup_with_libraries/startup.c ****         GPIO_D->odr_low = out;
  98              		.loc 1 25 10
  99 0032 FB1D     		adds	r3, r7, #7
 100 0034 1B78     		ldrb	r3, [r3]
 101 0036 002B     		cmp	r3, #0
 102 0038 EDD1     		bne	.L4
  29:/home/love/Documents/skola/EDA482/LV3/codelite/md407_startup_with_libraries/startup.c ****     }
  30:/home/love/Documents/skola/EDA482/LV3/codelite/md407_startup_with_libraries/startup.c ****     return 0;
 103              		.loc 1 30 12
 104 003a 0023     		movs	r3, #0
  31:/home/love/Documents/skola/EDA482/LV3/codelite/md407_startup_with_libraries/startup.c **** }
 105              		.loc 1 31 1
 106 003c 1800     		movs	r0, r3
 107 003e BD46     		mov	sp, r7
 108 0040 02B0     		add	sp, sp, #8
 109              		@ sp needed
 110 0042 80BD     		pop	{r7, pc}
 111              	.L7:
 112              		.align	2
 113              	.L6:
 114 0044 000C0240 		.word	1073875968
 115              		.cfi_endproc
 116              	.LFE1:
 118              	.Letext0:
 119              		.file 2 "/usr/arm-none-eabi/include/machine/_default_types.h"
 120              		.file 3 "/usr/arm-none-eabi/include/sys/_stdint.h"
 121              		.file 4 "/home/love/Documents/skola/EDA482/libs/include/libGPIO.h"
