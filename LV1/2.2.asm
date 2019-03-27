@
@	Uppgift 2.2
@

@	Initiera port D som utport
start:	LDR	R0,=0x55555555
	LDR	R1,=0x40020C00
	STR	R0,[R1]
@ adressen till port D:s ut-dataregister till R1
	LDR	R1,=0x40020C14
@ adressen till port E:s in-dataregister till R2
	LDR	R2,=0x40021010

main: 	LDRB	R0,[R2] @ Läs input till R0
	STRB	R0,[R1] @ Skriv R0 till output
	B	main @ Loopa till main

@ while true:
@	x = input
@	output = x