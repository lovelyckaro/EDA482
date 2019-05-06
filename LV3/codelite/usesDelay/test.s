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
  25              		.file 1 "/home/love/Documents/skola/EDA482/LV3/codelite/usesDelay/startup.c"
   1:/home/love/Documents/skola/EDA482/LV3/codelite/usesDelay/startup.c **** /*
   2:/home/love/Documents/skola/EDA482/LV3/codelite/usesDelay/startup.c ****  * 	startup.c
   3:/home/love/Documents/skola/EDA482/LV3/codelite/usesDelay/startup.c ****  *
   4:/home/love/Documents/skola/EDA482/LV3/codelite/usesDelay/startup.c ****  */
   5:/home/love/Documents/skola/EDA482/LV3/codelite/usesDelay/startup.c ****  #include "libdelay.h"
   6:/home/love/Documents/skola/EDA482/LV3/codelite/usesDelay/startup.c ****  #include "libGPIO.h"
   7:/home/love/Documents/skola/EDA482/LV3/codelite/usesDelay/startup.c ****  
   8:/home/love/Documents/skola/EDA482/LV3/codelite/usesDelay/startup.c **** void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );
   9:/home/love/Documents/skola/EDA482/LV3/codelite/usesDelay/startup.c **** 
  10:/home/love/Documents/skola/EDA482/LV3/codelite/usesDelay/startup.c **** void startup ( void )
  11:/home/love/Documents/skola/EDA482/LV3/codelite/usesDelay/startup.c **** {
  26              		.loc 1 11 1
  27              		.cfi_startproc
  28              		@ Naked Function: prologue and epilogue provided by programmer.
  29              		@ args = 0, pretend = 0, frame = 0
  30              		@ frame_needed = 1, uses_anonymous_args = 0
  12:/home/love/Documents/skola/EDA482/LV3/codelite/usesDelay/startup.c **** asm volatile(
  31              		.loc 1 12 1
  32              		.syntax divided
  33              	@ 12 "/home/love/Documents/skola/EDA482/LV3/codelite/usesDelay/startup.c" 1
  34 0000 0248     		 LDR R0,=0x2001C000
  35 0002 8546     	 MOV SP,R0
  36 0004 FFF7FEFF 	 BL main
  37 0008 FEE7     	.L1: B .L1
  38              	
  39              	@ 0 "" 2
  13:/home/love/Documents/skola/EDA482/LV3/codelite/usesDelay/startup.c **** 	" LDR R0,=0x2001C000\n"		/* set stack */
  14:/home/love/Documents/skola/EDA482/LV3/codelite/usesDelay/startup.c **** 	" MOV SP,R0\n"
  15:/home/love/Documents/skola/EDA482/LV3/codelite/usesDelay/startup.c **** 	" BL main\n"				/* call main */
  16:/home/love/Documents/skola/EDA482/LV3/codelite/usesDelay/startup.c **** 	".L1: B .L1\n"				/* never return */
  17:/home/love/Documents/skola/EDA482/LV3/codelite/usesDelay/startup.c **** 	) ;
  18:/home/love/Documents/skola/EDA482/LV3/codelite/usesDelay/startup.c **** }
  40              		.loc 1 18 1
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
  19:/home/love/Documents/skola/EDA482/LV3/codelite/usesDelay/startup.c **** 
  20:/home/love/Documents/skola/EDA482/LV3/codelite/usesDelay/startup.c **** void main(void)
  21:/home/love/Documents/skola/EDA482/LV3/codelite/usesDelay/startup.c **** {
  57              		.loc 1 21 1
  58              		.cfi_startproc
  59              		@ args = 0, pretend = 0, frame = 0
  60              		@ frame_needed = 1, uses_anonymous_args = 0
  61 0000 80B5     		push	{r7, lr}
  62              		.cfi_def_cfa_offset 8
  63              		.cfi_offset 7, -8
  64              		.cfi_offset 14, -4
  65 0002 00AF     		add	r7, sp, #0
  66              		.cfi_def_cfa_register 7
  67              	.L3:
  22:/home/love/Documents/skola/EDA482/LV3/codelite/usesDelay/startup.c ****     while(1){
  23:/home/love/Documents/skola/EDA482/LV3/codelite/usesDelay/startup.c ****         GPIO_output(GPIO_D);
  68              		.loc 1 23 9 discriminator 1
  69 0004 0A4B     		ldr	r3, .L4
  70 0006 1800     		movs	r0, r3
  71 0008 FFF7FEFF 		bl	GPIO_output
  24:/home/love/Documents/skola/EDA482/LV3/codelite/usesDelay/startup.c ****         GPIO_D->odr_low = 0xFF;
  72              		.loc 1 24 15 discriminator 1
  73 000c 084B     		ldr	r3, .L4
  74              		.loc 1 24 25 discriminator 1
  75 000e FF22     		movs	r2, #255
  76 0010 1A75     		strb	r2, [r3, #20]
  25:/home/love/Documents/skola/EDA482/LV3/codelite/usesDelay/startup.c ****         delay_micros(500);
  77              		.loc 1 25 9 discriminator 1
  78 0012 FA23     		movs	r3, #250
  79 0014 5B00     		lsls	r3, r3, #1
  80 0016 1800     		movs	r0, r3
  81 0018 FFF7FEFF 		bl	delay_micros
  26:/home/love/Documents/skola/EDA482/LV3/codelite/usesDelay/startup.c ****         GPIO_D->odr_low = 0x00;
  82              		.loc 1 26 15 discriminator 1
  83 001c 044B     		ldr	r3, .L4
  84              		.loc 1 26 25 discriminator 1
  85 001e 0022     		movs	r2, #0
  86 0020 1A75     		strb	r2, [r3, #20]
  27:/home/love/Documents/skola/EDA482/LV3/codelite/usesDelay/startup.c ****         delay_micros(500);
  87              		.loc 1 27 9 discriminator 1
  88 0022 FA23     		movs	r3, #250
  89 0024 5B00     		lsls	r3, r3, #1
  90 0026 1800     		movs	r0, r3
  91 0028 FFF7FEFF 		bl	delay_micros
  23:/home/love/Documents/skola/EDA482/LV3/codelite/usesDelay/startup.c ****         GPIO_D->odr_low = 0xFF;
  92              		.loc 1 23 9 discriminator 1
  93 002c EAE7     		b	.L3
  94              	.L5:
  95 002e C046     		.align	2
  96              	.L4:
  97 0030 000C0240 		.word	1073875968
  98              		.cfi_endproc
  99              	.LFE1:
 101              	.Letext0:
 102              		.file 2 "/usr/arm-none-eabi/include/machine/_default_types.h"
 103              		.file 3 "/usr/arm-none-eabi/include/sys/_stdint.h"
 104              		.file 4 "/home/love/Documents/skola/EDA482/libs/include/libGPIO.h"
