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
  25              		.file 1 "/home/love/Documents/skola/EDA482/LV5/C/sysick_irq/startup.c"
   1:/home/love/Documents/skola/EDA482/LV5/C/sysick_irq/startup.c **** /*
   2:/home/love/Documents/skola/EDA482/LV5/C/sysick_irq/startup.c ****  * 	startup.c
   3:/home/love/Documents/skola/EDA482/LV5/C/sysick_irq/startup.c ****  *  
   4:/home/love/Documents/skola/EDA482/LV5/C/sysick_irq/startup.c ****  */
   5:/home/love/Documents/skola/EDA482/LV5/C/sysick_irq/startup.c **** #include <libGPIO.h>
   6:/home/love/Documents/skola/EDA482/LV5/C/sysick_irq/startup.c **** #include <stdint.h>
   7:/home/love/Documents/skola/EDA482/LV5/C/sysick_irq/startup.c **** #include <stdbool.h>
   8:/home/love/Documents/skola/EDA482/LV5/C/sysick_irq/startup.c **** 
   9:/home/love/Documents/skola/EDA482/LV5/C/sysick_irq/startup.c **** #ifdef SIMULATOR
  10:/home/love/Documents/skola/EDA482/LV5/C/sysick_irq/startup.c ****     #define DELAY_COUNT 100
  11:/home/love/Documents/skola/EDA482/LV5/C/sysick_irq/startup.c **** #else
  12:/home/love/Documents/skola/EDA482/LV5/C/sysick_irq/startup.c ****     #define DELAY_COUNT 100000
  13:/home/love/Documents/skola/EDA482/LV5/C/sysick_irq/startup.c **** #endif
  14:/home/love/Documents/skola/EDA482/LV5/C/sysick_irq/startup.c **** 
  15:/home/love/Documents/skola/EDA482/LV5/C/sysick_irq/startup.c **** #define SysTick ((volatile STK*) 0xE000E010)
  16:/home/love/Documents/skola/EDA482/LV5/C/sysick_irq/startup.c **** 
  17:/home/love/Documents/skola/EDA482/LV5/C/sysick_irq/startup.c **** typedef struct{
  18:/home/love/Documents/skola/EDA482/LV5/C/sysick_irq/startup.c ****     uint32_t ctrl;
  19:/home/love/Documents/skola/EDA482/LV5/C/sysick_irq/startup.c ****     uint32_t load;
  20:/home/love/Documents/skola/EDA482/LV5/C/sysick_irq/startup.c ****     uint32_t val;
  21:/home/love/Documents/skola/EDA482/LV5/C/sysick_irq/startup.c ****     uint32_t calib;
  22:/home/love/Documents/skola/EDA482/LV5/C/sysick_irq/startup.c **** }STK;
  23:/home/love/Documents/skola/EDA482/LV5/C/sysick_irq/startup.c **** 
  24:/home/love/Documents/skola/EDA482/LV5/C/sysick_irq/startup.c **** void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );
  25:/home/love/Documents/skola/EDA482/LV5/C/sysick_irq/startup.c **** 
  26:/home/love/Documents/skola/EDA482/LV5/C/sysick_irq/startup.c **** void startup ( void )
  27:/home/love/Documents/skola/EDA482/LV5/C/sysick_irq/startup.c **** {
  26              		.loc 1 27 1
  27              		.cfi_startproc
  28              		@ Naked Function: prologue and epilogue provided by programmer.
  29              		@ args = 0, pretend = 0, frame = 0
  30              		@ frame_needed = 1, uses_anonymous_args = 0
  28:/home/love/Documents/skola/EDA482/LV5/C/sysick_irq/startup.c **** asm volatile(
  31              		.loc 1 28 1
  32              		.syntax divided
  33              	@ 28 "/home/love/Documents/skola/EDA482/LV5/C/sysick_irq/startup.c" 1
  34 0000 0248     		 LDR R0,=0x2001C000
  35 0002 8546     	 MOV SP,R0
  36 0004 FFF7FEFF 	 BL main
  37 0008 FEE7     	.L1: B .L1
  38              	
  39              	@ 0 "" 2
  29:/home/love/Documents/skola/EDA482/LV5/C/sysick_irq/startup.c **** 	" LDR R0,=0x2001C000\n"		/* set stack */
  30:/home/love/Documents/skola/EDA482/LV5/C/sysick_irq/startup.c **** 	" MOV SP,R0\n"
  31:/home/love/Documents/skola/EDA482/LV5/C/sysick_irq/startup.c **** 	" BL main\n"				/* call main */
  32:/home/love/Documents/skola/EDA482/LV5/C/sysick_irq/startup.c **** 	".L1: B .L1\n"				/* never return */
  33:/home/love/Documents/skola/EDA482/LV5/C/sysick_irq/startup.c **** 	) ;
  34:/home/love/Documents/skola/EDA482/LV5/C/sysick_irq/startup.c **** }
  40              		.loc 1 34 1
  41              		.thumb
  42              		.syntax unified
  43 000a C046     		nop
  44              		.cfi_endproc
  45              	.LFE0:
  47              		.bss
  48              	systick_flag:
  49 0000 00       		.space	1
  51 0001 000000   		.align	2
  52              	delay_count:
  53 0004 00000000 		.space	4
  55              		.text
  56              		.align	1
  57              		.global	delay_micro
  58              		.syntax unified
  59              		.code	16
  60              		.thumb_func
  61              		.fpu softvfp
  63              	delay_micro:
  64              	.LFB1:
  35:/home/love/Documents/skola/EDA482/LV5/C/sysick_irq/startup.c **** 
  36:/home/love/Documents/skola/EDA482/LV5/C/sysick_irq/startup.c **** static bool systick_flag;
  37:/home/love/Documents/skola/EDA482/LV5/C/sysick_irq/startup.c **** static int32_t delay_count;
  38:/home/love/Documents/skola/EDA482/LV5/C/sysick_irq/startup.c **** 
  39:/home/love/Documents/skola/EDA482/LV5/C/sysick_irq/startup.c **** void delay_micro(void) {
  65              		.loc 1 39 24
  66              		.cfi_startproc
  67              		@ args = 0, pretend = 0, frame = 0
  68              		@ frame_needed = 1, uses_anonymous_args = 0
  69 0000 80B5     		push	{r7, lr}
  70              		.cfi_def_cfa_offset 8
  71              		.cfi_offset 7, -8
  72              		.cfi_offset 14, -4
  73 0002 00AF     		add	r7, sp, #0
  74              		.cfi_def_cfa_register 7
  40:/home/love/Documents/skola/EDA482/LV5/C/sysick_irq/startup.c ****     systick_flag = false;
  75              		.loc 1 40 18
  76 0004 084B     		ldr	r3, .L3
  77 0006 0022     		movs	r2, #0
  78 0008 1A70     		strb	r2, [r3]
  41:/home/love/Documents/skola/EDA482/LV5/C/sysick_irq/startup.c ****     SysTick->ctrl = 0;
  79              		.loc 1 41 12
  80 000a 084B     		ldr	r3, .L3+4
  81              		.loc 1 41 19
  82 000c 0022     		movs	r2, #0
  83 000e 1A60     		str	r2, [r3]
  42:/home/love/Documents/skola/EDA482/LV5/C/sysick_irq/startup.c ****     SysTick->load = 168-1;
  84              		.loc 1 42 12
  85 0010 064B     		ldr	r3, .L3+4
  86              		.loc 1 42 19
  87 0012 A722     		movs	r2, #167
  88 0014 5A60     		str	r2, [r3, #4]
  43:/home/love/Documents/skola/EDA482/LV5/C/sysick_irq/startup.c ****     SysTick->val = 0;
  89              		.loc 1 43 12
  90 0016 054B     		ldr	r3, .L3+4
  91              		.loc 1 43 18
  92 0018 0022     		movs	r2, #0
  93 001a 9A60     		str	r2, [r3, #8]
  44:/home/love/Documents/skola/EDA482/LV5/C/sysick_irq/startup.c ****     SysTick->ctrl = 7;
  94              		.loc 1 44 12
  95 001c 034B     		ldr	r3, .L3+4
  96              		.loc 1 44 19
  97 001e 0722     		movs	r2, #7
  98 0020 1A60     		str	r2, [r3]
  45:/home/love/Documents/skola/EDA482/LV5/C/sysick_irq/startup.c **** }
  99              		.loc 1 45 1
 100 0022 C046     		nop
 101 0024 BD46     		mov	sp, r7
 102              		@ sp needed
 103 0026 80BD     		pop	{r7, pc}
 104              	.L4:
 105              		.align	2
 106              	.L3:
 107 0028 00000000 		.word	systick_flag
 108 002c 10E000E0 		.word	-536813552
 109              		.cfi_endproc
 110              	.LFE1:
 112              		.align	1
 113              		.global	systick_irq_handler
 114              		.syntax unified
 115              		.code	16
 116              		.thumb_func
 117              		.fpu softvfp
 119              	systick_irq_handler:
 120              	.LFB2:
  46:/home/love/Documents/skola/EDA482/LV5/C/sysick_irq/startup.c **** 
  47:/home/love/Documents/skola/EDA482/LV5/C/sysick_irq/startup.c **** void systick_irq_handler(void) {
 121              		.loc 1 47 32
 122              		.cfi_startproc
 123              		@ args = 0, pretend = 0, frame = 0
 124              		@ frame_needed = 1, uses_anonymous_args = 0
 125 0030 80B5     		push	{r7, lr}
 126              		.cfi_def_cfa_offset 8
 127              		.cfi_offset 7, -8
 128              		.cfi_offset 14, -4
 129 0032 00AF     		add	r7, sp, #0
 130              		.cfi_def_cfa_register 7
  48:/home/love/Documents/skola/EDA482/LV5/C/sysick_irq/startup.c ****     delay_count--;
 131              		.loc 1 48 16
 132 0034 084B     		ldr	r3, .L9
 133 0036 1B68     		ldr	r3, [r3]
 134 0038 5A1E     		subs	r2, r3, #1
 135 003a 074B     		ldr	r3, .L9
 136 003c 1A60     		str	r2, [r3]
  49:/home/love/Documents/skola/EDA482/LV5/C/sysick_irq/startup.c ****     if (delay_count) {
 137              		.loc 1 49 9
 138 003e 064B     		ldr	r3, .L9
 139 0040 1B68     		ldr	r3, [r3]
 140              		.loc 1 49 8
 141 0042 002B     		cmp	r3, #0
 142 0044 02D0     		beq	.L6
  50:/home/love/Documents/skola/EDA482/LV5/C/sysick_irq/startup.c ****         delay_micro();
 143              		.loc 1 50 9
 144 0046 FFF7FEFF 		bl	delay_micro
  51:/home/love/Documents/skola/EDA482/LV5/C/sysick_irq/startup.c ****     }else {
  52:/home/love/Documents/skola/EDA482/LV5/C/sysick_irq/startup.c ****         systick_flag = true;
  53:/home/love/Documents/skola/EDA482/LV5/C/sysick_irq/startup.c ****     }
  54:/home/love/Documents/skola/EDA482/LV5/C/sysick_irq/startup.c **** }
 145              		.loc 1 54 1
 146 004a 02E0     		b	.L8
 147              	.L6:
  52:/home/love/Documents/skola/EDA482/LV5/C/sysick_irq/startup.c ****     }
 148              		.loc 1 52 22
 149 004c 034B     		ldr	r3, .L9+4
 150 004e 0122     		movs	r2, #1
 151 0050 1A70     		strb	r2, [r3]
 152              	.L8:
 153              		.loc 1 54 1
 154 0052 C046     		nop
 155 0054 BD46     		mov	sp, r7
 156              		@ sp needed
 157 0056 80BD     		pop	{r7, pc}
 158              	.L10:
 159              		.align	2
 160              	.L9:
 161 0058 04000000 		.word	delay_count
 162 005c 00000000 		.word	systick_flag
 163              		.cfi_endproc
 164              	.LFE2:
 166              		.align	1
 167              		.global	delay
 168              		.syntax unified
 169              		.code	16
 170              		.thumb_func
 171              		.fpu softvfp
 173              	delay:
 174              	.LFB3:
  55:/home/love/Documents/skola/EDA482/LV5/C/sysick_irq/startup.c **** 
  56:/home/love/Documents/skola/EDA482/LV5/C/sysick_irq/startup.c **** void delay(uint32_t us) {
 175              		.loc 1 56 25
 176              		.cfi_startproc
 177              		@ args = 0, pretend = 0, frame = 8
 178              		@ frame_needed = 1, uses_anonymous_args = 0
 179 0060 80B5     		push	{r7, lr}
 180              		.cfi_def_cfa_offset 8
 181              		.cfi_offset 7, -8
 182              		.cfi_offset 14, -4
 183 0062 82B0     		sub	sp, sp, #8
 184              		.cfi_def_cfa_offset 16
 185 0064 00AF     		add	r7, sp, #0
 186              		.cfi_def_cfa_register 7
 187 0066 7860     		str	r0, [r7, #4]
  57:/home/love/Documents/skola/EDA482/LV5/C/sysick_irq/startup.c ****     delay_count = us;
 188              		.loc 1 57 17
 189 0068 7A68     		ldr	r2, [r7, #4]
 190 006a 044B     		ldr	r3, .L12
 191 006c 1A60     		str	r2, [r3]
  58:/home/love/Documents/skola/EDA482/LV5/C/sysick_irq/startup.c ****     delay_micro();
 192              		.loc 1 58 5
 193 006e FFF7FEFF 		bl	delay_micro
  59:/home/love/Documents/skola/EDA482/LV5/C/sysick_irq/startup.c **** }
 194              		.loc 1 59 1
 195 0072 C046     		nop
 196 0074 BD46     		mov	sp, r7
 197 0076 02B0     		add	sp, sp, #8
 198              		@ sp needed
 199 0078 80BD     		pop	{r7, pc}
 200              	.L13:
 201 007a C046     		.align	2
 202              	.L12:
 203 007c 04000000 		.word	delay_count
 204              		.cfi_endproc
 205              	.LFE3:
 207              		.align	1
 208              		.global	app_init
 209              		.syntax unified
 210              		.code	16
 211              		.thumb_func
 212              		.fpu softvfp
 214              	app_init:
 215              	.LFB4:
  60:/home/love/Documents/skola/EDA482/LV5/C/sysick_irq/startup.c **** 
  61:/home/love/Documents/skola/EDA482/LV5/C/sysick_irq/startup.c **** 
  62:/home/love/Documents/skola/EDA482/LV5/C/sysick_irq/startup.c **** 
  63:/home/love/Documents/skola/EDA482/LV5/C/sysick_irq/startup.c **** void app_init(void) {
 216              		.loc 1 63 21
 217              		.cfi_startproc
 218              		@ args = 0, pretend = 0, frame = 0
 219              		@ frame_needed = 1, uses_anonymous_args = 0
 220 0080 80B5     		push	{r7, lr}
 221              		.cfi_def_cfa_offset 8
 222              		.cfi_offset 7, -8
 223              		.cfi_offset 14, -4
 224 0082 00AF     		add	r7, sp, #0
 225              		.cfi_def_cfa_register 7
  64:/home/love/Documents/skola/EDA482/LV5/C/sysick_irq/startup.c ****     GPIO_output(GPIO_D);
 226              		.loc 1 64 5
 227 0084 064B     		ldr	r3, .L15
 228 0086 1800     		movs	r0, r3
 229 0088 FFF7FEFF 		bl	GPIO_output
  65:/home/love/Documents/skola/EDA482/LV5/C/sysick_irq/startup.c ****     *((void (**)(void)) 0x2001C03C) = systick_irq_handler;
 230              		.loc 1 65 5
 231 008c 054B     		ldr	r3, .L15+4
 232              		.loc 1 65 37
 233 008e 064A     		ldr	r2, .L15+8
 234 0090 1A60     		str	r2, [r3]
  66:/home/love/Documents/skola/EDA482/LV5/C/sysick_irq/startup.c ****     systick_flag = false;
 235              		.loc 1 66 18
 236 0092 064B     		ldr	r3, .L15+12
 237 0094 0022     		movs	r2, #0
 238 0096 1A70     		strb	r2, [r3]
  67:/home/love/Documents/skola/EDA482/LV5/C/sysick_irq/startup.c **** }
 239              		.loc 1 67 1
 240 0098 C046     		nop
 241 009a BD46     		mov	sp, r7
 242              		@ sp needed
 243 009c 80BD     		pop	{r7, pc}
 244              	.L16:
 245 009e C046     		.align	2
 246              	.L15:
 247 00a0 000C0240 		.word	1073875968
 248 00a4 3CC00120 		.word	536985660
 249 00a8 00000000 		.word	systick_irq_handler
 250 00ac 00000000 		.word	systick_flag
 251              		.cfi_endproc
 252              	.LFE4:
 254              		.align	1
 255              		.global	main
 256              		.syntax unified
 257              		.code	16
 258              		.thumb_func
 259              		.fpu softvfp
 261              	main:
 262              	.LFB5:
  68:/home/love/Documents/skola/EDA482/LV5/C/sysick_irq/startup.c **** 
  69:/home/love/Documents/skola/EDA482/LV5/C/sysick_irq/startup.c **** int main(void) {
 263              		.loc 1 69 16
 264              		.cfi_startproc
 265              		@ args = 0, pretend = 0, frame = 0
 266              		@ frame_needed = 1, uses_anonymous_args = 0
 267 00b0 80B5     		push	{r7, lr}
 268              		.cfi_def_cfa_offset 8
 269              		.cfi_offset 7, -8
 270              		.cfi_offset 14, -4
 271 00b2 00AF     		add	r7, sp, #0
 272              		.cfi_def_cfa_register 7
  70:/home/love/Documents/skola/EDA482/LV5/C/sysick_irq/startup.c ****     app_init();
 273              		.loc 1 70 5
 274 00b4 FFF7FEFF 		bl	app_init
  71:/home/love/Documents/skola/EDA482/LV5/C/sysick_irq/startup.c ****     GPIO_D->odr_low = 0;
 275              		.loc 1 71 11
 276 00b8 0A4B     		ldr	r3, .L24
 277              		.loc 1 71 21
 278 00ba 0022     		movs	r2, #0
 279 00bc 1A75     		strb	r2, [r3, #20]
  72:/home/love/Documents/skola/EDA482/LV5/C/sysick_irq/startup.c ****     delay(DELAY_COUNT);
 280              		.loc 1 72 5
 281 00be 6420     		movs	r0, #100
 282 00c0 FFF7FEFF 		bl	delay
  73:/home/love/Documents/skola/EDA482/LV5/C/sysick_irq/startup.c ****     GPIO_D->odr_low = 0xFF;
 283              		.loc 1 73 11
 284 00c4 074B     		ldr	r3, .L24
 285              		.loc 1 73 21
 286 00c6 FF22     		movs	r2, #255
 287 00c8 1A75     		strb	r2, [r3, #20]
 288              	.L20:
  74:/home/love/Documents/skola/EDA482/LV5/C/sysick_irq/startup.c ****     while (true) {
  75:/home/love/Documents/skola/EDA482/LV5/C/sysick_irq/startup.c ****         if(systick_flag) {
 289              		.loc 1 75 12
 290 00ca 074B     		ldr	r3, .L24+4
 291 00cc 1B78     		ldrb	r3, [r3]
 292              		.loc 1 75 11
 293 00ce 002B     		cmp	r3, #0
 294 00d0 00D1     		bne	.L23
 295 00d2 FAE7     		b	.L20
 296              	.L23:
  76:/home/love/Documents/skola/EDA482/LV5/C/sysick_irq/startup.c ****             break;
 297              		.loc 1 76 13
 298 00d4 C046     		nop
  77:/home/love/Documents/skola/EDA482/LV5/C/sysick_irq/startup.c ****         }
  78:/home/love/Documents/skola/EDA482/LV5/C/sysick_irq/startup.c ****     }
  79:/home/love/Documents/skola/EDA482/LV5/C/sysick_irq/startup.c ****     GPIO_D->odr_low = 0;
 299              		.loc 1 79 11
 300 00d6 034B     		ldr	r3, .L24
 301              		.loc 1 79 21
 302 00d8 0022     		movs	r2, #0
 303 00da 1A75     		strb	r2, [r3, #20]
  80:/home/love/Documents/skola/EDA482/LV5/C/sysick_irq/startup.c ****     return 0;
 304              		.loc 1 80 12
 305 00dc 0023     		movs	r3, #0
  81:/home/love/Documents/skola/EDA482/LV5/C/sysick_irq/startup.c **** }
 306              		.loc 1 81 1
 307 00de 1800     		movs	r0, r3
 308 00e0 BD46     		mov	sp, r7
 309              		@ sp needed
 310 00e2 80BD     		pop	{r7, pc}
 311              	.L25:
 312              		.align	2
 313              	.L24:
 314 00e4 000C0240 		.word	1073875968
 315 00e8 00000000 		.word	systick_flag
 316              		.cfi_endproc
 317              	.LFE5:
 319              	.Letext0:
 320              		.file 2 "/usr/arm-none-eabi/include/machine/_default_types.h"
 321              		.file 3 "/usr/arm-none-eabi/include/sys/_stdint.h"
 322              		.file 4 "/home/love/Documents/skola/EDA482/libs/include/libGPIO.h"
