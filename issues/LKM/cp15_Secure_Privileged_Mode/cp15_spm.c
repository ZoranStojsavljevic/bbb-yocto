/*
 *  cp15_spm.c - how to read in Secure Privileged Mode (SPM) Secure Configuration Register data
 */
#include <linux/module.h>	/* Needed by all modules */
#include <linux/kernel.h>	/* Needed for KERN_INFO */
#include <linux/init.h>		/* Needed for the macros */

MODULE_LICENSE("GPL");				///< The license type -- this affects available functionality
MODULE_AUTHOR("Zoran Stojsavljevic");		///< The author -- visible when you use modinfo
MODULE_DESCRIPTION("An armv7 A8 test driver");	///< The description -- see modinfo
MODULE_VERSION("0.01");				///< A version number to inform users

static inline unsigned asm_get_cpsr(void) {
	unsigned long retval;

	__asm ("mrs	r0, cpsr");
	__asm ("bic	r0, r0, #0x1f");
	__asm ("orr	r0, r0, #0x16");
	__asm ("msr	cpsr_c, r0");
	__asm ("mrs     r0, cpsr" : "=r"(retval) );
	return retval;
}

static int read_SPM_registers(void) {
	unsigned int reg_value = 0;

	printk(KERN_INFO "------------------------------------------------\n");
	asm volatile("mrs %0, cpsr" : "=r"(reg_value) );
	printk(KERN_INFO "CPSR/R0 value is: 0x%08x\n", reg_value);
	printk(KERN_INFO "NEW CPSR/R0 value using asm_get_cpsr() is: 0x%08x\n", asm_get_cpsr());
#if 0
	asm(
		"mrs	r0, cpsr\n\t"
		"bic	r0, r0, #0x1f\n\t"
		"orr	r0, r0, #0x16\n\t"
		"msr	cpsr_c, r0\n\t"
	);
	asm volatile("mrs %0, cpsr" : "=r"(reg_value) );
	printk(KERN_INFO "NEW CPSR/R0 value using inline_asm is: 0x%08x\n", reg_value);
#endif
	printk(KERN_INFO "------------------------------------------------\n");

	asm volatile("mrc p15, 0, %0, c1, c1, 0" : "=r"(reg_value) );
	printk(KERN_INFO "Secure Configuration Register data: 0x%08x\n", reg_value);
//	asm volatile("mrc p15, 0, %0, c1, c1, 1" : "=r"(reg_value) );
//	printk(KERN_INFO "Secure Debug Enable Register: 0x%08x\n", reg_value);
	printk(KERN_INFO "\n");

	return 0;
}

static int __init cp15_spm_init(void) {
	printk(KERN_INFO "cp15_Test init\n");
	return read_SPM_registers();
}

static void __exit cp15_spm_exit(void) {
	read_SPM_registers();
	printk(KERN_INFO "cp15_Test exit\n");
}

module_init(cp15_spm_init);
module_exit(cp15_spm_exit);
