.arch_extension sec

.globl	omap_smc

omap_smc:
	push	{r4-r12, lr}	@ save registers - ROM code may pollute
				@ our registers
	mov	r6, #0xFF	@ Indicate new Task call
	mov	r12, #0x00	@ Secure Service ID in R12

	dsb
	dmb
	smc	0		@ SMC #0 to enter monitor mode

	b	omap_smc_sec_end @ exit at end of the service execution
	nop

	@ In case of IRQ happening in Secure, then ARM will branch here.
	@ At that moment, IRQ will be pending and ARM will jump to Non Secure
	@ IRQ handler
	mov	r12, #0xFE

	dsb
	dmb
	smc	0		@ SMC #0 to enter monitor mode

omap_smc_sec_end:
	pop	{r4-r12, pc}
