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
  25              		.file 1 "/home/love/Documents/skola/EDA482/LV5/C/controlRegister/startup.c"
   1:/home/love/Documents/skola/EDA482/LV5/C/controlRegister/startup.c **** /*
   2:/home/love/Documents/skola/EDA482/LV5/C/controlRegister/startup.c ****  * 	startup.c
   3:/home/love/Documents/skola/EDA482/LV5/C/controlRegister/startup.c ****  *  
   4:/home/love/Documents/skola/EDA482/LV5/C/controlRegister/startup.c ****  */
   5:/home/love/Documents/skola/EDA482/LV5/C/controlRegister/startup.c **** #include <stdint.h>
   6:/home/love/Documents/skola/EDA482/LV5/C/controlRegister/startup.c **** 
   7:/home/love/Documents/skola/EDA482/LV5/C/controlRegister/startup.c **** #define SCB_VTOR (volatile uint32_t*) 0xE000ED08
   8:/home/love/Documents/skola/EDA482/LV5/C/controlRegister/startup.c **** 
   9:/home/love/Documents/skola/EDA482/LV5/C/controlRegister/startup.c **** void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );
  10:/home/love/Documents/skola/EDA482/LV5/C/controlRegister/startup.c **** 
  11:/home/love/Documents/skola/EDA482/LV5/C/controlRegister/startup.c **** void startup ( void ) {
  26              		.loc 1 11 23
  27              		.cfi_startproc
  28              		@ Naked Function: prologue and epilogue provided by programmer.
  29              		@ args = 0, pretend = 0, frame = 0
  30              		@ frame_needed = 1, uses_anonymous_args = 0
  12:/home/love/Documents/skola/EDA482/LV5/C/controlRegister/startup.c **** asm volatile(
  31              		.loc 1 12 1
  32              		.syntax divided
  33              	@ 12 "/home/love/Documents/skola/EDA482/LV5/C/controlRegister/startup.c" 1
  34 0000 0248     		 LDR R0,=0x2001C000
  35 0002 8546     	 MOV SP,R0
  36 0004 FFF7FEFF 	 BL main
  37 0008 FEE7     	.L1: B .L1
  38              	
  39              	@ 0 "" 2
  13:/home/love/Documents/skola/EDA482/LV5/C/controlRegister/startup.c **** 	" LDR R0,=0x2001C000\n"		/* set stack */
  14:/home/love/Documents/skola/EDA482/LV5/C/controlRegister/startup.c **** 	" MOV SP,R0\n"
  15:/home/love/Documents/skola/EDA482/LV5/C/controlRegister/startup.c **** 	" BL main\n"				/* call main */
  16:/home/love/Documents/skola/EDA482/LV5/C/controlRegister/startup.c **** 	".L1: B .L1\n"				/* never return */
  17:/home/love/Documents/skola/EDA482/LV5/C/controlRegister/startup.c **** 	) ;
  18:/home/love/Documents/skola/EDA482/LV5/C/controlRegister/startup.c **** }
  40              		.loc 1 18 1
  41              		.thumb
  42              		.syntax unified
  43 000a C046     		nop
  44              		.cfi_endproc
  45              	.LFE0:
  47              		.text
  48              		.align	1
  49              		.global	getControlReg
  50              		.syntax unified
  51              		.code	16
  52              		.thumb_func
  53              		.fpu softvfp
  55              	getControlReg:
  56              	.LFB1:
  19:/home/love/Documents/skola/EDA482/LV5/C/controlRegister/startup.c **** 
  20:/home/love/Documents/skola/EDA482/LV5/C/controlRegister/startup.c **** __attribute__((naked)) uint32_t getControlReg(void) {
  57              		.loc 1 20 53
  58              		.cfi_startproc
  59              		@ Naked Function: prologue and epilogue provided by programmer.
  60              		@ args = 0, pretend = 0, frame = 0
  61              		@ frame_needed = 1, uses_anonymous_args = 0
  21:/home/love/Documents/skola/EDA482/LV5/C/controlRegister/startup.c ****     asm(
  62              		.loc 1 21 5
  63              		.syntax divided
  64              	@ 21 "/home/love/Documents/skola/EDA482/LV5/C/controlRegister/startup.c" 1
  65 0000 EFF31480 		MRS R0,CONTROL
  66 0004 7047     	BX LR
  67              	
  68              	@ 0 "" 2
  22:/home/love/Documents/skola/EDA482/LV5/C/controlRegister/startup.c ****     "MRS R0,CONTROL\n"
  23:/home/love/Documents/skola/EDA482/LV5/C/controlRegister/startup.c ****     "BX LR\n"
  24:/home/love/Documents/skola/EDA482/LV5/C/controlRegister/startup.c ****     );
  25:/home/love/Documents/skola/EDA482/LV5/C/controlRegister/startup.c **** }
  69              		.loc 1 25 1
  70              		.thumb
  71              		.syntax unified
  72 0006 C046     		nop
  73 0008 1800     		movs	r0, r3
  74              		.cfi_endproc
  75              	.LFE1:
  77              		.align	1
  78              		.global	setControlReg
  79              		.syntax unified
  80              		.code	16
  81              		.thumb_func
  82              		.fpu softvfp
  84              	setControlReg:
  85              	.LFB2:
  26:/home/love/Documents/skola/EDA482/LV5/C/controlRegister/startup.c **** 
  27:/home/love/Documents/skola/EDA482/LV5/C/controlRegister/startup.c **** __attribute__((naked)) void setControlReg(uint32_t value) {
  86              		.loc 1 27 59
  87              		.cfi_startproc
  88              		@ Naked Function: prologue and epilogue provided by programmer.
  89              		@ args = 0, pretend = 0, frame = 0
  90              		@ frame_needed = 1, uses_anonymous_args = 0
  28:/home/love/Documents/skola/EDA482/LV5/C/controlRegister/startup.c ****     asm(
  91              		.loc 1 28 5
  92              		.syntax divided
  93              	@ 28 "/home/love/Documents/skola/EDA482/LV5/C/controlRegister/startup.c" 1
  94 000a 80F31488 		MSR CONTROL,R0
  95 000e 7047     	BX LR
  96              	
  97              	@ 0 "" 2
  29:/home/love/Documents/skola/EDA482/LV5/C/controlRegister/startup.c ****     "MSR CONTROL,R0\n"
  30:/home/love/Documents/skola/EDA482/LV5/C/controlRegister/startup.c ****     "BX LR\n"
  31:/home/love/Documents/skola/EDA482/LV5/C/controlRegister/startup.c ****     );
  32:/home/love/Documents/skola/EDA482/LV5/C/controlRegister/startup.c **** }
  98              		.loc 1 32 1
  99              		.thumb
 100              		.syntax unified
 101 0010 C046     		nop
 102              		.cfi_endproc
 103              	.LFE2:
 105              		.align	1
 106              		.global	enable_interrupt
 107              		.syntax unified
 108              		.code	16
 109              		.thumb_func
 110              		.fpu softvfp
 112              	enable_interrupt:
 113              	.LFB3:
  33:/home/love/Documents/skola/EDA482/LV5/C/controlRegister/startup.c **** 
  34:/home/love/Documents/skola/EDA482/LV5/C/controlRegister/startup.c **** __attribute__((naked)) void enable_interrupt(void) {
 114              		.loc 1 34 52
 115              		.cfi_startproc
 116              		@ Naked Function: prologue and epilogue provided by programmer.
 117              		@ args = 0, pretend = 0, frame = 0
 118              		@ frame_needed = 1, uses_anonymous_args = 0
  35:/home/love/Documents/skola/EDA482/LV5/C/controlRegister/startup.c ****     asm volatile(
 119              		.loc 1 35 5
 120              		.syntax divided
 121              	@ 35 "/home/love/Documents/skola/EDA482/LV5/C/controlRegister/startup.c" 1
 122 0012 62B6     		CPSIE I
 123 0014 7047     	BX LR
 124              	
 125              	@ 0 "" 2
  36:/home/love/Documents/skola/EDA482/LV5/C/controlRegister/startup.c ****     "CPSIE I\n"
  37:/home/love/Documents/skola/EDA482/LV5/C/controlRegister/startup.c ****     "BX LR\n"
  38:/home/love/Documents/skola/EDA482/LV5/C/controlRegister/startup.c ****     );
  39:/home/love/Documents/skola/EDA482/LV5/C/controlRegister/startup.c **** }
 126              		.loc 1 39 1
 127              		.thumb
 128              		.syntax unified
 129 0016 C046     		nop
 130              		.cfi_endproc
 131              	.LFE3:
 133              		.align	1
 134              		.global	disable_interrupt
 135              		.syntax unified
 136              		.code	16
 137              		.thumb_func
 138              		.fpu softvfp
 140              	disable_interrupt:
 141              	.LFB4:
  40:/home/love/Documents/skola/EDA482/LV5/C/controlRegister/startup.c **** 
  41:/home/love/Documents/skola/EDA482/LV5/C/controlRegister/startup.c **** __attribute__((naked)) void disable_interrupt(void) {
 142              		.loc 1 41 53
 143              		.cfi_startproc
 144              		@ Naked Function: prologue and epilogue provided by programmer.
 145              		@ args = 0, pretend = 0, frame = 0
 146              		@ frame_needed = 1, uses_anonymous_args = 0
  42:/home/love/Documents/skola/EDA482/LV5/C/controlRegister/startup.c ****     asm volatile (
 147              		.loc 1 42 5
 148              		.syntax divided
 149              	@ 42 "/home/love/Documents/skola/EDA482/LV5/C/controlRegister/startup.c" 1
 150 0018 72B6     		CPSID I
 151 001a 7047     	BX LR
 152              	
 153              	@ 0 "" 2
  43:/home/love/Documents/skola/EDA482/LV5/C/controlRegister/startup.c ****     "CPSID I\n"
  44:/home/love/Documents/skola/EDA482/LV5/C/controlRegister/startup.c ****     "BX LR\n"
  45:/home/love/Documents/skola/EDA482/LV5/C/controlRegister/startup.c ****     );
  46:/home/love/Documents/skola/EDA482/LV5/C/controlRegister/startup.c **** }
 154              		.loc 1 46 1
 155              		.thumb
 156              		.syntax unified
 157 001c C046     		nop
 158              		.cfi_endproc
 159              	.LFE4:
 161              		.align	1
 162              		.global	setUnPrivileged
 163              		.syntax unified
 164              		.code	16
 165              		.thumb_func
 166              		.fpu softvfp
 168              	setUnPrivileged:
 169              	.LFB5:
  47:/home/love/Documents/skola/EDA482/LV5/C/controlRegister/startup.c **** 
  48:/home/love/Documents/skola/EDA482/LV5/C/controlRegister/startup.c **** void setUnPrivileged(void) {
 170              		.loc 1 48 28
 171              		.cfi_startproc
 172              		@ args = 0, pretend = 0, frame = 0
 173              		@ frame_needed = 1, uses_anonymous_args = 0
 174 001e 80B5     		push	{r7, lr}
 175              		.cfi_def_cfa_offset 8
 176              		.cfi_offset 7, -8
 177              		.cfi_offset 14, -4
 178 0020 00AF     		add	r7, sp, #0
 179              		.cfi_def_cfa_register 7
  49:/home/love/Documents/skola/EDA482/LV5/C/controlRegister/startup.c ****     setControlReg (getControlReg() | 0b10);
 180              		.loc 1 49 20
 181 0022 FFF7FEFF 		bl	getControlReg
 182 0026 0300     		movs	r3, r0
 183              		.loc 1 49 5
 184 0028 0222     		movs	r2, #2
 185 002a 1343     		orrs	r3, r2
 186 002c 1800     		movs	r0, r3
 187 002e FFF7FEFF 		bl	setControlReg
  50:/home/love/Documents/skola/EDA482/LV5/C/controlRegister/startup.c **** }
 188              		.loc 1 50 1
 189 0032 C046     		nop
 190 0034 BD46     		mov	sp, r7
 191              		@ sp needed
 192 0036 80BD     		pop	{r7, pc}
 193              		.cfi_endproc
 194              	.LFE5:
 196              		.align	1
 197              		.global	app_init
 198              		.syntax unified
 199              		.code	16
 200              		.thumb_func
 201              		.fpu softvfp
 203              	app_init:
 204              	.LFB6:
  51:/home/love/Documents/skola/EDA482/LV5/C/controlRegister/startup.c **** 
  52:/home/love/Documents/skola/EDA482/LV5/C/controlRegister/startup.c **** void app_init(void) {
 205              		.loc 1 52 21
 206              		.cfi_startproc
 207              		@ args = 0, pretend = 0, frame = 0
 208              		@ frame_needed = 1, uses_anonymous_args = 0
 209 0038 80B5     		push	{r7, lr}
 210              		.cfi_def_cfa_offset 8
 211              		.cfi_offset 7, -8
 212              		.cfi_offset 14, -4
 213 003a 00AF     		add	r7, sp, #0
 214              		.cfi_def_cfa_register 7
  53:/home/love/Documents/skola/EDA482/LV5/C/controlRegister/startup.c ****     *SCB_VTOR = 0x2001C000; // Move exception vectors to 0x2001C000
 215              		.loc 1 53 5
 216 003c 024B     		ldr	r3, .L8
 217              		.loc 1 53 15
 218 003e 034A     		ldr	r2, .L8+4
 219 0040 1A60     		str	r2, [r3]
  54:/home/love/Documents/skola/EDA482/LV5/C/controlRegister/startup.c **** }
 220              		.loc 1 54 1
 221 0042 C046     		nop
 222 0044 BD46     		mov	sp, r7
 223              		@ sp needed
 224 0046 80BD     		pop	{r7, pc}
 225              	.L9:
 226              		.align	2
 227              	.L8:
 228 0048 08ED00E0 		.word	-536810232
 229 004c 00C00120 		.word	536985600
 230              		.cfi_endproc
 231              	.LFE6:
 233              		.align	1
 234              		.global	main
 235              		.syntax unified
 236              		.code	16
 237              		.thumb_func
 238              		.fpu softvfp
 240              	main:
 241              	.LFB7:
  55:/home/love/Documents/skola/EDA482/LV5/C/controlRegister/startup.c **** 
  56:/home/love/Documents/skola/EDA482/LV5/C/controlRegister/startup.c **** int main(void) {
 242              		.loc 1 56 16
 243              		.cfi_startproc
 244              		@ args = 0, pretend = 0, frame = 0
 245              		@ frame_needed = 1, uses_anonymous_args = 0
 246 0050 80B5     		push	{r7, lr}
 247              		.cfi_def_cfa_offset 8
 248              		.cfi_offset 7, -8
 249              		.cfi_offset 14, -4
 250 0052 00AF     		add	r7, sp, #0
 251              		.cfi_def_cfa_register 7
  57:/home/love/Documents/skola/EDA482/LV5/C/controlRegister/startup.c ****     
  58:/home/love/Documents/skola/EDA482/LV5/C/controlRegister/startup.c ****     return 0;
 252              		.loc 1 58 12
 253 0054 0023     		movs	r3, #0
  59:/home/love/Documents/skola/EDA482/LV5/C/controlRegister/startup.c **** }
 254              		.loc 1 59 1
 255 0056 1800     		movs	r0, r3
 256 0058 BD46     		mov	sp, r7
 257              		@ sp needed
 258 005a 80BD     		pop	{r7, pc}
 259              		.cfi_endproc
 260              	.LFE7:
 262              	.Letext0:
 263              		.file 2 "/usr/arm-none-eabi/include/machine/_default_types.h"
 264              		.file 3 "/usr/arm-none-eabi/include/sys/_stdint.h"
