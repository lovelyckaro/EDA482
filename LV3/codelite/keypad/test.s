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
  25              		.file 1 "/home/love/Documents/skola/EDA482/LV3/codelite/keypad/startup.c"
   1:/home/love/Documents/skola/EDA482/LV3/codelite/keypad/startup.c **** /*
   2:/home/love/Documents/skola/EDA482/LV3/codelite/keypad/startup.c ****  * 	startup.c
   3:/home/love/Documents/skola/EDA482/LV3/codelite/keypad/startup.c ****  *
   4:/home/love/Documents/skola/EDA482/LV3/codelite/keypad/startup.c ****  */
   5:/home/love/Documents/skola/EDA482/LV3/codelite/keypad/startup.c **** #include <libGPIO.h>
   6:/home/love/Documents/skola/EDA482/LV3/codelite/keypad/startup.c **** #include <stdint.h>
   7:/home/love/Documents/skola/EDA482/LV3/codelite/keypad/startup.c **** #include <stdbool.h>
   8:/home/love/Documents/skola/EDA482/LV3/codelite/keypad/startup.c **** 
   9:/home/love/Documents/skola/EDA482/LV3/codelite/keypad/startup.c **** void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );
  10:/home/love/Documents/skola/EDA482/LV3/codelite/keypad/startup.c **** 
  11:/home/love/Documents/skola/EDA482/LV3/codelite/keypad/startup.c **** void startup ( void )
  12:/home/love/Documents/skola/EDA482/LV3/codelite/keypad/startup.c **** {
  26              		.loc 1 12 1
  27              		.cfi_startproc
  28              		@ Naked Function: prologue and epilogue provided by programmer.
  29              		@ args = 0, pretend = 0, frame = 0
  30              		@ frame_needed = 1, uses_anonymous_args = 0
  13:/home/love/Documents/skola/EDA482/LV3/codelite/keypad/startup.c **** asm volatile(
  31              		.loc 1 13 1
  32              		.syntax divided
  33              	@ 13 "/home/love/Documents/skola/EDA482/LV3/codelite/keypad/startup.c" 1
  34 0000 0248     		 LDR R0,=0x2001C000
  35 0002 8546     	 MOV SP,R0
  36 0004 FFF7FEFF 	 BL main
  37 0008 FEE7     	.L1: B .L1
  38              	
  39              	@ 0 "" 2
  14:/home/love/Documents/skola/EDA482/LV3/codelite/keypad/startup.c **** 	" LDR R0,=0x2001C000\n"		/* set stack */
  15:/home/love/Documents/skola/EDA482/LV3/codelite/keypad/startup.c **** 	" MOV SP,R0\n"
  16:/home/love/Documents/skola/EDA482/LV3/codelite/keypad/startup.c **** 	" BL main\n"				/* call main */
  17:/home/love/Documents/skola/EDA482/LV3/codelite/keypad/startup.c **** 	".L1: B .L1\n"				/* never return */
  18:/home/love/Documents/skola/EDA482/LV3/codelite/keypad/startup.c **** 	) ;
  19:/home/love/Documents/skola/EDA482/LV3/codelite/keypad/startup.c **** }
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
  20:/home/love/Documents/skola/EDA482/LV3/codelite/keypad/startup.c **** 
  21:/home/love/Documents/skola/EDA482/LV3/codelite/keypad/startup.c **** int main(void)
  22:/home/love/Documents/skola/EDA482/LV3/codelite/keypad/startup.c **** {
  57              		.loc 1 22 1
  58              		.cfi_startproc
  59              		@ args = 0, pretend = 0, frame = 0
  60              		@ frame_needed = 1, uses_anonymous_args = 0
  61 0000 80B5     		push	{r7, lr}
  62              		.cfi_def_cfa_offset 8
  63              		.cfi_offset 7, -8
  64              		.cfi_offset 14, -4
  65 0002 00AF     		add	r7, sp, #0
  66              		.cfi_def_cfa_register 7
  23:/home/love/Documents/skola/EDA482/LV3/codelite/keypad/startup.c ****     GPIO_clock_start();
  67              		.loc 1 23 5
  68 0004 FFF7FEFF 		bl	GPIO_clock_start
  24:/home/love/Documents/skola/EDA482/LV3/codelite/keypad/startup.c ****     GPIO_init_seven_seg(GPIO_D, false);
  69              		.loc 1 24 5
  70 0008 0B4B     		ldr	r3, .L4
  71 000a 0021     		movs	r1, #0
  72 000c 1800     		movs	r0, r3
  73 000e FFF7FEFF 		bl	GPIO_init_seven_seg
  25:/home/love/Documents/skola/EDA482/LV3/codelite/keypad/startup.c ****     GPIO_init_keypad(GPIO_D, true);
  74              		.loc 1 25 5
  75 0012 094B     		ldr	r3, .L4
  76 0014 0121     		movs	r1, #1
  77 0016 1800     		movs	r0, r3
  78 0018 FFF7FEFF 		bl	GPIO_init_keypad
  79              	.L3:
  26:/home/love/Documents/skola/EDA482/LV3/codelite/keypad/startup.c ****     
  27:/home/love/Documents/skola/EDA482/LV3/codelite/keypad/startup.c ****     while(true) {
  28:/home/love/Documents/skola/EDA482/LV3/codelite/keypad/startup.c ****         GPIO_put_seven_seg(GPIO_D, false, GPIO_read_keypad(GPIO_D, true));
  80              		.loc 1 28 9 discriminator 1
  81 001c 064B     		ldr	r3, .L4
  82 001e 0121     		movs	r1, #1
  83 0020 1800     		movs	r0, r3
  84 0022 FFF7FEFF 		bl	GPIO_read_keypad
  85 0026 0300     		movs	r3, r0
  86 0028 1A00     		movs	r2, r3
  87 002a 034B     		ldr	r3, .L4
  88 002c 0021     		movs	r1, #0
  89 002e 1800     		movs	r0, r3
  90 0030 FFF7FEFF 		bl	GPIO_put_seven_seg
  91 0034 F2E7     		b	.L3
  92              	.L5:
  93 0036 C046     		.align	2
  94              	.L4:
  95 0038 000C0240 		.word	1073875968
  96              		.cfi_endproc
  97              	.LFE1:
  99              	.Letext0:
 100              		.file 2 "/usr/arm-none-eabi/include/machine/_default_types.h"
 101              		.file 3 "/usr/arm-none-eabi/include/sys/_stdint.h"
 102              		.file 4 "/home/love/Documents/skola/EDA482/libs/include/libGPIO.h"
