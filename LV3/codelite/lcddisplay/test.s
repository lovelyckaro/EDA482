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
  11              		.file	"graphics.c"
  12              		.text
  13              	.Ltext0:
  14              		.cfi_sections	.debug_frame
  15              		.align	1
  16              		.global	graphic_ctrl_bit_set
  17              		.syntax unified
  18              		.code	16
  19              		.thumb_func
  20              		.fpu softvfp
  22              	graphic_ctrl_bit_set:
  23              	.LFB0:
  24              		.file 1 "/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c"
   1:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c **** #include "graphics.h"
   2:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c **** #include <libGPIO.h>
   3:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c **** #include <libdelay.h>
   4:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c **** 
   5:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c **** #define BITMASK_E 0x40
   6:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c **** #define BITMASK_SELECT 0x4
   7:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c **** #define BITMASK_RW 0x2
   8:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c **** #define BITMASK_RS 0x1
   9:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c **** #define BITMASK_RESET 0x20
  10:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c **** #define BITMASK_CS1 0x8
  11:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c **** #define BITMASK_CS2 0x10
  12:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c **** 
  13:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c **** #define LCD_ON 0x3F
  14:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c **** #define LCD_OFF 0x3E
  15:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c **** #define LCD_SET_ADD 0x40
  16:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c **** #define LCD_SET_PAGE 0xB8
  17:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c **** #define LCD_DISP_START 0xC0
  18:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c **** #define LCD_BUSY 0x80
  19:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c **** 
  20:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c **** // choose graphic display, and set the bits from x
  21:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c **** void graphic_ctrl_bit_set(uint8_t x) {
  25              		.loc 1 21 38
  26              		.cfi_startproc
  27              		@ args = 0, pretend = 0, frame = 16
  28              		@ frame_needed = 1, uses_anonymous_args = 0
  29 0000 80B5     		push	{r7, lr}
  30              		.cfi_def_cfa_offset 8
  31              		.cfi_offset 7, -8
  32              		.cfi_offset 14, -4
  33 0002 84B0     		sub	sp, sp, #16
  34              		.cfi_def_cfa_offset 24
  35 0004 00AF     		add	r7, sp, #0
  36              		.cfi_def_cfa_register 7
  37 0006 0200     		movs	r2, r0
  38 0008 FB1D     		adds	r3, r7, #7
  39 000a 1A70     		strb	r2, [r3]
  22:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****     uint8_t c = GPIO_E->odr_low;
  40              		.loc 1 22 23
  41 000c 0C4A     		ldr	r2, .L2
  42              		.loc 1 22 13
  43 000e 0F21     		movs	r1, #15
  44 0010 7B18     		adds	r3, r7, r1
  45 0012 127D     		ldrb	r2, [r2, #20]
  46 0014 1A70     		strb	r2, [r3]
  23:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****     c |= (x & ~BITMASK_SELECT);
  47              		.loc 1 23 13
  48 0016 FB1D     		adds	r3, r7, #7
  49 0018 1B78     		ldrb	r3, [r3]
  50 001a 5BB2     		sxtb	r3, r3
  51 001c 0422     		movs	r2, #4
  52 001e 9343     		bics	r3, r2
  53 0020 5AB2     		sxtb	r2, r3
  54              		.loc 1 23 7
  55 0022 7B18     		adds	r3, r7, r1
  56 0024 1B78     		ldrb	r3, [r3]
  57 0026 5BB2     		sxtb	r3, r3
  58 0028 1343     		orrs	r3, r2
  59 002a 5AB2     		sxtb	r2, r3
  60 002c 7B18     		adds	r3, r7, r1
  61 002e 1A70     		strb	r2, [r3]
  24:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****     GPIO_E->odr_low = c;
  62              		.loc 1 24 11
  63 0030 034A     		ldr	r2, .L2
  64              		.loc 1 24 21
  65 0032 7B18     		adds	r3, r7, r1
  66 0034 1B78     		ldrb	r3, [r3]
  67 0036 1375     		strb	r3, [r2, #20]
  25:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c **** }
  68              		.loc 1 25 1
  69 0038 C046     		nop
  70 003a BD46     		mov	sp, r7
  71 003c 04B0     		add	sp, sp, #16
  72              		@ sp needed
  73 003e 80BD     		pop	{r7, pc}
  74              	.L3:
  75              		.align	2
  76              	.L2:
  77 0040 00100240 		.word	1073876992
  78              		.cfi_endproc
  79              	.LFE0:
  81              		.align	1
  82              		.global	graphic_ctrl_bit_clear
  83              		.syntax unified
  84              		.code	16
  85              		.thumb_func
  86              		.fpu softvfp
  88              	graphic_ctrl_bit_clear:
  89              	.LFB1:
  26:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c **** // Choose graphic display, and clear the bits from x
  27:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c **** void graphic_ctrl_bit_clear(uint8_t x) {
  90              		.loc 1 27 40
  91              		.cfi_startproc
  92              		@ args = 0, pretend = 0, frame = 16
  93              		@ frame_needed = 1, uses_anonymous_args = 0
  94 0044 80B5     		push	{r7, lr}
  95              		.cfi_def_cfa_offset 8
  96              		.cfi_offset 7, -8
  97              		.cfi_offset 14, -4
  98 0046 84B0     		sub	sp, sp, #16
  99              		.cfi_def_cfa_offset 24
 100 0048 00AF     		add	r7, sp, #0
 101              		.cfi_def_cfa_register 7
 102 004a 0200     		movs	r2, r0
 103 004c FB1D     		adds	r3, r7, #7
 104 004e 1A70     		strb	r2, [r3]
  28:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****     uint8_t c = GPIO_E->odr_low;
 105              		.loc 1 28 23
 106 0050 0C4A     		ldr	r2, .L5
 107              		.loc 1 28 13
 108 0052 0F21     		movs	r1, #15
 109 0054 7B18     		adds	r3, r7, r1
 110 0056 127D     		ldrb	r2, [r2, #20]
 111 0058 1A70     		strb	r2, [r3]
  29:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****     c &= (~x & ~BITMASK_SELECT); 
 112              		.loc 1 29 7
 113 005a FB1D     		adds	r3, r7, #7
 114 005c 1B78     		ldrb	r3, [r3]
 115 005e DB43     		mvns	r3, r3
 116 0060 DBB2     		uxtb	r3, r3
 117 0062 7A18     		adds	r2, r7, r1
 118 0064 1278     		ldrb	r2, [r2]
 119 0066 1340     		ands	r3, r2
 120 0068 DAB2     		uxtb	r2, r3
 121 006a 0800     		movs	r0, r1
 122 006c 7B18     		adds	r3, r7, r1
 123 006e 0421     		movs	r1, #4
 124 0070 8A43     		bics	r2, r1
 125 0072 1A70     		strb	r2, [r3]
  30:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****     GPIO_E->odr_low = c;
 126              		.loc 1 30 11
 127 0074 034A     		ldr	r2, .L5
 128              		.loc 1 30 21
 129 0076 3B18     		adds	r3, r7, r0
 130 0078 1B78     		ldrb	r3, [r3]
 131 007a 1375     		strb	r3, [r2, #20]
  31:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c **** }
 132              		.loc 1 31 1
 133 007c C046     		nop
 134 007e BD46     		mov	sp, r7
 135 0080 04B0     		add	sp, sp, #16
 136              		@ sp needed
 137 0082 80BD     		pop	{r7, pc}
 138              	.L6:
 139              		.align	2
 140              	.L5:
 141 0084 00100240 		.word	1073876992
 142              		.cfi_endproc
 143              	.LFE1:
 145              		.align	1
 146              		.global	select_controller
 147              		.syntax unified
 148              		.code	16
 149              		.thumb_func
 150              		.fpu softvfp
 152              	select_controller:
 153              	.LFB2:
  32:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c **** // Select chip
  33:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c **** void select_controller(uint8_t controller) {
 154              		.loc 1 33 44
 155              		.cfi_startproc
 156              		@ args = 0, pretend = 0, frame = 8
 157              		@ frame_needed = 1, uses_anonymous_args = 0
 158 0088 80B5     		push	{r7, lr}
 159              		.cfi_def_cfa_offset 8
 160              		.cfi_offset 7, -8
 161              		.cfi_offset 14, -4
 162 008a 82B0     		sub	sp, sp, #8
 163              		.cfi_def_cfa_offset 16
 164 008c 00AF     		add	r7, sp, #0
 165              		.cfi_def_cfa_register 7
 166 008e 0200     		movs	r2, r0
 167 0090 FB1D     		adds	r3, r7, #7
 168 0092 1A70     		strb	r2, [r3]
  34:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****     switch (controller) {
 169              		.loc 1 34 5
 170 0094 FB1D     		adds	r3, r7, #7
 171 0096 1B78     		ldrb	r3, [r3]
 172 0098 082B     		cmp	r3, #8
 173 009a 0CD0     		beq	.L8
 174 009c 02DC     		bgt	.L9
 175 009e 002B     		cmp	r3, #0
 176 00a0 05D0     		beq	.L10
  35:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****         case 0:
  36:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****             graphic_ctrl_bit_clear (BITMASK_CS1 | BITMASK_CS2);
  37:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****             break;
  38:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****         case BITMASK_CS1:
  39:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****             graphic_ctrl_bit_set(BITMASK_CS1);
  40:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****             graphic_ctrl_bit_clear(BITMASK_CS2);
  41:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****             break;
  42:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****         case BITMASK_CS2:
  43:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****             graphic_ctrl_bit_set(BITMASK_CS2);
  44:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****             graphic_ctrl_bit_clear(BITMASK_CS1);
  45:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****             break;
  46:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****         case BITMASK_CS1 | BITMASK_CS2:
  47:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****             graphic_ctrl_bit_set(BITMASK_CS1 | BITMASK_CS2);
  48:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****             break;
  49:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****     }
  50:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c **** }
 177              		.loc 1 50 1
 178 00a2 1AE0     		b	.L14
 179              	.L9:
  34:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****     switch (controller) {
 180              		.loc 1 34 5
 181 00a4 102B     		cmp	r3, #16
 182 00a6 0DD0     		beq	.L12
 183 00a8 182B     		cmp	r3, #24
 184 00aa 12D0     		beq	.L13
 185              		.loc 1 50 1
 186 00ac 15E0     		b	.L14
 187              	.L10:
  36:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****             break;
 188              		.loc 1 36 13
 189 00ae 1820     		movs	r0, #24
 190 00b0 FFF7FEFF 		bl	graphic_ctrl_bit_clear
  37:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****         case BITMASK_CS1:
 191              		.loc 1 37 13
 192 00b4 11E0     		b	.L11
 193              	.L8:
  39:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****             graphic_ctrl_bit_clear(BITMASK_CS2);
 194              		.loc 1 39 13
 195 00b6 0820     		movs	r0, #8
 196 00b8 FFF7FEFF 		bl	graphic_ctrl_bit_set
  40:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****             break;
 197              		.loc 1 40 13
 198 00bc 1020     		movs	r0, #16
 199 00be FFF7FEFF 		bl	graphic_ctrl_bit_clear
  41:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****         case BITMASK_CS2:
 200              		.loc 1 41 13
 201 00c2 0AE0     		b	.L11
 202              	.L12:
  43:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****             graphic_ctrl_bit_clear(BITMASK_CS1);
 203              		.loc 1 43 13
 204 00c4 1020     		movs	r0, #16
 205 00c6 FFF7FEFF 		bl	graphic_ctrl_bit_set
  44:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****             break;
 206              		.loc 1 44 13
 207 00ca 0820     		movs	r0, #8
 208 00cc FFF7FEFF 		bl	graphic_ctrl_bit_clear
  45:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****         case BITMASK_CS1 | BITMASK_CS2:
 209              		.loc 1 45 13
 210 00d0 03E0     		b	.L11
 211              	.L13:
  47:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****             break;
 212              		.loc 1 47 13
 213 00d2 1820     		movs	r0, #24
 214 00d4 FFF7FEFF 		bl	graphic_ctrl_bit_set
  48:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****     }
 215              		.loc 1 48 13
 216 00d8 C046     		nop
 217              	.L11:
 218              	.L14:
 219              		.loc 1 50 1
 220 00da C046     		nop
 221 00dc BD46     		mov	sp, r7
 222 00de 02B0     		add	sp, sp, #8
 223              		@ sp needed
 224 00e0 80BD     		pop	{r7, pc}
 225              		.cfi_endproc
 226              	.LFE2:
 228              		.align	1
 229              		.global	graphic_wait_ready
 230              		.syntax unified
 231              		.code	16
 232              		.thumb_func
 233              		.fpu softvfp
 235              	graphic_wait_ready:
 236              	.LFB3:
  51:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c **** 
  52:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c **** void graphic_wait_ready() {
 237              		.loc 1 52 27
 238              		.cfi_startproc
 239              		@ args = 0, pretend = 0, frame = 8
 240              		@ frame_needed = 1, uses_anonymous_args = 0
 241 00e2 80B5     		push	{r7, lr}
 242              		.cfi_def_cfa_offset 8
 243              		.cfi_offset 7, -8
 244              		.cfi_offset 14, -4
 245 00e4 82B0     		sub	sp, sp, #8
 246              		.cfi_def_cfa_offset 16
 247 00e6 00AF     		add	r7, sp, #0
 248              		.cfi_def_cfa_register 7
  53:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****     graphic_ctrl_bit_clear(BITMASK_E);
 249              		.loc 1 53 5
 250 00e8 4020     		movs	r0, #64
 251 00ea FFF7FEFF 		bl	graphic_ctrl_bit_clear
  54:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****     GPIO_E->moder = 0x00005555;
 252              		.loc 1 54 11
 253 00ee 154B     		ldr	r3, .L17
 254              		.loc 1 54 19
 255 00f0 154A     		ldr	r2, .L17+4
 256 00f2 1A60     		str	r2, [r3]
  55:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****     graphic_ctrl_bit_set(BITMASK_RW);
 257              		.loc 1 55 5
 258 00f4 0220     		movs	r0, #2
 259 00f6 FFF7FEFF 		bl	graphic_ctrl_bit_set
  56:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****     graphic_ctrl_bit_clear(BITMASK_RS);
 260              		.loc 1 56 5
 261 00fa 0120     		movs	r0, #1
 262 00fc FFF7FEFF 		bl	graphic_ctrl_bit_clear
  57:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****     delay_500ns();
 263              		.loc 1 57 5
 264 0100 FFF7FEFF 		bl	delay_500ns
 265              	.L16:
  58:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****     
  59:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****     uint8_t c;
  60:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****     do {
  61:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****         graphic_ctrl_bit_set(BITMASK_E);
 266              		.loc 1 61 9 discriminator 1
 267 0104 4020     		movs	r0, #64
 268 0106 FFF7FEFF 		bl	graphic_ctrl_bit_set
  62:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****         delay_500ns();
 269              		.loc 1 62 9 discriminator 1
 270 010a FFF7FEFF 		bl	delay_500ns
  63:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****         c = GPIO_E->idr_high & LCD_BUSY;
 271              		.loc 1 63 19 discriminator 1
 272 010e 0D4B     		ldr	r3, .L17
 273 0110 5B7C     		ldrb	r3, [r3, #17]
 274 0112 DAB2     		uxtb	r2, r3
 275              		.loc 1 63 11 discriminator 1
 276 0114 FB1D     		adds	r3, r7, #7
 277 0116 7F21     		movs	r1, #127
 278 0118 8A43     		bics	r2, r1
 279 011a 1A70     		strb	r2, [r3]
  64:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****         graphic_ctrl_bit_clear(BITMASK_E);
 280              		.loc 1 64 9 discriminator 1
 281 011c 4020     		movs	r0, #64
 282 011e FFF7FEFF 		bl	graphic_ctrl_bit_clear
  65:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****         delay_500ns();
 283              		.loc 1 65 9 discriminator 1
 284 0122 FFF7FEFF 		bl	delay_500ns
  66:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****     }while(c);
 285              		.loc 1 66 5 discriminator 1
 286 0126 FB1D     		adds	r3, r7, #7
 287 0128 1B78     		ldrb	r3, [r3]
 288 012a 002B     		cmp	r3, #0
 289 012c EAD1     		bne	.L16
  67:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****     
  68:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****     graphic_ctrl_bit_set(BITMASK_E);
 290              		.loc 1 68 5
 291 012e 4020     		movs	r0, #64
 292 0130 FFF7FEFF 		bl	graphic_ctrl_bit_set
  69:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****     GPIO_E->moder = 0x55555555;
 293              		.loc 1 69 11
 294 0134 034B     		ldr	r3, .L17
 295              		.loc 1 69 19
 296 0136 054A     		ldr	r2, .L17+8
 297 0138 1A60     		str	r2, [r3]
  70:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c **** }
 298              		.loc 1 70 1
 299 013a C046     		nop
 300 013c BD46     		mov	sp, r7
 301 013e 02B0     		add	sp, sp, #8
 302              		@ sp needed
 303 0140 80BD     		pop	{r7, pc}
 304              	.L18:
 305 0142 C046     		.align	2
 306              	.L17:
 307 0144 00100240 		.word	1073876992
 308 0148 55550000 		.word	21845
 309 014c 55555555 		.word	1431655765
 310              		.cfi_endproc
 311              	.LFE3:
 313              		.align	1
 314              		.global	graphic_read
 315              		.syntax unified
 316              		.code	16
 317              		.thumb_func
 318              		.fpu softvfp
 320              	graphic_read:
 321              	.LFB4:
  71:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c **** 
  72:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c **** uint8_t graphic_read(uint8_t controller) {
 322              		.loc 1 72 42
 323              		.cfi_startproc
 324              		@ args = 0, pretend = 0, frame = 16
 325              		@ frame_needed = 1, uses_anonymous_args = 0
 326 0150 80B5     		push	{r7, lr}
 327              		.cfi_def_cfa_offset 8
 328              		.cfi_offset 7, -8
 329              		.cfi_offset 14, -4
 330 0152 84B0     		sub	sp, sp, #16
 331              		.cfi_def_cfa_offset 24
 332 0154 00AF     		add	r7, sp, #0
 333              		.cfi_def_cfa_register 7
 334 0156 0200     		movs	r2, r0
 335 0158 FB1D     		adds	r3, r7, #7
 336 015a 1A70     		strb	r2, [r3]
  73:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****     graphic_ctrl_bit_clear(BITMASK_E);
 337              		.loc 1 73 5
 338 015c 4020     		movs	r0, #64
 339 015e FFF7FEFF 		bl	graphic_ctrl_bit_clear
  74:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****     GPIO_E->moder = 0x00005555;
 340              		.loc 1 74 11
 341 0162 1C4B     		ldr	r3, .L23
 342              		.loc 1 74 19
 343 0164 1C4A     		ldr	r2, .L23+4
 344 0166 1A60     		str	r2, [r3]
  75:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****     graphic_ctrl_bit_set(BITMASK_RS | BITMASK_RW);
 345              		.loc 1 75 5
 346 0168 0320     		movs	r0, #3
 347 016a FFF7FEFF 		bl	graphic_ctrl_bit_set
  76:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****     select_controller(controller);
 348              		.loc 1 76 5
 349 016e FB1D     		adds	r3, r7, #7
 350 0170 1B78     		ldrb	r3, [r3]
 351 0172 1800     		movs	r0, r3
 352 0174 FFF7FEFF 		bl	select_controller
  77:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****     delay_500ns();
 353              		.loc 1 77 5
 354 0178 FFF7FEFF 		bl	delay_500ns
  78:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****     graphic_ctrl_bit_set(BITMASK_E);
 355              		.loc 1 78 5
 356 017c 4020     		movs	r0, #64
 357 017e FFF7FEFF 		bl	graphic_ctrl_bit_set
  79:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****     delay_500ns();
 358              		.loc 1 79 5
 359 0182 FFF7FEFF 		bl	delay_500ns
  80:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****     uint8_t returnvalue = GPIO_E->idr_high;
 360              		.loc 1 80 33
 361 0186 134A     		ldr	r2, .L23
 362              		.loc 1 80 13
 363 0188 0F23     		movs	r3, #15
 364 018a FB18     		adds	r3, r7, r3
 365 018c 527C     		ldrb	r2, [r2, #17]
 366 018e 1A70     		strb	r2, [r3]
  81:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****     graphic_ctrl_bit_clear(BITMASK_E);
 367              		.loc 1 81 5
 368 0190 4020     		movs	r0, #64
 369 0192 FFF7FEFF 		bl	graphic_ctrl_bit_clear
  82:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****     GPIO_E->moder = 0x55555555;
 370              		.loc 1 82 11
 371 0196 0F4B     		ldr	r3, .L23
 372              		.loc 1 82 19
 373 0198 104A     		ldr	r2, .L23+8
 374 019a 1A60     		str	r2, [r3]
  83:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****     if(controller & BITMASK_CS1) {
 375              		.loc 1 83 19
 376 019c FB1D     		adds	r3, r7, #7
 377 019e 1B78     		ldrb	r3, [r3]
 378 01a0 0822     		movs	r2, #8
 379 01a2 1340     		ands	r3, r2
 380              		.loc 1 83 7
 381 01a4 04D0     		beq	.L20
  84:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****         select_controller(BITMASK_CS1);
 382              		.loc 1 84 9
 383 01a6 0820     		movs	r0, #8
 384 01a8 FFF7FEFF 		bl	select_controller
  85:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****         graphic_wait_ready();
 385              		.loc 1 85 9
 386 01ac FFF7FEFF 		bl	graphic_wait_ready
 387              	.L20:
  86:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****     }
  87:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****     if(controller & BITMASK_CS2) {
 388              		.loc 1 87 19
 389 01b0 FB1D     		adds	r3, r7, #7
 390 01b2 1B78     		ldrb	r3, [r3]
 391 01b4 1022     		movs	r2, #16
 392 01b6 1340     		ands	r3, r2
 393              		.loc 1 87 7
 394 01b8 04D0     		beq	.L21
  88:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****         select_controller(BITMASK_CS1);
 395              		.loc 1 88 9
 396 01ba 0820     		movs	r0, #8
 397 01bc FFF7FEFF 		bl	select_controller
  89:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****         graphic_wait_ready();
 398              		.loc 1 89 9
 399 01c0 FFF7FEFF 		bl	graphic_wait_ready
 400              	.L21:
  90:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****     }
  91:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****     return returnvalue;
 401              		.loc 1 91 12
 402 01c4 0F23     		movs	r3, #15
 403 01c6 FB18     		adds	r3, r7, r3
 404 01c8 1B78     		ldrb	r3, [r3]
  92:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c **** }
 405              		.loc 1 92 1
 406 01ca 1800     		movs	r0, r3
 407 01cc BD46     		mov	sp, r7
 408 01ce 04B0     		add	sp, sp, #16
 409              		@ sp needed
 410 01d0 80BD     		pop	{r7, pc}
 411              	.L24:
 412 01d2 C046     		.align	2
 413              	.L23:
 414 01d4 00100240 		.word	1073876992
 415 01d8 55550000 		.word	21845
 416 01dc 55555555 		.word	1431655765
 417              		.cfi_endproc
 418              	.LFE4:
 420              		.align	1
 421              		.global	graphic_write
 422              		.syntax unified
 423              		.code	16
 424              		.thumb_func
 425              		.fpu softvfp
 427              	graphic_write:
 428              	.LFB5:
  93:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c **** 
  94:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c **** void graphic_write(uint8_t value, uint8_t controller) {
 429              		.loc 1 94 55
 430              		.cfi_startproc
 431              		@ args = 0, pretend = 0, frame = 8
 432              		@ frame_needed = 1, uses_anonymous_args = 0
 433 01e0 80B5     		push	{r7, lr}
 434              		.cfi_def_cfa_offset 8
 435              		.cfi_offset 7, -8
 436              		.cfi_offset 14, -4
 437 01e2 82B0     		sub	sp, sp, #8
 438              		.cfi_def_cfa_offset 16
 439 01e4 00AF     		add	r7, sp, #0
 440              		.cfi_def_cfa_register 7
 441 01e6 0200     		movs	r2, r0
 442 01e8 FB1D     		adds	r3, r7, #7
 443 01ea 1A70     		strb	r2, [r3]
 444 01ec BB1D     		adds	r3, r7, #6
 445 01ee 0A1C     		adds	r2, r1, #0
 446 01f0 1A70     		strb	r2, [r3]
  95:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****     GPIO_E->odr_high = value;
 447              		.loc 1 95 11
 448 01f2 1A4A     		ldr	r2, .L28
 449              		.loc 1 95 22
 450 01f4 FB1D     		adds	r3, r7, #7
 451 01f6 1B78     		ldrb	r3, [r3]
 452 01f8 5375     		strb	r3, [r2, #21]
  96:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****     select_controller(controller);
 453              		.loc 1 96 5
 454 01fa BB1D     		adds	r3, r7, #6
 455 01fc 1B78     		ldrb	r3, [r3]
 456 01fe 1800     		movs	r0, r3
 457 0200 FFF7FEFF 		bl	select_controller
  97:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****     delay_500ns();
 458              		.loc 1 97 5
 459 0204 FFF7FEFF 		bl	delay_500ns
  98:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****     graphic_ctrl_bit_set(BITMASK_E);
 460              		.loc 1 98 5
 461 0208 4020     		movs	r0, #64
 462 020a FFF7FEFF 		bl	graphic_ctrl_bit_set
  99:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****     delay_500ns();
 463              		.loc 1 99 5
 464 020e FFF7FEFF 		bl	delay_500ns
 100:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****     graphic_ctrl_bit_clear(BITMASK_E);
 465              		.loc 1 100 5
 466 0212 4020     		movs	r0, #64
 467 0214 FFF7FEFF 		bl	graphic_ctrl_bit_clear
 101:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****     if(controller & BITMASK_CS1) {
 468              		.loc 1 101 19
 469 0218 BB1D     		adds	r3, r7, #6
 470 021a 1B78     		ldrb	r3, [r3]
 471 021c 0822     		movs	r2, #8
 472 021e 1340     		ands	r3, r2
 473              		.loc 1 101 7
 474 0220 04D0     		beq	.L26
 102:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****         select_controller(BITMASK_CS1);
 475              		.loc 1 102 9
 476 0222 0820     		movs	r0, #8
 477 0224 FFF7FEFF 		bl	select_controller
 103:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****         graphic_wait_ready();
 478              		.loc 1 103 9
 479 0228 FFF7FEFF 		bl	graphic_wait_ready
 480              	.L26:
 104:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****     }
 105:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****     if(controller & BITMASK_CS2) {
 481              		.loc 1 105 19
 482 022c BB1D     		adds	r3, r7, #6
 483 022e 1B78     		ldrb	r3, [r3]
 484 0230 1022     		movs	r2, #16
 485 0232 1340     		ands	r3, r2
 486              		.loc 1 105 7
 487 0234 04D0     		beq	.L27
 106:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****         select_controller(BITMASK_CS2);
 488              		.loc 1 106 9
 489 0236 1020     		movs	r0, #16
 490 0238 FFF7FEFF 		bl	select_controller
 107:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****         graphic_wait_ready();
 491              		.loc 1 107 9
 492 023c FFF7FEFF 		bl	graphic_wait_ready
 493              	.L27:
 108:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****     }
 109:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****     GPIO_E->odr_high = 0;
 494              		.loc 1 109 11
 495 0240 064B     		ldr	r3, .L28
 496              		.loc 1 109 22
 497 0242 0022     		movs	r2, #0
 498 0244 5A75     		strb	r2, [r3, #21]
 110:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****     graphic_ctrl_bit_set(BITMASK_E);
 499              		.loc 1 110 5
 500 0246 4020     		movs	r0, #64
 501 0248 FFF7FEFF 		bl	graphic_ctrl_bit_set
 111:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****     select_controller(0);
 502              		.loc 1 111 5
 503 024c 0020     		movs	r0, #0
 504 024e FFF7FEFF 		bl	select_controller
 112:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c **** }
 505              		.loc 1 112 1
 506 0252 C046     		nop
 507 0254 BD46     		mov	sp, r7
 508 0256 02B0     		add	sp, sp, #8
 509              		@ sp needed
 510 0258 80BD     		pop	{r7, pc}
 511              	.L29:
 512 025a C046     		.align	2
 513              	.L28:
 514 025c 00100240 		.word	1073876992
 515              		.cfi_endproc
 516              	.LFE5:
 518              		.align	1
 519              		.global	graphic_write_command
 520              		.syntax unified
 521              		.code	16
 522              		.thumb_func
 523              		.fpu softvfp
 525              	graphic_write_command:
 526              	.LFB6:
 113:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c **** 
 114:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c **** void graphic_write_command(uint8_t command, uint8_t controller) {
 527              		.loc 1 114 65
 528              		.cfi_startproc
 529              		@ args = 0, pretend = 0, frame = 8
 530              		@ frame_needed = 1, uses_anonymous_args = 0
 531 0260 80B5     		push	{r7, lr}
 532              		.cfi_def_cfa_offset 8
 533              		.cfi_offset 7, -8
 534              		.cfi_offset 14, -4
 535 0262 82B0     		sub	sp, sp, #8
 536              		.cfi_def_cfa_offset 16
 537 0264 00AF     		add	r7, sp, #0
 538              		.cfi_def_cfa_register 7
 539 0266 0200     		movs	r2, r0
 540 0268 FB1D     		adds	r3, r7, #7
 541 026a 1A70     		strb	r2, [r3]
 542 026c BB1D     		adds	r3, r7, #6
 543 026e 0A1C     		adds	r2, r1, #0
 544 0270 1A70     		strb	r2, [r3]
 115:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****     graphic_ctrl_bit_clear(BITMASK_E);
 545              		.loc 1 115 5
 546 0272 4020     		movs	r0, #64
 547 0274 FFF7FEFF 		bl	graphic_ctrl_bit_clear
 116:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****     select_controller(controller);
 548              		.loc 1 116 5
 549 0278 BB1D     		adds	r3, r7, #6
 550 027a 1B78     		ldrb	r3, [r3]
 551 027c 1800     		movs	r0, r3
 552 027e FFF7FEFF 		bl	select_controller
 117:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****     graphic_ctrl_bit_clear(BITMASK_RS | BITMASK_RW);
 553              		.loc 1 117 5
 554 0282 0320     		movs	r0, #3
 555 0284 FFF7FEFF 		bl	graphic_ctrl_bit_clear
 118:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****     graphic_write(command, controller);
 556              		.loc 1 118 5
 557 0288 BB1D     		adds	r3, r7, #6
 558 028a 1A78     		ldrb	r2, [r3]
 559 028c FB1D     		adds	r3, r7, #7
 560 028e 1B78     		ldrb	r3, [r3]
 561 0290 1100     		movs	r1, r2
 562 0292 1800     		movs	r0, r3
 563 0294 FFF7FEFF 		bl	graphic_write
 119:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c **** }
 564              		.loc 1 119 1
 565 0298 C046     		nop
 566 029a BD46     		mov	sp, r7
 567 029c 02B0     		add	sp, sp, #8
 568              		@ sp needed
 569 029e 80BD     		pop	{r7, pc}
 570              		.cfi_endproc
 571              	.LFE6:
 573              		.align	1
 574              		.global	graphic_write_data
 575              		.syntax unified
 576              		.code	16
 577              		.thumb_func
 578              		.fpu softvfp
 580              	graphic_write_data:
 581              	.LFB7:
 120:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c **** 
 121:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c **** void graphic_write_data(uint8_t data, uint8_t controller) {
 582              		.loc 1 121 59
 583              		.cfi_startproc
 584              		@ args = 0, pretend = 0, frame = 8
 585              		@ frame_needed = 1, uses_anonymous_args = 0
 586 02a0 80B5     		push	{r7, lr}
 587              		.cfi_def_cfa_offset 8
 588              		.cfi_offset 7, -8
 589              		.cfi_offset 14, -4
 590 02a2 82B0     		sub	sp, sp, #8
 591              		.cfi_def_cfa_offset 16
 592 02a4 00AF     		add	r7, sp, #0
 593              		.cfi_def_cfa_register 7
 594 02a6 0200     		movs	r2, r0
 595 02a8 FB1D     		adds	r3, r7, #7
 596 02aa 1A70     		strb	r2, [r3]
 597 02ac BB1D     		adds	r3, r7, #6
 598 02ae 0A1C     		adds	r2, r1, #0
 599 02b0 1A70     		strb	r2, [r3]
 122:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****     graphic_ctrl_bit_clear(BITMASK_E);
 600              		.loc 1 122 5
 601 02b2 4020     		movs	r0, #64
 602 02b4 FFF7FEFF 		bl	graphic_ctrl_bit_clear
 123:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****     select_controller(controller);
 603              		.loc 1 123 5
 604 02b8 BB1D     		adds	r3, r7, #6
 605 02ba 1B78     		ldrb	r3, [r3]
 606 02bc 1800     		movs	r0, r3
 607 02be FFF7FEFF 		bl	select_controller
 124:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****     graphic_ctrl_bit_clear(BITMASK_RW);
 608              		.loc 1 124 5
 609 02c2 0220     		movs	r0, #2
 610 02c4 FFF7FEFF 		bl	graphic_ctrl_bit_clear
 125:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****     graphic_ctrl_bit_set(BITMASK_RS);
 611              		.loc 1 125 5
 612 02c8 0120     		movs	r0, #1
 613 02ca FFF7FEFF 		bl	graphic_ctrl_bit_set
 126:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****     graphic_write(data, controller);
 614              		.loc 1 126 5
 615 02ce BB1D     		adds	r3, r7, #6
 616 02d0 1A78     		ldrb	r2, [r3]
 617 02d2 FB1D     		adds	r3, r7, #7
 618 02d4 1B78     		ldrb	r3, [r3]
 619 02d6 1100     		movs	r1, r2
 620 02d8 1800     		movs	r0, r3
 621 02da FFF7FEFF 		bl	graphic_write
 127:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c **** }
 622              		.loc 1 127 1
 623 02de C046     		nop
 624 02e0 BD46     		mov	sp, r7
 625 02e2 02B0     		add	sp, sp, #8
 626              		@ sp needed
 627 02e4 80BD     		pop	{r7, pc}
 628              		.cfi_endproc
 629              	.LFE7:
 631              		.align	1
 632              		.global	graphic_read_data
 633              		.syntax unified
 634              		.code	16
 635              		.thumb_func
 636              		.fpu softvfp
 638              	graphic_read_data:
 639              	.LFB8:
 128:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c **** 
 129:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c **** uint8_t graphic_read_data(uint8_t controller) {
 640              		.loc 1 129 47
 641              		.cfi_startproc
 642              		@ args = 0, pretend = 0, frame = 8
 643              		@ frame_needed = 1, uses_anonymous_args = 0
 644 02e6 80B5     		push	{r7, lr}
 645              		.cfi_def_cfa_offset 8
 646              		.cfi_offset 7, -8
 647              		.cfi_offset 14, -4
 648 02e8 82B0     		sub	sp, sp, #8
 649              		.cfi_def_cfa_offset 16
 650 02ea 00AF     		add	r7, sp, #0
 651              		.cfi_def_cfa_register 7
 652 02ec 0200     		movs	r2, r0
 653 02ee FB1D     		adds	r3, r7, #7
 654 02f0 1A70     		strb	r2, [r3]
 130:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****     (void) graphic_read(controller);
 655              		.loc 1 130 12
 656 02f2 FB1D     		adds	r3, r7, #7
 657 02f4 1B78     		ldrb	r3, [r3]
 658 02f6 1800     		movs	r0, r3
 659 02f8 FFF7FEFF 		bl	graphic_read
 131:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****     return graphic_read(controller);
 660              		.loc 1 131 12
 661 02fc FB1D     		adds	r3, r7, #7
 662 02fe 1B78     		ldrb	r3, [r3]
 663 0300 1800     		movs	r0, r3
 664 0302 FFF7FEFF 		bl	graphic_read
 665 0306 0300     		movs	r3, r0
 132:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c **** }
 666              		.loc 1 132 1
 667 0308 1800     		movs	r0, r3
 668 030a BD46     		mov	sp, r7
 669 030c 02B0     		add	sp, sp, #8
 670              		@ sp needed
 671 030e 80BD     		pop	{r7, pc}
 672              		.cfi_endproc
 673              	.LFE8:
 675              		.align	1
 676              		.global	pixel
 677              		.syntax unified
 678              		.code	16
 679              		.thumb_func
 680              		.fpu softvfp
 682              	pixel:
 683              	.LFB9:
 133:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c **** 
 134:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c **** void pixel(uint8_t x, uint8_t y, bool set) {
 684              		.loc 1 134 44
 685              		.cfi_startproc
 686              		@ args = 0, pretend = 0, frame = 16
 687              		@ frame_needed = 1, uses_anonymous_args = 0
 688 0310 F0B5     		push	{r4, r5, r6, r7, lr}
 689              		.cfi_def_cfa_offset 20
 690              		.cfi_offset 4, -20
 691              		.cfi_offset 5, -16
 692              		.cfi_offset 6, -12
 693              		.cfi_offset 7, -8
 694              		.cfi_offset 14, -4
 695 0312 85B0     		sub	sp, sp, #20
 696              		.cfi_def_cfa_offset 40
 697 0314 00AF     		add	r7, sp, #0
 698              		.cfi_def_cfa_register 7
 699 0316 0400     		movs	r4, r0
 700 0318 0800     		movs	r0, r1
 701 031a 1100     		movs	r1, r2
 702 031c FB1D     		adds	r3, r7, #7
 703 031e 221C     		adds	r2, r4, #0
 704 0320 1A70     		strb	r2, [r3]
 705 0322 BB1D     		adds	r3, r7, #6
 706 0324 021C     		adds	r2, r0, #0
 707 0326 1A70     		strb	r2, [r3]
 708 0328 7B1D     		adds	r3, r7, #5
 709 032a 0A1C     		adds	r2, r1, #0
 710 032c 1A70     		strb	r2, [r3]
 135:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****     // Create bitmask for the pixel
 136:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****     uint8_t index, mask, controller;
 137:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****     index = (y-1) / 8;
 711              		.loc 1 137 15
 712 032e BB1D     		adds	r3, r7, #6
 713 0330 1B78     		ldrb	r3, [r3]
 714 0332 013B     		subs	r3, r3, #1
 715              		.loc 1 137 19
 716 0334 002B     		cmp	r3, #0
 717 0336 00DA     		bge	.L35
 718 0338 0733     		adds	r3, r3, #7
 719              	.L35:
 720 033a DB10     		asrs	r3, r3, #3
 721 033c 1A00     		movs	r2, r3
 722              		.loc 1 137 11
 723 033e 0D23     		movs	r3, #13
 724 0340 FB18     		adds	r3, r7, r3
 725 0342 1A70     		strb	r2, [r3]
 138:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****     mask = 0x1 << ((y-1) % 8);
 726              		.loc 1 138 22
 727 0344 BB1D     		adds	r3, r7, #6
 728 0346 1B78     		ldrb	r3, [r3]
 729 0348 013B     		subs	r3, r3, #1
 730              		.loc 1 138 26
 731 034a 3E4A     		ldr	r2, .L41
 732 034c 1340     		ands	r3, r2
 733 034e 04D5     		bpl	.L36
 734 0350 013B     		subs	r3, r3, #1
 735 0352 0822     		movs	r2, #8
 736 0354 5242     		rsbs	r2, r2, #0
 737 0356 1343     		orrs	r3, r2
 738 0358 0133     		adds	r3, r3, #1
 739              	.L36:
 740 035a 1A00     		movs	r2, r3
 741              		.loc 1 138 16
 742 035c 0123     		movs	r3, #1
 743 035e 9340     		lsls	r3, r3, r2
 744 0360 1A00     		movs	r2, r3
 745              		.loc 1 138 10
 746 0362 0F23     		movs	r3, #15
 747 0364 FB18     		adds	r3, r7, r3
 748 0366 1A70     		strb	r2, [r3]
 139:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****     if (x > 64) {
 749              		.loc 1 139 8
 750 0368 FB1D     		adds	r3, r7, #7
 751 036a 1B78     		ldrb	r3, [r3]
 752 036c 402B     		cmp	r3, #64
 753 036e 09D9     		bls	.L37
 140:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****         controller = BITMASK_CS2;
 754              		.loc 1 140 20
 755 0370 0E23     		movs	r3, #14
 756 0372 FB18     		adds	r3, r7, r3
 757 0374 1022     		movs	r2, #16
 758 0376 1A70     		strb	r2, [r3]
 141:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****         x -= 65;
 759              		.loc 1 141 11
 760 0378 FB1D     		adds	r3, r7, #7
 761 037a FA1D     		adds	r2, r7, #7
 762 037c 1278     		ldrb	r2, [r2]
 763 037e 413A     		subs	r2, r2, #65
 764 0380 1A70     		strb	r2, [r3]
 765 0382 08E0     		b	.L38
 766              	.L37:
 142:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****     }else {
 143:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****         controller = BITMASK_CS1;
 767              		.loc 1 143 20
 768 0384 0E23     		movs	r3, #14
 769 0386 FB18     		adds	r3, r7, r3
 770 0388 0822     		movs	r2, #8
 771 038a 1A70     		strb	r2, [r3]
 144:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****         x--;
 772              		.loc 1 144 10
 773 038c FB1D     		adds	r3, r7, #7
 774 038e 1A78     		ldrb	r2, [r3]
 775 0390 FB1D     		adds	r3, r7, #7
 776 0392 013A     		subs	r2, r2, #1
 777 0394 1A70     		strb	r2, [r3]
 778              	.L38:
 145:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****     }
 146:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****     
 147:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****     graphic_write_command(LCD_SET_ADD | x, controller);
 779              		.loc 1 147 5
 780 0396 FB1D     		adds	r3, r7, #7
 781 0398 1B78     		ldrb	r3, [r3]
 782 039a 4022     		movs	r2, #64
 783 039c 1343     		orrs	r3, r2
 784 039e DAB2     		uxtb	r2, r3
 785 03a0 0E25     		movs	r5, #14
 786 03a2 7B19     		adds	r3, r7, r5
 787 03a4 1B78     		ldrb	r3, [r3]
 788 03a6 1900     		movs	r1, r3
 789 03a8 1000     		movs	r0, r2
 790 03aa FFF7FEFF 		bl	graphic_write_command
 148:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****     graphic_write_command(LCD_SET_PAGE | index, controller);
 791              		.loc 1 148 5
 792 03ae 0D23     		movs	r3, #13
 793 03b0 FB18     		adds	r3, r7, r3
 794 03b2 1B78     		ldrb	r3, [r3]
 795 03b4 4822     		movs	r2, #72
 796 03b6 5242     		rsbs	r2, r2, #0
 797 03b8 1343     		orrs	r3, r2
 798 03ba DAB2     		uxtb	r2, r3
 799 03bc 7B19     		adds	r3, r7, r5
 800 03be 1B78     		ldrb	r3, [r3]
 801 03c0 1900     		movs	r1, r3
 802 03c2 1000     		movs	r0, r2
 803 03c4 FFF7FEFF 		bl	graphic_write_command
 149:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****     uint8_t temp = graphic_read_data(controller);
 804              		.loc 1 149 20
 805 03c8 0C26     		movs	r6, #12
 806 03ca BC19     		adds	r4, r7, r6
 807 03cc 7B19     		adds	r3, r7, r5
 808 03ce 1B78     		ldrb	r3, [r3]
 809 03d0 1800     		movs	r0, r3
 810 03d2 FFF7FEFF 		bl	graphic_read_data
 811 03d6 0300     		movs	r3, r0
 812 03d8 2370     		strb	r3, [r4]
 150:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****     graphic_write_command(LCD_SET_ADD | x, controller);
 813              		.loc 1 150 5
 814 03da FB1D     		adds	r3, r7, #7
 815 03dc 1B78     		ldrb	r3, [r3]
 816 03de 4022     		movs	r2, #64
 817 03e0 1343     		orrs	r3, r2
 818 03e2 DAB2     		uxtb	r2, r3
 819 03e4 7B19     		adds	r3, r7, r5
 820 03e6 1B78     		ldrb	r3, [r3]
 821 03e8 1900     		movs	r1, r3
 822 03ea 1000     		movs	r0, r2
 823 03ec FFF7FEFF 		bl	graphic_write_command
 151:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****     if (set) {
 824              		.loc 1 151 8
 825 03f0 7B1D     		adds	r3, r7, #5
 826 03f2 1B78     		ldrb	r3, [r3]
 827 03f4 002B     		cmp	r3, #0
 828 03f6 08D0     		beq	.L39
 152:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****         mask |= temp;
 829              		.loc 1 152 14
 830 03f8 0F22     		movs	r2, #15
 831 03fa BB18     		adds	r3, r7, r2
 832 03fc B918     		adds	r1, r7, r2
 833 03fe BA19     		adds	r2, r7, r6
 834 0400 0978     		ldrb	r1, [r1]
 835 0402 1278     		ldrb	r2, [r2]
 836 0404 0A43     		orrs	r2, r1
 837 0406 1A70     		strb	r2, [r3]
 838 0408 0DE0     		b	.L40
 839              	.L39:
 153:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****     }else {
 154:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****         mask = ~mask & temp;
 840              		.loc 1 154 22
 841 040a 0F21     		movs	r1, #15
 842 040c 7B18     		adds	r3, r7, r1
 843 040e 1B78     		ldrb	r3, [r3]
 844 0410 5BB2     		sxtb	r3, r3
 845 0412 DB43     		mvns	r3, r3
 846 0414 5BB2     		sxtb	r3, r3
 847 0416 0C22     		movs	r2, #12
 848 0418 BA18     		adds	r2, r7, r2
 849 041a 1278     		ldrb	r2, [r2]
 850 041c 52B2     		sxtb	r2, r2
 851 041e 1340     		ands	r3, r2
 852 0420 5AB2     		sxtb	r2, r3
 853              		.loc 1 154 14
 854 0422 7B18     		adds	r3, r7, r1
 855 0424 1A70     		strb	r2, [r3]
 856              	.L40:
 155:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****     }
 156:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****     graphic_write_data(mask, controller);
 857              		.loc 1 156 5
 858 0426 0E23     		movs	r3, #14
 859 0428 FB18     		adds	r3, r7, r3
 860 042a 1A78     		ldrb	r2, [r3]
 861 042c 0F23     		movs	r3, #15
 862 042e FB18     		adds	r3, r7, r3
 863 0430 1B78     		ldrb	r3, [r3]
 864 0432 1100     		movs	r1, r2
 865 0434 1800     		movs	r0, r3
 866 0436 FFF7FEFF 		bl	graphic_write_data
 157:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c **** }
 867              		.loc 1 157 1
 868 043a C046     		nop
 869 043c BD46     		mov	sp, r7
 870 043e 05B0     		add	sp, sp, #20
 871              		@ sp needed
 872 0440 F0BD     		pop	{r4, r5, r6, r7, pc}
 873              	.L42:
 874 0442 C046     		.align	2
 875              	.L41:
 876 0444 07000080 		.word	-2147483641
 877              		.cfi_endproc
 878              	.LFE9:
 880              		.align	1
 881              		.global	graphic_clear_screen
 882              		.syntax unified
 883              		.code	16
 884              		.thumb_func
 885              		.fpu softvfp
 887              	graphic_clear_screen:
 888              	.LFB10:
 158:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c **** 
 159:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c **** void graphic_clear_screen(void) {
 889              		.loc 1 159 33
 890              		.cfi_startproc
 891              		@ args = 0, pretend = 0, frame = 8
 892              		@ frame_needed = 1, uses_anonymous_args = 0
 893 0448 80B5     		push	{r7, lr}
 894              		.cfi_def_cfa_offset 8
 895              		.cfi_offset 7, -8
 896              		.cfi_offset 14, -4
 897 044a 82B0     		sub	sp, sp, #8
 898              		.cfi_def_cfa_offset 16
 899 044c 00AF     		add	r7, sp, #0
 900              		.cfi_def_cfa_register 7
 901              	.LBB2:
 160:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****     for (uint8_t page = 0; page < 8; page++ ) {
 902              		.loc 1 160 18
 903 044e FB1D     		adds	r3, r7, #7
 904 0450 0022     		movs	r2, #0
 905 0452 1A70     		strb	r2, [r3]
 906              		.loc 1 160 5
 907 0454 23E0     		b	.L44
 908              	.L47:
 161:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****         graphic_write_command(LCD_SET_PAGE | page, BITMASK_CS1 | BITMASK_CS2);
 909              		.loc 1 161 9
 910 0456 FB1D     		adds	r3, r7, #7
 911 0458 1B78     		ldrb	r3, [r3]
 912 045a 4822     		movs	r2, #72
 913 045c 5242     		rsbs	r2, r2, #0
 914 045e 1343     		orrs	r3, r2
 915 0460 DBB2     		uxtb	r3, r3
 916 0462 1821     		movs	r1, #24
 917 0464 1800     		movs	r0, r3
 918 0466 FFF7FEFF 		bl	graphic_write_command
 162:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****         graphic_write_command(LCD_SET_ADD  | 0, BITMASK_CS1 | BITMASK_CS2);
 919              		.loc 1 162 9
 920 046a 1821     		movs	r1, #24
 921 046c 4020     		movs	r0, #64
 922 046e FFF7FEFF 		bl	graphic_write_command
 923              	.LBB3:
 163:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****         for (uint8_t add = 0; add < 64; add++) {
 924              		.loc 1 163 22
 925 0472 BB1D     		adds	r3, r7, #6
 926 0474 0022     		movs	r2, #0
 927 0476 1A70     		strb	r2, [r3]
 928              		.loc 1 163 9
 929 0478 08E0     		b	.L45
 930              	.L46:
 164:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****             graphic_write_data(0, BITMASK_CS1 | BITMASK_CS2);
 931              		.loc 1 164 13 discriminator 3
 932 047a 1821     		movs	r1, #24
 933 047c 0020     		movs	r0, #0
 934 047e FFF7FEFF 		bl	graphic_write_data
 163:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****         for (uint8_t add = 0; add < 64; add++) {
 935              		.loc 1 163 44 discriminator 3
 936 0482 BB1D     		adds	r3, r7, #6
 937 0484 1A78     		ldrb	r2, [r3]
 938 0486 BB1D     		adds	r3, r7, #6
 939 0488 0132     		adds	r2, r2, #1
 940 048a 1A70     		strb	r2, [r3]
 941              	.L45:
 163:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****         for (uint8_t add = 0; add < 64; add++) {
 942              		.loc 1 163 9 discriminator 1
 943 048c BB1D     		adds	r3, r7, #6
 944 048e 1B78     		ldrb	r3, [r3]
 945 0490 3F2B     		cmp	r3, #63
 946 0492 F2D9     		bls	.L46
 947              	.LBE3:
 160:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****         graphic_write_command(LCD_SET_PAGE | page, BITMASK_CS1 | BITMASK_CS2);
 948              		.loc 1 160 42 discriminator 2
 949 0494 FB1D     		adds	r3, r7, #7
 950 0496 1A78     		ldrb	r2, [r3]
 951 0498 FB1D     		adds	r3, r7, #7
 952 049a 0132     		adds	r2, r2, #1
 953 049c 1A70     		strb	r2, [r3]
 954              	.L44:
 160:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****         graphic_write_command(LCD_SET_PAGE | page, BITMASK_CS1 | BITMASK_CS2);
 955              		.loc 1 160 5 discriminator 1
 956 049e FB1D     		adds	r3, r7, #7
 957 04a0 1B78     		ldrb	r3, [r3]
 958 04a2 072B     		cmp	r3, #7
 959 04a4 D7D9     		bls	.L47
 960              	.LBE2:
 165:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****         }
 166:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****     }
 167:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c **** }
 961              		.loc 1 167 1
 962 04a6 C046     		nop
 963 04a8 BD46     		mov	sp, r7
 964 04aa 02B0     		add	sp, sp, #8
 965              		@ sp needed
 966 04ac 80BD     		pop	{r7, pc}
 967              		.cfi_endproc
 968              	.LFE10:
 970              		.align	1
 971              		.global	graphic_init
 972              		.syntax unified
 973              		.code	16
 974              		.thumb_func
 975              		.fpu softvfp
 977              	graphic_init:
 978              	.LFB11:
 168:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c **** 
 169:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c **** 
 170:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c **** void graphic_init(void) {
 979              		.loc 1 170 25
 980              		.cfi_startproc
 981              		@ args = 0, pretend = 0, frame = 0
 982              		@ frame_needed = 1, uses_anonymous_args = 0
 983 04ae 80B5     		push	{r7, lr}
 984              		.cfi_def_cfa_offset 8
 985              		.cfi_offset 7, -8
 986              		.cfi_offset 14, -4
 987 04b0 00AF     		add	r7, sp, #0
 988              		.cfi_def_cfa_register 7
 171:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****     graphic_ctrl_bit_set(BITMASK_E);
 989              		.loc 1 171 5
 990 04b2 4020     		movs	r0, #64
 991 04b4 FFF7FEFF 		bl	graphic_ctrl_bit_set
 172:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****     delay_micros(10);
 992              		.loc 1 172 5
 993 04b8 0A20     		movs	r0, #10
 994 04ba FFF7FEFF 		bl	delay_micros
 173:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****     graphic_ctrl_bit_clear(BITMASK_CS1 | BITMASK_CS2 | BITMASK_RESET | BITMASK_E);
 995              		.loc 1 173 5
 996 04be 7820     		movs	r0, #120
 997 04c0 FFF7FEFF 		bl	graphic_ctrl_bit_clear
 174:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****     delay_millis(30);
 998              		.loc 1 174 5
 999 04c4 1E20     		movs	r0, #30
 1000 04c6 FFF7FEFF 		bl	delay_millis
 175:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****     graphic_ctrl_bit_set(BITMASK_RESET);
 1001              		.loc 1 175 5
 1002 04ca 2020     		movs	r0, #32
 1003 04cc FFF7FEFF 		bl	graphic_ctrl_bit_set
 176:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****     
 177:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****     // Toggle display
 178:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****     graphic_write_command(LCD_OFF, BITMASK_CS1 | BITMASK_CS2);
 1004              		.loc 1 178 5
 1005 04d0 1821     		movs	r1, #24
 1006 04d2 3E20     		movs	r0, #62
 1007 04d4 FFF7FEFF 		bl	graphic_write_command
 179:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****     graphic_write_command(LCD_ON, BITMASK_CS1 | BITMASK_CS2);
 1008              		.loc 1 179 5
 1009 04d8 1821     		movs	r1, #24
 1010 04da 3F20     		movs	r0, #63
 1011 04dc FFF7FEFF 		bl	graphic_write_command
 180:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****     //Start = 0
 181:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****     graphic_write_command(LCD_DISP_START, BITMASK_CS1 | BITMASK_CS2);
 1012              		.loc 1 181 5
 1013 04e0 1821     		movs	r1, #24
 1014 04e2 C020     		movs	r0, #192
 1015 04e4 FFF7FEFF 		bl	graphic_write_command
 182:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****     // Add = 0
 183:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****     graphic_write_command(LCD_SET_ADD, BITMASK_CS1 | BITMASK_CS2);
 1016              		.loc 1 183 5
 1017 04e8 1821     		movs	r1, #24
 1018 04ea 4020     		movs	r0, #64
 1019 04ec FFF7FEFF 		bl	graphic_write_command
 184:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****     // Page = 0
 185:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****     graphic_write_command(LCD_SET_PAGE, BITMASK_CS1 | BITMASK_CS2);
 1020              		.loc 1 185 5
 1021 04f0 1821     		movs	r1, #24
 1022 04f2 B820     		movs	r0, #184
 1023 04f4 FFF7FEFF 		bl	graphic_write_command
 186:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****     // Deactivate both CS signals
 187:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****     select_controller(0);
 1024              		.loc 1 187 5
 1025 04f8 0020     		movs	r0, #0
 1026 04fa FFF7FEFF 		bl	select_controller
 188:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c **** }...
 1027              		.loc 1 188 1
 1028 04fe C046     		nop
 1029 0500 BD46     		mov	sp, r7
 1030              		@ sp needed
 1031 0502 80BD     		pop	{r7, pc}
 1032              		.cfi_endproc
 1033              	.LFE11:
 1035              	.Letext0:
 1036              		.file 2 "/usr/arm-none-eabi/include/machine/_default_types.h"
 1037              		.file 3 "/usr/arm-none-eabi/include/sys/_stdint.h"
 1038              		.file 4 "/home/love/Documents/skola/EDA482/libs/include/libGPIO.h"
