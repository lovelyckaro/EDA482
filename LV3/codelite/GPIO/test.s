   1              		.arch armv6-m
   2              		.eabi_attribute 20, 1
   3              		.eabi_attribute 21, 1
   4              		.eabi_attribute 23, 3
   5              		.eabi_attribute 24, 1
   6              		.eabi_attribute 25, 1
   7              		.eabi_attribute 26, 1
   8              		.eabi_attribute 30, 2
   9              		.eabi_attribute 34, 0
  10              		.eabi_attribute 18, 4
  11              		.file	"libGPIO.c"
  12              		.text
  13              		.align	1
  14              		.p2align 2,,3
  15              		.global	init_GPIO
  16              		.syntax unified
  17              		.code	16
  18              		.thumb_func
  19              		.fpu softvfp
  21              	init_GPIO:
  22              		@ args = 0, pretend = 0, frame = 0
  23              		@ frame_needed = 0, uses_anonymous_args = 0
  24              		@ link register save eliminated.
  25 0000 0160     		str	r1, [r0]
  26              		@ sp needed
  27 0002 7047     		bx	lr
  29              		.align	1
  30              		.p2align 2,,3
  31              		.global	GPIO_split_mode
  32              		.syntax unified
  33              		.code	16
  34              		.thumb_func
  35              		.fpu softvfp
  37              	GPIO_split_mode:
  38              		@ args = 0, pretend = 0, frame = 0
  39              		@ frame_needed = 0, uses_anonymous_args = 0
  40              		@ link register save eliminated.
  41 0004 4B42     		rsbs	r3, r1, #0
  42 0006 5941     		adcs	r1, r1, r3
  43 0008 054B     		ldr	r3, .L10
  44 000a 4942     		rsbs	r1, r1, #0
  45 000c 1940     		ands	r1, r3
  46 000e 054B     		ldr	r3, .L10+4
  47 0010 9C46     		mov	ip, r3
  48 0012 6144     		add	r1, r1, ip
  49 0014 002A     		cmp	r2, #0
  50 0016 01D0     		beq	.L5
  51 0018 034B     		ldr	r3, .L10+8
  52 001a 1943     		orrs	r1, r3
  53              	.L5:
  54 001c 0160     		str	r1, [r0]
  55              		@ sp needed
  56 001e 7047     		bx	lr
  57              	.L11:
  58              		.align	2
  59              	.L10:
  60 0020 0000ABAA 		.word	-1431633920
  61 0024 00005555 		.word	1431633920
  62 0028 55550000 		.word	21845
  64              		.align	1
  65              		.p2align 2,,3
  66              		.global	GPIO_output
  67              		.syntax unified
  68              		.code	16
  69              		.thumb_func
  70              		.fpu softvfp
  72              	GPIO_output:
  73              		@ args = 0, pretend = 0, frame = 0
  74              		@ frame_needed = 0, uses_anonymous_args = 0
  75              		@ link register save eliminated.
  76 002c 014B     		ldr	r3, .L13
  77              		@ sp needed
  78 002e 0360     		str	r3, [r0]
  79 0030 7047     		bx	lr
  80              	.L14:
  81 0032 C046     		.align	2
  82              	.L13:
  83 0034 55555555 		.word	1431655765
  85              		.align	1
  86              		.p2align 2,,3
  87              		.global	GPIO_input
  88              		.syntax unified
  89              		.code	16
  90              		.thumb_func
  91              		.fpu softvfp
  93              	GPIO_input:
  94              		@ args = 0, pretend = 0, frame = 0
  95              		@ frame_needed = 0, uses_anonymous_args = 0
  96              		@ link register save eliminated.
  97 0038 0023     		movs	r3, #0
  98              		@ sp needed
  99 003a 0360     		str	r3, [r0]
 100 003c 7047     		bx	lr
 102              		.align	1
 103 003e C046     		.p2align 2,,3
 104              		.global	GPIO_clock_start
 105              		.syntax unified
 106              		.code	16
 107              		.thumb_func
 108              		.fpu softvfp
 110              	GPIO_clock_start:
 111              		@ args = 0, pretend = 0, frame = 0
 112              		@ frame_needed = 0, uses_anonymous_args = 0
 113              		@ link register save eliminated.
 114 0040 1822     		movs	r2, #24
 115 0042 014B     		ldr	r3, .L17
 116              		@ sp needed
 117 0044 1A60     		str	r2, [r3]
 118 0046 7047     		bx	lr
 119              	.L18:
 120              		.align	2
 121              	.L17:
 122 0048 30380240 		.word	1073887280
 124              		.align	1
 125              		.p2align 2,,3
 126              		.global	GPIO_init_keypad
 127              		.syntax unified
 128              		.code	16
 129              		.thumb_func
 130              		.fpu softvfp
 132              	GPIO_init_keypad:
 133              		@ args = 0, pretend = 0, frame = 0
 134              		@ frame_needed = 0, uses_anonymous_args = 0
 135 004c 70B5     		push	{r4, r5, r6, lr}
 136 004e 0029     		cmp	r1, #0
 137 0050 13D1     		bne	.L21
 138 0052 FF23     		movs	r3, #255
 139 0054 AA26     		movs	r6, #170
 140 0056 AA25     		movs	r5, #170
 141 0058 0C4C     		ldr	r4, .L22
 142 005a 0F31     		adds	r1, r1, #15
 143 005c 1B02     		lsls	r3, r3, #8
 144 005e F601     		lsls	r6, r6, #7
 145              	.L20:
 146 0060 0268     		ldr	r2, [r0]
 147              		@ sp needed
 148 0062 2240     		ands	r2, r4
 149 0064 3243     		orrs	r2, r6
 150 0066 0260     		str	r2, [r0]
 151 0068 8288     		ldrh	r2, [r0, #4]
 152 006a 1A40     		ands	r2, r3
 153 006c 0A43     		orrs	r2, r1
 154 006e 8280     		strh	r2, [r0, #4]
 155 0070 C368     		ldr	r3, [r0, #12]
 156 0072 2340     		ands	r3, r4
 157 0074 2B43     		orrs	r3, r5
 158 0076 C360     		str	r3, [r0, #12]
 159 0078 70BD     		pop	{r4, r5, r6, pc}
 160              	.L21:
 161 007a F021     		movs	r1, #240
 162 007c AA25     		movs	r5, #170
 163 007e AA26     		movs	r6, #170
 164 0080 0901     		lsls	r1, r1, #4
 165 0082 FF23     		movs	r3, #255
 166 0084 2D04     		lsls	r5, r5, #16
 167 0086 F605     		lsls	r6, r6, #23
 168 0088 014C     		ldr	r4, .L22+4
 169 008a E9E7     		b	.L20
 170              	.L23:
 171              		.align	2
 172              	.L22:
 173 008c 0000FFFF 		.word	-65536
 174 0090 FFFF0000 		.word	65535
 176              		.align	1
 177              		.p2align 2,,3
 178              		.global	activate_row
 179              		.syntax unified
 180              		.code	16
 181              		.thumb_func
 182              		.fpu softvfp
 184              	activate_row:
 185              		@ args = 0, pretend = 0, frame = 0
 186              		@ frame_needed = 0, uses_anonymous_args = 0
 187              		@ link register save eliminated.
 188 0094 0823     		movs	r3, #8
 189 0096 9340     		lsls	r3, r3, r2
 190 0098 DBB2     		uxtb	r3, r3
 191 009a 0029     		cmp	r1, #0
 192 009c 01D0     		beq	.L25
 193 009e 4375     		strb	r3, [r0, #21]
 194              	.L24:
 195              		@ sp needed
 196 00a0 7047     		bx	lr
 197              	.L25:
 198 00a2 0375     		strb	r3, [r0, #20]
 199 00a4 FCE7     		b	.L24
 201              		.align	1
 202 00a6 C046     		.p2align 2,,3
 203              		.global	read_column
 204              		.syntax unified
 205              		.code	16
 206              		.thumb_func
 207              		.fpu softvfp
 209              	read_column:
 210              		@ args = 0, pretend = 0, frame = 0
 211              		@ frame_needed = 0, uses_anonymous_args = 0
 212              		@ link register save eliminated.
 213 00a8 0029     		cmp	r1, #0
 214 00aa 0AD0     		beq	.L28
 215 00ac 0F23     		movs	r3, #15
 216 00ae 427C     		ldrb	r2, [r0, #17]
 217 00b0 1340     		ands	r3, r2
 218              	.L31:
 219 00b2 0020     		movs	r0, #0
 220 00b4 002B     		cmp	r3, #0
 221 00b6 03D0     		beq	.L30
 222              	.L29:
 223 00b8 0130     		adds	r0, r0, #1
 224 00ba 40B2     		sxtb	r0, r0
 225 00bc 5B08     		lsrs	r3, r3, #1
 226 00be FBD1     		bne	.L29
 227              	.L30:
 228              		@ sp needed
 229 00c0 7047     		bx	lr
 230              	.L28:
 231 00c2 0F23     		movs	r3, #15
 232 00c4 027C     		ldrb	r2, [r0, #16]
 233 00c6 1340     		ands	r3, r2
 234 00c8 F3E7     		b	.L31
 236              		.align	1
 237 00ca C046     		.p2align 2,,3
 238              		.global	key_value
 239              		.syntax unified
 240              		.code	16
 241              		.thumb_func
 242              		.fpu softvfp
 244              	key_value:
 245              		@ args = 0, pretend = 0, frame = 16
 246              		@ frame_needed = 0, uses_anonymous_args = 0
 247 00cc F0B5     		push	{r4, r5, r6, r7, lr}
 248 00ce 85B0     		sub	sp, sp, #20
 249 00d0 6A46     		mov	r2, sp
 250 00d2 1400     		movs	r4, r2
 251 00d4 0B4B     		ldr	r3, .L39
 252 00d6 0138     		subs	r0, r0, #1
 253 00d8 E0CB     		ldmia	r3!, {r5, r6, r7}
 254 00da E0C4     		stmia	r4!, {r5, r6, r7}
 255 00dc 1B68     		ldr	r3, [r3]
 256 00de 2360     		str	r3, [r4]
 257 00e0 C3B2     		uxtb	r3, r0
 258 00e2 032B     		cmp	r3, #3
 259 00e4 0AD8     		bhi	.L38
 260 00e6 4B1E     		subs	r3, r1, #1
 261 00e8 DBB2     		uxtb	r3, r3
 262 00ea 032B     		cmp	r3, #3
 263 00ec 06D8     		bhi	.L38
 264 00ee 8000     		lsls	r0, r0, #2
 265 00f0 1218     		adds	r2, r2, r0
 266 00f2 0120     		movs	r0, #1
 267 00f4 5218     		adds	r2, r2, r1
 268 00f6 4042     		rsbs	r0, r0, #0
 269 00f8 1056     		ldrsb	r0, [r2, r0]
 270 00fa 00E0     		b	.L36
 271              	.L38:
 272 00fc 0020     		movs	r0, #0
 273              	.L36:
 274 00fe 05B0     		add	sp, sp, #20
 275              		@ sp needed
 276 0100 F0BD     		pop	{r4, r5, r6, r7, pc}
 277              	.L40:
 278 0102 C046     		.align	2
 279              	.L39:
 280 0104 00000000 		.word	.LANCHOR0
 282              		.align	1
 283              		.p2align 2,,3
 284              		.global	GPIO_read_keypad
 285              		.syntax unified
 286              		.code	16
 287              		.thumb_func
 288              		.fpu softvfp
 290              	GPIO_read_keypad:
 291              		@ args = 0, pretend = 0, frame = 16
 292              		@ frame_needed = 0, uses_anonymous_args = 0
 293 0108 0123     		movs	r3, #1
 294 010a F0B5     		push	{r4, r5, r6, r7, lr}
 295 010c C646     		mov	lr, r8
 296 010e 0500     		movs	r5, r0
 297 0110 9C46     		mov	ip, r3
 298 0112 0827     		movs	r7, #8
 299 0114 0F26     		movs	r6, #15
 300 0116 00B5     		push	{lr}
 301 0118 84B0     		sub	sp, sp, #16
 302              	.L48:
 303 011a 3B00     		movs	r3, r7
 304 011c 6246     		mov	r2, ip
 305 011e 9340     		lsls	r3, r3, r2
 306 0120 DBB2     		uxtb	r3, r3
 307 0122 0029     		cmp	r1, #0
 308 0124 17D0     		beq	.L42
 309 0126 6B75     		strb	r3, [r5, #21]
 310 0128 687C     		ldrb	r0, [r5, #17]
 311 012a 3040     		ands	r0, r6
 312              	.L43:
 313 012c 0028     		cmp	r0, #0
 314 012e 07D0     		beq	.L44
 315 0130 0023     		movs	r3, #0
 316              	.L45:
 317 0132 DAB2     		uxtb	r2, r3
 318 0134 531C     		adds	r3, r2, #1
 319 0136 5BB2     		sxtb	r3, r3
 320 0138 4008     		lsrs	r0, r0, #1
 321 013a FAD1     		bne	.L45
 322 013c 002B     		cmp	r3, #0
 323 013e 0ED1     		bne	.L57
 324              	.L44:
 325 0140 0123     		movs	r3, #1
 326 0142 9846     		mov	r8, r3
 327 0144 C444     		add	ip, ip, r8
 328 0146 6346     		mov	r3, ip
 329 0148 052B     		cmp	r3, #5
 330 014a E6D1     		bne	.L48
 331 014c 1020     		movs	r0, #16
 332              	.L47:
 333 014e 04B0     		add	sp, sp, #16
 334              		@ sp needed
 335 0150 04BC     		pop	{r2}
 336 0152 9046     		mov	r8, r2
 337 0154 F0BD     		pop	{r4, r5, r6, r7, pc}
 338              	.L42:
 339 0156 2B75     		strb	r3, [r5, #20]
 340 0158 287C     		ldrb	r0, [r5, #16]
 341 015a 3040     		ands	r0, r6
 342 015c E6E7     		b	.L43
 343              	.L57:
 344 015e E846     		mov	r8, sp
 345 0160 4646     		mov	r6, r8
 346 0162 074D     		ldr	r5, .L58
 347 0164 92CD     		ldmia	r5!, {r1, r4, r7}
 348 0166 92C6     		stmia	r6!, {r1, r4, r7}
 349 0168 2D68     		ldr	r5, [r5]
 350 016a 3560     		str	r5, [r6]
 351 016c 032A     		cmp	r2, #3
 352 016e EED8     		bhi	.L47
 353 0170 6446     		mov	r4, ip
 354 0172 013C     		subs	r4, r4, #1
 355 0174 A400     		lsls	r4, r4, #2
 356 0176 4444     		add	r4, r4, r8
 357 0178 E318     		adds	r3, r4, r3
 358 017a 013B     		subs	r3, r3, #1
 359 017c 1878     		ldrb	r0, [r3]
 360 017e E6E7     		b	.L47
 361              	.L59:
 362              		.align	2
 363              	.L58:
 364 0180 00000000 		.word	.LANCHOR0
 366              		.align	1
 367              		.p2align 2,,3
 368              		.global	GPIO_init_seven_seg
 369              		.syntax unified
 370              		.code	16
 371              		.thumb_func
 372              		.fpu softvfp
 374              	GPIO_init_seven_seg:
 375              		@ args = 0, pretend = 0, frame = 0
 376              		@ frame_needed = 0, uses_anonymous_args = 0
 377              		@ link register save eliminated.
 378 0184 4B1E     		subs	r3, r1, #1
 379 0186 9941     		sbcs	r1, r1, r3
 380 0188 034B     		ldr	r3, .L63
 381 018a 4942     		rsbs	r1, r1, #0
 382 018c 1940     		ands	r1, r3
 383 018e 034B     		ldr	r3, .L63+4
 384              		@ sp needed
 385 0190 9C46     		mov	ip, r3
 386 0192 6144     		add	r1, r1, ip
 387 0194 0160     		str	r1, [r0]
 388 0196 7047     		bx	lr
 389              	.L64:
 390              		.align	2
 391              	.L63:
 392 0198 ABAA5455 		.word	1431612075
 393 019c 55550000 		.word	21845
 395              		.align	1
 396              		.p2align 2,,3
 397              		.global	GPIO_put_seven_seg
 398              		.syntax unified
 399              		.code	16
 400              		.thumb_func
 401              		.fpu softvfp
 403              	GPIO_put_seven_seg:
 404              		@ args = 0, pretend = 0, frame = 0
 405              		@ frame_needed = 0, uses_anonymous_args = 0
 406              		@ link register save eliminated.
 407 01a0 3F23     		movs	r3, #63
 408              		@ sp needed
 409 01a2 0375     		strb	r3, [r0, #20]
 410 01a4 7047     		bx	lr
 412 01a6 C046     		.section	.rodata
 413              		.align	2
 414              		.set	.LANCHOR0,. + 0
 415              	.LC0:
 416 0000 01       		.byte	1
 417 0001 02       		.byte	2
 418 0002 03       		.byte	3
 419 0003 0A       		.byte	10
 420 0004 04       		.byte	4
 421 0005 05       		.byte	5
 422 0006 06       		.byte	6
 423 0007 0B       		.byte	11
 424 0008 07       		.byte	7
 425 0009 08       		.byte	8
 426 000a 09       		.byte	9
 427 000b 0C       		.byte	12
 428 000c 0E       		.byte	14
 429 000d 00       		.byte	0
 430 000e 0F       		.byte	15
 431 000f 0D       		.byte	13
 432              		.ident	"GCC: (Arch Repository) 8.3.0"
