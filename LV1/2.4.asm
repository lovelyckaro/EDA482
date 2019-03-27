@
@	Uppgift 2.4
@



main:	LDR	R1,=c		@ c -> R1
	LDR	R2,=s		@ s -> R2
	LDR	R3,=0		@ 0  -> R3
	LDRB	R0,[R1,R3]	@ M(R1 + R3) -> R0 (Signed byte)
	STRH	R0,[R2]		@ R0 -> M(R2)
	B	main
	
	.ALIGN
s:	.HWORD	0		@ short s, (signed)
c:	.BYTE	0x80		@ char c, (unsigned)
