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
 172 0098 182B     		cmp	r3, #24
 173 009a 1AD0     		beq	.L8
 174 009c 1DDC     		bgt	.L13
 175 009e 102B     		cmp	r3, #16
 176 00a0 10D0     		beq	.L10
 177 00a2 1ADC     		bgt	.L13
 178 00a4 002B     		cmp	r3, #0
 179 00a6 02D0     		beq	.L11
 180 00a8 082B     		cmp	r3, #8
 181 00aa 04D0     		beq	.L12
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
 182              		.loc 1 50 1
 183 00ac 15E0     		b	.L13
 184              	.L11:
  36:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****             break;
 185              		.loc 1 36 13
 186 00ae 1820     		movs	r0, #24
 187 00b0 FFF7FEFF 		bl	graphic_ctrl_bit_clear
  37:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****         case BITMASK_CS1:
 188              		.loc 1 37 13
 189 00b4 11E0     		b	.L9
 190              	.L12:
  39:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****             graphic_ctrl_bit_clear(BITMASK_CS2);
 191              		.loc 1 39 13
 192 00b6 0820     		movs	r0, #8
 193 00b8 FFF7FEFF 		bl	graphic_ctrl_bit_set
  40:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****             break;
 194              		.loc 1 40 13
 195 00bc 1020     		movs	r0, #16
 196 00be FFF7FEFF 		bl	graphic_ctrl_bit_clear
  41:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****         case BITMASK_CS2:
 197              		.loc 1 41 13
 198 00c2 0AE0     		b	.L9
 199              	.L10:
  43:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****             graphic_ctrl_bit_clear(BITMASK_CS1);
 200              		.loc 1 43 13
 201 00c4 1020     		movs	r0, #16
 202 00c6 FFF7FEFF 		bl	graphic_ctrl_bit_set
  44:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****             break;
 203              		.loc 1 44 13
 204 00ca 0820     		movs	r0, #8
 205 00cc FFF7FEFF 		bl	graphic_ctrl_bit_clear
  45:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****         case BITMASK_CS1 | BITMASK_CS2:
 206              		.loc 1 45 13
 207 00d0 03E0     		b	.L9
 208              	.L8:
  47:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****             break;
 209              		.loc 1 47 13
 210 00d2 1820     		movs	r0, #24
 211 00d4 FFF7FEFF 		bl	graphic_ctrl_bit_set
  48:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****     }
 212              		.loc 1 48 13
 213 00d8 C046     		nop
 214              	.L9:
 215              	.L13:
 216              		.loc 1 50 1
 217 00da C046     		nop
 218 00dc BD46     		mov	sp, r7
 219 00de 02B0     		add	sp, sp, #8
 220              		@ sp needed
 221 00e0 80BD     		pop	{r7, pc}
 222              		.cfi_endproc
 223              	.LFE2:
 225              		.align	1
 226              		.global	graphic_wait_ready
 227              		.syntax unified
 228              		.code	16
 229              		.thumb_func
 230              		.fpu softvfp
 232              	graphic_wait_ready:
 233              	.LFB3:
  51:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c **** 
  52:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c **** void graphic_wait_ready() {
 234              		.loc 1 52 27
 235              		.cfi_startproc
 236              		@ args = 0, pretend = 0, frame = 8
 237              		@ frame_needed = 1, uses_anonymous_args = 0
 238 00e2 80B5     		push	{r7, lr}
 239              		.cfi_def_cfa_offset 8
 240              		.cfi_offset 7, -8
 241              		.cfi_offset 14, -4
 242 00e4 82B0     		sub	sp, sp, #8
 243              		.cfi_def_cfa_offset 16
 244 00e6 00AF     		add	r7, sp, #0
 245              		.cfi_def_cfa_register 7
  53:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****     graphic_ctrl_bit_clear(BITMASK_E);
 246              		.loc 1 53 5
 247 00e8 4020     		movs	r0, #64
 248 00ea FFF7FEFF 		bl	graphic_ctrl_bit_clear
  54:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****     GPIO_E->moder = 0x00005555;
 249              		.loc 1 54 11
 250 00ee 154B     		ldr	r3, .L16
 251              		.loc 1 54 19
 252 00f0 154A     		ldr	r2, .L16+4
 253 00f2 1A60     		str	r2, [r3]
  55:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****     graphic_ctrl_bit_set(BITMASK_RW);
 254              		.loc 1 55 5
 255 00f4 0220     		movs	r0, #2
 256 00f6 FFF7FEFF 		bl	graphic_ctrl_bit_set
  56:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****     graphic_ctrl_bit_clear(BITMASK_RS);
 257              		.loc 1 56 5
 258 00fa 0120     		movs	r0, #1
 259 00fc FFF7FEFF 		bl	graphic_ctrl_bit_clear
  57:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****     delay_500ns();
 260              		.loc 1 57 5
 261 0100 FFF7FEFF 		bl	delay_500ns
 262              	.L15:
  58:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****     
  59:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****     uint8_t c;
  60:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****     do {
  61:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****         graphic_ctrl_bit_set(BITMASK_E);
 263              		.loc 1 61 9 discriminator 1
 264 0104 4020     		movs	r0, #64
 265 0106 FFF7FEFF 		bl	graphic_ctrl_bit_set
  62:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****         delay_500ns();
 266              		.loc 1 62 9 discriminator 1
 267 010a FFF7FEFF 		bl	delay_500ns
  63:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****         c = GPIO_E->idr_high & LCD_BUSY;
 268              		.loc 1 63 19 discriminator 1
 269 010e 0D4B     		ldr	r3, .L16
 270 0110 5B7C     		ldrb	r3, [r3, #17]
 271 0112 DAB2     		uxtb	r2, r3
 272              		.loc 1 63 11 discriminator 1
 273 0114 FB1D     		adds	r3, r7, #7
 274 0116 7F21     		movs	r1, #127
 275 0118 8A43     		bics	r2, r1
 276 011a 1A70     		strb	r2, [r3]
  64:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****         graphic_ctrl_bit_clear(BITMASK_E);
 277              		.loc 1 64 9 discriminator 1
 278 011c 4020     		movs	r0, #64
 279 011e FFF7FEFF 		bl	graphic_ctrl_bit_clear
  65:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****         delay_500ns();
 280              		.loc 1 65 9 discriminator 1
 281 0122 FFF7FEFF 		bl	delay_500ns
  66:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****     }while(c);
 282              		.loc 1 66 5 discriminator 1
 283 0126 FB1D     		adds	r3, r7, #7
 284 0128 1B78     		ldrb	r3, [r3]
 285 012a 002B     		cmp	r3, #0
 286 012c EAD1     		bne	.L15
  67:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****     
  68:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****     graphic_ctrl_bit_set(BITMASK_E);
 287              		.loc 1 68 5
 288 012e 4020     		movs	r0, #64
 289 0130 FFF7FEFF 		bl	graphic_ctrl_bit_set
  69:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****     GPIO_E->moder = 0x55555555;
 290              		.loc 1 69 11
 291 0134 034B     		ldr	r3, .L16
 292              		.loc 1 69 19
 293 0136 054A     		ldr	r2, .L16+8
 294 0138 1A60     		str	r2, [r3]
  70:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c **** }
 295              		.loc 1 70 1
 296 013a C046     		nop
 297 013c BD46     		mov	sp, r7
 298 013e 02B0     		add	sp, sp, #8
 299              		@ sp needed
 300 0140 80BD     		pop	{r7, pc}
 301              	.L17:
 302 0142 C046     		.align	2
 303              	.L16:
 304 0144 00100240 		.word	1073876992
 305 0148 55550000 		.word	21845
 306 014c 55555555 		.word	1431655765
 307              		.cfi_endproc
 308              	.LFE3:
 310              		.align	1
 311              		.global	graphic_read
 312              		.syntax unified
 313              		.code	16
 314              		.thumb_func
 315              		.fpu softvfp
 317              	graphic_read:
 318              	.LFB4:
  71:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c **** 
  72:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c **** uint8_t graphic_read(uint8_t controller) {
 319              		.loc 1 72 42
 320              		.cfi_startproc
 321              		@ args = 0, pretend = 0, frame = 16
 322              		@ frame_needed = 1, uses_anonymous_args = 0
 323 0150 80B5     		push	{r7, lr}
 324              		.cfi_def_cfa_offset 8
 325              		.cfi_offset 7, -8
 326              		.cfi_offset 14, -4
 327 0152 84B0     		sub	sp, sp, #16
 328              		.cfi_def_cfa_offset 24
 329 0154 00AF     		add	r7, sp, #0
 330              		.cfi_def_cfa_register 7
 331 0156 0200     		movs	r2, r0
 332 0158 FB1D     		adds	r3, r7, #7
 333 015a 1A70     		strb	r2, [r3]
  73:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****     graphic_ctrl_bit_clear(BITMASK_E);
 334              		.loc 1 73 5
 335 015c 4020     		movs	r0, #64
 336 015e FFF7FEFF 		bl	graphic_ctrl_bit_clear
  74:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****     GPIO_E->moder = 0x00005555;
 337              		.loc 1 74 11
 338 0162 1C4B     		ldr	r3, .L22
 339              		.loc 1 74 19
 340 0164 1C4A     		ldr	r2, .L22+4
 341 0166 1A60     		str	r2, [r3]
  75:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****     graphic_ctrl_bit_set(BITMASK_RS | BITMASK_RW);
 342              		.loc 1 75 5
 343 0168 0320     		movs	r0, #3
 344 016a FFF7FEFF 		bl	graphic_ctrl_bit_set
  76:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****     select_controller(controller);
 345              		.loc 1 76 5
 346 016e FB1D     		adds	r3, r7, #7
 347 0170 1B78     		ldrb	r3, [r3]
 348 0172 1800     		movs	r0, r3
 349 0174 FFF7FEFF 		bl	select_controller
  77:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****     delay_500ns();
 350              		.loc 1 77 5
 351 0178 FFF7FEFF 		bl	delay_500ns
  78:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****     graphic_ctrl_bit_set(BITMASK_E);
 352              		.loc 1 78 5
 353 017c 4020     		movs	r0, #64
 354 017e FFF7FEFF 		bl	graphic_ctrl_bit_set
  79:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****     delay_500ns();
 355              		.loc 1 79 5
 356 0182 FFF7FEFF 		bl	delay_500ns
  80:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****     uint8_t returnvalue = GPIO_E->idr_high;
 357              		.loc 1 80 33
 358 0186 134A     		ldr	r2, .L22
 359              		.loc 1 80 13
 360 0188 0F23     		movs	r3, #15
 361 018a FB18     		adds	r3, r7, r3
 362 018c 527C     		ldrb	r2, [r2, #17]
 363 018e 1A70     		strb	r2, [r3]
  81:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****     graphic_ctrl_bit_clear(BITMASK_E);
 364              		.loc 1 81 5
 365 0190 4020     		movs	r0, #64
 366 0192 FFF7FEFF 		bl	graphic_ctrl_bit_clear
  82:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****     GPIO_E->moder = 0x55555555;
 367              		.loc 1 82 11
 368 0196 0F4B     		ldr	r3, .L22
 369              		.loc 1 82 19
 370 0198 104A     		ldr	r2, .L22+8
 371 019a 1A60     		str	r2, [r3]
  83:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****     if(controller & BITMASK_CS1) {
 372              		.loc 1 83 19
 373 019c FB1D     		adds	r3, r7, #7
 374 019e 1B78     		ldrb	r3, [r3]
 375 01a0 0822     		movs	r2, #8
 376 01a2 1340     		ands	r3, r2
 377              		.loc 1 83 7
 378 01a4 04D0     		beq	.L19
  84:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****         select_controller(BITMASK_CS1);
 379              		.loc 1 84 9
 380 01a6 0820     		movs	r0, #8
 381 01a8 FFF7FEFF 		bl	select_controller
  85:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****         graphic_wait_ready();
 382              		.loc 1 85 9
 383 01ac FFF7FEFF 		bl	graphic_wait_ready
 384              	.L19:
  86:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****     }
  87:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****     if(controller & BITMASK_CS2) {
 385              		.loc 1 87 19
 386 01b0 FB1D     		adds	r3, r7, #7
 387 01b2 1B78     		ldrb	r3, [r3]
 388 01b4 1022     		movs	r2, #16
 389 01b6 1340     		ands	r3, r2
 390              		.loc 1 87 7
 391 01b8 04D0     		beq	.L20
  88:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****         select_controller(BITMASK_CS1);
 392              		.loc 1 88 9
 393 01ba 0820     		movs	r0, #8
 394 01bc FFF7FEFF 		bl	select_controller
  89:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****         graphic_wait_ready();
 395              		.loc 1 89 9
 396 01c0 FFF7FEFF 		bl	graphic_wait_ready
 397              	.L20:
  90:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****     }
  91:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****     return returnvalue;
 398              		.loc 1 91 12
 399 01c4 0F23     		movs	r3, #15
 400 01c6 FB18     		adds	r3, r7, r3
 401 01c8 1B78     		ldrb	r3, [r3]
  92:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c **** }
 402              		.loc 1 92 1
 403 01ca 1800     		movs	r0, r3
 404 01cc BD46     		mov	sp, r7
 405 01ce 04B0     		add	sp, sp, #16
 406              		@ sp needed
 407 01d0 80BD     		pop	{r7, pc}
 408              	.L23:
 409 01d2 C046     		.align	2
 410              	.L22:
 411 01d4 00100240 		.word	1073876992
 412 01d8 55550000 		.word	21845
 413 01dc 55555555 		.word	1431655765
 414              		.cfi_endproc
 415              	.LFE4:
 417              		.align	1
 418              		.global	graphic_write
 419              		.syntax unified
 420              		.code	16
 421              		.thumb_func
 422              		.fpu softvfp
 424              	graphic_write:
 425              	.LFB5:
  93:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c **** 
  94:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c **** void graphic_write(uint8_t value, uint8_t controller) {
 426              		.loc 1 94 55
 427              		.cfi_startproc
 428              		@ args = 0, pretend = 0, frame = 8
 429              		@ frame_needed = 1, uses_anonymous_args = 0
 430 01e0 80B5     		push	{r7, lr}
 431              		.cfi_def_cfa_offset 8
 432              		.cfi_offset 7, -8
 433              		.cfi_offset 14, -4
 434 01e2 82B0     		sub	sp, sp, #8
 435              		.cfi_def_cfa_offset 16
 436 01e4 00AF     		add	r7, sp, #0
 437              		.cfi_def_cfa_register 7
 438 01e6 0200     		movs	r2, r0
 439 01e8 FB1D     		adds	r3, r7, #7
 440 01ea 1A70     		strb	r2, [r3]
 441 01ec BB1D     		adds	r3, r7, #6
 442 01ee 0A1C     		adds	r2, r1, #0
 443 01f0 1A70     		strb	r2, [r3]
  95:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****     GPIO_E->odr_high = value;
 444              		.loc 1 95 11
 445 01f2 1A4A     		ldr	r2, .L27
 446              		.loc 1 95 22
 447 01f4 FB1D     		adds	r3, r7, #7
 448 01f6 1B78     		ldrb	r3, [r3]
 449 01f8 5375     		strb	r3, [r2, #21]
  96:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****     select_controller(controller);
 450              		.loc 1 96 5
 451 01fa BB1D     		adds	r3, r7, #6
 452 01fc 1B78     		ldrb	r3, [r3]
 453 01fe 1800     		movs	r0, r3
 454 0200 FFF7FEFF 		bl	select_controller
  97:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****     delay_500ns();
 455              		.loc 1 97 5
 456 0204 FFF7FEFF 		bl	delay_500ns
  98:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****     graphic_ctrl_bit_set(BITMASK_E);
 457              		.loc 1 98 5
 458 0208 4020     		movs	r0, #64
 459 020a FFF7FEFF 		bl	graphic_ctrl_bit_set
  99:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****     delay_500ns();
 460              		.loc 1 99 5
 461 020e FFF7FEFF 		bl	delay_500ns
 100:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****     graphic_ctrl_bit_clear(BITMASK_E);
 462              		.loc 1 100 5
 463 0212 4020     		movs	r0, #64
 464 0214 FFF7FEFF 		bl	graphic_ctrl_bit_clear
 101:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****     if(controller & BITMASK_CS1) {
 465              		.loc 1 101 19
 466 0218 BB1D     		adds	r3, r7, #6
 467 021a 1B78     		ldrb	r3, [r3]
 468 021c 0822     		movs	r2, #8
 469 021e 1340     		ands	r3, r2
 470              		.loc 1 101 7
 471 0220 04D0     		beq	.L25
 102:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****         select_controller(BITMASK_CS1);
 472              		.loc 1 102 9
 473 0222 0820     		movs	r0, #8
 474 0224 FFF7FEFF 		bl	select_controller
 103:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****         graphic_wait_ready();
 475              		.loc 1 103 9
 476 0228 FFF7FEFF 		bl	graphic_wait_ready
 477              	.L25:
 104:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****     }
 105:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****     if(controller & BITMASK_CS2) {
 478              		.loc 1 105 19
 479 022c BB1D     		adds	r3, r7, #6
 480 022e 1B78     		ldrb	r3, [r3]
 481 0230 1022     		movs	r2, #16
 482 0232 1340     		ands	r3, r2
 483              		.loc 1 105 7
 484 0234 04D0     		beq	.L26
 106:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****         select_controller(BITMASK_CS2);
 485              		.loc 1 106 9
 486 0236 1020     		movs	r0, #16
 487 0238 FFF7FEFF 		bl	select_controller
 107:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****         graphic_wait_ready();
 488              		.loc 1 107 9
 489 023c FFF7FEFF 		bl	graphic_wait_ready
 490              	.L26:
 108:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****     }
 109:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****     GPIO_E->odr_high = 0;
 491              		.loc 1 109 11
 492 0240 064B     		ldr	r3, .L27
 493              		.loc 1 109 22
 494 0242 0022     		movs	r2, #0
 495 0244 5A75     		strb	r2, [r3, #21]
 110:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****     graphic_ctrl_bit_set(BITMASK_E);
 496              		.loc 1 110 5
 497 0246 4020     		movs	r0, #64
 498 0248 FFF7FEFF 		bl	graphic_ctrl_bit_set
 111:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****     select_controller(0);
 499              		.loc 1 111 5
 500 024c 0020     		movs	r0, #0
 501 024e FFF7FEFF 		bl	select_controller
 112:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c **** }
 502              		.loc 1 112 1
 503 0252 C046     		nop
 504 0254 BD46     		mov	sp, r7
 505 0256 02B0     		add	sp, sp, #8
 506              		@ sp needed
 507 0258 80BD     		pop	{r7, pc}
 508              	.L28:
 509 025a C046     		.align	2
 510              	.L27:
 511 025c 00100240 		.word	1073876992
 512              		.cfi_endproc
 513              	.LFE5:
 515              		.align	1
 516              		.global	graphic_write_command
 517              		.syntax unified
 518              		.code	16
 519              		.thumb_func
 520              		.fpu softvfp
 522              	graphic_write_command:
 523              	.LFB6:
 113:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c **** 
 114:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c **** void graphic_write_command(uint8_t command, uint8_t controller) {
 524              		.loc 1 114 65
 525              		.cfi_startproc
 526              		@ args = 0, pretend = 0, frame = 8
 527              		@ frame_needed = 1, uses_anonymous_args = 0
 528 0260 80B5     		push	{r7, lr}
 529              		.cfi_def_cfa_offset 8
 530              		.cfi_offset 7, -8
 531              		.cfi_offset 14, -4
 532 0262 82B0     		sub	sp, sp, #8
 533              		.cfi_def_cfa_offset 16
 534 0264 00AF     		add	r7, sp, #0
 535              		.cfi_def_cfa_register 7
 536 0266 0200     		movs	r2, r0
 537 0268 FB1D     		adds	r3, r7, #7
 538 026a 1A70     		strb	r2, [r3]
 539 026c BB1D     		adds	r3, r7, #6
 540 026e 0A1C     		adds	r2, r1, #0
 541 0270 1A70     		strb	r2, [r3]
 115:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****     graphic_ctrl_bit_clear(BITMASK_E);
 542              		.loc 1 115 5
 543 0272 4020     		movs	r0, #64
 544 0274 FFF7FEFF 		bl	graphic_ctrl_bit_clear
 116:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****     select_controller(controller);
 545              		.loc 1 116 5
 546 0278 BB1D     		adds	r3, r7, #6
 547 027a 1B78     		ldrb	r3, [r3]
 548 027c 1800     		movs	r0, r3
 549 027e FFF7FEFF 		bl	select_controller
 117:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****     graphic_ctrl_bit_clear(BITMASK_RS | BITMASK_RW);
 550              		.loc 1 117 5
 551 0282 0320     		movs	r0, #3
 552 0284 FFF7FEFF 		bl	graphic_ctrl_bit_clear
 118:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****     graphic_write(command, controller);
 553              		.loc 1 118 5
 554 0288 BB1D     		adds	r3, r7, #6
 555 028a 1A78     		ldrb	r2, [r3]
 556 028c FB1D     		adds	r3, r7, #7
 557 028e 1B78     		ldrb	r3, [r3]
 558 0290 1100     		movs	r1, r2
 559 0292 1800     		movs	r0, r3
 560 0294 FFF7FEFF 		bl	graphic_write
 119:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c **** }
 561              		.loc 1 119 1
 562 0298 C046     		nop
 563 029a BD46     		mov	sp, r7
 564 029c 02B0     		add	sp, sp, #8
 565              		@ sp needed
 566 029e 80BD     		pop	{r7, pc}
 567              		.cfi_endproc
 568              	.LFE6:
 570              		.align	1
 571              		.global	graphic_write_data
 572              		.syntax unified
 573              		.code	16
 574              		.thumb_func
 575              		.fpu softvfp
 577              	graphic_write_data:
 578              	.LFB7:
 120:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c **** 
 121:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c **** void graphic_write_data(uint8_t data, uint8_t controller) {
 579              		.loc 1 121 59
 580              		.cfi_startproc
 581              		@ args = 0, pretend = 0, frame = 8
 582              		@ frame_needed = 1, uses_anonymous_args = 0
 583 02a0 80B5     		push	{r7, lr}
 584              		.cfi_def_cfa_offset 8
 585              		.cfi_offset 7, -8
 586              		.cfi_offset 14, -4
 587 02a2 82B0     		sub	sp, sp, #8
 588              		.cfi_def_cfa_offset 16
 589 02a4 00AF     		add	r7, sp, #0
 590              		.cfi_def_cfa_register 7
 591 02a6 0200     		movs	r2, r0
 592 02a8 FB1D     		adds	r3, r7, #7
 593 02aa 1A70     		strb	r2, [r3]
 594 02ac BB1D     		adds	r3, r7, #6
 595 02ae 0A1C     		adds	r2, r1, #0
 596 02b0 1A70     		strb	r2, [r3]
 122:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****     graphic_ctrl_bit_clear(BITMASK_E);
 597              		.loc 1 122 5
 598 02b2 4020     		movs	r0, #64
 599 02b4 FFF7FEFF 		bl	graphic_ctrl_bit_clear
 123:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****     select_controller(controller);
 600              		.loc 1 123 5
 601 02b8 BB1D     		adds	r3, r7, #6
 602 02ba 1B78     		ldrb	r3, [r3]
 603 02bc 1800     		movs	r0, r3
 604 02be FFF7FEFF 		bl	select_controller
 124:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****     graphic_ctrl_bit_clear(BITMASK_RW);
 605              		.loc 1 124 5
 606 02c2 0220     		movs	r0, #2
 607 02c4 FFF7FEFF 		bl	graphic_ctrl_bit_clear
 125:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****     graphic_ctrl_bit_set(BITMASK_RS);
 608              		.loc 1 125 5
 609 02c8 0120     		movs	r0, #1
 610 02ca FFF7FEFF 		bl	graphic_ctrl_bit_set
 126:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****     graphic_write(data, controller);
 611              		.loc 1 126 5
 612 02ce BB1D     		adds	r3, r7, #6
 613 02d0 1A78     		ldrb	r2, [r3]
 614 02d2 FB1D     		adds	r3, r7, #7
 615 02d4 1B78     		ldrb	r3, [r3]
 616 02d6 1100     		movs	r1, r2
 617 02d8 1800     		movs	r0, r3
 618 02da FFF7FEFF 		bl	graphic_write
 127:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c **** }
 619              		.loc 1 127 1
 620 02de C046     		nop
 621 02e0 BD46     		mov	sp, r7
 622 02e2 02B0     		add	sp, sp, #8
 623              		@ sp needed
 624 02e4 80BD     		pop	{r7, pc}
 625              		.cfi_endproc
 626              	.LFE7:
 628              		.align	1
 629              		.global	graphic_read_data
 630              		.syntax unified
 631              		.code	16
 632              		.thumb_func
 633              		.fpu softvfp
 635              	graphic_read_data:
 636              	.LFB8:
 128:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c **** 
 129:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c **** uint8_t graphic_read_data(uint8_t controller) {
 637              		.loc 1 129 47
 638              		.cfi_startproc
 639              		@ args = 0, pretend = 0, frame = 8
 640              		@ frame_needed = 1, uses_anonymous_args = 0
 641 02e6 80B5     		push	{r7, lr}
 642              		.cfi_def_cfa_offset 8
 643              		.cfi_offset 7, -8
 644              		.cfi_offset 14, -4
 645 02e8 82B0     		sub	sp, sp, #8
 646              		.cfi_def_cfa_offset 16
 647 02ea 00AF     		add	r7, sp, #0
 648              		.cfi_def_cfa_register 7
 649 02ec 0200     		movs	r2, r0
 650 02ee FB1D     		adds	r3, r7, #7
 651 02f0 1A70     		strb	r2, [r3]
 130:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****     (void) graphic_read(controller);
 652              		.loc 1 130 12
 653 02f2 FB1D     		adds	r3, r7, #7
 654 02f4 1B78     		ldrb	r3, [r3]
 655 02f6 1800     		movs	r0, r3
 656 02f8 FFF7FEFF 		bl	graphic_read
 131:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****     return graphic_read(controller);
 657              		.loc 1 131 12
 658 02fc FB1D     		adds	r3, r7, #7
 659 02fe 1B78     		ldrb	r3, [r3]
 660 0300 1800     		movs	r0, r3
 661 0302 FFF7FEFF 		bl	graphic_read
 662 0306 0300     		movs	r3, r0
 132:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c **** }
 663              		.loc 1 132 1
 664 0308 1800     		movs	r0, r3
 665 030a BD46     		mov	sp, r7
 666 030c 02B0     		add	sp, sp, #8
 667              		@ sp needed
 668 030e 80BD     		pop	{r7, pc}
 669              		.cfi_endproc
 670              	.LFE8:
 672              		.align	1
 673              		.global	pixel
 674              		.syntax unified
 675              		.code	16
 676              		.thumb_func
 677              		.fpu softvfp
 679              	pixel:
 680              	.LFB9:
 133:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c **** 
 134:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c **** void pixel(uint8_t x, uint8_t y, bool set) {
 681              		.loc 1 134 44
 682              		.cfi_startproc
 683              		@ args = 0, pretend = 0, frame = 16
 684              		@ frame_needed = 1, uses_anonymous_args = 0
 685 0310 F0B5     		push	{r4, r5, r6, r7, lr}
 686              		.cfi_def_cfa_offset 20
 687              		.cfi_offset 4, -20
 688              		.cfi_offset 5, -16
 689              		.cfi_offset 6, -12
 690              		.cfi_offset 7, -8
 691              		.cfi_offset 14, -4
 692 0312 85B0     		sub	sp, sp, #20
 693              		.cfi_def_cfa_offset 40
 694 0314 00AF     		add	r7, sp, #0
 695              		.cfi_def_cfa_register 7
 696 0316 0400     		movs	r4, r0
 697 0318 0800     		movs	r0, r1
 698 031a 1100     		movs	r1, r2
 699 031c FB1D     		adds	r3, r7, #7
 700 031e 221C     		adds	r2, r4, #0
 701 0320 1A70     		strb	r2, [r3]
 702 0322 BB1D     		adds	r3, r7, #6
 703 0324 021C     		adds	r2, r0, #0
 704 0326 1A70     		strb	r2, [r3]
 705 0328 7B1D     		adds	r3, r7, #5
 706 032a 0A1C     		adds	r2, r1, #0
 707 032c 1A70     		strb	r2, [r3]
 135:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****     // Create bitmask for the pixel
 136:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****     uint8_t index, mask, controller;
 137:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****     index = (y-1) / 8;
 708              		.loc 1 137 15
 709 032e BB1D     		adds	r3, r7, #6
 710 0330 1B78     		ldrb	r3, [r3]
 711 0332 013B     		subs	r3, r3, #1
 712              		.loc 1 137 19
 713 0334 002B     		cmp	r3, #0
 714 0336 00DA     		bge	.L34
 715 0338 0733     		adds	r3, r3, #7
 716              	.L34:
 717 033a DB10     		asrs	r3, r3, #3
 718 033c 1A00     		movs	r2, r3
 719              		.loc 1 137 11
 720 033e 0D23     		movs	r3, #13
 721 0340 FB18     		adds	r3, r7, r3
 722 0342 1A70     		strb	r2, [r3]
 138:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****     mask = 0x1 << ((y-1) % 8);
 723              		.loc 1 138 22
 724 0344 BB1D     		adds	r3, r7, #6
 725 0346 1B78     		ldrb	r3, [r3]
 726 0348 013B     		subs	r3, r3, #1
 727              		.loc 1 138 26
 728 034a 3E4A     		ldr	r2, .L40
 729 034c 1340     		ands	r3, r2
 730 034e 04D5     		bpl	.L35
 731 0350 013B     		subs	r3, r3, #1
 732 0352 0822     		movs	r2, #8
 733 0354 5242     		rsbs	r2, r2, #0
 734 0356 1343     		orrs	r3, r2
 735 0358 0133     		adds	r3, r3, #1
 736              	.L35:
 737 035a 1A00     		movs	r2, r3
 738              		.loc 1 138 16
 739 035c 0123     		movs	r3, #1
 740 035e 9340     		lsls	r3, r3, r2
 741 0360 1A00     		movs	r2, r3
 742              		.loc 1 138 10
 743 0362 0F23     		movs	r3, #15
 744 0364 FB18     		adds	r3, r7, r3
 745 0366 1A70     		strb	r2, [r3]
 139:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****     if (x > 64) {
 746              		.loc 1 139 8
 747 0368 FB1D     		adds	r3, r7, #7
 748 036a 1B78     		ldrb	r3, [r3]
 749 036c 402B     		cmp	r3, #64
 750 036e 09D9     		bls	.L36
 140:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****         controller = BITMASK_CS2;
 751              		.loc 1 140 20
 752 0370 0E23     		movs	r3, #14
 753 0372 FB18     		adds	r3, r7, r3
 754 0374 1022     		movs	r2, #16
 755 0376 1A70     		strb	r2, [r3]
 141:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****         x -= 65;
 756              		.loc 1 141 11
 757 0378 FB1D     		adds	r3, r7, #7
 758 037a FA1D     		adds	r2, r7, #7
 759 037c 1278     		ldrb	r2, [r2]
 760 037e 413A     		subs	r2, r2, #65
 761 0380 1A70     		strb	r2, [r3]
 762 0382 08E0     		b	.L37
 763              	.L36:
 142:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****     }else {
 143:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****         controller = BITMASK_CS1;
 764              		.loc 1 143 20
 765 0384 0E23     		movs	r3, #14
 766 0386 FB18     		adds	r3, r7, r3
 767 0388 0822     		movs	r2, #8
 768 038a 1A70     		strb	r2, [r3]
 144:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****         x--;
 769              		.loc 1 144 10
 770 038c FB1D     		adds	r3, r7, #7
 771 038e 1A78     		ldrb	r2, [r3]
 772 0390 FB1D     		adds	r3, r7, #7
 773 0392 013A     		subs	r2, r2, #1
 774 0394 1A70     		strb	r2, [r3]
 775              	.L37:
 145:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****     }
 146:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****     
 147:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****     graphic_write_command(LCD_SET_ADD | x, controller);
 776              		.loc 1 147 5
 777 0396 FB1D     		adds	r3, r7, #7
 778 0398 1B78     		ldrb	r3, [r3]
 779 039a 4022     		movs	r2, #64
 780 039c 1343     		orrs	r3, r2
 781 039e DAB2     		uxtb	r2, r3
 782 03a0 0E25     		movs	r5, #14
 783 03a2 7B19     		adds	r3, r7, r5
 784 03a4 1B78     		ldrb	r3, [r3]
 785 03a6 1900     		movs	r1, r3
 786 03a8 1000     		movs	r0, r2
 787 03aa FFF7FEFF 		bl	graphic_write_command
 148:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****     graphic_write_command(LCD_SET_PAGE | index, controller);
 788              		.loc 1 148 5
 789 03ae 0D23     		movs	r3, #13
 790 03b0 FB18     		adds	r3, r7, r3
 791 03b2 1B78     		ldrb	r3, [r3]
 792 03b4 4822     		movs	r2, #72
 793 03b6 5242     		rsbs	r2, r2, #0
 794 03b8 1343     		orrs	r3, r2
 795 03ba DAB2     		uxtb	r2, r3
 796 03bc 7B19     		adds	r3, r7, r5
 797 03be 1B78     		ldrb	r3, [r3]
 798 03c0 1900     		movs	r1, r3
 799 03c2 1000     		movs	r0, r2
 800 03c4 FFF7FEFF 		bl	graphic_write_command
 149:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****     uint8_t temp = graphic_read_data(controller);
 801              		.loc 1 149 20
 802 03c8 0C26     		movs	r6, #12
 803 03ca BC19     		adds	r4, r7, r6
 804 03cc 7B19     		adds	r3, r7, r5
 805 03ce 1B78     		ldrb	r3, [r3]
 806 03d0 1800     		movs	r0, r3
 807 03d2 FFF7FEFF 		bl	graphic_read_data
 808 03d6 0300     		movs	r3, r0
 809 03d8 2370     		strb	r3, [r4]
 150:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****     graphic_write_command(LCD_SET_ADD | x, controller);
 810              		.loc 1 150 5
 811 03da FB1D     		adds	r3, r7, #7
 812 03dc 1B78     		ldrb	r3, [r3]
 813 03de 4022     		movs	r2, #64
 814 03e0 1343     		orrs	r3, r2
 815 03e2 DAB2     		uxtb	r2, r3
 816 03e4 7B19     		adds	r3, r7, r5
 817 03e6 1B78     		ldrb	r3, [r3]
 818 03e8 1900     		movs	r1, r3
 819 03ea 1000     		movs	r0, r2
 820 03ec FFF7FEFF 		bl	graphic_write_command
 151:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****     if (set) {
 821              		.loc 1 151 8
 822 03f0 7B1D     		adds	r3, r7, #5
 823 03f2 1B78     		ldrb	r3, [r3]
 824 03f4 002B     		cmp	r3, #0
 825 03f6 08D0     		beq	.L38
 152:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****         mask |= temp;
 826              		.loc 1 152 14
 827 03f8 0F22     		movs	r2, #15
 828 03fa BB18     		adds	r3, r7, r2
 829 03fc B918     		adds	r1, r7, r2
 830 03fe BA19     		adds	r2, r7, r6
 831 0400 0978     		ldrb	r1, [r1]
 832 0402 1278     		ldrb	r2, [r2]
 833 0404 0A43     		orrs	r2, r1
 834 0406 1A70     		strb	r2, [r3]
 835 0408 0DE0     		b	.L39
 836              	.L38:
 153:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****     }else {
 154:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****         mask = ~mask & temp;
 837              		.loc 1 154 22
 838 040a 0F21     		movs	r1, #15
 839 040c 7B18     		adds	r3, r7, r1
 840 040e 1B78     		ldrb	r3, [r3]
 841 0410 5BB2     		sxtb	r3, r3
 842 0412 DB43     		mvns	r3, r3
 843 0414 5BB2     		sxtb	r3, r3
 844 0416 0C22     		movs	r2, #12
 845 0418 BA18     		adds	r2, r7, r2
 846 041a 1278     		ldrb	r2, [r2]
 847 041c 52B2     		sxtb	r2, r2
 848 041e 1340     		ands	r3, r2
 849 0420 5AB2     		sxtb	r2, r3
 850              		.loc 1 154 14
 851 0422 7B18     		adds	r3, r7, r1
 852 0424 1A70     		strb	r2, [r3]
 853              	.L39:
 155:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****     }
 156:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****     graphic_write_data(mask, controller);
 854              		.loc 1 156 5
 855 0426 0E23     		movs	r3, #14
 856 0428 FB18     		adds	r3, r7, r3
 857 042a 1A78     		ldrb	r2, [r3]
 858 042c 0F23     		movs	r3, #15
 859 042e FB18     		adds	r3, r7, r3
 860 0430 1B78     		ldrb	r3, [r3]
 861 0432 1100     		movs	r1, r2
 862 0434 1800     		movs	r0, r3
 863 0436 FFF7FEFF 		bl	graphic_write_data
 157:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c **** }
 864              		.loc 1 157 1
 865 043a C046     		nop
 866 043c BD46     		mov	sp, r7
 867 043e 05B0     		add	sp, sp, #20
 868              		@ sp needed
 869 0440 F0BD     		pop	{r4, r5, r6, r7, pc}
 870              	.L41:
 871 0442 C046     		.align	2
 872              	.L40:
 873 0444 07000080 		.word	-2147483641
 874              		.cfi_endproc
 875              	.LFE9:
 877              		.align	1
 878              		.global	graphic_clear_screen
 879              		.syntax unified
 880              		.code	16
 881              		.thumb_func
 882              		.fpu softvfp
 884              	graphic_clear_screen:
 885              	.LFB10:
 158:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c **** 
 159:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c **** void graphic_clear_screen(void) {
 886              		.loc 1 159 33
 887              		.cfi_startproc
 888              		@ args = 0, pretend = 0, frame = 8
 889              		@ frame_needed = 1, uses_anonymous_args = 0
 890 0448 80B5     		push	{r7, lr}
 891              		.cfi_def_cfa_offset 8
 892              		.cfi_offset 7, -8
 893              		.cfi_offset 14, -4
 894 044a 82B0     		sub	sp, sp, #8
 895              		.cfi_def_cfa_offset 16
 896 044c 00AF     		add	r7, sp, #0
 897              		.cfi_def_cfa_register 7
 898              	.LBB2:
 160:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****     for (uint8_t page = 0; page < 8; page++ ) {
 899              		.loc 1 160 18
 900 044e FB1D     		adds	r3, r7, #7
 901 0450 0022     		movs	r2, #0
 902 0452 1A70     		strb	r2, [r3]
 903              		.loc 1 160 5
 904 0454 23E0     		b	.L43
 905              	.L46:
 161:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****         graphic_write_command(LCD_SET_PAGE | page, BITMASK_CS1 | BITMASK_CS2);
 906              		.loc 1 161 9
 907 0456 FB1D     		adds	r3, r7, #7
 908 0458 1B78     		ldrb	r3, [r3]
 909 045a 4822     		movs	r2, #72
 910 045c 5242     		rsbs	r2, r2, #0
 911 045e 1343     		orrs	r3, r2
 912 0460 DBB2     		uxtb	r3, r3
 913 0462 1821     		movs	r1, #24
 914 0464 1800     		movs	r0, r3
 915 0466 FFF7FEFF 		bl	graphic_write_command
 162:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****         graphic_write_command(LCD_SET_ADD  | 0, BITMASK_CS1 | BITMASK_CS2);
 916              		.loc 1 162 9
 917 046a 1821     		movs	r1, #24
 918 046c 4020     		movs	r0, #64
 919 046e FFF7FEFF 		bl	graphic_write_command
 920              	.LBB3:
 163:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****         for (uint8_t add = 0; add < 64; add++) {
 921              		.loc 1 163 22
 922 0472 BB1D     		adds	r3, r7, #6
 923 0474 0022     		movs	r2, #0
 924 0476 1A70     		strb	r2, [r3]
 925              		.loc 1 163 9
 926 0478 08E0     		b	.L44
 927              	.L45:
 164:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****             graphic_write_data(0, BITMASK_CS1 | BITMASK_CS2);
 928              		.loc 1 164 13 discriminator 3
 929 047a 1821     		movs	r1, #24
 930 047c 0020     		movs	r0, #0
 931 047e FFF7FEFF 		bl	graphic_write_data
 163:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****         for (uint8_t add = 0; add < 64; add++) {
 932              		.loc 1 163 44 discriminator 3
 933 0482 BB1D     		adds	r3, r7, #6
 934 0484 1A78     		ldrb	r2, [r3]
 935 0486 BB1D     		adds	r3, r7, #6
 936 0488 0132     		adds	r2, r2, #1
 937 048a 1A70     		strb	r2, [r3]
 938              	.L44:
 163:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****         for (uint8_t add = 0; add < 64; add++) {
 939              		.loc 1 163 9 discriminator 1
 940 048c BB1D     		adds	r3, r7, #6
 941 048e 1B78     		ldrb	r3, [r3]
 942 0490 3F2B     		cmp	r3, #63
 943 0492 F2D9     		bls	.L45
 944              	.LBE3:
 160:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****         graphic_write_command(LCD_SET_PAGE | page, BITMASK_CS1 | BITMASK_CS2);
 945              		.loc 1 160 42 discriminator 2
 946 0494 FB1D     		adds	r3, r7, #7
 947 0496 1A78     		ldrb	r2, [r3]
 948 0498 FB1D     		adds	r3, r7, #7
 949 049a 0132     		adds	r2, r2, #1
 950 049c 1A70     		strb	r2, [r3]
 951              	.L43:
 160:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****         graphic_write_command(LCD_SET_PAGE | page, BITMASK_CS1 | BITMASK_CS2);
 952              		.loc 1 160 5 discriminator 1
 953 049e FB1D     		adds	r3, r7, #7
 954 04a0 1B78     		ldrb	r3, [r3]
 955 04a2 072B     		cmp	r3, #7
 956 04a4 D7D9     		bls	.L46
 957              	.LBE2:
 165:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****         }
 166:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****     }
 167:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c **** }
 958              		.loc 1 167 1
 959 04a6 C046     		nop
 960 04a8 C046     		nop
 961 04aa BD46     		mov	sp, r7
 962 04ac 02B0     		add	sp, sp, #8
 963              		@ sp needed
 964 04ae 80BD     		pop	{r7, pc}
 965              		.cfi_endproc
 966              	.LFE10:
 968              		.align	1
 969              		.global	graphic_init
 970              		.syntax unified
 971              		.code	16
 972              		.thumb_func
 973              		.fpu softvfp
 975              	graphic_init:
 976              	.LFB11:
 168:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c **** 
 169:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c **** 
 170:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c **** void graphic_init(void) {
 977              		.loc 1 170 25
 978              		.cfi_startproc
 979              		@ args = 0, pretend = 0, frame = 0
 980              		@ frame_needed = 1, uses_anonymous_args = 0
 981 04b0 80B5     		push	{r7, lr}
 982              		.cfi_def_cfa_offset 8
 983              		.cfi_offset 7, -8
 984              		.cfi_offset 14, -4
 985 04b2 00AF     		add	r7, sp, #0
 986              		.cfi_def_cfa_register 7
 171:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****     graphic_ctrl_bit_set(BITMASK_E);
 987              		.loc 1 171 5
 988 04b4 4020     		movs	r0, #64
 989 04b6 FFF7FEFF 		bl	graphic_ctrl_bit_set
 172:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****     delay_micros(10);
 990              		.loc 1 172 5
 991 04ba 0A20     		movs	r0, #10
 992 04bc FFF7FEFF 		bl	delay_micros
 173:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****     graphic_ctrl_bit_clear(BITMASK_CS1 | BITMASK_CS2 | BITMASK_RESET | BITMASK_E);
 993              		.loc 1 173 5
 994 04c0 7820     		movs	r0, #120
 995 04c2 FFF7FEFF 		bl	graphic_ctrl_bit_clear
 174:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****     delay_millis(30);
 996              		.loc 1 174 5
 997 04c6 1E20     		movs	r0, #30
 998 04c8 FFF7FEFF 		bl	delay_millis
 175:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****     graphic_ctrl_bit_set(BITMASK_RESET);
 999              		.loc 1 175 5
 1000 04cc 2020     		movs	r0, #32
 1001 04ce FFF7FEFF 		bl	graphic_ctrl_bit_set
 176:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****     
 177:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****     // Toggle display
 178:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****     graphic_write_command(LCD_OFF, BITMASK_CS1 | BITMASK_CS2);
 1002              		.loc 1 178 5
 1003 04d2 1821     		movs	r1, #24
 1004 04d4 3E20     		movs	r0, #62
 1005 04d6 FFF7FEFF 		bl	graphic_write_command
 179:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****     graphic_write_command(LCD_ON, BITMASK_CS1 | BITMASK_CS2);
 1006              		.loc 1 179 5
 1007 04da 1821     		movs	r1, #24
 1008 04dc 3F20     		movs	r0, #63
 1009 04de FFF7FEFF 		bl	graphic_write_command
 180:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****     //Start = 0
 181:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****     graphic_write_command(LCD_DISP_START, BITMASK_CS1 | BITMASK_CS2);
 1010              		.loc 1 181 5
 1011 04e2 1821     		movs	r1, #24
 1012 04e4 C020     		movs	r0, #192
 1013 04e6 FFF7FEFF 		bl	graphic_write_command
 182:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****     // Add = 0
 183:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****     graphic_write_command(LCD_SET_ADD, BITMASK_CS1 | BITMASK_CS2);
 1014              		.loc 1 183 5
 1015 04ea 1821     		movs	r1, #24
 1016 04ec 4020     		movs	r0, #64
 1017 04ee FFF7FEFF 		bl	graphic_write_command
 184:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****     // Page = 0
 185:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****     graphic_write_command(LCD_SET_PAGE, BITMASK_CS1 | BITMASK_CS2);
 1018              		.loc 1 185 5
 1019 04f2 1821     		movs	r1, #24
 1020 04f4 B820     		movs	r0, #184
 1021 04f6 FFF7FEFF 		bl	graphic_write_command
 186:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****     // Deactivate both CS signals
 187:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c ****     select_controller(0);
 1022              		.loc 1 187 5
 1023 04fa 0020     		movs	r0, #0
 1024 04fc FFF7FEFF 		bl	select_controller
 188:/home/love/Documents/skola/EDA482/LV3/codelite/lcddisplay/graphics.c **** }...
 1025              		.loc 1 188 1
 1026 0500 C046     		nop
 1027 0502 BD46     		mov	sp, r7
 1028              		@ sp needed
 1029 0504 80BD     		pop	{r7, pc}
 1030              		.cfi_endproc
 1031              	.LFE11:
 1033              	.Letext0:
 1034              		.file 2 "/usr/arm-none-eabi/include/machine/_default_types.h"
 1035              		.file 3 "/usr/arm-none-eabi/include/sys/_stdint.h"
 1036              		.file 4 "/home/love/Documents/skola/EDA482/libs/include/libGPIO.h"
