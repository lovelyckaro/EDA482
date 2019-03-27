@@	Uppgift 2.3@
			
			@ short s
			@ char c
main:	LDR	R1,=i	@ R1 = pekare till s
	LDR	R2,=s	@ R2 = pekare till c
	LDR	R0,[R1] @ R0 = Minnesinnehållet R1 pekar på
	STRH	R0,[R2]	@ Minnesinnehållet R2 pekar på = Innehållet i R0
	B	main	@ Loop back to main

	.ALIGN
i:	.WORD	0x3E000
s:	.HWORD	0x0000
