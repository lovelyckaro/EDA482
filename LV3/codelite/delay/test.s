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
  94 0048 F0B5     		push	{r4, r5, r6, r7, lr}
  95 004a 441E     		subs	r4, r0, #1
  96 004c 0028     		cmp	r0, #0
  97 004e 18D0     		beq	.L14
  98 0050 8022     		movs	r2, #128
  99 0052 0020     		movs	r0, #0
 100 0054 0027     		movs	r7, #0
 101 0056 5326     		movs	r6, #83
 102 0058 0525     		movs	r5, #5
 103 005a 0A4B     		ldr	r3, .L27
 104 005c 5202     		lsls	r2, r2, #9
 105              	.L18:
 106 005e 1F60     		str	r7, [r3]
 107 0060 5E60     		str	r6, [r3, #4]
 108 0062 9F60     		str	r7, [r3, #8]
 109 0064 1D60     		str	r5, [r3]
 110              	.L16:
 111 0066 1968     		ldr	r1, [r3]
 112 0068 1142     		tst	r1, r2
 113 006a FCD0     		beq	.L16
 114 006c 1860     		str	r0, [r3]
 115 006e 1860     		str	r0, [r3]
 116 0070 5E60     		str	r6, [r3, #4]
 117 0072 9860     		str	r0, [r3, #8]
 118 0074 1D60     		str	r5, [r3]
 119              	.L17:
 120 0076 1968     		ldr	r1, [r3]
 121 0078 1142     		tst	r1, r2
 122 007a FCD0     		beq	.L17
 123 007c 1860     		str	r0, [r3]
 124 007e 013C     		subs	r4, r4, #1
 125 0080 EDD2     		bcs	.L18
 126              	.L14:
 127              		@ sp needed
 128 0082 F0BD     		pop	{r4, r5, r6, r7, pc}
 129              	.L28:
 130              		.align	2
 131              	.L27:
 132 0084 10E000E0 		.word	-536813552
 134              		.align	1
 135              		.p2align 2,,3
 136              		.global	delay_millis
 137              		.syntax unified
 138              		.code	16
 139              		.thumb_func
 140              		.fpu softvfp
 142              	delay_millis:
 143              		@ args = 0, pretend = 0, frame = 0
 144              		@ frame_needed = 0, uses_anonymous_args = 0
 145 0088 10B5     		push	{r4, lr}
 146 008a 4301     		lsls	r3, r0, #5
 147 008c 1B1A     		subs	r3, r3, r0
 148 008e 9B00     		lsls	r3, r3, #2
 149 0090 1818     		adds	r0, r3, r0
 150 0092 C000     		lsls	r0, r0, #3
 151 0094 FFF7FEFF 		bl	delay_micros
 152              		@ sp needed
 153 0098 10BD     		pop	{r4, pc}
 155 009a C046     		.ident	"GCC: (Arch Repository) 8.3.0"
