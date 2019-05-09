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
  11              		.file	"libdelay.c"
  12              		.text
  13              		.align	1
  14              		.p2align 2,,3
  15              		.global	delay_250ns
  16              		.syntax unified
  17              		.code	16
  18              		.thumb_func
  19              		.fpu softvfp
  21              	delay_250ns:
  22              		@ args = 0, pretend = 0, frame = 0
  23              		@ frame_needed = 0, uses_anonymous_args = 0
  24              		@ link register save eliminated.
  25 0000 0023     		movs	r3, #0
  26 0002 2921     		movs	r1, #41
  27 0004 064A     		ldr	r2, .L6
  28 0006 1360     		str	r3, [r2]
  29 0008 5160     		str	r1, [r2, #4]
  30 000a 8021     		movs	r1, #128
  31 000c 9360     		str	r3, [r2, #8]
  32 000e 0533     		adds	r3, r3, #5
  33 0010 1360     		str	r3, [r2]
  34 0012 4902     		lsls	r1, r1, #9
  35              	.L2:
  36 0014 1368     		ldr	r3, [r2]
  37 0016 0B42     		tst	r3, r1
  38 0018 FCD0     		beq	.L2
  39 001a 0023     		movs	r3, #0
  40              		@ sp needed
  41 001c 1360     		str	r3, [r2]
  42 001e 7047     		bx	lr
  43              	.L7:
  44              		.align	2
  45              	.L6:
  46 0020 10E000E0 		.word	-536813552
  48              		.align	1
  49              		.p2align 2,,3
  50              		.global	delay_500ns
  51              		.syntax unified
  52              		.code	16
  53              		.thumb_func
  54              		.fpu softvfp
  56              	delay_500ns:
  57              		@ args = 0, pretend = 0, frame = 0
  58              		@ frame_needed = 0, uses_anonymous_args = 0
  59              		@ link register save eliminated.
  60 0024 0023     		movs	r3, #0
  61 0026 5321     		movs	r1, #83
  62 0028 064A     		ldr	r2, .L12
  63 002a 1360     		str	r3, [r2]
  64 002c 5160     		str	r1, [r2, #4]
  65 002e 8021     		movs	r1, #128
  66 0030 9360     		str	r3, [r2, #8]
  67 0032 0533     		adds	r3, r3, #5
  68 0034 1360     		str	r3, [r2]
  69 0036 4902     		lsls	r1, r1, #9
  70              	.L9:
  71 0038 1368     		ldr	r3, [r2]
  72 003a 0B42     		tst	r3, r1
  73 003c FCD0     		beq	.L9
  74 003e 0023     		movs	r3, #0
  75              		@ sp needed
  76 0040 1360     		str	r3, [r2]
  77 0042 7047     		bx	lr
  78              	.L13:
  79              		.align	2
  80              	.L12:
  81 0044 10E000E0 		.word	-536813552
  83              		.align	1
  84              		.p2align 2,,3
  85              		.global	delay_micros
  86              		.syntax unified
  87              		.code	16
  88              		.thumb_func
  89              		.fpu softvfp
  91              	delay_micros:
  92              		@ args = 0, pretend = 0, frame = 0
  93              		@ frame_needed = 0, uses_anonymous_args = 0
  94 0048 8022     		movs	r2, #128
  95 004a F0B5     		push	{r4, r5, r6, r7, lr}
  96 004c 0024     		movs	r4, #0
  97 004e 0027     		movs	r7, #0
  98 0050 5326     		movs	r6, #83
  99 0052 0525     		movs	r5, #5
 100 0054 0A4B     		ldr	r3, .L23
 101 0056 800A     		lsrs	r0, r0, #10
 102 0058 5202     		lsls	r2, r2, #9
 103              	.L17:
 104 005a 1F60     		str	r7, [r3]
 105 005c 5E60     		str	r6, [r3, #4]
 106 005e 9F60     		str	r7, [r3, #8]
 107 0060 1D60     		str	r5, [r3]
 108              	.L15:
 109 0062 1968     		ldr	r1, [r3]
 110 0064 1142     		tst	r1, r2
 111 0066 FCD0     		beq	.L15
 112 0068 1C60     		str	r4, [r3]
 113 006a 1C60     		str	r4, [r3]
 114 006c 5E60     		str	r6, [r3, #4]
 115 006e 9C60     		str	r4, [r3, #8]
 116 0070 1D60     		str	r5, [r3]
 117              	.L16:
 118 0072 1968     		ldr	r1, [r3]
 119 0074 1142     		tst	r1, r2
 120 0076 FCD0     		beq	.L16
 121 0078 1C60     		str	r4, [r3]
 122 007a 0138     		subs	r0, r0, #1
 123 007c EDD2     		bcs	.L17
 124              		@ sp needed
 125 007e F0BD     		pop	{r4, r5, r6, r7, pc}
 126              	.L24:
 127              		.align	2
 128              	.L23:
 129 0080 10E000E0 		.word	-536813552
 131              		.align	1
 132              		.p2align 2,,3
 133              		.global	delay_millis
 134              		.syntax unified
 135              		.code	16
 136              		.thumb_func
 137              		.fpu softvfp
 139              	delay_millis:
 140              		@ args = 0, pretend = 0, frame = 0
 141              		@ frame_needed = 0, uses_anonymous_args = 0
 142 0084 10B5     		push	{r4, lr}
 143 0086 4301     		lsls	r3, r0, #5
 144 0088 1B1A     		subs	r3, r3, r0
 145 008a 9B00     		lsls	r3, r3, #2
 146 008c 1818     		adds	r0, r3, r0
 147 008e C000     		lsls	r0, r0, #3
 148 0090 FFF7FEFF 		bl	delay_micros
 149              		@ sp needed
 150 0094 10BD     		pop	{r4, pc}
 152 0096 C046     		.ident	"GCC: (Arch Repository) 8.3.0"
