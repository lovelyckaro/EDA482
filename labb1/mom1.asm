@
@	mom1.asm, uppgift 1.1 - 1.2
@

start:	LDR	R0,=0x55555555
	LDR	R1,=0x40020C00	
	STR	R0,[R1]		 
	
	LDR	R1,=0x40020C14	@ Adress to GPIO_D, b0-7
	LDR	R2,=0x40021010	@ Adress to GPIO_E, b0-7

main:	LDR	R0,[R2]
	STR	R0,[R1]
	B	main
