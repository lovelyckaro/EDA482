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
  25              		.file 1 "/home/love/Documents/skola/EDA482/LV5/C/flipflop_irq_erik/startup.c"
   1:/home/love/Documents/skola/EDA482/LV5/C/flipflop_irq_erik/startup.c **** /*
   2:/home/love/Documents/skola/EDA482/LV5/C/flipflop_irq_erik/startup.c ****  * 	startup.c
   3:/home/love/Documents/skola/EDA482/LV5/C/flipflop_irq_erik/startup.c ****  *  
   4:/home/love/Documents/skola/EDA482/LV5/C/flipflop_irq_erik/startup.c ****  */
   5:/home/love/Documents/skola/EDA482/LV5/C/flipflop_irq_erik/startup.c **** #include "libGPIO.h"
   6:/home/love/Documents/skola/EDA482/LV5/C/flipflop_irq_erik/startup.c **** #include <stdint.h>
   7:/home/love/Documents/skola/EDA482/LV5/C/flipflop_irq_erik/startup.c **** 
   8:/home/love/Documents/skola/EDA482/LV5/C/flipflop_irq_erik/startup.c **** void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );
   9:/home/love/Documents/skola/EDA482/LV5/C/flipflop_irq_erik/startup.c **** 
  10:/home/love/Documents/skola/EDA482/LV5/C/flipflop_irq_erik/startup.c **** void startup ( void )
  11:/home/love/Documents/skola/EDA482/LV5/C/flipflop_irq_erik/startup.c **** {
  26              		.loc 1 11 1
  27              		.cfi_startproc
  28              		@ Naked Function: prologue and epilogue provided by programmer.
  29              		@ args = 0, pretend = 0, frame = 0
  30              		@ frame_needed = 1, uses_anonymous_args = 0
  12:/home/love/Documents/skola/EDA482/LV5/C/flipflop_irq_erik/startup.c **** asm volatile(
  31              		.loc 1 12 1
  32              		.syntax divided
  33              	@ 12 "/home/love/Documents/skola/EDA482/LV5/C/flipflop_irq_erik/startup.c" 1
  34 0000 0248     		 LDR R0,=0x2001C000
  35 0002 8546     	 MOV SP,R0
  36 0004 FFF7FEFF 	 BL main
  37 0008 FEE7     	.L1: B .L1
  38              	
  39              	@ 0 "" 2
  13:/home/love/Documents/skola/EDA482/LV5/C/flipflop_irq_erik/startup.c **** 	" LDR R0,=0x2001C000\n"		/* set stack */
  14:/home/love/Documents/skola/EDA482/LV5/C/flipflop_irq_erik/startup.c **** 	" MOV SP,R0\n"
  15:/home/love/Documents/skola/EDA482/LV5/C/flipflop_irq_erik/startup.c **** 	" BL main\n"				/* call main */
  16:/home/love/Documents/skola/EDA482/LV5/C/flipflop_irq_erik/startup.c **** 	".L1: B .L1\n"				/* never return */
  17:/home/love/Documents/skola/EDA482/LV5/C/flipflop_irq_erik/startup.c **** 	) ;
  18:/home/love/Documents/skola/EDA482/LV5/C/flipflop_irq_erik/startup.c **** }
  40              		.loc 1 18 1
  41              		.thumb
  42              		.syntax unified
  43 000a C046     		nop
  44              		.cfi_endproc
  45              	.LFE0:
  47              		.bss
  48              		.align	2
  49              	count:
  50 0000 00000000 		.space	4
  52              		.text
  53              		.align	1
  54              		.global	exti3_irq_handler
  55              		.syntax unified
  56              		.code	16
  57              		.thumb_func
  58              		.fpu softvfp
  60              	exti3_irq_handler:
  61              	.LFB1:
  19:/home/love/Documents/skola/EDA482/LV5/C/flipflop_irq_erik/startup.c **** 
  20:/home/love/Documents/skola/EDA482/LV5/C/flipflop_irq_erik/startup.c **** #define SYSCFG_EXTICR1 0x40013808
  21:/home/love/Documents/skola/EDA482/LV5/C/flipflop_irq_erik/startup.c **** #define EXTI_RTSR 0x40013C08
  22:/home/love/Documents/skola/EDA482/LV5/C/flipflop_irq_erik/startup.c **** #define EXTI_FTSR 0x40013C0C
  23:/home/love/Documents/skola/EDA482/LV5/C/flipflop_irq_erik/startup.c **** #define EXTI_IMR 0x40013C00
  24:/home/love/Documents/skola/EDA482/LV5/C/flipflop_irq_erik/startup.c **** 
  25:/home/love/Documents/skola/EDA482/LV5/C/flipflop_irq_erik/startup.c **** static volatile int count;
  26:/home/love/Documents/skola/EDA482/LV5/C/flipflop_irq_erik/startup.c **** 
  27:/home/love/Documents/skola/EDA482/LV5/C/flipflop_irq_erik/startup.c **** void exti3_irq_handler(void){
  62              		.loc 1 27 29
  63              		.cfi_startproc
  64              		@ args = 0, pretend = 0, frame = 0
  65              		@ frame_needed = 1, uses_anonymous_args = 0
  66 0000 80B5     		push	{r7, lr}
  67              		.cfi_def_cfa_offset 8
  68              		.cfi_offset 7, -8
  69              		.cfi_offset 14, -4
  70 0002 00AF     		add	r7, sp, #0
  71              		.cfi_def_cfa_register 7
  28:/home/love/Documents/skola/EDA482/LV5/C/flipflop_irq_erik/startup.c **** 	count++;
  72              		.loc 1 28 7
  73 0004 064B     		ldr	r3, .L3
  74 0006 1B68     		ldr	r3, [r3]
  75 0008 5A1C     		adds	r2, r3, #1
  76 000a 054B     		ldr	r3, .L3
  77 000c 1A60     		str	r2, [r3]
  29:/home/love/Documents/skola/EDA482/LV5/C/flipflop_irq_erik/startup.c **** 	*((unsigned int *) 0x40013C14) |= 8;
  78              		.loc 1 29 33
  79 000e 054B     		ldr	r3, .L3+4
  80 0010 1A68     		ldr	r2, [r3]
  81 0012 044B     		ldr	r3, .L3+4
  82 0014 0821     		movs	r1, #8
  83 0016 0A43     		orrs	r2, r1
  84 0018 1A60     		str	r2, [r3]
  30:/home/love/Documents/skola/EDA482/LV5/C/flipflop_irq_erik/startup.c **** }
  85              		.loc 1 30 1
  86 001a C046     		nop
  87 001c BD46     		mov	sp, r7
  88              		@ sp needed
  89 001e 80BD     		pop	{r7, pc}
  90              	.L4:
  91              		.align	2
  92              	.L3:
  93 0020 00000000 		.word	count
  94 0024 143C0140 		.word	1073822740
  95              		.cfi_endproc
  96              	.LFE1:
  98              		.align	1
  99              		.global	app_init
 100              		.syntax unified
 101              		.code	16
 102              		.thumb_func
 103              		.fpu softvfp
 105              	app_init:
 106              	.LFB2:
  31:/home/love/Documents/skola/EDA482/LV5/C/flipflop_irq_erik/startup.c **** 
  32:/home/love/Documents/skola/EDA482/LV5/C/flipflop_irq_erik/startup.c **** void app_init (void){
 107              		.loc 1 32 21
 108              		.cfi_startproc
 109              		@ args = 0, pretend = 0, frame = 0
 110              		@ frame_needed = 1, uses_anonymous_args = 0
 111 0028 80B5     		push	{r7, lr}
 112              		.cfi_def_cfa_offset 8
 113              		.cfi_offset 7, -8
 114              		.cfi_offset 14, -4
 115 002a 00AF     		add	r7, sp, #0
 116              		.cfi_def_cfa_register 7
  33:/home/love/Documents/skola/EDA482/LV5/C/flipflop_irq_erik/startup.c **** 	GPIO_clock_start();
 117              		.loc 1 33 2
 118 002c FFF7FEFF 		bl	GPIO_clock_start
  34:/home/love/Documents/skola/EDA482/LV5/C/flipflop_irq_erik/startup.c **** 	GPIO_D->moder = 0x00005555;
 119              		.loc 1 34 8
 120 0030 174B     		ldr	r3, .L6
 121              		.loc 1 34 16
 122 0032 184A     		ldr	r2, .L6+4
 123 0034 1A60     		str	r2, [r3]
  35:/home/love/Documents/skola/EDA482/LV5/C/flipflop_irq_erik/startup.c **** 	
  36:/home/love/Documents/skola/EDA482/LV5/C/flipflop_irq_erik/startup.c **** 	*((unsigned int *) SYSCFG_EXTICR1) &= ~0xF000;
 124              		.loc 1 36 37
 125 0036 184B     		ldr	r3, .L6+8
 126 0038 1A68     		ldr	r2, [r3]
 127 003a 174B     		ldr	r3, .L6+8
 128 003c 1749     		ldr	r1, .L6+12
 129 003e 0A40     		ands	r2, r1
 130 0040 1A60     		str	r2, [r3]
  37:/home/love/Documents/skola/EDA482/LV5/C/flipflop_irq_erik/startup.c **** 	*((unsigned int *) SYSCFG_EXTICR1) |= 0x4000; //sätt PE3 -> EXTI3
 131              		.loc 1 37 37
 132 0042 154B     		ldr	r3, .L6+8
 133 0044 1A68     		ldr	r2, [r3]
 134 0046 144B     		ldr	r3, .L6+8
 135 0048 8021     		movs	r1, #128
 136 004a C901     		lsls	r1, r1, #7
 137 004c 0A43     		orrs	r2, r1
 138 004e 1A60     		str	r2, [r3]
  38:/home/love/Documents/skola/EDA482/LV5/C/flipflop_irq_erik/startup.c **** 	
  39:/home/love/Documents/skola/EDA482/LV5/C/flipflop_irq_erik/startup.c **** 	*((unsigned int *) EXTI_IMR) |= 8; //EXTI_IMR
 139              		.loc 1 39 31
 140 0050 134B     		ldr	r3, .L6+16
 141 0052 1A68     		ldr	r2, [r3]
 142 0054 124B     		ldr	r3, .L6+16
 143 0056 0821     		movs	r1, #8
 144 0058 0A43     		orrs	r2, r1
 145 005a 1A60     		str	r2, [r3]
  40:/home/love/Documents/skola/EDA482/LV5/C/flipflop_irq_erik/startup.c **** 	*((unsigned int *) EXTI_FTSR) &= ~8; //Deaktivera neg. flank
 146              		.loc 1 40 32
 147 005c 114B     		ldr	r3, .L6+20
 148 005e 1A68     		ldr	r2, [r3]
 149 0060 104B     		ldr	r3, .L6+20
 150 0062 0821     		movs	r1, #8
 151 0064 8A43     		bics	r2, r1
 152 0066 1A60     		str	r2, [r3]
  41:/home/love/Documents/skola/EDA482/LV5/C/flipflop_irq_erik/startup.c **** 	*((unsigned int *) EXTI_RTSR) |= 8; //Aktivera pos. flank
 153              		.loc 1 41 32
 154 0068 0F4B     		ldr	r3, .L6+24
 155 006a 1A68     		ldr	r2, [r3]
 156 006c 0E4B     		ldr	r3, .L6+24
 157 006e 0821     		movs	r1, #8
 158 0070 0A43     		orrs	r2, r1
 159 0072 1A60     		str	r2, [r3]
  42:/home/love/Documents/skola/EDA482/LV5/C/flipflop_irq_erik/startup.c **** 	
  43:/home/love/Documents/skola/EDA482/LV5/C/flipflop_irq_erik/startup.c **** 	*((void (**) (void)) 0x2001C064) = exti3_irq_handler;
 160              		.loc 1 43 2
 161 0074 0D4B     		ldr	r3, .L6+28
 162              		.loc 1 43 35
 163 0076 0E4A     		ldr	r2, .L6+32
 164 0078 1A60     		str	r2, [r3]
  44:/home/love/Documents/skola/EDA482/LV5/C/flipflop_irq_erik/startup.c **** 	
  45:/home/love/Documents/skola/EDA482/LV5/C/flipflop_irq_erik/startup.c **** 	*((unsigned int *) 0xE000E100) |= (1<<9);
 165              		.loc 1 45 33
 166 007a 0E4B     		ldr	r3, .L6+36
 167 007c 1A68     		ldr	r2, [r3]
 168 007e 0D4B     		ldr	r3, .L6+36
 169 0080 8021     		movs	r1, #128
 170 0082 8900     		lsls	r1, r1, #2
 171 0084 0A43     		orrs	r2, r1
 172 0086 1A60     		str	r2, [r3]
  46:/home/love/Documents/skola/EDA482/LV5/C/flipflop_irq_erik/startup.c **** }
 173              		.loc 1 46 1
 174 0088 C046     		nop
 175 008a BD46     		mov	sp, r7
 176              		@ sp needed
 177 008c 80BD     		pop	{r7, pc}
 178              	.L7:
 179 008e C046     		.align	2
 180              	.L6:
 181 0090 000C0240 		.word	1073875968
 182 0094 55550000 		.word	21845
 183 0098 08380140 		.word	1073821704
 184 009c FF0FFFFF 		.word	-61441
 185 00a0 003C0140 		.word	1073822720
 186 00a4 0C3C0140 		.word	1073822732
 187 00a8 083C0140 		.word	1073822728
 188 00ac 64C00120 		.word	536985700
 189 00b0 00000000 		.word	exti3_irq_handler
 190 00b4 00E100E0 		.word	-536813312
 191              		.cfi_endproc
 192              	.LFE2:
 194              		.align	1
 195              		.global	main
 196              		.syntax unified
 197              		.code	16
 198              		.thumb_func
 199              		.fpu softvfp
 201              	main:
 202              	.LFB3:
  47:/home/love/Documents/skola/EDA482/LV5/C/flipflop_irq_erik/startup.c **** 
  48:/home/love/Documents/skola/EDA482/LV5/C/flipflop_irq_erik/startup.c **** int main(void)
  49:/home/love/Documents/skola/EDA482/LV5/C/flipflop_irq_erik/startup.c **** {
 203              		.loc 1 49 1
 204              		.cfi_startproc
 205              		@ args = 0, pretend = 0, frame = 0
 206              		@ frame_needed = 1, uses_anonymous_args = 0
 207 00b8 80B5     		push	{r7, lr}
 208              		.cfi_def_cfa_offset 8
 209              		.cfi_offset 7, -8
 210              		.cfi_offset 14, -4
 211 00ba 00AF     		add	r7, sp, #0
 212              		.cfi_def_cfa_register 7
  50:/home/love/Documents/skola/EDA482/LV5/C/flipflop_irq_erik/startup.c ****     app_init();
 213              		.loc 1 50 5
 214 00bc FFF7FEFF 		bl	app_init
 215              	.L9:
  51:/home/love/Documents/skola/EDA482/LV5/C/flipflop_irq_erik/startup.c ****     while(1) {
  52:/home/love/Documents/skola/EDA482/LV5/C/flipflop_irq_erik/startup.c ****         GPIO_D->odr_low = count;
 216              		.loc 1 52 25 discriminator 1
 217 00c0 024B     		ldr	r3, .L10
 218 00c2 1A68     		ldr	r2, [r3]
 219              		.loc 1 52 15 discriminator 1
 220 00c4 024B     		ldr	r3, .L10+4
 221              		.loc 1 52 25 discriminator 1
 222 00c6 D2B2     		uxtb	r2, r2
 223 00c8 1A75     		strb	r2, [r3, #20]
 224 00ca F9E7     		b	.L9
 225              	.L11:
 226              		.align	2
 227              	.L10:
 228 00cc 00000000 		.word	count
 229 00d0 000C0240 		.word	1073875968
 230              		.cfi_endproc
 231              	.LFE3:
 233              	.Letext0:
 234              		.file 2 "/usr/arm-none-eabi/include/machine/_default_types.h"
 235              		.file 3 "/usr/arm-none-eabi/include/sys/_stdint.h"
 236              		.file 4 "/home/love/Documents/skola/EDA482/libs/include/libGPIO.h"
