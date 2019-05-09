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
  25              		.file 1 "/home/love/Documents/skola/EDA482/LV3/codelite/labb3_3/startup.c"
   1:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_3/startup.c **** /*
   2:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_3/startup.c ****  * 	startup.c
   3:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_3/startup.c ****  *  
   4:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_3/startup.c ****  */
   5:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_3/startup.c **** #include "libGPIO.h"
   6:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_3/startup.c **** #include "libdelay.h"
   7:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_3/startup.c **** #include "graphics.h"
   8:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_3/startup.c **** #include <stdint.h>
   9:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_3/startup.c **** 
  10:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_3/startup.c **** #define MAX_POINTS 20
  11:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_3/startup.c **** 
  12:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_3/startup.c **** 
  13:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_3/startup.c **** 
  14:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_3/startup.c **** typedef struct tpoint {
  15:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_3/startup.c ****     uint8_t x;
  16:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_3/startup.c ****     uint8_t y;
  17:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_3/startup.c **** }POINT;
  18:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_3/startup.c **** 
  19:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_3/startup.c **** typedef struct tShape {
  20:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_3/startup.c ****     uint8_t numPoints;
  21:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_3/startup.c ****     POINT size;
  22:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_3/startup.c ****     POINT points[MAX_POINTS];
  23:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_3/startup.c **** }SHAPE;
  24:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_3/startup.c **** 
  25:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_3/startup.c **** typedef struct tObj {
  26:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_3/startup.c ****     SHAPE* shape;
  27:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_3/startup.c ****     POINT velocity;
  28:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_3/startup.c ****     POINT position;
  29:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_3/startup.c ****     void (* draw) (struct tObj*);
  30:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_3/startup.c ****     void (* clear) (struct tObj*);
  31:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_3/startup.c ****     void (* move) (struct tObj*);
  32:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_3/startup.c ****     void (* set_speed) (struct tObj*, POINT);
  33:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_3/startup.c **** }OBJECT;
  34:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_3/startup.c **** 
  35:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_3/startup.c **** void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );
  36:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_3/startup.c **** 
  37:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_3/startup.c **** void startup ( void )
  38:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_3/startup.c **** {
  26              		.loc 1 38 1
  27              		.cfi_startproc
  28              		@ Naked Function: prologue and epilogue provided by programmer.
  29              		@ args = 0, pretend = 0, frame = 0
  30              		@ frame_needed = 1, uses_anonymous_args = 0
  39:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_3/startup.c **** asm volatile(
  31              		.loc 1 39 1
  32              		.syntax divided
  33              	@ 39 "/home/love/Documents/skola/EDA482/LV3/codelite/labb3_3/startup.c" 1
  34 0000 0248     		 LDR R0,=0x2001C000
  35 0002 8546     	 MOV SP,R0
  36 0004 FFF7FEFF 	 BL main
  37 0008 FEE7     	.L1: B .L1
  38              	
  39              	@ 0 "" 2
  40:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_3/startup.c **** 	" LDR R0,=0x2001C000\n"		/* set stack */
  41:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_3/startup.c **** 	" MOV SP,R0\n"
  42:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_3/startup.c **** 	" BL main\n"				/* call main */
  43:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_3/startup.c **** 	".L1: B .L1\n"				/* never return */
  44:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_3/startup.c **** 	) ;
  45:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_3/startup.c **** }
  40              		.loc 1 45 1
  41              		.thumb
  42              		.syntax unified
  43 000a C046     		nop
  44              		.cfi_endproc
  45              	.LFE0:
  47              		.text
  48              		.align	1
  49              		.global	draw_object
  50              		.syntax unified
  51              		.code	16
  52              		.thumb_func
  53              		.fpu softvfp
  55              	draw_object:
  56              	.LFB1:
  46:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_3/startup.c **** 
  47:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_3/startup.c **** 
  48:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_3/startup.c **** 
  49:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_3/startup.c **** void draw_object(OBJECT* self) {
  57              		.loc 1 49 32
  58              		.cfi_startproc
  59              		@ args = 0, pretend = 0, frame = 24
  60              		@ frame_needed = 1, uses_anonymous_args = 0
  61 0000 F0B5     		push	{r4, r5, r6, r7, lr}
  62              		.cfi_def_cfa_offset 20
  63              		.cfi_offset 4, -20
  64              		.cfi_offset 5, -16
  65              		.cfi_offset 6, -12
  66              		.cfi_offset 7, -8
  67              		.cfi_offset 14, -4
  68 0002 87B0     		sub	sp, sp, #28
  69              		.cfi_def_cfa_offset 48
  70 0004 00AF     		add	r7, sp, #0
  71              		.cfi_def_cfa_register 7
  72 0006 7860     		str	r0, [r7, #4]
  50:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_3/startup.c ****     SHAPE* shape = self->shape;
  73              		.loc 1 50 12
  74 0008 7B68     		ldr	r3, [r7, #4]
  75 000a 1B68     		ldr	r3, [r3]
  76 000c 3B61     		str	r3, [r7, #16]
  77              	.LBB2:
  51:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_3/startup.c ****     for (uint8_t i = 0; i < shape->numPoints; i++) {
  78              		.loc 1 51 18
  79 000e 1723     		movs	r3, #23
  80 0010 FB18     		adds	r3, r7, r3
  81 0012 0022     		movs	r2, #0
  82 0014 1A70     		strb	r2, [r3]
  83              		.loc 1 51 5
  84 0016 33E0     		b	.L3
  85              	.L4:
  86              	.LBB3:
  52:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_3/startup.c ****         uint8_t x = shape->points[i].x;
  87              		.loc 1 52 37 discriminator 3
  88 0018 1724     		movs	r4, #23
  89 001a 3B19     		adds	r3, r7, r4
  90 001c 1A78     		ldrb	r2, [r3]
  91              		.loc 1 52 17 discriminator 3
  92 001e 0F20     		movs	r0, #15
  93 0020 3B18     		adds	r3, r7, r0
  94 0022 3969     		ldr	r1, [r7, #16]
  95 0024 5200     		lsls	r2, r2, #1
  96 0026 8A18     		adds	r2, r1, r2
  97 0028 0332     		adds	r2, r2, #3
  98 002a 1278     		ldrb	r2, [r2]
  99 002c 1A70     		strb	r2, [r3]
  53:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_3/startup.c ****         uint8_t y = shape->points[i].y;
 100              		.loc 1 53 37 discriminator 3
 101 002e 3B19     		adds	r3, r7, r4
 102 0030 1A78     		ldrb	r2, [r3]
 103              		.loc 1 53 17 discriminator 3
 104 0032 0E25     		movs	r5, #14
 105 0034 7B19     		adds	r3, r7, r5
 106 0036 3969     		ldr	r1, [r7, #16]
 107 0038 5200     		lsls	r2, r2, #1
 108 003a 8A18     		adds	r2, r1, r2
 109 003c 0432     		adds	r2, r2, #4
 110 003e 1278     		ldrb	r2, [r2]
 111 0040 1A70     		strb	r2, [r3]
  54:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_3/startup.c ****         uint8_t px = self->position.x;
 112              		.loc 1 54 17 discriminator 3
 113 0042 0D21     		movs	r1, #13
 114 0044 7B18     		adds	r3, r7, r1
 115 0046 7A68     		ldr	r2, [r7, #4]
 116 0048 9279     		ldrb	r2, [r2, #6]
 117 004a 1A70     		strb	r2, [r3]
  55:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_3/startup.c ****         uint8_t py = self->position.y;
 118              		.loc 1 55 17 discriminator 3
 119 004c 0C26     		movs	r6, #12
 120 004e BB19     		adds	r3, r7, r6
 121 0050 7A68     		ldr	r2, [r7, #4]
 122 0052 D279     		ldrb	r2, [r2, #7]
 123 0054 1A70     		strb	r2, [r3]
  56:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_3/startup.c ****         pixel(x + px, y + py, true);
 124              		.loc 1 56 9 discriminator 3
 125 0056 3A18     		adds	r2, r7, r0
 126 0058 7B18     		adds	r3, r7, r1
 127 005a 1278     		ldrb	r2, [r2]
 128 005c 1B78     		ldrb	r3, [r3]
 129 005e D318     		adds	r3, r2, r3
 130 0060 D8B2     		uxtb	r0, r3
 131 0062 7A19     		adds	r2, r7, r5
 132 0064 BB19     		adds	r3, r7, r6
 133 0066 1278     		ldrb	r2, [r2]
 134 0068 1B78     		ldrb	r3, [r3]
 135 006a D318     		adds	r3, r2, r3
 136 006c DBB2     		uxtb	r3, r3
 137 006e 0122     		movs	r2, #1
 138 0070 1900     		movs	r1, r3
 139 0072 FFF7FEFF 		bl	pixel
 140              	.LBE3:
  51:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_3/startup.c ****         uint8_t x = shape->points[i].x;
 141              		.loc 1 51 48 discriminator 3
 142 0076 3B19     		adds	r3, r7, r4
 143 0078 1A78     		ldrb	r2, [r3]
 144 007a 3B19     		adds	r3, r7, r4
 145 007c 0132     		adds	r2, r2, #1
 146 007e 1A70     		strb	r2, [r3]
 147              	.L3:
  51:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_3/startup.c ****         uint8_t x = shape->points[i].x;
 148              		.loc 1 51 34 discriminator 1
 149 0080 3B69     		ldr	r3, [r7, #16]
 150 0082 1B78     		ldrb	r3, [r3]
  51:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_3/startup.c ****         uint8_t x = shape->points[i].x;
 151              		.loc 1 51 5 discriminator 1
 152 0084 1722     		movs	r2, #23
 153 0086 BA18     		adds	r2, r7, r2
 154 0088 1278     		ldrb	r2, [r2]
 155 008a 9A42     		cmp	r2, r3
 156 008c C4D3     		bcc	.L4
 157              	.LBE2:
  57:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_3/startup.c ****     }
  58:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_3/startup.c **** }
 158              		.loc 1 58 1
 159 008e C046     		nop
 160 0090 BD46     		mov	sp, r7
 161 0092 07B0     		add	sp, sp, #28
 162              		@ sp needed
 163 0094 F0BD     		pop	{r4, r5, r6, r7, pc}
 164              		.cfi_endproc
 165              	.LFE1:
 167              		.align	1
 168              		.global	clear_object
 169              		.syntax unified
 170              		.code	16
 171              		.thumb_func
 172              		.fpu softvfp
 174              	clear_object:
 175              	.LFB2:
  59:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_3/startup.c **** 
  60:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_3/startup.c **** void clear_object(OBJECT* self) {
 176              		.loc 1 60 33
 177              		.cfi_startproc
 178              		@ args = 0, pretend = 0, frame = 24
 179              		@ frame_needed = 1, uses_anonymous_args = 0
 180 0096 F0B5     		push	{r4, r5, r6, r7, lr}
 181              		.cfi_def_cfa_offset 20
 182              		.cfi_offset 4, -20
 183              		.cfi_offset 5, -16
 184              		.cfi_offset 6, -12
 185              		.cfi_offset 7, -8
 186              		.cfi_offset 14, -4
 187 0098 87B0     		sub	sp, sp, #28
 188              		.cfi_def_cfa_offset 48
 189 009a 00AF     		add	r7, sp, #0
 190              		.cfi_def_cfa_register 7
 191 009c 7860     		str	r0, [r7, #4]
  61:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_3/startup.c ****     SHAPE* shape = self->shape;
 192              		.loc 1 61 12
 193 009e 7B68     		ldr	r3, [r7, #4]
 194 00a0 1B68     		ldr	r3, [r3]
 195 00a2 3B61     		str	r3, [r7, #16]
 196              	.LBB4:
  62:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_3/startup.c ****     for (uint8_t i = 0; i < shape->numPoints; i++) {
 197              		.loc 1 62 18
 198 00a4 1723     		movs	r3, #23
 199 00a6 FB18     		adds	r3, r7, r3
 200 00a8 0022     		movs	r2, #0
 201 00aa 1A70     		strb	r2, [r3]
 202              		.loc 1 62 5
 203 00ac 33E0     		b	.L6
 204              	.L7:
 205              	.LBB5:
  63:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_3/startup.c ****         uint8_t x = shape->points[i].x;
 206              		.loc 1 63 37 discriminator 3
 207 00ae 1724     		movs	r4, #23
 208 00b0 3B19     		adds	r3, r7, r4
 209 00b2 1A78     		ldrb	r2, [r3]
 210              		.loc 1 63 17 discriminator 3
 211 00b4 0F20     		movs	r0, #15
 212 00b6 3B18     		adds	r3, r7, r0
 213 00b8 3969     		ldr	r1, [r7, #16]
 214 00ba 5200     		lsls	r2, r2, #1
 215 00bc 8A18     		adds	r2, r1, r2
 216 00be 0332     		adds	r2, r2, #3
 217 00c0 1278     		ldrb	r2, [r2]
 218 00c2 1A70     		strb	r2, [r3]
  64:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_3/startup.c ****         uint8_t y = shape->points[i].y;
 219              		.loc 1 64 37 discriminator 3
 220 00c4 3B19     		adds	r3, r7, r4
 221 00c6 1A78     		ldrb	r2, [r3]
 222              		.loc 1 64 17 discriminator 3
 223 00c8 0E25     		movs	r5, #14
 224 00ca 7B19     		adds	r3, r7, r5
 225 00cc 3969     		ldr	r1, [r7, #16]
 226 00ce 5200     		lsls	r2, r2, #1
 227 00d0 8A18     		adds	r2, r1, r2
 228 00d2 0432     		adds	r2, r2, #4
 229 00d4 1278     		ldrb	r2, [r2]
 230 00d6 1A70     		strb	r2, [r3]
  65:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_3/startup.c ****         uint8_t px = self->position.x;
 231              		.loc 1 65 17 discriminator 3
 232 00d8 0D21     		movs	r1, #13
 233 00da 7B18     		adds	r3, r7, r1
 234 00dc 7A68     		ldr	r2, [r7, #4]
 235 00de 9279     		ldrb	r2, [r2, #6]
 236 00e0 1A70     		strb	r2, [r3]
  66:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_3/startup.c ****         uint8_t py = self->position.y;
 237              		.loc 1 66 17 discriminator 3
 238 00e2 0C26     		movs	r6, #12
 239 00e4 BB19     		adds	r3, r7, r6
 240 00e6 7A68     		ldr	r2, [r7, #4]
 241 00e8 D279     		ldrb	r2, [r2, #7]
 242 00ea 1A70     		strb	r2, [r3]
  67:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_3/startup.c ****         pixel(x + px, y + py, false);
 243              		.loc 1 67 9 discriminator 3
 244 00ec 3A18     		adds	r2, r7, r0
 245 00ee 7B18     		adds	r3, r7, r1
 246 00f0 1278     		ldrb	r2, [r2]
 247 00f2 1B78     		ldrb	r3, [r3]
 248 00f4 D318     		adds	r3, r2, r3
 249 00f6 D8B2     		uxtb	r0, r3
 250 00f8 7A19     		adds	r2, r7, r5
 251 00fa BB19     		adds	r3, r7, r6
 252 00fc 1278     		ldrb	r2, [r2]
 253 00fe 1B78     		ldrb	r3, [r3]
 254 0100 D318     		adds	r3, r2, r3
 255 0102 DBB2     		uxtb	r3, r3
 256 0104 0022     		movs	r2, #0
 257 0106 1900     		movs	r1, r3
 258 0108 FFF7FEFF 		bl	pixel
 259              	.LBE5:
  62:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_3/startup.c ****         uint8_t x = shape->points[i].x;
 260              		.loc 1 62 48 discriminator 3
 261 010c 3B19     		adds	r3, r7, r4
 262 010e 1A78     		ldrb	r2, [r3]
 263 0110 3B19     		adds	r3, r7, r4
 264 0112 0132     		adds	r2, r2, #1
 265 0114 1A70     		strb	r2, [r3]
 266              	.L6:
  62:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_3/startup.c ****         uint8_t x = shape->points[i].x;
 267              		.loc 1 62 34 discriminator 1
 268 0116 3B69     		ldr	r3, [r7, #16]
 269 0118 1B78     		ldrb	r3, [r3]
  62:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_3/startup.c ****         uint8_t x = shape->points[i].x;
 270              		.loc 1 62 5 discriminator 1
 271 011a 1722     		movs	r2, #23
 272 011c BA18     		adds	r2, r7, r2
 273 011e 1278     		ldrb	r2, [r2]
 274 0120 9A42     		cmp	r2, r3
 275 0122 C4D3     		bcc	.L7
 276              	.LBE4:
  68:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_3/startup.c ****     }
  69:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_3/startup.c **** }
 277              		.loc 1 69 1
 278 0124 C046     		nop
 279 0126 BD46     		mov	sp, r7
 280 0128 07B0     		add	sp, sp, #28
 281              		@ sp needed
 282 012a F0BD     		pop	{r4, r5, r6, r7, pc}
 283              		.cfi_endproc
 284              	.LFE2:
 286              		.align	1
 287              		.global	set_speed
 288              		.syntax unified
 289              		.code	16
 290              		.thumb_func
 291              		.fpu softvfp
 293              	set_speed:
 294              	.LFB3:
  70:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_3/startup.c **** 
  71:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_3/startup.c **** void set_speed(OBJECT* self, POINT velocity) {
 295              		.loc 1 71 46
 296              		.cfi_startproc
 297              		@ args = 0, pretend = 0, frame = 8
 298              		@ frame_needed = 1, uses_anonymous_args = 0
 299 012c 80B5     		push	{r7, lr}
 300              		.cfi_def_cfa_offset 8
 301              		.cfi_offset 7, -8
 302              		.cfi_offset 14, -4
 303 012e 82B0     		sub	sp, sp, #8
 304              		.cfi_def_cfa_offset 16
 305 0130 00AF     		add	r7, sp, #0
 306              		.cfi_def_cfa_register 7
 307 0132 7860     		str	r0, [r7, #4]
 308 0134 3B00     		movs	r3, r7
 309 0136 1980     		strh	r1, [r3]
  72:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_3/startup.c ****     self->velocity = velocity;
 310              		.loc 1 72 20
 311 0138 7B68     		ldr	r3, [r7, #4]
 312 013a 3A00     		movs	r2, r7
 313 013c 1288     		ldrh	r2, [r2]
 314 013e 9A80     		strh	r2, [r3, #4]
  73:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_3/startup.c **** }
 315              		.loc 1 73 1
 316 0140 C046     		nop
 317 0142 BD46     		mov	sp, r7
 318 0144 02B0     		add	sp, sp, #8
 319              		@ sp needed
 320 0146 80BD     		pop	{r7, pc}
 321              		.cfi_endproc
 322              	.LFE3:
 324              		.align	1
 325              		.global	move_object
 326              		.syntax unified
 327              		.code	16
 328              		.thumb_func
 329              		.fpu softvfp
 331              	move_object:
 332              	.LFB4:
  74:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_3/startup.c **** 
  75:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_3/startup.c **** void move_object(OBJECT* self) {
 333              		.loc 1 75 32
 334              		.cfi_startproc
 335              		@ args = 0, pretend = 0, frame = 16
 336              		@ frame_needed = 1, uses_anonymous_args = 0
 337 0148 80B5     		push	{r7, lr}
 338              		.cfi_def_cfa_offset 8
 339              		.cfi_offset 7, -8
 340              		.cfi_offset 14, -4
 341 014a 84B0     		sub	sp, sp, #16
 342              		.cfi_def_cfa_offset 24
 343 014c 00AF     		add	r7, sp, #0
 344              		.cfi_def_cfa_register 7
 345 014e 7860     		str	r0, [r7, #4]
  76:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_3/startup.c ****     uint8_t newX = self->position.x + self->velocity.x;
 346              		.loc 1 76 34
 347 0150 7B68     		ldr	r3, [r7, #4]
 348 0152 9979     		ldrb	r1, [r3, #6]
 349              		.loc 1 76 53
 350 0154 7B68     		ldr	r3, [r7, #4]
 351 0156 1A79     		ldrb	r2, [r3, #4]
 352              		.loc 1 76 13
 353 0158 0E20     		movs	r0, #14
 354 015a 3B18     		adds	r3, r7, r0
 355 015c 8A18     		adds	r2, r1, r2
 356 015e 1A70     		strb	r2, [r3]
  77:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_3/startup.c ****     uint8_t newY = self->position.y + self->velocity.y;
 357              		.loc 1 77 34
 358 0160 7B68     		ldr	r3, [r7, #4]
 359 0162 D979     		ldrb	r1, [r3, #7]
 360              		.loc 1 77 53
 361 0164 7B68     		ldr	r3, [r7, #4]
 362 0166 5A79     		ldrb	r2, [r3, #5]
 363              		.loc 1 77 13
 364 0168 0D23     		movs	r3, #13
 365 016a FB18     		adds	r3, r7, r3
 366 016c 8A18     		adds	r2, r1, r2
 367 016e 1A70     		strb	r2, [r3]
  78:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_3/startup.c ****     bool shouldIMove = true;
 368              		.loc 1 78 10
 369 0170 0F23     		movs	r3, #15
 370 0172 FB18     		adds	r3, r7, r3
 371 0174 0122     		movs	r2, #1
 372 0176 1A70     		strb	r2, [r3]
  79:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_3/startup.c ****     
  80:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_3/startup.c ****     if (newX < 1 || newX > 128) {
 373              		.loc 1 80 8
 374 0178 3B18     		adds	r3, r7, r0
 375 017a 1B78     		ldrb	r3, [r3]
 376 017c 002B     		cmp	r3, #0
 377 017e 03D0     		beq	.L10
 378              		.loc 1 80 18 discriminator 1
 379 0180 3B18     		adds	r3, r7, r0
 380 0182 1B78     		ldrb	r3, [r3]
 381 0184 802B     		cmp	r3, #128
 382 0186 09D9     		bls	.L11
 383              	.L10:
  81:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_3/startup.c ****         self->velocity.x = -self->velocity.x;
 384              		.loc 1 81 43
 385 0188 7B68     		ldr	r3, [r7, #4]
 386 018a 1B79     		ldrb	r3, [r3, #4]
 387              		.loc 1 81 26
 388 018c 5B42     		rsbs	r3, r3, #0
 389 018e DAB2     		uxtb	r2, r3
 390 0190 7B68     		ldr	r3, [r7, #4]
 391 0192 1A71     		strb	r2, [r3, #4]
  82:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_3/startup.c ****         shouldIMove = false;
 392              		.loc 1 82 21
 393 0194 0F23     		movs	r3, #15
 394 0196 FB18     		adds	r3, r7, r3
 395 0198 0022     		movs	r2, #0
 396 019a 1A70     		strb	r2, [r3]
 397              	.L11:
  83:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_3/startup.c ****     }
  84:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_3/startup.c ****     if (newY < 1 || newY > 64) {
 398              		.loc 1 84 8
 399 019c 0D22     		movs	r2, #13
 400 019e BB18     		adds	r3, r7, r2
 401 01a0 1B78     		ldrb	r3, [r3]
 402 01a2 002B     		cmp	r3, #0
 403 01a4 03D0     		beq	.L12
 404              		.loc 1 84 18 discriminator 1
 405 01a6 BB18     		adds	r3, r7, r2
 406 01a8 1B78     		ldrb	r3, [r3]
 407 01aa 402B     		cmp	r3, #64
 408 01ac 09D9     		bls	.L13
 409              	.L12:
  85:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_3/startup.c ****         self->velocity.y = -self->velocity.y;
 410              		.loc 1 85 43
 411 01ae 7B68     		ldr	r3, [r7, #4]
 412 01b0 5B79     		ldrb	r3, [r3, #5]
 413              		.loc 1 85 26
 414 01b2 5B42     		rsbs	r3, r3, #0
 415 01b4 DAB2     		uxtb	r2, r3
 416 01b6 7B68     		ldr	r3, [r7, #4]
 417 01b8 5A71     		strb	r2, [r3, #5]
  86:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_3/startup.c ****         shouldIMove = false;
 418              		.loc 1 86 21
 419 01ba 0F23     		movs	r3, #15
 420 01bc FB18     		adds	r3, r7, r3
 421 01be 0022     		movs	r2, #0
 422 01c0 1A70     		strb	r2, [r3]
 423              	.L13:
  87:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_3/startup.c ****     }
  88:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_3/startup.c ****     if (self->velocity.x == 0 && self->velocity.y == 0) {
 424              		.loc 1 88 23
 425 01c2 7B68     		ldr	r3, [r7, #4]
 426 01c4 1B79     		ldrb	r3, [r3, #4]
 427              		.loc 1 88 8
 428 01c6 002B     		cmp	r3, #0
 429 01c8 07D1     		bne	.L14
 430              		.loc 1 88 48 discriminator 1
 431 01ca 7B68     		ldr	r3, [r7, #4]
 432 01cc 5B79     		ldrb	r3, [r3, #5]
 433              		.loc 1 88 31 discriminator 1
 434 01ce 002B     		cmp	r3, #0
 435 01d0 03D1     		bne	.L14
  89:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_3/startup.c ****         shouldIMove = false;
 436              		.loc 1 89 21
 437 01d2 0F23     		movs	r3, #15
 438 01d4 FB18     		adds	r3, r7, r3
 439 01d6 0022     		movs	r2, #0
 440 01d8 1A70     		strb	r2, [r3]
 441              	.L14:
  90:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_3/startup.c ****     }
  91:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_3/startup.c ****     if (shouldIMove) {
 442              		.loc 1 91 8
 443 01da 0F23     		movs	r3, #15
 444 01dc FB18     		adds	r3, r7, r3
 445 01de 1B78     		ldrb	r3, [r3]
 446 01e0 002B     		cmp	r3, #0
 447 01e2 13D0     		beq	.L16
  92:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_3/startup.c ****         self->clear(self);
 448              		.loc 1 92 13
 449 01e4 7B68     		ldr	r3, [r7, #4]
 450 01e6 DB68     		ldr	r3, [r3, #12]
 451              		.loc 1 92 9
 452 01e8 7A68     		ldr	r2, [r7, #4]
 453 01ea 1000     		movs	r0, r2
 454 01ec 9847     		blx	r3
 455              	.LVL0:
  93:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_3/startup.c ****         self->position.x = newX;
 456              		.loc 1 93 26
 457 01ee 7B68     		ldr	r3, [r7, #4]
 458 01f0 0E22     		movs	r2, #14
 459 01f2 BA18     		adds	r2, r7, r2
 460 01f4 1278     		ldrb	r2, [r2]
 461 01f6 9A71     		strb	r2, [r3, #6]
  94:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_3/startup.c ****         self->position.y = newY;
 462              		.loc 1 94 26
 463 01f8 7B68     		ldr	r3, [r7, #4]
 464 01fa 0D22     		movs	r2, #13
 465 01fc BA18     		adds	r2, r7, r2
 466 01fe 1278     		ldrb	r2, [r2]
 467 0200 DA71     		strb	r2, [r3, #7]
  95:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_3/startup.c ****         self->draw(self);
 468              		.loc 1 95 13
 469 0202 7B68     		ldr	r3, [r7, #4]
 470 0204 9B68     		ldr	r3, [r3, #8]
 471              		.loc 1 95 9
 472 0206 7A68     		ldr	r2, [r7, #4]
 473 0208 1000     		movs	r0, r2
 474 020a 9847     		blx	r3
 475              	.LVL1:
 476              	.L16:
  96:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_3/startup.c ****     }
  97:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_3/startup.c ****     
  98:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_3/startup.c **** }
 477              		.loc 1 98 1
 478 020c C046     		nop
 479 020e BD46     		mov	sp, r7
 480 0210 04B0     		add	sp, sp, #16
 481              		@ sp needed
 482 0212 80BD     		pop	{r7, pc}
 483              		.cfi_endproc
 484              	.LFE4:
 486              		.align	1
 487              		.global	app_init
 488              		.syntax unified
 489              		.code	16
 490              		.thumb_func
 491              		.fpu softvfp
 493              	app_init:
 494              	.LFB5:
  99:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_3/startup.c **** 
 100:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_3/startup.c **** 
 101:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_3/startup.c **** 
 102:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_3/startup.c **** void app_init(void) {
 495              		.loc 1 102 21
 496              		.cfi_startproc
 497              		@ args = 0, pretend = 0, frame = 0
 498              		@ frame_needed = 1, uses_anonymous_args = 0
 499 0214 80B5     		push	{r7, lr}
 500              		.cfi_def_cfa_offset 8
 501              		.cfi_offset 7, -8
 502              		.cfi_offset 14, -4
 503 0216 00AF     		add	r7, sp, #0
 504              		.cfi_def_cfa_register 7
 103:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_3/startup.c ****     GPIO_E->moder = 0x55555555;
 505              		.loc 1 103 11
 506 0218 054B     		ldr	r3, .L18
 507              		.loc 1 103 19
 508 021a 064A     		ldr	r2, .L18+4
 509 021c 1A60     		str	r2, [r3]
 104:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_3/startup.c ****     GPIO_init_keypad(GPIO_D, false);
 510              		.loc 1 104 5
 511 021e 064B     		ldr	r3, .L18+8
 512 0220 0021     		movs	r1, #0
 513 0222 1800     		movs	r0, r3
 514 0224 FFF7FEFF 		bl	GPIO_init_keypad
 105:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_3/startup.c **** }
 515              		.loc 1 105 1
 516 0228 C046     		nop
 517 022a BD46     		mov	sp, r7
 518              		@ sp needed
 519 022c 80BD     		pop	{r7, pc}
 520              	.L19:
 521 022e C046     		.align	2
 522              	.L18:
 523 0230 00100240 		.word	1073876992
 524 0234 55555555 		.word	1431655765
 525 0238 000C0240 		.word	1073875968
 526              		.cfi_endproc
 527              	.LFE5:
 529              		.align	1
 530              		.global	main
 531              		.syntax unified
 532              		.code	16
 533              		.thumb_func
 534              		.fpu softvfp
 536              	main:
 537              	.LFB6:
 106:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_3/startup.c **** 
 107:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_3/startup.c **** int main(void)
 108:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_3/startup.c **** {
 538              		.loc 1 108 1
 539              		.cfi_startproc
 540              		@ args = 0, pretend = 0, frame = 24
 541              		@ frame_needed = 1, uses_anonymous_args = 0
 542 023c B0B5     		push	{r4, r5, r7, lr}
 543              		.cfi_def_cfa_offset 16
 544              		.cfi_offset 4, -16
 545              		.cfi_offset 5, -12
 546              		.cfi_offset 7, -8
 547              		.cfi_offset 14, -4
 548 023e 86B0     		sub	sp, sp, #24
 549              		.cfi_def_cfa_offset 40
 550 0240 00AF     		add	r7, sp, #0
 551              		.cfi_def_cfa_register 7
 109:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_3/startup.c ****     app_init();
 552              		.loc 1 109 5
 553 0242 FFF7FEFF 		bl	app_init
 110:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_3/startup.c ****     graphic_init();
 554              		.loc 1 110 5
 555 0246 FFF7FEFF 		bl	graphic_init
 556              	.L28:
 111:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_3/startup.c ****     #ifndef SIMULATOR
 112:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_3/startup.c ****         graphic_clear_screen();
 113:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_3/startup.c ****     #endif
 114:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_3/startup.c ****     
 115:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_3/startup.c ****     static SHAPE ball_geometry = {
 116:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_3/startup.c ****         12,
 117:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_3/startup.c ****         {10,10},
 118:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_3/startup.c ****         {
 119:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_3/startup.c ****                    {0,1}, {0,2}, 
 120:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_3/startup.c ****             {1,0}, {1,1}, {1,2}, {1,3}, 
 121:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_3/startup.c ****             {2,0}, {2,1}, {2,2}, {2,3},
 122:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_3/startup.c ****                    {3,1}, {3,2}
 123:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_3/startup.c ****         }
 124:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_3/startup.c ****     };
 125:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_3/startup.c ****     
 126:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_3/startup.c ****     static OBJECT ball = {
 127:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_3/startup.c ****         &ball_geometry,
 128:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_3/startup.c ****         {4,4},
 129:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_3/startup.c ****         {1,1},
 130:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_3/startup.c ****         draw_object,
 131:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_3/startup.c ****         clear_object,
 132:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_3/startup.c ****         move_object,
 133:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_3/startup.c ****         set_speed
 134:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_3/startup.c ****     };
 135:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_3/startup.c ****     uint8_t c;
 136:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_3/startup.c ****     while (true) {
 137:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_3/startup.c ****         ball.move(&ball);
 557              		.loc 1 137 13
 558 024a 2E4B     		ldr	r3, .L29
 559 024c 1B69     		ldr	r3, [r3, #16]
 560              		.loc 1 137 9
 561 024e 2D4A     		ldr	r2, .L29
 562 0250 1000     		movs	r0, r2
 563 0252 9847     		blx	r3
 564              	.LVL2:
 138:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_3/startup.c ****         c = GPIO_read_keypad(GPIO_D, false);
 565              		.loc 1 138 13
 566 0254 1725     		movs	r5, #23
 567 0256 7C19     		adds	r4, r7, r5
 568 0258 2B4B     		ldr	r3, .L29+4
 569 025a 0021     		movs	r1, #0
 570 025c 1800     		movs	r0, r3
 571 025e FFF7FEFF 		bl	GPIO_read_keypad
 572 0262 0300     		movs	r3, r0
 573 0264 2370     		strb	r3, [r4]
 139:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_3/startup.c ****         switch (c) {
 574              		.loc 1 139 9
 575 0266 7B19     		adds	r3, r7, r5
 576 0268 1B78     		ldrb	r3, [r3]
 577 026a 082B     		cmp	r3, #8
 578 026c EDD8     		bhi	.L28
 579 026e 9A00     		lsls	r2, r3, #2
 580 0270 264B     		ldr	r3, .L29+8
 581 0272 D318     		adds	r3, r2, r3
 582 0274 1B68     		ldr	r3, [r3]
 583 0276 9F46     		mov	pc, r3
 584              		.section	.rodata
 585              		.align	2
 586              	.L23:
 587 0000 4A020000 		.word	.L28
 588 0004 4A020000 		.word	.L28
 589 0008 C8020000 		.word	.L27
 590 000c 4A020000 		.word	.L28
 591 0010 AC020000 		.word	.L26
 592 0014 78020000 		.word	.L25
 593 0018 90020000 		.word	.L24
 594 001c 4A020000 		.word	.L28
 595 0020 E4020000 		.word	.L22
 596              		.text
 597              	.L25:
 140:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_3/startup.c ****             case 5:
 141:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_3/startup.c ****                 ball.set_speed(&ball, (POINT){0,0});
 598              		.loc 1 141 21
 599 0278 224B     		ldr	r3, .L29
 600 027a 5A69     		ldr	r2, [r3, #20]
 601              		.loc 1 141 46
 602 027c 3B1D     		adds	r3, r7, #4
 603 027e 0021     		movs	r1, #0
 604 0280 1970     		strb	r1, [r3]
 605 0282 3B1D     		adds	r3, r7, #4
 606 0284 0021     		movs	r1, #0
 607 0286 5970     		strb	r1, [r3, #1]
 608              		.loc 1 141 17
 609 0288 3B1D     		adds	r3, r7, #4
 610 028a 1E48     		ldr	r0, .L29
 611 028c 1968     		ldr	r1, [r3]
 612 028e 9047     		blx	r2
 613              	.LVL3:
 614              	.L24:
 142:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_3/startup.c ****             case 6:
 143:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_3/startup.c ****                 ball.set_speed(&ball, (POINT){2,0});
 615              		.loc 1 143 21
 616 0290 1C4B     		ldr	r3, .L29
 617 0292 5A69     		ldr	r2, [r3, #20]
 618              		.loc 1 143 46
 619 0294 0820     		movs	r0, #8
 620 0296 3B18     		adds	r3, r7, r0
 621 0298 0221     		movs	r1, #2
 622 029a 1970     		strb	r1, [r3]
 623 029c 3B18     		adds	r3, r7, r0
 624 029e 0021     		movs	r1, #0
 625 02a0 5970     		strb	r1, [r3, #1]
 626              		.loc 1 143 17
 627 02a2 3B18     		adds	r3, r7, r0
 628 02a4 1748     		ldr	r0, .L29
 629 02a6 1968     		ldr	r1, [r3]
 630 02a8 9047     		blx	r2
 631              	.LVL4:
 144:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_3/startup.c ****                 break;
 632              		.loc 1 144 17
 633 02aa 29E0     		b	.L21
 634              	.L26:
 145:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_3/startup.c ****             case 4:
 146:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_3/startup.c ****                 ball.set_speed(&ball, (POINT){-2,0});
 635              		.loc 1 146 21
 636 02ac 154B     		ldr	r3, .L29
 637 02ae 5A69     		ldr	r2, [r3, #20]
 638              		.loc 1 146 46
 639 02b0 0C20     		movs	r0, #12
 640 02b2 3B18     		adds	r3, r7, r0
 641 02b4 FE21     		movs	r1, #254
 642 02b6 1970     		strb	r1, [r3]
 643 02b8 3B18     		adds	r3, r7, r0
 644 02ba 0021     		movs	r1, #0
 645 02bc 5970     		strb	r1, [r3, #1]
 646              		.loc 1 146 17
 647 02be 3B18     		adds	r3, r7, r0
 648 02c0 1048     		ldr	r0, .L29
 649 02c2 1968     		ldr	r1, [r3]
 650 02c4 9047     		blx	r2
 651              	.LVL5:
 147:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_3/startup.c ****                 break;
 652              		.loc 1 147 17
 653 02c6 1BE0     		b	.L21
 654              	.L27:
 148:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_3/startup.c ****             case 2:
 149:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_3/startup.c ****                 ball.set_speed(&ball, (POINT){0,-2});
 655              		.loc 1 149 21
 656 02c8 0E4B     		ldr	r3, .L29
 657 02ca 5A69     		ldr	r2, [r3, #20]
 658              		.loc 1 149 46
 659 02cc 1020     		movs	r0, #16
 660 02ce 3B18     		adds	r3, r7, r0
 661 02d0 0021     		movs	r1, #0
 662 02d2 1970     		strb	r1, [r3]
 663 02d4 3B18     		adds	r3, r7, r0
 664 02d6 FE21     		movs	r1, #254
 665 02d8 5970     		strb	r1, [r3, #1]
 666              		.loc 1 149 17
 667 02da 3B18     		adds	r3, r7, r0
 668 02dc 0948     		ldr	r0, .L29
 669 02de 1968     		ldr	r1, [r3]
 670 02e0 9047     		blx	r2
 671              	.LVL6:
 150:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_3/startup.c ****                 break;
 672              		.loc 1 150 17
 673 02e2 0DE0     		b	.L21
 674              	.L22:
 151:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_3/startup.c ****             case 8:
 152:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_3/startup.c ****                 ball.set_speed(&ball, (POINT){0,2});
 675              		.loc 1 152 21
 676 02e4 074B     		ldr	r3, .L29
 677 02e6 5A69     		ldr	r2, [r3, #20]
 678              		.loc 1 152 46
 679 02e8 1420     		movs	r0, #20
 680 02ea 3B18     		adds	r3, r7, r0
 681 02ec 0021     		movs	r1, #0
 682 02ee 1970     		strb	r1, [r3]
 683 02f0 3B18     		adds	r3, r7, r0
 684 02f2 0221     		movs	r1, #2
 685 02f4 5970     		strb	r1, [r3, #1]
 686              		.loc 1 152 17
 687 02f6 3B18     		adds	r3, r7, r0
 688 02f8 0248     		ldr	r0, .L29
 689 02fa 1968     		ldr	r1, [r3]
 690 02fc 9047     		blx	r2
 691              	.LVL7:
 153:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_3/startup.c ****                 break;
 692              		.loc 1 153 17
 693 02fe C046     		nop
 694              	.L21:
 137:/home/love/Documents/skola/EDA482/LV3/codelite/labb3_3/startup.c ****         c = GPIO_read_keypad(GPIO_D, false);
 695              		.loc 1 137 9
 696 0300 A3E7     		b	.L28
 697              	.L30:
 698 0302 C046     		.align	2
 699              	.L29:
 700 0304 00000000 		.word	ball.4360
 701 0308 000C0240 		.word	1073875968
 702 030c 00000000 		.word	.L23
 703              		.cfi_endproc
 704              	.LFE6:
 706              		.data
 707              		.align	2
 710              	ball.4360:
 711 0000 18000000 		.word	ball_geometry.4359
 712 0004 04       		.byte	4
 713 0005 04       		.byte	4
 714 0006 01       		.byte	1
 715 0007 01       		.byte	1
 716 0008 00000000 		.word	draw_object
 717 000c 00000000 		.word	clear_object
 718 0010 00000000 		.word	move_object
 719 0014 00000000 		.word	set_speed
 720              		.align	2
 723              	ball_geometry.4359:
 724 0018 0C       		.byte	12
 725 0019 0A       		.byte	10
 726 001a 0A       		.byte	10
 727 001b 00       		.byte	0
 728 001c 01       		.byte	1
 729 001d 00       		.byte	0
 730 001e 02       		.byte	2
 731 001f 01       		.byte	1
 732 0020 00       		.byte	0
 733 0021 01       		.byte	1
 734 0022 01       		.byte	1
 735 0023 01       		.byte	1
 736 0024 02       		.byte	2
 737 0025 01       		.byte	1
 738 0026 03       		.byte	3
 739 0027 02       		.byte	2
 740 0028 00       		.byte	0
 741 0029 02       		.byte	2
 742 002a 01       		.byte	1
 743 002b 02       		.byte	2
 744 002c 02       		.byte	2
 745 002d 02       		.byte	2
 746 002e 03       		.byte	3
 747 002f 03       		.byte	3
 748 0030 01       		.byte	1
 749 0031 03       		.byte	3
 750 0032 02       		.byte	2
 751 0033 00000000 		.space	16
 751      00000000 
 751      00000000 
 751      00000000 
 752              		.text
 753              	.Letext0:
 754              		.file 2 "/usr/arm-none-eabi/include/machine/_default_types.h"
 755              		.file 3 "/usr/arm-none-eabi/include/sys/_stdint.h"
 756              		.file 4 "/home/love/Documents/skola/EDA482/libs/include/libGPIO.h"
