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
  25              		.file 1 "/home/love/Documents/skola/EDA482/LV3/codelite/basic_io_labb1/startup.c"
   1:/home/love/Documents/skola/EDA482/LV3/codelite/basic_io_labb1/startup.c **** /*
   2:/home/love/Documents/skola/EDA482/LV3/codelite/basic_io_labb1/startup.c ****  * 	startup.c
   3:/home/love/Documents/skola/EDA482/LV3/codelite/basic_io_labb1/startup.c ****  *
   4:/home/love/Documents/skola/EDA482/LV3/codelite/basic_io_labb1/startup.c ****  */
   5:/home/love/Documents/skola/EDA482/LV3/codelite/basic_io_labb1/startup.c **** void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );
   6:/home/love/Documents/skola/EDA482/LV3/codelite/basic_io_labb1/startup.c **** 
   7:/home/love/Documents/skola/EDA482/LV3/codelite/basic_io_labb1/startup.c **** void startup ( void )
   8:/home/love/Documents/skola/EDA482/LV3/codelite/basic_io_labb1/startup.c **** {
  26              		.loc 1 8 1
  27              		.cfi_startproc
  28              		@ Naked Function: prologue and epilogue provided by programmer.
  29              		@ args = 0, pretend = 0, frame = 0
  30              		@ frame_needed = 1, uses_anonymous_args = 0
   9:/home/love/Documents/skola/EDA482/LV3/codelite/basic_io_labb1/startup.c **** asm volatile(
  31              		.loc 1 9 1
  32              		.syntax divided
  33              	@ 9 "/home/love/Documents/skola/EDA482/LV3/codelite/basic_io_labb1/startup.c" 1
  34 0000 0248     		 LDR R0,=0x2001C000
  35 0002 8546     	 MOV SP,R0
  36 0004 FFF7FEFF 	 BL main
  37 0008 FEE7     	.L1: B .L1
  38              	
  39              	@ 0 "" 2
  10:/home/love/Documents/skola/EDA482/LV3/codelite/basic_io_labb1/startup.c **** 	" LDR R0,=0x2001C000\n"		/* set stack */
  11:/home/love/Documents/skola/EDA482/LV3/codelite/basic_io_labb1/startup.c **** 	" MOV SP,R0\n"
  12:/home/love/Documents/skola/EDA482/LV3/codelite/basic_io_labb1/startup.c **** 	" BL main\n"				/* call main */
  13:/home/love/Documents/skola/EDA482/LV3/codelite/basic_io_labb1/startup.c **** 	".L1: B .L1\n"				/* never return */
  14:/home/love/Documents/skola/EDA482/LV3/codelite/basic_io_labb1/startup.c **** 	) ;
  15:/home/love/Documents/skola/EDA482/LV3/codelite/basic_io_labb1/startup.c **** }
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
  16:/home/love/Documents/skola/EDA482/LV3/codelite/basic_io_labb1/startup.c **** 
  17:/home/love/Documents/skola/EDA482/LV3/codelite/basic_io_labb1/startup.c **** #define GPIO_E (unsigned char *) 0x40021010 // GPIO_E b0-7
  18:/home/love/Documents/skola/EDA482/LV3/codelite/basic_io_labb1/startup.c **** #define GPIO_D (unsigned char *) 0x40020C14 // GPIO_D b0-7
  19:/home/love/Documents/skola/EDA482/LV3/codelite/basic_io_labb1/startup.c **** #define GPIO_D_MODER (unsigned long *) 0x40020C00 // Config for GPIO_D b0-7
  20:/home/love/Documents/skola/EDA482/LV3/codelite/basic_io_labb1/startup.c **** #define RCC_AHB1ENR (unsigned long *) 0x40023830 // Reset and clock control
  21:/home/love/Documents/skola/EDA482/LV3/codelite/basic_io_labb1/startup.c **** 
  22:/home/love/Documents/skola/EDA482/LV3/codelite/basic_io_labb1/startup.c **** void io_init() 
  23:/home/love/Documents/skola/EDA482/LV3/codelite/basic_io_labb1/startup.c **** {
  57              		.loc 1 23 1
  58              		.cfi_startproc
  59              		@ args = 0, pretend = 0, frame = 0
  60              		@ frame_needed = 1, uses_anonymous_args = 0
  61 0000 80B5     		push	{r7, lr}
  62              		.cfi_def_cfa_offset 8
  63              		.cfi_offset 7, -8
  64              		.cfi_offset 14, -4
  65 0002 00AF     		add	r7, sp, #0
  66              		.cfi_def_cfa_register 7
  24:/home/love/Documents/skola/EDA482/LV3/codelite/basic_io_labb1/startup.c ****     *RCC_AHB1ENR = 0x18; // Start GPIO clock
  67              		.loc 1 24 5
  68 0004 044B     		ldr	r3, .L3
  69              		.loc 1 24 18
  70 0006 1822     		movs	r2, #24
  71 0008 1A60     		str	r2, [r3]
  25:/home/love/Documents/skola/EDA482/LV3/codelite/basic_io_labb1/startup.c ****     *GPIO_D_MODER = 0x55555555; // Use GPIO_D b0-7 as output
  72              		.loc 1 25 5
  73 000a 044B     		ldr	r3, .L3+4
  74              		.loc 1 25 19
  75 000c 044A     		ldr	r2, .L3+8
  76 000e 1A60     		str	r2, [r3]
  26:/home/love/Documents/skola/EDA482/LV3/codelite/basic_io_labb1/startup.c **** }
  77              		.loc 1 26 1
  78 0010 C046     		nop
  79 0012 BD46     		mov	sp, r7
  80              		@ sp needed
  81 0014 80BD     		pop	{r7, pc}
  82              	.L4:
  83 0016 C046     		.align	2
  84              	.L3:
  85 0018 30380240 		.word	1073887280
  86 001c 000C0240 		.word	1073875968
  87 0020 55555555 		.word	1431655765
  88              		.cfi_endproc
  89              	.LFE1:
  91              		.align	1
  92              		.global	get_char
  93              		.syntax unified
  94              		.code	16
  95              		.thumb_func
  96              		.fpu softvfp
  98              	get_char:
  99              	.LFB2:
  27:/home/love/Documents/skola/EDA482/LV3/codelite/basic_io_labb1/startup.c **** 
  28:/home/love/Documents/skola/EDA482/LV3/codelite/basic_io_labb1/startup.c **** unsigned char get_char() {
 100              		.loc 1 28 26
 101              		.cfi_startproc
 102              		@ args = 0, pretend = 0, frame = 0
 103              		@ frame_needed = 1, uses_anonymous_args = 0
 104 0024 80B5     		push	{r7, lr}
 105              		.cfi_def_cfa_offset 8
 106              		.cfi_offset 7, -8
 107              		.cfi_offset 14, -4
 108 0026 00AF     		add	r7, sp, #0
 109              		.cfi_def_cfa_register 7
  29:/home/love/Documents/skola/EDA482/LV3/codelite/basic_io_labb1/startup.c ****     return (unsigned char) *GPIO_E;
 110              		.loc 1 29 12
 111 0028 024B     		ldr	r3, .L7
 112 002a 1B78     		ldrb	r3, [r3]
  30:/home/love/Documents/skola/EDA482/LV3/codelite/basic_io_labb1/startup.c **** }
 113              		.loc 1 30 1
 114 002c 1800     		movs	r0, r3
 115 002e BD46     		mov	sp, r7
 116              		@ sp needed
 117 0030 80BD     		pop	{r7, pc}
 118              	.L8:
 119 0032 C046     		.align	2
 120              	.L7:
 121 0034 10100240 		.word	1073877008
 122              		.cfi_endproc
 123              	.LFE2:
 125              		.align	1
 126              		.global	put_char
 127              		.syntax unified
 128              		.code	16
 129              		.thumb_func
 130              		.fpu softvfp
 132              	put_char:
 133              	.LFB3:
  31:/home/love/Documents/skola/EDA482/LV3/codelite/basic_io_labb1/startup.c **** 
  32:/home/love/Documents/skola/EDA482/LV3/codelite/basic_io_labb1/startup.c **** void put_char(unsigned char c) {
 134              		.loc 1 32 32
 135              		.cfi_startproc
 136              		@ args = 0, pretend = 0, frame = 8
 137              		@ frame_needed = 1, uses_anonymous_args = 0
 138 0038 80B5     		push	{r7, lr}
 139              		.cfi_def_cfa_offset 8
 140              		.cfi_offset 7, -8
 141              		.cfi_offset 14, -4
 142 003a 82B0     		sub	sp, sp, #8
 143              		.cfi_def_cfa_offset 16
 144 003c 00AF     		add	r7, sp, #0
 145              		.cfi_def_cfa_register 7
 146 003e 0200     		movs	r2, r0
 147 0040 FB1D     		adds	r3, r7, #7
 148 0042 1A70     		strb	r2, [r3]
  33:/home/love/Documents/skola/EDA482/LV3/codelite/basic_io_labb1/startup.c ****     *GPIO_D = c;
 149              		.loc 1 33 5
 150 0044 034A     		ldr	r2, .L10
 151              		.loc 1 33 13
 152 0046 FB1D     		adds	r3, r7, #7
 153 0048 1B78     		ldrb	r3, [r3]
 154 004a 1370     		strb	r3, [r2]
  34:/home/love/Documents/skola/EDA482/LV3/codelite/basic_io_labb1/startup.c **** }
 155              		.loc 1 34 1
 156 004c C046     		nop
 157 004e BD46     		mov	sp, r7
 158 0050 02B0     		add	sp, sp, #8
 159              		@ sp needed
 160 0052 80BD     		pop	{r7, pc}
 161              	.L11:
 162              		.align	2
 163              	.L10:
 164 0054 140C0240 		.word	1073875988
 165              		.cfi_endproc
 166              	.LFE3:
 168              		.align	1
 169              		.global	main
 170              		.syntax unified
 171              		.code	16
 172              		.thumb_func
 173              		.fpu softvfp
 175              	main:
 176              	.LFB4:
  35:/home/love/Documents/skola/EDA482/LV3/codelite/basic_io_labb1/startup.c **** 
  36:/home/love/Documents/skola/EDA482/LV3/codelite/basic_io_labb1/startup.c **** int main(void)
  37:/home/love/Documents/skola/EDA482/LV3/codelite/basic_io_labb1/startup.c **** {
 177              		.loc 1 37 1
 178              		.cfi_startproc
 179              		@ args = 0, pretend = 0, frame = 8
 180              		@ frame_needed = 1, uses_anonymous_args = 0
 181 0058 90B5     		push	{r4, r7, lr}
 182              		.cfi_def_cfa_offset 12
 183              		.cfi_offset 4, -12
 184              		.cfi_offset 7, -8
 185              		.cfi_offset 14, -4
 186 005a 83B0     		sub	sp, sp, #12
 187              		.cfi_def_cfa_offset 24
 188 005c 00AF     		add	r7, sp, #0
 189              		.cfi_def_cfa_register 7
  38:/home/love/Documents/skola/EDA482/LV3/codelite/basic_io_labb1/startup.c ****     unsigned char c;
  39:/home/love/Documents/skola/EDA482/LV3/codelite/basic_io_labb1/startup.c ****     io_init();
 190              		.loc 1 39 5
 191 005e FFF7FEFF 		bl	io_init
 192              	.L13:
  40:/home/love/Documents/skola/EDA482/LV3/codelite/basic_io_labb1/startup.c ****     while(1) {
  41:/home/love/Documents/skola/EDA482/LV3/codelite/basic_io_labb1/startup.c ****         c = get_char();
 193              		.loc 1 41 13 discriminator 1
 194 0062 FC1D     		adds	r4, r7, #7
 195 0064 FFF7FEFF 		bl	get_char
 196 0068 0300     		movs	r3, r0
 197 006a 2370     		strb	r3, [r4]
  42:/home/love/Documents/skola/EDA482/LV3/codelite/basic_io_labb1/startup.c ****         put_char(c);
 198              		.loc 1 42 9 discriminator 1
 199 006c FB1D     		adds	r3, r7, #7
 200 006e 1B78     		ldrb	r3, [r3]
 201 0070 1800     		movs	r0, r3
 202 0072 FFF7FEFF 		bl	put_char
  41:/home/love/Documents/skola/EDA482/LV3/codelite/basic_io_labb1/startup.c ****         put_char(c);
 203              		.loc 1 41 11 discriminator 1
 204 0076 F4E7     		b	.L13
 205              		.cfi_endproc
 206              	.LFE4:
 208              	.Letext0:
