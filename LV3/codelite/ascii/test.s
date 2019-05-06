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
  11              		.file	"libascii.c"
  12              		.text
  13              		.align	1
  14              		.p2align 2,,3
  15              		.global	ascii_ctrl_bit_set
  16              		.syntax unified
  17              		.code	16
  18              		.thumb_func
  19              		.fpu softvfp
  21              	ascii_ctrl_bit_set:
  22              		@ args = 0, pretend = 0, frame = 0
  23              		@ frame_needed = 0, uses_anonymous_args = 0
  24              		@ link register save eliminated.
  25 0000 034A     		ldr	r2, .L3
  26              		@ sp needed
  27 0002 137D     		ldrb	r3, [r2, #20]
  28 0004 0343     		orrs	r3, r0
  29 0006 0420     		movs	r0, #4
  30 0008 0343     		orrs	r3, r0
  31 000a 1375     		strb	r3, [r2, #20]
  32 000c 7047     		bx	lr
  33              	.L4:
  34 000e C046     		.align	2
  35              	.L3:
  36 0010 00100240 		.word	1073876992
  38              		.align	1
  39              		.p2align 2,,3
  40              		.global	ascii_ctrl_bit_clear
  41              		.syntax unified
  42              		.code	16
  43              		.thumb_func
  44              		.fpu softvfp
  46              	ascii_ctrl_bit_clear:
  47              		@ args = 0, pretend = 0, frame = 0
  48              		@ frame_needed = 0, uses_anonymous_args = 0
  49              		@ link register save eliminated.
  50 0014 0421     		movs	r1, #4
  51 0016 C043     		mvns	r0, r0
  52 0018 024A     		ldr	r2, .L6
  53 001a 0843     		orrs	r0, r1
  54 001c 137D     		ldrb	r3, [r2, #20]
  55              		@ sp needed
  56 001e 1840     		ands	r0, r3
  57 0020 1075     		strb	r0, [r2, #20]
  58 0022 7047     		bx	lr
  59              	.L7:
  60              		.align	2
  61              	.L6:
  62 0024 00100240 		.word	1073876992
  64              		.align	1
  65              		.p2align 2,,3
  66              		.global	ascii_write_controller
  67              		.syntax unified
  68              		.code	16
  69              		.thumb_func
  70              		.fpu softvfp
  72              	ascii_write_controller:
  73              		@ args = 0, pretend = 0, frame = 0
  74              		@ frame_needed = 0, uses_anonymous_args = 0
  75 0028 4421     		movs	r1, #68
  76 002a 10B5     		push	{r4, lr}
  77 002c 054B     		ldr	r3, .L9
  78              		@ sp needed
  79 002e 1A7D     		ldrb	r2, [r3, #20]
  80 0030 0A43     		orrs	r2, r1
  81 0032 4021     		movs	r1, #64
  82 0034 1A75     		strb	r2, [r3, #20]
  83 0036 5875     		strb	r0, [r3, #21]
  84 0038 1A7D     		ldrb	r2, [r3, #20]
  85 003a 8A43     		bics	r2, r1
  86 003c 1A75     		strb	r2, [r3, #20]
  87 003e FFF7FEFF 		bl	delay_250ns
  88 0042 10BD     		pop	{r4, pc}
  89              	.L10:
  90              		.align	2
  91              	.L9:
  92 0044 00100240 		.word	1073876992
  94              		.align	1
  95              		.p2align 2,,3
  96              		.global	ascii_read_controller
  97              		.syntax unified
  98              		.code	16
  99              		.thumb_func
 100              		.fpu softvfp
 102              	ascii_read_controller:
 103              		@ args = 0, pretend = 0, frame = 0
 104              		@ frame_needed = 0, uses_anonymous_args = 0
 105 0048 4422     		movs	r2, #68
 106 004a 10B5     		push	{r4, lr}
 107 004c 074C     		ldr	r4, .L12
 108              		@ sp needed
 109 004e 237D     		ldrb	r3, [r4, #20]
 110 0050 1343     		orrs	r3, r2
 111 0052 2375     		strb	r3, [r4, #20]
 112 0054 FFF7FEFF 		bl	delay_250ns
 113 0058 FFF7FEFF 		bl	delay_250ns
 114 005c 4022     		movs	r2, #64
 115 005e 607C     		ldrb	r0, [r4, #17]
 116 0060 237D     		ldrb	r3, [r4, #20]
 117 0062 C0B2     		uxtb	r0, r0
 118 0064 9343     		bics	r3, r2
 119 0066 2375     		strb	r3, [r4, #20]
 120 0068 10BD     		pop	{r4, pc}
 121              	.L13:
 122 006a C046     		.align	2
 123              	.L12:
 124 006c 00100240 		.word	1073876992
 126              		.align	1
 127              		.p2align 2,,3
 128              		.global	ascii_write_cmd
 129              		.syntax unified
 130              		.code	16
 131              		.thumb_func
 132              		.fpu softvfp
 134              	ascii_write_cmd:
 135              		@ args = 0, pretend = 0, frame = 0
 136              		@ frame_needed = 0, uses_anonymous_args = 0
 137 0070 0321     		movs	r1, #3
 138 0072 10B5     		push	{r4, lr}
 139 0074 074B     		ldr	r3, .L15
 140              		@ sp needed
 141 0076 1A7D     		ldrb	r2, [r3, #20]
 142 0078 8A43     		bics	r2, r1
 143 007a 4421     		movs	r1, #68
 144 007c 1A75     		strb	r2, [r3, #20]
 145 007e 1A7D     		ldrb	r2, [r3, #20]
 146 0080 0A43     		orrs	r2, r1
 147 0082 4021     		movs	r1, #64
 148 0084 1A75     		strb	r2, [r3, #20]
 149 0086 5875     		strb	r0, [r3, #21]
 150 0088 1A7D     		ldrb	r2, [r3, #20]
 151 008a 8A43     		bics	r2, r1
 152 008c 1A75     		strb	r2, [r3, #20]
 153 008e FFF7FEFF 		bl	delay_250ns
 154 0092 10BD     		pop	{r4, pc}
 155              	.L16:
 156              		.align	2
 157              	.L15:
 158 0094 00100240 		.word	1073876992
 160              		.align	1
 161              		.p2align 2,,3
 162              		.global	ascii_write_data
 163              		.syntax unified
 164              		.code	16
 165              		.thumb_func
 166              		.fpu softvfp
 168              	ascii_write_data:
 169              		@ args = 0, pretend = 0, frame = 0
 170              		@ frame_needed = 0, uses_anonymous_args = 0
 171 0098 0521     		movs	r1, #5
 172 009a 10B5     		push	{r4, lr}
 173 009c 094B     		ldr	r3, .L18
 174              		@ sp needed
 175 009e 1A7D     		ldrb	r2, [r3, #20]
 176 00a0 0A43     		orrs	r2, r1
 177 00a2 0221     		movs	r1, #2
 178 00a4 1A75     		strb	r2, [r3, #20]
 179 00a6 1A7D     		ldrb	r2, [r3, #20]
 180 00a8 8A43     		bics	r2, r1
 181 00aa 4421     		movs	r1, #68
 182 00ac 1A75     		strb	r2, [r3, #20]
 183 00ae 1A7D     		ldrb	r2, [r3, #20]
 184 00b0 0A43     		orrs	r2, r1
 185 00b2 4021     		movs	r1, #64
 186 00b4 1A75     		strb	r2, [r3, #20]
 187 00b6 5875     		strb	r0, [r3, #21]
 188 00b8 1A7D     		ldrb	r2, [r3, #20]
 189 00ba 8A43     		bics	r2, r1
 190 00bc 1A75     		strb	r2, [r3, #20]
 191 00be FFF7FEFF 		bl	delay_250ns
 192 00c2 10BD     		pop	{r4, pc}
 193              	.L19:
 194              		.align	2
 195              	.L18:
 196 00c4 00100240 		.word	1073876992
 198              		.align	1
 199              		.p2align 2,,3
 200              		.global	ascii_read_status
 201              		.syntax unified
 202              		.code	16
 203              		.thumb_func
 204              		.fpu softvfp
 206              	ascii_read_status:
 207              		@ args = 0, pretend = 0, frame = 0
 208              		@ frame_needed = 0, uses_anonymous_args = 0
 209 00c8 0122     		movs	r2, #1
 210 00ca 10B5     		push	{r4, lr}
 211 00cc 074B     		ldr	r3, .L21
 212 00ce 084C     		ldr	r4, .L21+4
 213              		@ sp needed
 214 00d0 2360     		str	r3, [r4]
 215 00d2 237D     		ldrb	r3, [r4, #20]
 216 00d4 9343     		bics	r3, r2
 217 00d6 0622     		movs	r2, #6
 218 00d8 2375     		strb	r3, [r4, #20]
 219 00da 237D     		ldrb	r3, [r4, #20]
 220 00dc 1343     		orrs	r3, r2
 221 00de 2375     		strb	r3, [r4, #20]
 222 00e0 FFF7FEFF 		bl	ascii_read_controller
 223 00e4 034B     		ldr	r3, .L21+8
 224 00e6 2360     		str	r3, [r4]
 225 00e8 10BD     		pop	{r4, pc}
 226              	.L22:
 227 00ea C046     		.align	2
 228              	.L21:
 229 00ec 55550000 		.word	21845
 230 00f0 00100240 		.word	1073876992
 231 00f4 55555555 		.word	1431655765
 233              		.align	1
 234              		.p2align 2,,3
 235              		.global	ascii_read_data
 236              		.syntax unified
 237              		.code	16
 238              		.thumb_func
 239              		.fpu softvfp
 241              	ascii_read_data:
 242              		@ args = 0, pretend = 0, frame = 0
 243              		@ frame_needed = 0, uses_anonymous_args = 0
 244 00f8 0522     		movs	r2, #5
 245 00fa 10B5     		push	{r4, lr}
 246 00fc 074B     		ldr	r3, .L24
 247 00fe 084C     		ldr	r4, .L24+4
 248              		@ sp needed
 249 0100 2360     		str	r3, [r4]
 250 0102 237D     		ldrb	r3, [r4, #20]
 251 0104 1343     		orrs	r3, r2
 252 0106 0622     		movs	r2, #6
 253 0108 2375     		strb	r3, [r4, #20]
 254 010a 237D     		ldrb	r3, [r4, #20]
 255 010c 1343     		orrs	r3, r2
 256 010e 2375     		strb	r3, [r4, #20]
 257 0110 FFF7FEFF 		bl	ascii_read_controller
 258 0114 034B     		ldr	r3, .L24+8
 259 0116 2360     		str	r3, [r4]
 260 0118 10BD     		pop	{r4, pc}
 261              	.L25:
 262 011a C046     		.align	2
 263              	.L24:
 264 011c 55550000 		.word	21845
 265 0120 00100240 		.word	1073876992
 266 0124 55555555 		.word	1431655765
 268              		.align	1
 269              		.p2align 2,,3
 270              		.global	ascii_write_cmd_delay
 271              		.syntax unified
 272              		.code	16
 273              		.thumb_func
 274              		.fpu softvfp
 276              	ascii_write_cmd_delay:
 277              		@ args = 0, pretend = 0, frame = 0
 278              		@ frame_needed = 0, uses_anonymous_args = 0
 279 0128 70B5     		push	{r4, r5, r6, lr}
 280 012a 0500     		movs	r5, r0
 281 012c 0C00     		movs	r4, r1
 282              	.L27:
 283 012e FFF7FEFF 		bl	ascii_read_status
 284 0132 0306     		lsls	r3, r0, #24
 285 0134 FBD4     		bmi	.L27
 286 0136 0820     		movs	r0, #8
 287 0138 FFF7FEFF 		bl	delay_micros
 288 013c 2800     		movs	r0, r5
 289 013e FFF7FEFF 		bl	ascii_write_cmd
 290 0142 2000     		movs	r0, r4
 291 0144 FFF7FEFF 		bl	delay_micros
 292              		@ sp needed
 293 0148 70BD     		pop	{r4, r5, r6, pc}
 295              		.align	1
 296 014a C046     		.p2align 2,,3
 297              		.global	ascii_write_data_delay
 298              		.syntax unified
 299              		.code	16
 300              		.thumb_func
 301              		.fpu softvfp
 303              	ascii_write_data_delay:
 304              		@ args = 0, pretend = 0, frame = 0
 305              		@ frame_needed = 0, uses_anonymous_args = 0
 306 014c 70B5     		push	{r4, r5, r6, lr}
 307 014e 0500     		movs	r5, r0
 308 0150 0C00     		movs	r4, r1
 309              	.L30:
 310 0152 FFF7FEFF 		bl	ascii_read_status
 311 0156 0306     		lsls	r3, r0, #24
 312 0158 FBD4     		bmi	.L30
 313 015a 0820     		movs	r0, #8
 314 015c FFF7FEFF 		bl	delay_micros
 315 0160 2800     		movs	r0, r5
 316 0162 FFF7FEFF 		bl	ascii_write_data
 317 0166 2000     		movs	r0, r4
 318 0168 FFF7FEFF 		bl	delay_micros
 319              		@ sp needed
 320 016c 70BD     		pop	{r4, r5, r6, pc}
 322              		.align	1
 323 016e C046     		.p2align 2,,3
 324              		.global	ascii_init
 325              		.syntax unified
 326              		.code	16
 327              		.thumb_func
 328              		.fpu softvfp
 330              	ascii_init:
 331              		@ args = 0, pretend = 0, frame = 0
 332              		@ frame_needed = 0, uses_anonymous_args = 0
 333 0170 FA21     		movs	r1, #250
 334 0172 10B5     		push	{r4, lr}
 335 0174 C900     		lsls	r1, r1, #3
 336 0176 0120     		movs	r0, #1
 337 0178 FFF7FEFF 		bl	ascii_write_cmd_delay
 338 017c 2821     		movs	r1, #40
 339 017e 3820     		movs	r0, #56
 340 0180 FFF7FEFF 		bl	ascii_write_cmd_delay
 341 0184 2821     		movs	r1, #40
 342 0186 0E20     		movs	r0, #14
 343 0188 FFF7FEFF 		bl	ascii_write_cmd_delay
 344 018c 2821     		movs	r1, #40
 345 018e 0620     		movs	r0, #6
 346 0190 FFF7FEFF 		bl	ascii_write_cmd_delay
 347              		@ sp needed
 348 0194 10BD     		pop	{r4, pc}
 350              		.align	1
 351 0196 C046     		.p2align 2,,3
 352              		.global	ascii_gotoxy
 353              		.syntax unified
 354              		.code	16
 355              		.thumb_func
 356              		.fpu softvfp
 358              	ascii_gotoxy:
 359              		@ args = 0, pretend = 0, frame = 0
 360              		@ frame_needed = 0, uses_anonymous_args = 0
 361 0198 10B5     		push	{r4, lr}
 362 019a 0129     		cmp	r1, #1
 363 019c 07D9     		bls	.L36
 364 019e 3F30     		adds	r0, r0, #63
 365 01a0 C0B2     		uxtb	r0, r0
 366              	.L35:
 367 01a2 8023     		movs	r3, #128
 368 01a4 2821     		movs	r1, #40
 369 01a6 1843     		orrs	r0, r3
 370 01a8 FFF7FEFF 		bl	ascii_write_cmd_delay
 371              		@ sp needed
 372 01ac 10BD     		pop	{r4, pc}
 373              	.L36:
 374 01ae 0138     		subs	r0, r0, #1
 375 01b0 C0B2     		uxtb	r0, r0
 376 01b2 F6E7     		b	.L35
 378              		.align	1
 379              		.p2align 2,,3
 380              		.global	ascii_write_char
 381              		.syntax unified
 382              		.code	16
 383              		.thumb_func
 384              		.fpu softvfp
 386              	ascii_write_char:
 387              		@ args = 0, pretend = 0, frame = 0
 388              		@ frame_needed = 0, uses_anonymous_args = 0
 389 01b4 10B5     		push	{r4, lr}
 390 01b6 2B21     		movs	r1, #43
 391 01b8 FFF7FEFF 		bl	ascii_write_data_delay
 392              		@ sp needed
 393 01bc 10BD     		pop	{r4, pc}
 395              		.align	1
 396 01be C046     		.p2align 2,,3
 397              		.global	ascii_write_string
 398              		.syntax unified
 399              		.code	16
 400              		.thumb_func
 401              		.fpu softvfp
 403              	ascii_write_string:
 404              		@ args = 0, pretend = 0, frame = 0
 405              		@ frame_needed = 0, uses_anonymous_args = 0
 406 01c0 10B5     		push	{r4, lr}
 407 01c2 0400     		movs	r4, r0
 408 01c4 0078     		ldrb	r0, [r0]
 409 01c6 0028     		cmp	r0, #0
 410 01c8 06D0     		beq	.L38
 411              	.L40:
 412 01ca 0134     		adds	r4, r4, #1
 413 01cc 2B21     		movs	r1, #43
 414 01ce FFF7FEFF 		bl	ascii_write_data_delay
 415 01d2 2078     		ldrb	r0, [r4]
 416 01d4 0028     		cmp	r0, #0
 417 01d6 F8D1     		bne	.L40
 418              	.L38:
 419              		@ sp needed
 420 01d8 10BD     		pop	{r4, pc}
 422 01da C046     		.ident	"GCC: (Arch Repository) 8.3.0"
