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
  11              		.file	"delay.c"
  12              		.text
  13              	.Ltext0:
  14              		.cfi_sections	.debug_frame
  15              		.align	1
  16              		.global	delay_250ns
  17              		.syntax unified
  18              		.code	16
  19              		.thumb_func
  20              		.fpu softvfp
  22              	delay_250ns:
  23              	.LFB0:
  24              		.file 1 "/home/love/Documents/skola/EDA482/LV3/codelite/asciidisplay/delay.c"
   1:/home/love/Documents/skola/EDA482/LV3/codelite/asciidisplay/delay.c **** #include "delay.h"
   2:/home/love/Documents/skola/EDA482/LV3/codelite/asciidisplay/delay.c **** #include "STK.h"
   3:/home/love/Documents/skola/EDA482/LV3/codelite/asciidisplay/delay.c **** 
   4:/home/love/Documents/skola/EDA482/LV3/codelite/asciidisplay/delay.c **** void delay_250ns(void) 
   5:/home/love/Documents/skola/EDA482/LV3/codelite/asciidisplay/delay.c **** {
  25              		.loc 1 5 1
  26              		.cfi_startproc
  27              		@ args = 0, pretend = 0, frame = 0
  28              		@ frame_needed = 1, uses_anonymous_args = 0
  29 0000 80B5     		push	{r7, lr}
  30              		.cfi_def_cfa_offset 8
  31              		.cfi_offset 7, -8
  32              		.cfi_offset 14, -4
  33 0002 00AF     		add	r7, sp, #0
  34              		.cfi_def_cfa_register 7
   6:/home/love/Documents/skola/EDA482/LV3/codelite/asciidisplay/delay.c ****     SysTick->ctrl = 0;
  35              		.loc 1 6 12
  36 0004 0C4B     		ldr	r3, .L3
  37              		.loc 1 6 19
  38 0006 0022     		movs	r2, #0
  39 0008 1A60     		str	r2, [r3]
   7:/home/love/Documents/skola/EDA482/LV3/codelite/asciidisplay/delay.c ****     SysTick->load = 168/4 - 1;
  40              		.loc 1 7 12
  41 000a 0B4B     		ldr	r3, .L3
  42              		.loc 1 7 19
  43 000c 2922     		movs	r2, #41
  44 000e 5A60     		str	r2, [r3, #4]
   8:/home/love/Documents/skola/EDA482/LV3/codelite/asciidisplay/delay.c ****     SysTick->val = 0;
  45              		.loc 1 8 12
  46 0010 094B     		ldr	r3, .L3
  47              		.loc 1 8 18
  48 0012 0022     		movs	r2, #0
  49 0014 9A60     		str	r2, [r3, #8]
   9:/home/love/Documents/skola/EDA482/LV3/codelite/asciidisplay/delay.c ****     SysTick->ctrl = 5;
  50              		.loc 1 9 12
  51 0016 084B     		ldr	r3, .L3
  52              		.loc 1 9 19
  53 0018 0522     		movs	r2, #5
  54 001a 1A60     		str	r2, [r3]
  10:/home/love/Documents/skola/EDA482/LV3/codelite/asciidisplay/delay.c ****     while (!(SysTick->ctrl & 0x10000));
  55              		.loc 1 10 11
  56 001c C046     		nop
  57              	.L2:
  58              		.loc 1 10 21 discriminator 1
  59 001e 064B     		ldr	r3, .L3
  60 0020 1A68     		ldr	r2, [r3]
  61              		.loc 1 10 28 discriminator 1
  62 0022 8023     		movs	r3, #128
  63 0024 5B02     		lsls	r3, r3, #9
  64 0026 1340     		ands	r3, r2
  65              		.loc 1 10 11 discriminator 1
  66 0028 F9D0     		beq	.L2
  11:/home/love/Documents/skola/EDA482/LV3/codelite/asciidisplay/delay.c ****     SysTick->ctrl = 0;
  67              		.loc 1 11 12
  68 002a 034B     		ldr	r3, .L3
  69              		.loc 1 11 19
  70 002c 0022     		movs	r2, #0
  71 002e 1A60     		str	r2, [r3]
  12:/home/love/Documents/skola/EDA482/LV3/codelite/asciidisplay/delay.c **** }
  72              		.loc 1 12 1
  73 0030 C046     		nop
  74 0032 BD46     		mov	sp, r7
  75              		@ sp needed
  76 0034 80BD     		pop	{r7, pc}
  77              	.L4:
  78 0036 C046     		.align	2
  79              	.L3:
  80 0038 10E000E0 		.word	-536813552
  81              		.cfi_endproc
  82              	.LFE0:
  84              		.align	1
  85              		.global	delay_500ns
  86              		.syntax unified
  87              		.code	16
  88              		.thumb_func
  89              		.fpu softvfp
  91              	delay_500ns:
  92              	.LFB1:
  13:/home/love/Documents/skola/EDA482/LV3/codelite/asciidisplay/delay.c **** 
  14:/home/love/Documents/skola/EDA482/LV3/codelite/asciidisplay/delay.c **** void delay_500ns(void)
  15:/home/love/Documents/skola/EDA482/LV3/codelite/asciidisplay/delay.c **** {
  93              		.loc 1 15 1
  94              		.cfi_startproc
  95              		@ args = 0, pretend = 0, frame = 0
  96              		@ frame_needed = 1, uses_anonymous_args = 0
  97 003c 80B5     		push	{r7, lr}
  98              		.cfi_def_cfa_offset 8
  99              		.cfi_offset 7, -8
 100              		.cfi_offset 14, -4
 101 003e 00AF     		add	r7, sp, #0
 102              		.cfi_def_cfa_register 7
  16:/home/love/Documents/skola/EDA482/LV3/codelite/asciidisplay/delay.c ****     SysTick->ctrl = 0;
 103              		.loc 1 16 12
 104 0040 0C4B     		ldr	r3, .L7
 105              		.loc 1 16 19
 106 0042 0022     		movs	r2, #0
 107 0044 1A60     		str	r2, [r3]
  17:/home/love/Documents/skola/EDA482/LV3/codelite/asciidisplay/delay.c ****     SysTick->load = 168 / 2 - 1;
 108              		.loc 1 17 12
 109 0046 0B4B     		ldr	r3, .L7
 110              		.loc 1 17 19
 111 0048 5322     		movs	r2, #83
 112 004a 5A60     		str	r2, [r3, #4]
  18:/home/love/Documents/skola/EDA482/LV3/codelite/asciidisplay/delay.c ****     SysTick->val = 0;
 113              		.loc 1 18 12
 114 004c 094B     		ldr	r3, .L7
 115              		.loc 1 18 18
 116 004e 0022     		movs	r2, #0
 117 0050 9A60     		str	r2, [r3, #8]
  19:/home/love/Documents/skola/EDA482/LV3/codelite/asciidisplay/delay.c ****     SysTick->ctrl = 5;
 118              		.loc 1 19 12
 119 0052 084B     		ldr	r3, .L7
 120              		.loc 1 19 19
 121 0054 0522     		movs	r2, #5
 122 0056 1A60     		str	r2, [r3]
  20:/home/love/Documents/skola/EDA482/LV3/codelite/asciidisplay/delay.c ****     while (!(SysTick->ctrl & 0x10000));
 123              		.loc 1 20 11
 124 0058 C046     		nop
 125              	.L6:
 126              		.loc 1 20 21 discriminator 1
 127 005a 064B     		ldr	r3, .L7
 128 005c 1A68     		ldr	r2, [r3]
 129              		.loc 1 20 28 discriminator 1
 130 005e 8023     		movs	r3, #128
 131 0060 5B02     		lsls	r3, r3, #9
 132 0062 1340     		ands	r3, r2
 133              		.loc 1 20 11 discriminator 1
 134 0064 F9D0     		beq	.L6
  21:/home/love/Documents/skola/EDA482/LV3/codelite/asciidisplay/delay.c ****     SysTick->ctrl = 0;
 135              		.loc 1 21 12
 136 0066 034B     		ldr	r3, .L7
 137              		.loc 1 21 19
 138 0068 0022     		movs	r2, #0
 139 006a 1A60     		str	r2, [r3]
  22:/home/love/Documents/skola/EDA482/LV3/codelite/asciidisplay/delay.c **** }
 140              		.loc 1 22 1
 141 006c C046     		nop
 142 006e BD46     		mov	sp, r7
 143              		@ sp needed
 144 0070 80BD     		pop	{r7, pc}
 145              	.L8:
 146 0072 C046     		.align	2
 147              	.L7:
 148 0074 10E000E0 		.word	-536813552
 149              		.cfi_endproc
 150              	.LFE1:
 152              		.align	1
 153              		.global	delay_micros
 154              		.syntax unified
 155              		.code	16
 156              		.thumb_func
 157              		.fpu softvfp
 159              	delay_micros:
 160              	.LFB2:
  23:/home/love/Documents/skola/EDA482/LV3/codelite/asciidisplay/delay.c **** 
  24:/home/love/Documents/skola/EDA482/LV3/codelite/asciidisplay/delay.c **** void delay_micros(unsigned int u) 
  25:/home/love/Documents/skola/EDA482/LV3/codelite/asciidisplay/delay.c **** {
 161              		.loc 1 25 1
 162              		.cfi_startproc
 163              		@ args = 0, pretend = 0, frame = 8
 164              		@ frame_needed = 1, uses_anonymous_args = 0
 165 0078 80B5     		push	{r7, lr}
 166              		.cfi_def_cfa_offset 8
 167              		.cfi_offset 7, -8
 168              		.cfi_offset 14, -4
 169 007a 82B0     		sub	sp, sp, #8
 170              		.cfi_def_cfa_offset 16
 171 007c 00AF     		add	r7, sp, #0
 172              		.cfi_def_cfa_register 7
 173 007e 7860     		str	r0, [r7, #4]
  26:/home/love/Documents/skola/EDA482/LV3/codelite/asciidisplay/delay.c ****     #ifdef SIMULATOR
  27:/home/love/Documents/skola/EDA482/LV3/codelite/asciidisplay/delay.c ****         u /= 1000;
  28:/home/love/Documents/skola/EDA482/LV3/codelite/asciidisplay/delay.c ****         u++;
  29:/home/love/Documents/skola/EDA482/LV3/codelite/asciidisplay/delay.c ****     #endif
  30:/home/love/Documents/skola/EDA482/LV3/codelite/asciidisplay/delay.c ****     while (u--)
 174              		.loc 1 30 11
 175 0080 03E0     		b	.L10
 176              	.L11:
  31:/home/love/Documents/skola/EDA482/LV3/codelite/asciidisplay/delay.c ****     {
  32:/home/love/Documents/skola/EDA482/LV3/codelite/asciidisplay/delay.c ****         delay_500ns();
 177              		.loc 1 32 9
 178 0082 FFF7FEFF 		bl	delay_500ns
  33:/home/love/Documents/skola/EDA482/LV3/codelite/asciidisplay/delay.c ****         delay_500ns();
 179              		.loc 1 33 9
 180 0086 FFF7FEFF 		bl	delay_500ns
 181              	.L10:
  30:/home/love/Documents/skola/EDA482/LV3/codelite/asciidisplay/delay.c ****     {
 182              		.loc 1 30 13
 183 008a 7B68     		ldr	r3, [r7, #4]
 184 008c 5A1E     		subs	r2, r3, #1
 185 008e 7A60     		str	r2, [r7, #4]
  30:/home/love/Documents/skola/EDA482/LV3/codelite/asciidisplay/delay.c ****     {
 186              		.loc 1 30 11
 187 0090 002B     		cmp	r3, #0
 188 0092 F6D1     		bne	.L11
  34:/home/love/Documents/skola/EDA482/LV3/codelite/asciidisplay/delay.c ****     }
  35:/home/love/Documents/skola/EDA482/LV3/codelite/asciidisplay/delay.c **** }
 189              		.loc 1 35 1
 190 0094 C046     		nop
 191 0096 BD46     		mov	sp, r7
 192 0098 02B0     		add	sp, sp, #8
 193              		@ sp needed
 194 009a 80BD     		pop	{r7, pc}
 195              		.cfi_endproc
 196              	.LFE2:
 198              		.align	1
 199              		.global	delay_millis
 200              		.syntax unified
 201              		.code	16
 202              		.thumb_func
 203              		.fpu softvfp
 205              	delay_millis:
 206              	.LFB3:
  36:/home/love/Documents/skola/EDA482/LV3/codelite/asciidisplay/delay.c **** 
  37:/home/love/Documents/skola/EDA482/LV3/codelite/asciidisplay/delay.c **** void delay_millis(unsigned int m) 
  38:/home/love/Documents/skola/EDA482/LV3/codelite/asciidisplay/delay.c **** {
 207              		.loc 1 38 1
 208              		.cfi_startproc
 209              		@ args = 0, pretend = 0, frame = 8
 210              		@ frame_needed = 1, uses_anonymous_args = 0
 211 009c 80B5     		push	{r7, lr}
 212              		.cfi_def_cfa_offset 8
 213              		.cfi_offset 7, -8
 214              		.cfi_offset 14, -4
 215 009e 82B0     		sub	sp, sp, #8
 216              		.cfi_def_cfa_offset 16
 217 00a0 00AF     		add	r7, sp, #0
 218              		.cfi_def_cfa_register 7
 219 00a2 7860     		str	r0, [r7, #4]
  39:/home/love/Documents/skola/EDA482/LV3/codelite/asciidisplay/delay.c ****     delay_micros(m * 1000);
 220              		.loc 1 39 5
 221 00a4 7A68     		ldr	r2, [r7, #4]
 222 00a6 1300     		movs	r3, r2
 223 00a8 5B01     		lsls	r3, r3, #5
 224 00aa 9B1A     		subs	r3, r3, r2
 225 00ac 9B00     		lsls	r3, r3, #2
 226 00ae 9B18     		adds	r3, r3, r2
 227 00b0 DB00     		lsls	r3, r3, #3
 228 00b2 1800     		movs	r0, r3
 229 00b4 FFF7FEFF 		bl	delay_micros
  40:/home/love/Documents/skola/EDA482/LV3/codelite/asciidisplay/delay.c **** }...
 230              		.loc 1 40 1
 231 00b8 C046     		nop
 232 00ba BD46     		mov	sp, r7
 233 00bc 02B0     		add	sp, sp, #8
 234              		@ sp needed
 235 00be 80BD     		pop	{r7, pc}
 236              		.cfi_endproc
 237              	.LFE3:
 239              	.Letext0:
 240              		.file 2 "/usr/arm-none-eabi/include/machine/_default_types.h"
 241              		.file 3 "/usr/arm-none-eabi/include/sys/_stdint.h"
 242              		.file 4 "/home/love/Documents/skola/EDA482/LV3/codelite/asciidisplay/STK.h"
