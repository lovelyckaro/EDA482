@
@	binary input to 7 seg output, uppgift 2.8
@


init:		LDR	R0,=0x40020C00
		LDR	R1,=0x55555555
		STR	R1,[R0]		@ D = output
		LDR	R5,=0x40020C14	@ R5 = adress to GPIO_D , b0-7 (Output)
		LDR	R6,=0x40021010	@ R6 = adress to GPIO_E , b0-7 (input)
		LDR	R4,=segCodes	@ R4 = adress to array of segcodes
main:		LDR	R0,[R6]		@ Read from input
		CMP	R0,#16
		BCC	true		@ if R0 < 16 jump to true
false:		MOV	R0,#0		@ Otherwise, 0 to ouput
		STR	R0,[R5]
		B	main		@ Loop back
true:		LDRB	R0,[R4,R0]	@ Read byte from M(R4 + input) = segCodes[input]
		STRB	R0,[R5]		@ Store that byte in output
		B	main		@ Loop back
		.ALIGN
segCodes:	.BYTE	0x3f,0x6,0x5b,0x4f,0x66,0x6d,0x7d,0x7,0x7f,0x6f,0x77,0x7c,0x39,0x5E,0x79,0x71


