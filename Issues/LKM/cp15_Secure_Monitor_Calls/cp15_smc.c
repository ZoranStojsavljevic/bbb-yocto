/*
 *  cp15_smc.c - Demonstrating the Secure Monitor Calls (SMCs) in am335x TI armv7 A8 architecture.
 */
#include <linux/module.h>	/* Needed by all modules */
#include <linux/kernel.h>	/* Needed for KERN_INFO */
#include <linux/init.h>		/* Needed for the macros */

MODULE_LICENSE("GPL");						///< The license type -- this affects available functionality
MODULE_AUTHOR("Zoran Stojsavljevic");				///< The author -- visible when you use modinfo
MODULE_DESCRIPTION("An armv7 A8 L2 ECC enabling  driver");	///< The description -- see modinfo
MODULE_VERSION("0.01");						///< A version number to inform users

#if 0 // These definitions are wrong, but I still keep them here until I solve the problem
void __dsb(/*constant*/ unsigned int);
void __isb(/*constant*/ unsigned int);
void __dmb(/*constant*/ unsigned int);

// void volatile __DSB( void );
// void volatile __ISB( void );
// void volatile __DMB( void );
#endif

static inline void asm_enable_L2_ECC(void) {
	unsigned int reg_value;

	asm volatile("mrc p15, 0, %0, c0, c2, 4" : "=r"(reg_value) );
	printk(KERN_INFO "Instruction Set Attributes Register 4: 0x%08x\n", reg_value);
	if (0x000f0000 & reg_value) {
		printk(KERN_INFO "The processor does support DMB, DSB and ISB instructions\n");
	}
	else {
		printk(KERN_INFO "The processor does NOT support DMB, DSB and ISB instructions\n");
		return;
	}

	__asm ("stmfd	sp!, {r0 - r4}");		// save contextof R0-R4,which secure monitor call may use
	__asm ("mrc	p15, #1, r0, c9, c0, #2");	// Read L2 Cache Auxiliary Control Reg into R0
	__asm ("mov	r1, #0");			// Clear R1
	__asm ("eor	r1, r1, r1");			// xor R1, R1 - clear R1
	__asm ("ldr	r1, =#0x10200000");		// enable mask for ECC (set bits 21 and 28 to enable ECC)
//	__asm ("movt	r1, #0x1020");			// enable mask for ECC (set bits 21 and 28 to enable ECC)
	__asm ("orr	r0, r0, r1");			// OR with original register value
	__asm ("ldr	r12, =#0x00000102");		// setup service ID in R12
//	__asm ("movw	r12, #0x0102");			// setup service ID in R12
	__asm ("mcr	p15, #0, r1, c7, c5, #6");	// invalidate entire branch predictor array

#if 0
	__dsb(15);
	__isb(15);
	__dmb(15);

// #if 0
//	__asm ("dsb" : : : "memory");			// data synchronization barrier operation
//	__asm ("isb" : : : "memory");			// instruction synchronization barrier operation
//	__asm ("dmb" : : : "memory");			// data memory barrier operation
//	__asm ("smc #1");				// secure monitor call SMC (previously SMI)
#endif

	__asm ("ldmfd	sp!, {r0 - r4}");		// after returning from SMC, restore R0-R4
//	__asm ("mov	pc, lr");			// return: does NOT work as expected, produces kernel panic!
	printk(KERN_INFO "Thread pass checkpoint\n");   // ensure that the unrolling is done correctly

	return;
}

static int __init cp15_smc_init(void) {
	printk(KERN_INFO "cp15_SMC init\n");
	asm_enable_L2_ECC();
	return 0;
}

static void __exit cp15_smc_exit(void) {
	asm_enable_L2_ECC();
	printk(KERN_INFO "cp15_SMC exit\n");
}

module_init(cp15_smc_init);
module_exit(cp15_smc_exit);
