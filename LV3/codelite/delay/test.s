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
  25              		.file 1 "/home/love/Documents/skola/EDA482/LV3/codelite/delay/startup.c"
   1:/home/love/Documents/skola/EDA482/LV3/codelite/delay/startup.c **** /*
   2:/home/love/Documents/skola/EDA482/LV3/codelite/delay/startup.c ****  * 	startup.c
   3:/home/love/Documents/skola/EDA482/LV3/codelite/delay/startup.c ****  *
   4:/home/love/Documents/skola/EDA482/LV3/codelite/delay/startup.c ****  */
   5:/home/love/Documents/skola/EDA482/LV3/codelite/delay/startup.c **** void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );
   6:/home/love/Documents/skola/EDA482/LV3/codelite/delay/startup.c **** 
   7:/home/love/Documents/skola/EDA482/LV3/codelite/delay/startup.c **** void startup ( void )
   8:/home/love/Documents/skola/EDA482/LV3/codelite/delay/startup.c **** {
  26              		.loc 1 8 1
  27              		.cfi_startproc
  28              		@ Naked Function: prologue and epilogue provided by programmer.
  29              		@ args = 0, pretend = 0, frame = 0
  30              		@ frame_needed = 1, uses_anonymous_args = 0
   9:/home/love/Documents/skola/EDA482/LV3/codelite/delay/startup.c **** asm volatile(
  31              		.loc 1 9 1
  32              		.syntax divided
  33              	@ 9 "/home/love/Documents/skola/EDA482/LV3/codelite/delay/startup.c" 1
  34 0000 0248     		 LDR R0,=0x2001C000
  35 0002 8546     	 MOV SP,R0
  36 0004 FFF7FEFF 	 BL main
  37 0008 FEE7     	.L1: B .L1
  38              	
  39              	@ 0 "" 2
  10:/home/love/Documents/skola/EDA482/LV3/codelite/delay/startup.c **** 	" LDR R0,=0x2001C000\n"		/* set stack */
  11:/home/love/Documents/skola/EDA482/LV3/codelite/delay/startup.c **** 	" MOV SP,R0\n"
  12:/home/love/Documents/skola/EDA482/LV3/codelite/delay/startup.c **** 	" BL main\n"				/* call main */
  13:/home/love/Documents/skola/EDA482/LV3/codelite/delay/startup.c **** 	".L1: B .L1\n"				/* never return */
  14:/home/love/Documents/skola/EDA482/LV3/codelite/delay/startup.c **** 	) ;
  15:/home/love/Documents/skola/EDA482/LV3/codelite/delay/startup.c **** }
  40              		.loc 1 15 1
  41              		.thumb
  42              		.syntax unified
  43 000a C046     		nop
  44              		.cfi_endproc
  45              	.LFE0:
  47              		.text
  48              		.align	1
  49              		.global	delay_250ns
  50              		.syntax unified
  51              		.code	16
  52              		.thumb_func
  53              		.fpu softvfp
  55              	delay_250ns:
  56              	.LFB1:
  16:/home/love/Documents/skola/EDA482/LV3/codelite/delay/startup.c **** 
  17:/home/love/Documents/skola/EDA482/LV3/codelite/delay/startup.c **** #define STK_CTRL ((volatile unsigned long *) 0xE000E010)
  18:/home/love/Documents/skola/EDA482/LV3/codelite/delay/startup.c **** #define STK_LOAD ((volatile unsigned long *) 0xE000E014)
  19:/home/love/Documents/skola/EDA482/LV3/codelite/delay/startup.c **** #define STK_VAL ((volatile unsigned long *) 0xE000E018)
  20:/home/love/Documents/skola/EDA482/LV3/codelite/delay/startup.c **** #define GPIO_E (volatile unsigned char *) 0x40021010
  21:/home/love/Documents/skola/EDA482/LV3/codelite/delay/startup.c **** #define GPIO_D (volatile unsigned char *) 0x40020C14 // GPIO_D b0-7
  22:/home/love/Documents/skola/EDA482/LV3/codelite/delay/startup.c **** #define GPIO_D_MODER (volatile unsigned long *) 0x40020C00 // Config for GPIO_D b0-7
  23:/home/love/Documents/skola/EDA482/LV3/codelite/delay/startup.c **** 
  24:/home/love/Documents/skola/EDA482/LV3/codelite/delay/startup.c **** void delay_250ns(void) 
  25:/home/love/Documents/skola/EDA482/LV3/codelite/delay/startup.c **** {
  57              		.loc 1 25 1
  58              		.cfi_startproc
  59              		@ args = 0, pretend = 0, frame = 0
  60              		@ frame_needed = 1, uses_anonymous_args = 0
  61 0000 80B5     		push	{r7, lr}
  62              		.cfi_def_cfa_offset 8
  63              		.cfi_offset 7, -8
  64              		.cfi_offset 14, -4
  65 0002 00AF     		add	r7, sp, #0
  66              		.cfi_def_cfa_register 7
  26:/home/love/Documents/skola/EDA482/LV3/codelite/delay/startup.c ****     *STK_CTRL = 0;
  67              		.loc 1 26 5
  68 0004 0C4B     		ldr	r3, .L4
  69              		.loc 1 26 15
  70 0006 0022     		movs	r2, #0
  71 0008 1A60     		str	r2, [r3]
  27:/home/love/Documents/skola/EDA482/LV3/codelite/delay/startup.c ****     *STK_LOAD = 168/4 - 1;
  72              		.loc 1 27 5
  73 000a 0C4B     		ldr	r3, .L4+4
  74              		.loc 1 27 15
  75 000c 2922     		movs	r2, #41
  76 000e 1A60     		str	r2, [r3]
  28:/home/love/Documents/skola/EDA482/LV3/codelite/delay/startup.c ****     *STK_VAL = 0;
  77              		.loc 1 28 5
  78 0010 0B4B     		ldr	r3, .L4+8
  79              		.loc 1 28 14
  80 0012 0022     		movs	r2, #0
  81 0014 1A60     		str	r2, [r3]
  29:/home/love/Documents/skola/EDA482/LV3/codelite/delay/startup.c ****     *STK_CTRL = 5;
  82              		.loc 1 29 5
  83 0016 084B     		ldr	r3, .L4
  84              		.loc 1 29 15
  85 0018 0522     		movs	r2, #5
  86 001a 1A60     		str	r2, [r3]
  30:/home/love/Documents/skola/EDA482/LV3/codelite/delay/startup.c ****     while (!(*STK_CTRL & 0x10000));
  87              		.loc 1 30 11
  88 001c C046     		nop
  89              	.L3:
  90              		.loc 1 30 14 discriminator 1
  91 001e 064B     		ldr	r3, .L4
  92 0020 1A68     		ldr	r2, [r3]
  93              		.loc 1 30 24 discriminator 1
  94 0022 8023     		movs	r3, #128
  95 0024 5B02     		lsls	r3, r3, #9
  96 0026 1340     		ands	r3, r2
  97              		.loc 1 30 11 discriminator 1
  98 0028 F9D0     		beq	.L3
  31:/home/love/Documents/skola/EDA482/LV3/codelite/delay/startup.c ****     *STK_CTRL = 0;
  99              		.loc 1 31 5
 100 002a 034B     		ldr	r3, .L4
 101              		.loc 1 31 15
 102 002c 0022     		movs	r2, #0
 103 002e 1A60     		str	r2, [r3]
  32:/home/love/Documents/skola/EDA482/LV3/codelite/delay/startup.c **** }
 104              		.loc 1 32 1
 105 0030 C046     		nop
 106 0032 BD46     		mov	sp, r7
 107              		@ sp needed
 108 0034 80BD     		pop	{r7, pc}
 109              	.L5:
 110 0036 C046     		.align	2
 111              	.L4:
 112 0038 10E000E0 		.word	-536813552
 113 003c 14E000E0 		.word	-536813548
 114 0040 18E000E0 		.word	-536813544
 115              		.cfi_endproc
 116              	.LFE1:
 118              		.align	1
 119              		.global	delay_micros
 120              		.syntax unified
 121              		.code	16
 122              		.thumb_func
 123              		.fpu softvfp
 125              	delay_micros:
 126              	.LFB2:
  33:/home/love/Documents/skola/EDA482/LV3/codelite/delay/startup.c **** 
  34:/home/love/Documents/skola/EDA482/LV3/codelite/delay/startup.c **** void delay_micros(unsigned int u) {
 127              		.loc 1 34 35
 128              		.cfi_startproc
 129              		@ args = 0, pretend = 0, frame = 8
 130              		@ frame_needed = 1, uses_anonymous_args = 0
 131 0044 80B5     		push	{r7, lr}
 132              		.cfi_def_cfa_offset 8
 133              		.cfi_offset 7, -8
 134              		.cfi_offset 14, -4
 135 0046 82B0     		sub	sp, sp, #8
 136              		.cfi_def_cfa_offset 16
 137 0048 00AF     		add	r7, sp, #0
 138              		.cfi_def_cfa_register 7
 139 004a 7860     		str	r0, [r7, #4]
  35:/home/love/Documents/skola/EDA482/LV3/codelite/delay/startup.c ****     #ifdef SIMULATOR
  36:/home/love/Documents/skola/EDA482/LV3/codelite/delay/startup.c ****         u /= 1000;
  37:/home/love/Documents/skola/EDA482/LV3/codelite/delay/startup.c ****         u++;
  38:/home/love/Documents/skola/EDA482/LV3/codelite/delay/startup.c ****     #endif
  39:/home/love/Documents/skola/EDA482/LV3/codelite/delay/startup.c ****     while (u--)
 140              		.loc 1 39 11
 141 004c 07E0     		b	.L7
 142              	.L8:
  40:/home/love/Documents/skola/EDA482/LV3/codelite/delay/startup.c ****     {
  41:/home/love/Documents/skola/EDA482/LV3/codelite/delay/startup.c ****         delay_250ns();
 143              		.loc 1 41 9
 144 004e FFF7FEFF 		bl	delay_250ns
  42:/home/love/Documents/skola/EDA482/LV3/codelite/delay/startup.c ****         delay_250ns();
 145              		.loc 1 42 9
 146 0052 FFF7FEFF 		bl	delay_250ns
  43:/home/love/Documents/skola/EDA482/LV3/codelite/delay/startup.c ****         delay_250ns();
 147              		.loc 1 43 9
 148 0056 FFF7FEFF 		bl	delay_250ns
  44:/home/love/Documents/skola/EDA482/LV3/codelite/delay/startup.c ****         delay_250ns();
 149              		.loc 1 44 9
 150 005a FFF7FEFF 		bl	delay_250ns
 151              	.L7:
  39:/home/love/Documents/skola/EDA482/LV3/codelite/delay/startup.c ****     {
 152              		.loc 1 39 13
 153 005e 7B68     		ldr	r3, [r7, #4]
 154 0060 5A1E     		subs	r2, r3, #1
 155 0062 7A60     		str	r2, [r7, #4]
  39:/home/love/Documents/skola/EDA482/LV3/codelite/delay/startup.c ****     {
 156              		.loc 1 39 11
 157 0064 002B     		cmp	r3, #0
 158 0066 F2D1     		bne	.L8
  45:/home/love/Documents/skola/EDA482/LV3/codelite/delay/startup.c ****     }
  46:/home/love/Documents/skola/EDA482/LV3/codelite/delay/startup.c **** }
 159              		.loc 1 46 1
 160 0068 C046     		nop
 161 006a BD46     		mov	sp, r7
 162 006c 02B0     		add	sp, sp, #8
 163              		@ sp needed
 164 006e 80BD     		pop	{r7, pc}
 165              		.cfi_endproc
 166              	.LFE2:
 168              		.align	1
 169              		.global	main
 170              		.syntax unified
 171              		.code	16
 172              		.thumb_func
 173              		.fpu softvfp
 175              	main:
 176              	.LFB3:
  47:/home/love/Documents/skola/EDA482/LV3/codelite/delay/startup.c **** 
  48:/home/love/Documents/skola/EDA482/LV3/codelite/delay/startup.c **** 
  49:/home/love/Documents/skola/EDA482/LV3/codelite/delay/startup.c **** int main(void)
  50:/home/love/Documents/skola/EDA482/LV3/codelite/delay/startup.c **** {
 177              		.loc 1 50 1
 178              		.cfi_startproc
 179              		@ args = 0, pretend = 0, frame = 8
 180              		@ frame_needed = 1, uses_anonymous_args = 0
 181 0070 80B5     		push	{r7, lr}
 182              		.cfi_def_cfa_offset 8
 183              		.cfi_offset 7, -8
 184              		.cfi_offset 14, -4
 185 0072 82B0     		sub	sp, sp, #8
 186              		.cfi_def_cfa_offset 16
 187 0074 00AF     		add	r7, sp, #0
 188              		.cfi_def_cfa_register 7
  51:/home/love/Documents/skola/EDA482/LV3/codelite/delay/startup.c ****     *GPIO_D_MODER = 0x55555555;
 189              		.loc 1 51 5
 190 0076 124B     		ldr	r3, .L16
 191              		.loc 1 51 19
 192 0078 124A     		ldr	r2, .L16+4
 193 007a 1A60     		str	r2, [r3]
 194              	.L12:
 195              	.LBB2:
  52:/home/love/Documents/skola/EDA482/LV3/codelite/delay/startup.c ****     while(1) {
  53:/home/love/Documents/skola/EDA482/LV3/codelite/delay/startup.c ****         unsigned int inp = (unsigned int) *GPIO_E;
 196              		.loc 1 53 43
 197 007c 124B     		ldr	r3, .L16+8
 198 007e 1B78     		ldrb	r3, [r3]
 199 0080 DBB2     		uxtb	r3, r3
 200              		.loc 1 53 22
 201 0082 7B60     		str	r3, [r7, #4]
  54:/home/love/Documents/skola/EDA482/LV3/codelite/delay/startup.c ****         if (inp == 0x81) 
 202              		.loc 1 54 12
 203 0084 7B68     		ldr	r3, [r7, #4]
 204 0086 812B     		cmp	r3, #129
 205 0088 14D0     		beq	.L15
  55:/home/love/Documents/skola/EDA482/LV3/codelite/delay/startup.c ****         {
  56:/home/love/Documents/skola/EDA482/LV3/codelite/delay/startup.c ****             break;
  57:/home/love/Documents/skola/EDA482/LV3/codelite/delay/startup.c ****         }
  58:/home/love/Documents/skola/EDA482/LV3/codelite/delay/startup.c ****         inp *= 10;
 206              		.loc 1 58 13
 207 008a 7A68     		ldr	r2, [r7, #4]
 208 008c 1300     		movs	r3, r2
 209 008e 9B00     		lsls	r3, r3, #2
 210 0090 9B18     		adds	r3, r3, r2
 211 0092 5B00     		lsls	r3, r3, #1
 212 0094 7B60     		str	r3, [r7, #4]
  59:/home/love/Documents/skola/EDA482/LV3/codelite/delay/startup.c ****         *GPIO_D = 0xFF;
 213              		.loc 1 59 9
 214 0096 0D4B     		ldr	r3, .L16+12
 215              		.loc 1 59 17
 216 0098 FF22     		movs	r2, #255
 217 009a 1A70     		strb	r2, [r3]
  60:/home/love/Documents/skola/EDA482/LV3/codelite/delay/startup.c ****         delay_micros(inp);
 218              		.loc 1 60 9
 219 009c 7B68     		ldr	r3, [r7, #4]
 220 009e 1800     		movs	r0, r3
 221 00a0 FFF7FEFF 		bl	delay_micros
  61:/home/love/Documents/skola/EDA482/LV3/codelite/delay/startup.c ****         *GPIO_D = 0;
 222              		.loc 1 61 9
 223 00a4 094B     		ldr	r3, .L16+12
 224              		.loc 1 61 17
 225 00a6 0022     		movs	r2, #0
 226 00a8 1A70     		strb	r2, [r3]
  62:/home/love/Documents/skola/EDA482/LV3/codelite/delay/startup.c ****         delay_micros(inp);
 227              		.loc 1 62 9
 228 00aa 7B68     		ldr	r3, [r7, #4]
 229 00ac 1800     		movs	r0, r3
 230 00ae FFF7FEFF 		bl	delay_micros
 231              	.LBE2:
  52:/home/love/Documents/skola/EDA482/LV3/codelite/delay/startup.c ****         unsigned int inp = (unsigned int) *GPIO_E;
 232              		.loc 1 52 14
 233 00b2 E3E7     		b	.L12
 234              	.L15:
 235              	.LBB3:
  56:/home/love/Documents/skola/EDA482/LV3/codelite/delay/startup.c ****         }
 236              		.loc 1 56 13
 237 00b4 C046     		nop
 238              	.LBE3:
  63:/home/love/Documents/skola/EDA482/LV3/codelite/delay/startup.c ****     }
  64:/home/love/Documents/skola/EDA482/LV3/codelite/delay/startup.c ****     return 0;
 239              		.loc 1 64 12
 240 00b6 0023     		movs	r3, #0
  65:/home/love/Documents/skola/EDA482/LV3/codelite/delay/startup.c **** }
 241              		.loc 1 65 1
 242 00b8 1800     		movs	r0, r3
 243 00ba BD46     		mov	sp, r7
 244 00bc 02B0     		add	sp, sp, #8
 245              		@ sp needed
 246 00be 80BD     		pop	{r7, pc}
 247              	.L17:
 248              		.align	2
 249              	.L16:
 250 00c0 000C0240 		.word	1073875968
 251 00c4 55555555 		.word	1431655765
 252 00c8 10100240 		.word	1073877008
 253 00cc 140C0240 		.word	1073875988
 254              		.cfi_endproc
 255              	.LFE3:
 257              	.Letext0:
