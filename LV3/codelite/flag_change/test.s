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
  25              		.file 1 "/home/love/Documents/skola/EDA482/LV3/codelite/flag_change/startup.c"
   1:/home/love/Documents/skola/EDA482/LV3/codelite/flag_change/startup.c **** /*
   2:/home/love/Documents/skola/EDA482/LV3/codelite/flag_change/startup.c ****  * 	startup.c
   3:/home/love/Documents/skola/EDA482/LV3/codelite/flag_change/startup.c ****  *  
   4:/home/love/Documents/skola/EDA482/LV3/codelite/flag_change/startup.c ****  */
   5:/home/love/Documents/skola/EDA482/LV3/codelite/flag_change/startup.c **** #include <stdint.h>
   6:/home/love/Documents/skola/EDA482/LV3/codelite/flag_change/startup.c **** 
   7:/home/love/Documents/skola/EDA482/LV3/codelite/flag_change/startup.c **** void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );
   8:/home/love/Documents/skola/EDA482/LV3/codelite/flag_change/startup.c **** 
   9:/home/love/Documents/skola/EDA482/LV3/codelite/flag_change/startup.c **** void startup ( void )
  10:/home/love/Documents/skola/EDA482/LV3/codelite/flag_change/startup.c **** {
  26              		.loc 1 10 1
  27              		.cfi_startproc
  28              		@ Naked Function: prologue and epilogue provided by programmer.
  29              		@ args = 0, pretend = 0, frame = 0
  30              		@ frame_needed = 1, uses_anonymous_args = 0
  11:/home/love/Documents/skola/EDA482/LV3/codelite/flag_change/startup.c **** asm volatile(
  31              		.loc 1 11 1
  32              		.syntax divided
  33              	@ 11 "/home/love/Documents/skola/EDA482/LV3/codelite/flag_change/startup.c" 1
  34 0000 0248     		 LDR R0,=0x2001C000
  35 0002 8546     	 MOV SP,R0
  36 0004 FFF7FEFF 	 BL main
  37 0008 FEE7     	.L1: B .L1
  38              	
  39              	@ 0 "" 2
  12:/home/love/Documents/skola/EDA482/LV3/codelite/flag_change/startup.c **** 	" LDR R0,=0x2001C000\n"		/* set stack */
  13:/home/love/Documents/skola/EDA482/LV3/codelite/flag_change/startup.c **** 	" MOV SP,R0\n"
  14:/home/love/Documents/skola/EDA482/LV3/codelite/flag_change/startup.c **** 	" BL main\n"				/* call main */
  15:/home/love/Documents/skola/EDA482/LV3/codelite/flag_change/startup.c **** 	".L1: B .L1\n"				/* never return */
  16:/home/love/Documents/skola/EDA482/LV3/codelite/flag_change/startup.c **** 	) ;
  17:/home/love/Documents/skola/EDA482/LV3/codelite/flag_change/startup.c **** }
  40              		.loc 1 17 1
  41              		.thumb
  42              		.syntax unified
  43 000a C046     		nop
  44              		.cfi_endproc
  45              	.LFE0:
  47              		.text
  48              		.align	1
  49              		.global	getPsrReg
  50              		.syntax unified
  51              		.code	16
  52              		.thumb_func
  53              		.fpu softvfp
  55              	getPsrReg:
  56              	.LFB1:
  18:/home/love/Documents/skola/EDA482/LV3/codelite/flag_change/startup.c **** 
  19:/home/love/Documents/skola/EDA482/LV3/codelite/flag_change/startup.c **** __attribute__((naked)) uint32_t getPsrReg(void) {
  57              		.loc 1 19 49
  58              		.cfi_startproc
  59              		@ Naked Function: prologue and epilogue provided by programmer.
  60              		@ args = 0, pretend = 0, frame = 0
  61              		@ frame_needed = 1, uses_anonymous_args = 0
  20:/home/love/Documents/skola/EDA482/LV3/codelite/flag_change/startup.c ****     asm(
  62              		.loc 1 20 5
  63              		.syntax divided
  64              	@ 20 "/home/love/Documents/skola/EDA482/LV3/codelite/flag_change/startup.c" 1
  65 0000 EFF30080 		MRS R0,APSR
  66 0004 7047     	BX LR
  67              	
  68              	@ 0 "" 2
  21:/home/love/Documents/skola/EDA482/LV3/codelite/flag_change/startup.c ****     "MRS R0,APSR\n"
  22:/home/love/Documents/skola/EDA482/LV3/codelite/flag_change/startup.c ****     "BX LR\n"
  23:/home/love/Documents/skola/EDA482/LV3/codelite/flag_change/startup.c ****     );
  24:/home/love/Documents/skola/EDA482/LV3/codelite/flag_change/startup.c **** }
  69              		.loc 1 24 1
  70              		.thumb
  71              		.syntax unified
  72 0006 C046     		nop
  73 0008 1800     		movs	r0, r3
  74              		.cfi_endproc
  75              	.LFE1:
  77              		.align	1
  78              		.global	setPsrReg
  79              		.syntax unified
  80              		.code	16
  81              		.thumb_func
  82              		.fpu softvfp
  84              	setPsrReg:
  85              	.LFB2:
  25:/home/love/Documents/skola/EDA482/LV3/codelite/flag_change/startup.c **** 
  26:/home/love/Documents/skola/EDA482/LV3/codelite/flag_change/startup.c **** __attribute__((naked)) void setPsrReg(uint32_t apsr) {
  86              		.loc 1 26 54
  87              		.cfi_startproc
  88              		@ Naked Function: prologue and epilogue provided by programmer.
  89              		@ args = 0, pretend = 0, frame = 0
  90              		@ frame_needed = 1, uses_anonymous_args = 0
  27:/home/love/Documents/skola/EDA482/LV3/codelite/flag_change/startup.c ****     asm(
  91              		.loc 1 27 5
  92              		.syntax divided
  93              	@ 27 "/home/love/Documents/skola/EDA482/LV3/codelite/flag_change/startup.c" 1
  94 000a 80F30088 		MSR APSR,R0
  95 000e 7047     	BX LR
  96              	
  97              	@ 0 "" 2
  28:/home/love/Documents/skola/EDA482/LV3/codelite/flag_change/startup.c ****     "MSR APSR,R0\n"
  29:/home/love/Documents/skola/EDA482/LV3/codelite/flag_change/startup.c ****     "BX LR\n"
  30:/home/love/Documents/skola/EDA482/LV3/codelite/flag_change/startup.c ****     );
  31:/home/love/Documents/skola/EDA482/LV3/codelite/flag_change/startup.c **** }
  98              		.loc 1 31 1
  99              		.thumb
 100              		.syntax unified
 101 0010 C046     		nop
 102              		.cfi_endproc
 103              	.LFE2:
 105              		.align	1
 106              		.global	main
 107              		.syntax unified
 108              		.code	16
 109              		.thumb_func
 110              		.fpu softvfp
 112              	main:
 113              	.LFB3:
  32:/home/love/Documents/skola/EDA482/LV3/codelite/flag_change/startup.c **** 
  33:/home/love/Documents/skola/EDA482/LV3/codelite/flag_change/startup.c **** int main(void) {
 114              		.loc 1 33 16
 115              		.cfi_startproc
 116              		@ args = 0, pretend = 0, frame = 8
 117              		@ frame_needed = 1, uses_anonymous_args = 0
 118 0012 80B5     		push	{r7, lr}
 119              		.cfi_def_cfa_offset 8
 120              		.cfi_offset 7, -8
 121              		.cfi_offset 14, -4
 122 0014 82B0     		sub	sp, sp, #8
 123              		.cfi_def_cfa_offset 16
 124 0016 00AF     		add	r7, sp, #0
 125              		.cfi_def_cfa_register 7
  34:/home/love/Documents/skola/EDA482/LV3/codelite/flag_change/startup.c ****     uint32_t psr;
  35:/home/love/Documents/skola/EDA482/LV3/codelite/flag_change/startup.c ****     psr = getPsrReg();
 126              		.loc 1 35 11
 127 0018 FFF7FEFF 		bl	getPsrReg
 128 001c 0300     		movs	r3, r0
 129 001e 7B60     		str	r3, [r7, #4]
  36:/home/love/Documents/skola/EDA482/LV3/codelite/flag_change/startup.c ****     setPsrReg(0);
 130              		.loc 1 36 5
 131 0020 0020     		movs	r0, #0
 132 0022 FFF7FEFF 		bl	setPsrReg
  37:/home/love/Documents/skola/EDA482/LV3/codelite/flag_change/startup.c ****     psr = getPsrReg();
 133              		.loc 1 37 11
 134 0026 FFF7FEFF 		bl	getPsrReg
 135 002a 0300     		movs	r3, r0
 136 002c 7B60     		str	r3, [r7, #4]
  38:/home/love/Documents/skola/EDA482/LV3/codelite/flag_change/startup.c ****     return 0;
 137              		.loc 1 38 12
 138 002e 0023     		movs	r3, #0
  39:/home/love/Documents/skola/EDA482/LV3/codelite/flag_change/startup.c **** }
 139              		.loc 1 39 1
 140 0030 1800     		movs	r0, r3
 141 0032 BD46     		mov	sp, r7
 142 0034 02B0     		add	sp, sp, #8
 143              		@ sp needed
 144 0036 80BD     		pop	{r7, pc}
 145              		.cfi_endproc
 146              	.LFE3:
 148              	.Letext0:
 149              		.file 2 "/usr/arm-none-eabi/include/machine/_default_types.h"
 150              		.file 3 "/usr/arm-none-eabi/include/sys/_stdint.h"
