@ invstate.asm
main:	lDR	R0,=func1
	BLX	R0
	LDR	R0,=func2
	BLX	R0

	.thumb_func
func1:	BX	LR

func2:	BX	LR
