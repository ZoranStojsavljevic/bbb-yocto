	.globl	omap_smc

omap_smc:
	push	{r4-r12, lr}	@ save registers - ROM code may pollute
				@ our registers
	mov	r12, r0		@ Service
	mov	r0, r1		@ Argument

	dsb
	dmb
@	smc	0		@ SMC #0 to enter monitor mode
				@ call ROM Code API for the service requested
	pop	{r4-r12, pc}
	movs	pc, lr		@ return
