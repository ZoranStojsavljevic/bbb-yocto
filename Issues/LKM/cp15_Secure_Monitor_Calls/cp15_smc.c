/*
 *  cp15_smc.c - Demonstrating the Secure Monitor Calls (SMCs) in am335x TI armv7 A8 architecture
 */
#include <linux/module.h>	/* Needed by all modules */
#include <linux/kernel.h>	/* Needed for KERN_INFO */
#include <linux/init.h>		/* Needed for the macros */

MODULE_LICENSE("GPL");						///< The license type -- this affects available functionality
MODULE_AUTHOR("Zoran Stojsavljevic");				///< The author -- visible when you use modinfo
MODULE_DESCRIPTION("An armv7 A8 L2 ECC enabling  driver");	///< The description -- see modinfo
MODULE_VERSION("0.01");						///< A version number to inform users

extern void omap_smc(void);

static void enable_L2_ECC(void) {
	unsigned int reg_value;

	// CRn = C0 within CP15, Opcode_1 = 0
	printk(KERN_INFO "CRn = C0 within CP15, Opcode_1 = 0\n");
	__asm volatile("mrc p15, 0, %0, c0, c0, 0" : "=r"(reg_value) );
	printk(KERN_INFO "Main ID Register: 0x%08x\n", reg_value);

	__asm volatile ("mrc p15, 0, %0, c0, c2, 4" : "=r"(reg_value) );
	printk(KERN_INFO "Instruction Set Attributes Register 4: 0x%08x\n", reg_value);
	if (0x00010000 & reg_value) {
		printk(KERN_INFO "The processor does support DMB, DSB and ISB instructions\n");
	}
	else {
		printk(KERN_INFO "The processor does NOT support DMB, DSB and ISB instructions\n");
	}

	__asm volatile ("mrc p15, 1, %0, c9, c0, 2" : "=r"(reg_value) );
	printk(KERN_INFO "L2 Cache Auxiliary Control Register: 0x%08x\n", reg_value);
	if (0x00200000 & reg_value ) {
		printk(KERN_INFO "The processor is configured to include parity and ECC RAM\n");
	}
	else {
		printk(KERN_INFO "The processor is NOT configured to include parity and ECC RAM\n");
	}

_set_L2_ECC:
	__asm volatile ("mrc p15, 1, %0, c9, c0, 2" : "=r"(reg_value) );	// Read L2 Cache Auxiliary Control Register into R0
//	__asm volatile ("orr r0, r0, #0x00200000");				// Set parity/ECC enable
//	__asm volatile ("mcr p15, 1, r0, c9, c0, 2");				// Write L2 Cache Auxiliary Control Register
//	__asm volatile ("mrc p15, 1, %0, c9, c0, 2" : "=r"(reg_value) );
	if (0x00200000 & reg_value ) {
		printk(KERN_INFO "The processor is configured to include parity and ECC RAM\n");
	}
	else {
		printk(KERN_INFO "The processor is NOT configured to include parity and ECC RAM\n");
	}

	__asm ("stmfd	sp!, {r0 - r4}");		// Save context of R0-R4, which secure monitor call may use
	__asm volatile ("mrc p15, 1, r0, c9, c0, 2");	// Read L2 Cache Auxiliary Control Reg into R0
	__asm ("mov	r1, #0");			// Clear R1
	__asm ("eor	r1, r1, r1");			// xor R1, R1 - clear R1
	__asm ("ldr	r1, =#0x10200000");		// Enable mask for ECC (set bits 21 and 28 to enable ECC)
//	__asm ("movt	r1, #0x1020");			// Enable mask for ECC (set bits 21 and 28 to enable ECC)
	__asm ("orr	r0, r0, r1");			// OR with original register value
	__asm ("ldr	r12, =#0x00000102");		// Setup service ID in R12
//	__asm ("movw	r12, #0x0102");			// Setup service ID in R12
	__asm ("eor	r1, r1, r1");			// xor R1, R1 - clear R1
	__asm volatile ("mcr p15, 0, r1, c7, c5, 6");	// Invalidate entire branch predictor array

	dsb();			// data synchronization barrier operation
	isb();			// instruction synchronization barrier operation
	dmb();			// data memory barrier operation
	omap_smc();
//	__asm ("smc	#1");	// secure monitor call SMC (previously SMI)

	__asm ("ldmfd	sp!, {r0 - r4}");		// After returning from SMC, restore R0-R4
//	__asm ("mov	pc, lr");			// Return: does NOT work as expected, produces kernel panic!

	__asm volatile ("mrc    p15, 1, %0, c9, c0, 2" : "=r"(reg_value) );
	printk(KERN_INFO "L2 Cache Auxiliary Control Register: 0x%08x\n", reg_value);

	return;
}

static int __init cp15_smc_init(void) {
	printk(KERN_INFO "cp15_SMC init\n");
	enable_L2_ECC();
	return 0;
}

static void __exit cp15_smc_exit(void) {
	enable_L2_ECC();
	printk(KERN_INFO "cp15_SMC exit\n");
}

module_init(cp15_smc_init);
module_exit(cp15_smc_exit);
