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
  25              		.file 1 "/home/love/Documents/skola/EDA482/LV3/codelite/asciidisplay/startup.c"
   1:/home/love/Documents/skola/EDA482/LV3/codelite/asciidisplay/startup.c **** /*
   2:/home/love/Documents/skola/EDA482/LV3/codelite/asciidisplay/startup.c ****  * 	startup.c
   3:/home/love/Documents/skola/EDA482/LV3/codelite/asciidisplay/startup.c ****  *
   4:/home/love/Documents/skola/EDA482/LV3/codelite/asciidisplay/startup.c ****  */
   5:/home/love/Documents/skola/EDA482/LV3/codelite/asciidisplay/startup.c **** #include "GPIO.h" 
   6:/home/love/Documents/skola/EDA482/LV3/codelite/asciidisplay/startup.c **** #include "delay.h"
   7:/home/love/Documents/skola/EDA482/LV3/codelite/asciidisplay/startup.c **** #include "ascii.h"
   8:/home/love/Documents/skola/EDA482/LV3/codelite/asciidisplay/startup.c ****  
   9:/home/love/Documents/skola/EDA482/LV3/codelite/asciidisplay/startup.c **** void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );
  10:/home/love/Documents/skola/EDA482/LV3/codelite/asciidisplay/startup.c **** 
  11:/home/love/Documents/skola/EDA482/LV3/codelite/asciidisplay/startup.c **** void startup ( void )
  12:/home/love/Documents/skola/EDA482/LV3/codelite/asciidisplay/startup.c **** {
  26              		.loc 1 12 1
  27              		.cfi_startproc
  28              		@ Naked Function: prologue and epilogue provided by programmer.
  29              		@ args = 0, pretend = 0, frame = 0
  30              		@ frame_needed = 1, uses_anonymous_args = 0
  13:/home/love/Documents/skola/EDA482/LV3/codelite/asciidisplay/startup.c **** asm volatile(
  31              		.loc 1 13 1
  32              		.syntax divided
  33              	@ 13 "/home/love/Documents/skola/EDA482/LV3/codelite/asciidisplay/startup.c" 1
  34 0000 0248     		 LDR R0,=0x2001C000
  35 0002 8546     	 MOV SP,R0
  36 0004 FFF7FEFF 	 BL main
  37 0008 FEE7     	.L1: B .L1
  38              	
  39              	@ 0 "" 2
  14:/home/love/Documents/skola/EDA482/LV3/codelite/asciidisplay/startup.c **** 	" LDR R0,=0x2001C000\n"		/* set stack */
  15:/home/love/Documents/skola/EDA482/LV3/codelite/asciidisplay/startup.c **** 	" MOV SP,R0\n"
  16:/home/love/Documents/skola/EDA482/LV3/codelite/asciidisplay/startup.c **** 	" BL main\n"				/* call main */
  17:/home/love/Documents/skola/EDA482/LV3/codelite/asciidisplay/startup.c **** 	".L1: B .L1\n"				/* never return */
  18:/home/love/Documents/skola/EDA482/LV3/codelite/asciidisplay/startup.c **** 	) ;
  19:/home/love/Documents/skola/EDA482/LV3/codelite/asciidisplay/startup.c **** }
  40              		.loc 1 19 1
  41              		.thumb
  42              		.syntax unified
  43 000a C046     		nop
  44              		.cfi_endproc
  45              	.LFE0:
  47              		.section	.rodata
  48              		.align	2
  49              	.LC0:
  50 0000 49276D20 		.ascii	"I'm a cat, a kitty cat\000"
  50      61206361 
  50      742C2061 
  50      206B6974 
  50      74792063 
  51 0017 00       		.align	2
  52              	.LC2:
  53 0018 616E6420 		.ascii	"and i dance dance dance\000"
  53      69206461 
  53      6E636520 
  53      64616E63 
  53      65206461 
  54              		.text
  55              		.align	1
  56              		.global	main
  57              		.syntax unified
  58              		.code	16
  59              		.thumb_func
  60              		.fpu softvfp
  62              	main:
  63              	.LFB1:
  20:/home/love/Documents/skola/EDA482/LV3/codelite/asciidisplay/startup.c **** 
  21:/home/love/Documents/skola/EDA482/LV3/codelite/asciidisplay/startup.c **** int main(void)
  22:/home/love/Documents/skola/EDA482/LV3/codelite/asciidisplay/startup.c **** {
  64              		.loc 1 22 1
  65              		.cfi_startproc
  66              		@ args = 0, pretend = 0, frame = 48
  67              		@ frame_needed = 1, uses_anonymous_args = 0
  68 0000 B0B5     		push	{r4, r5, r7, lr}
  69              		.cfi_def_cfa_offset 16
  70              		.cfi_offset 4, -16
  71              		.cfi_offset 5, -12
  72              		.cfi_offset 7, -8
  73              		.cfi_offset 14, -4
  74 0002 8CB0     		sub	sp, sp, #48
  75              		.cfi_def_cfa_offset 64
  76 0004 00AF     		add	r7, sp, #0
  77              		.cfi_def_cfa_register 7
  23:/home/love/Documents/skola/EDA482/LV3/codelite/asciidisplay/startup.c ****     #ifdef USBDM
  24:/home/love/Documents/skola/EDA482/LV3/codelite/asciidisplay/startup.c ****         GPIO_clock_start();
  25:/home/love/Documents/skola/EDA482/LV3/codelite/asciidisplay/startup.c ****         asm volatile("LDR R0,=0x08000209\n BKX R0\n");
  26:/home/love/Documents/skola/EDA482/LV3/codelite/asciidisplay/startup.c ****     #endif
  27:/home/love/Documents/skola/EDA482/LV3/codelite/asciidisplay/startup.c ****     GPIO_output(GPIO_E); // GPIO_E is output by default
  78              		.loc 1 27 5
  79 0006 164B     		ldr	r3, .L4
  80 0008 1800     		movs	r0, r3
  81 000a FFF7FEFF 		bl	GPIO_output
  28:/home/love/Documents/skola/EDA482/LV3/codelite/asciidisplay/startup.c ****     ascii_init();
  82              		.loc 1 28 5
  83 000e FFF7FEFF 		bl	ascii_init
  29:/home/love/Documents/skola/EDA482/LV3/codelite/asciidisplay/startup.c ****     ascii_gotoxy(1,1);
  84              		.loc 1 29 5
  85 0012 0121     		movs	r1, #1
  86 0014 0120     		movs	r0, #1
  87 0016 FFF7FEFF 		bl	ascii_gotoxy
  30:/home/love/Documents/skola/EDA482/LV3/codelite/asciidisplay/startup.c ****     char test1[] = "I'm a cat, a kitty cat";
  88              		.loc 1 30 10
  89 001a 1820     		movs	r0, #24
  90 001c 3B18     		adds	r3, r7, r0
  91 001e 114A     		ldr	r2, .L4+4
  92 0020 32CA     		ldmia	r2!, {r1, r4, r5}
  93 0022 32C3     		stmia	r3!, {r1, r4, r5}
  94 0024 12CA     		ldmia	r2!, {r1, r4}
  95 0026 12C3     		stmia	r3!, {r1, r4}
  96 0028 1188     		ldrh	r1, [r2]
  97 002a 1980     		strh	r1, [r3]
  98 002c 9278     		ldrb	r2, [r2, #2]
  99 002e 9A70     		strb	r2, [r3, #2]
  31:/home/love/Documents/skola/EDA482/LV3/codelite/asciidisplay/startup.c ****     char test2[] = "and i dance dance dance";
 100              		.loc 1 31 10
 101 0030 3B00     		movs	r3, r7
 102 0032 0D4A     		ldr	r2, .L4+8
 103 0034 32CA     		ldmia	r2!, {r1, r4, r5}
 104 0036 32C3     		stmia	r3!, {r1, r4, r5}
 105 0038 32CA     		ldmia	r2!, {r1, r4, r5}
 106 003a 32C3     		stmia	r3!, {r1, r4, r5}
  32:/home/love/Documents/skola/EDA482/LV3/codelite/asciidisplay/startup.c ****     ascii_write_string(test1);
 107              		.loc 1 32 5
 108 003c 3B18     		adds	r3, r7, r0
 109 003e 1800     		movs	r0, r3
 110 0040 FFF7FEFF 		bl	ascii_write_string
  33:/home/love/Documents/skola/EDA482/LV3/codelite/asciidisplay/startup.c ****     ascii_gotoxy(1,2);
 111              		.loc 1 33 5
 112 0044 0221     		movs	r1, #2
 113 0046 0120     		movs	r0, #1
 114 0048 FFF7FEFF 		bl	ascii_gotoxy
  34:/home/love/Documents/skola/EDA482/LV3/codelite/asciidisplay/startup.c ****     ascii_write_string(test2);
 115              		.loc 1 34 5
 116 004c 3B00     		movs	r3, r7
 117 004e 1800     		movs	r0, r3
 118 0050 FFF7FEFF 		bl	ascii_write_string
  35:/home/love/Documents/skola/EDA482/LV3/codelite/asciidisplay/startup.c ****     return 0;
 119              		.loc 1 35 12
 120 0054 0023     		movs	r3, #0
  36:/home/love/Documents/skola/EDA482/LV3/codelite/asciidisplay/startup.c **** }
 121              		.loc 1 36 1
 122 0056 1800     		movs	r0, r3
 123 0058 BD46     		mov	sp, r7
 124 005a 0CB0     		add	sp, sp, #48
 125              		@ sp needed
 126 005c B0BD     		pop	{r4, r5, r7, pc}
 127              	.L5:
 128 005e C046     		.align	2
 129              	.L4:
 130 0060 00100240 		.word	1073876992
 131 0064 00000000 		.word	.LC0
 132 0068 18000000 		.word	.LC2
 133              		.cfi_endproc
 134              	.LFE1:
 136              	.Letext0:
 137              		.file 2 "/usr/arm-none-eabi/include/machine/_default_types.h"
 138              		.file 3 "/usr/arm-none-eabi/include/sys/_stdint.h"
 139              		.file 4 "/home/love/Documents/skola/EDA482/LV3/codelite/asciidisplay/GPIO.h"
