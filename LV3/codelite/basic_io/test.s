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
  25              		.file 1 "/home/love/Documents/skola/EDA482/LV3/codelite/basic_io/startup.c"
   1:/home/love/Documents/skola/EDA482/LV3/codelite/basic_io/startup.c **** /*
   2:/home/love/Documents/skola/EDA482/LV3/codelite/basic_io/startup.c ****  * 	startup.c
   3:/home/love/Documents/skola/EDA482/LV3/codelite/basic_io/startup.c ****  *
   4:/home/love/Documents/skola/EDA482/LV3/codelite/basic_io/startup.c ****  */
   5:/home/love/Documents/skola/EDA482/LV3/codelite/basic_io/startup.c **** void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );
   6:/home/love/Documents/skola/EDA482/LV3/codelite/basic_io/startup.c **** 
   7:/home/love/Documents/skola/EDA482/LV3/codelite/basic_io/startup.c **** void startup ( void )
   8:/home/love/Documents/skola/EDA482/LV3/codelite/basic_io/startup.c **** {
  26              		.loc 1 8 1
  27              		.cfi_startproc
  28              		@ Naked Function: prologue and epilogue provided by programmer.
  29              		@ args = 0, pretend = 0, frame = 0
  30              		@ frame_needed = 1, uses_anonymous_args = 0
   9:/home/love/Documents/skola/EDA482/LV3/codelite/basic_io/startup.c **** asm volatile(
  31              		.loc 1 9 1
  32              		.syntax divided
  33              	@ 9 "/home/love/Documents/skola/EDA482/LV3/codelite/basic_io/startup.c" 1
  34 0000 0248     		 LDR R0,=0x2001C000
  35 0002 8546     	 MOV SP,R0
  36 0004 FFF7FEFF 	 BL main
  37 0008 FEE7     	.L1: B .L1
  38              	
  39              	@ 0 "" 2
  10:/home/love/Documents/skola/EDA482/LV3/codelite/basic_io/startup.c **** 	" LDR R0,=0x2001C000\n"		/* set stack */
  11:/home/love/Documents/skola/EDA482/LV3/codelite/basic_io/startup.c **** 	" MOV SP,R0\n"
  12:/home/love/Documents/skola/EDA482/LV3/codelite/basic_io/startup.c **** 	" BL main\n"				/* call main */
  13:/home/love/Documents/skola/EDA482/LV3/codelite/basic_io/startup.c **** 	".L1: B .L1\n"				/* never return */
  14:/home/love/Documents/skola/EDA482/LV3/codelite/basic_io/startup.c **** 	) ;
  15:/home/love/Documents/skola/EDA482/LV3/codelite/basic_io/startup.c **** }
  40              		.loc 1 15 1
  41              		.thumb
  42              		.syntax unified
  43 000a C046     		nop
  44              		.cfi_endproc
  45              	.LFE0:
  47              		.text
  48              		.align	1
  49              		.global	io_init
  50              		.syntax unified
  51              		.code	16
  52              		.thumb_func
  53              		.fpu softvfp
  55              	io_init:
  56              	.LFB1:
  16:/home/love/Documents/skola/EDA482/LV3/codelite/basic_io/startup.c **** 
  17:/home/love/Documents/skola/EDA482/LV3/codelite/basic_io/startup.c **** #define GPIO_E (unsigned char *) 0x40021010 // GPIO_E b0-7
  18:/home/love/Documents/skola/EDA482/LV3/codelite/basic_io/startup.c **** #define GPIO_D (unsigned char *) 0x40020C14 // GPIO_D b0-7
  19:/home/love/Documents/skola/EDA482/LV3/codelite/basic_io/startup.c **** #define GPIO_D_CONFIG (unsigned long *) 0x40020C00 // Config for GPIO_D b0-7
  20:/home/love/Documents/skola/EDA482/LV3/codelite/basic_io/startup.c **** 
  21:/home/love/Documents/skola/EDA482/LV3/codelite/basic_io/startup.c **** void io_init() 
  22:/home/love/Documents/skola/EDA482/LV3/codelite/basic_io/startup.c **** {
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
  23:/home/love/Documents/skola/EDA482/LV3/codelite/basic_io/startup.c ****     *GPIO_D_CONFIG = 0x55555555; // Use GPIO_D b0-7 as output
  67              		.loc 1 23 5
  68 0004 024B     		ldr	r3, .L3
  69              		.loc 1 23 20
  70 0006 034A     		ldr	r2, .L3+4
  71 0008 1A60     		str	r2, [r3]
  24:/home/love/Documents/skola/EDA482/LV3/codelite/basic_io/startup.c **** }
  72              		.loc 1 24 1
  73 000a C046     		nop
  74 000c BD46     		mov	sp, r7
  75              		@ sp needed
  76 000e 80BD     		pop	{r7, pc}
  77              	.L4:
  78              		.align	2
  79              	.L3:
  80 0010 000C0240 		.word	1073875968
  81 0014 55555555 		.word	1431655765
  82              		.cfi_endproc
  83              	.LFE1:
  85              		.align	1
  86              		.global	get_char
  87              		.syntax unified
  88              		.code	16
  89              		.thumb_func
  90              		.fpu softvfp
  92              	get_char:
  93              	.LFB2:
  25:/home/love/Documents/skola/EDA482/LV3/codelite/basic_io/startup.c **** 
  26:/home/love/Documents/skola/EDA482/LV3/codelite/basic_io/startup.c **** unsigned char get_char() {
  94              		.loc 1 26 26
  95              		.cfi_startproc
  96              		@ args = 0, pretend = 0, frame = 0
  97              		@ frame_needed = 1, uses_anonymous_args = 0
  98 0018 80B5     		push	{r7, lr}
  99              		.cfi_def_cfa_offset 8
 100              		.cfi_offset 7, -8
 101              		.cfi_offset 14, -4
 102 001a 00AF     		add	r7, sp, #0
 103              		.cfi_def_cfa_register 7
  27:/home/love/Documents/skola/EDA482/LV3/codelite/basic_io/startup.c ****     return (unsigned char) *GPIO_E;
 104              		.loc 1 27 12
 105 001c 024B     		ldr	r3, .L7
 106 001e 1B78     		ldrb	r3, [r3]
  28:/home/love/Documents/skola/EDA482/LV3/codelite/basic_io/startup.c **** }
 107              		.loc 1 28 1
 108 0020 1800     		movs	r0, r3
 109 0022 BD46     		mov	sp, r7
 110              		@ sp needed
 111 0024 80BD     		pop	{r7, pc}
 112              	.L8:
 113 0026 C046     		.align	2
 114              	.L7:
 115 0028 10100240 		.word	1073877008
 116              		.cfi_endproc
 117              	.LFE2:
 119              		.align	1
 120              		.global	put_char
 121              		.syntax unified
 122              		.code	16
 123              		.thumb_func
 124              		.fpu softvfp
 126              	put_char:
 127              	.LFB3:
  29:/home/love/Documents/skola/EDA482/LV3/codelite/basic_io/startup.c **** 
  30:/home/love/Documents/skola/EDA482/LV3/codelite/basic_io/startup.c **** void put_char(unsigned char c) {
 128              		.loc 1 30 32
 129              		.cfi_startproc
 130              		@ args = 0, pretend = 0, frame = 8
 131              		@ frame_needed = 1, uses_anonymous_args = 0
 132 002c 80B5     		push	{r7, lr}
 133              		.cfi_def_cfa_offset 8
 134              		.cfi_offset 7, -8
 135              		.cfi_offset 14, -4
 136 002e 82B0     		sub	sp, sp, #8
 137              		.cfi_def_cfa_offset 16
 138 0030 00AF     		add	r7, sp, #0
 139              		.cfi_def_cfa_register 7
 140 0032 0200     		movs	r2, r0
 141 0034 FB1D     		adds	r3, r7, #7
 142 0036 1A70     		strb	r2, [r3]
  31:/home/love/Documents/skola/EDA482/LV3/codelite/basic_io/startup.c ****     *GPIO_D = c;
 143              		.loc 1 31 5
 144 0038 034A     		ldr	r2, .L10
 145              		.loc 1 31 13
 146 003a FB1D     		adds	r3, r7, #7
 147 003c 1B78     		ldrb	r3, [r3]
 148 003e 1370     		strb	r3, [r2]
  32:/home/love/Documents/skola/EDA482/LV3/codelite/basic_io/startup.c **** }
 149              		.loc 1 32 1
 150 0040 C046     		nop
 151 0042 BD46     		mov	sp, r7
 152 0044 02B0     		add	sp, sp, #8
 153              		@ sp needed
 154 0046 80BD     		pop	{r7, pc}
 155              	.L11:
 156              		.align	2
 157              	.L10:
 158 0048 140C0240 		.word	1073875988
 159              		.cfi_endproc
 160              	.LFE3:
 162              		.align	1
 163              		.global	main
 164              		.syntax unified
 165              		.code	16
 166              		.thumb_func
 167              		.fpu softvfp
 169              	main:
 170              	.LFB4:
  33:/home/love/Documents/skola/EDA482/LV3/codelite/basic_io/startup.c **** 
  34:/home/love/Documents/skola/EDA482/LV3/codelite/basic_io/startup.c **** int main(void)
  35:/home/love/Documents/skola/EDA482/LV3/codelite/basic_io/startup.c **** {
 171              		.loc 1 35 1
 172              		.cfi_startproc
 173              		@ args = 0, pretend = 0, frame = 8
 174              		@ frame_needed = 1, uses_anonymous_args = 0
 175 004c 90B5     		push	{r4, r7, lr}
 176              		.cfi_def_cfa_offset 12
 177              		.cfi_offset 4, -12
 178              		.cfi_offset 7, -8
 179              		.cfi_offset 14, -4
 180 004e 83B0     		sub	sp, sp, #12
 181              		.cfi_def_cfa_offset 24
 182 0050 00AF     		add	r7, sp, #0
 183              		.cfi_def_cfa_register 7
  36:/home/love/Documents/skola/EDA482/LV3/codelite/basic_io/startup.c ****     unsigned char c;
  37:/home/love/Documents/skola/EDA482/LV3/codelite/basic_io/startup.c ****     io_init();
 184              		.loc 1 37 5
 185 0052 FFF7FEFF 		bl	io_init
 186              	.L13:
  38:/home/love/Documents/skola/EDA482/LV3/codelite/basic_io/startup.c ****     while(1) {
  39:/home/love/Documents/skola/EDA482/LV3/codelite/basic_io/startup.c ****         c = get_char();
 187              		.loc 1 39 13 discriminator 1
 188 0056 FC1D     		adds	r4, r7, #7
 189 0058 FFF7FEFF 		bl	get_char
 190 005c 0300     		movs	r3, r0
 191 005e 2370     		strb	r3, [r4]
  40:/home/love/Documents/skola/EDA482/LV3/codelite/basic_io/startup.c ****         put_char(c);
 192              		.loc 1 40 9 discriminator 1
 193 0060 FB1D     		adds	r3, r7, #7
 194 0062 1B78     		ldrb	r3, [r3]
 195 0064 1800     		movs	r0, r3
 196 0066 FFF7FEFF 		bl	put_char
  39:/home/love/Documents/skola/EDA482/LV3/codelite/basic_io/startup.c ****         put_char(c);
 197              		.loc 1 39 11 discriminator 1
 198 006a F4E7     		b	.L13
 199              		.cfi_endproc
 200              	.LFE4:
 202              	.Letext0:
