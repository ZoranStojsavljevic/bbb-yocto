/*
 *  cp15_test.c - Demonstrating the module_init() and module_exit() macros.
 *  This is preferred over using init_module() and cleanup_module().
 */
#include <linux/module.h>	/* Needed by all modules */
#include <linux/kernel.h>	/* Needed for KERN_INFO */
#include <linux/init.h>		/* Needed for the macros */

MODULE_LICENSE("GPL");					///< The license type -- this affects available functionality
MODULE_AUTHOR("Zoran Stojsavljevic");			///< The author -- visible when you use modinfo
MODULE_DESCRIPTION("A simple armv7 A8 test driver");	///< The description -- see modinfo
MODULE_VERSION("0.01");					///< A version number to inform users

static inline unsigned asm_get_cpsr(void) {
	unsigned long retval;

	__asm ("mrs	r0, cpsr");
	__asm ("bic	r0, r0, #0x1f");
	__asm ("orr	r0, r0, #0x16");
	__asm ("msr	cpsr_c, %0" : "=r"(retval) );
	return retval;
}

static int read_cp15_registers(void) {
	unsigned int reg_value;

	// CRn = C0 within CP15, Opcode_1 = 0
	printk(KERN_INFO "CRn = C0 within CP15, Opcode_1 = 0\n");
	asm volatile("mrc p15, 0, %0, c0, c0, 0" : "=r"(reg_value) );
	printk(KERN_INFO "Main ID Register: 0x%08x\n", reg_value);
	asm volatile("mrc p15, 0, %0, c0, c0, 1" : "=r"(reg_value) );
	printk(KERN_INFO "Cache Type Register: 0x%08x\n", reg_value);
	asm volatile("mrc p15, 0, %0, c0, c0, 2" : "=r"(reg_value) );
	printk(KERN_INFO "TCM Type Register: 0x%08x\n", reg_value);
	asm volatile("mrc p15, 0, %0, c0, c0, 3" : "=r"(reg_value) );
	printk(KERN_INFO "TLB Type Register: 0x%08x\n", reg_value);
	asm volatile("mrc p15, 0, %0, c0, c0, 5" : "=r"(reg_value) );
	printk(KERN_INFO "Multiprocessor ID Register: 0x%08x\n", reg_value);
	asm volatile("mrc p15, 0, %0, c0, c1, 0" : "=r"(reg_value) );
	printk(KERN_INFO "Processor Feature Register 0: 0x%08x\n", reg_value);
	asm volatile("mrc p15, 0, %0, c0, c1, 1" : "=r"(reg_value) );
	printk(KERN_INFO "Processor Feature Register 1: 0x%08x\n", reg_value);
	asm volatile("mrc p15, 0, %0, c0, c1, 2" : "=r"(reg_value) );
	printk(KERN_INFO "Debug Feature Register 0: 0x%08x\n", reg_value);
	asm volatile("mrc p15, 0, %0, c0, c1, 3" : "=r"(reg_value) );
	printk(KERN_INFO "Auxiliary Feature Register 0: 0x%08x\n", reg_value);
	asm volatile("mrc p15, 0, %0, c0, c1, 4" : "=r"(reg_value) );
	printk(KERN_INFO "Memory Model Feature Register 0: 0x%08x\n", reg_value);
	asm volatile("mrc p15, 0, %0, c0, c1, 5" : "=r"(reg_value) );
	printk(KERN_INFO "Memory Model Feature Register 1: 0x%08x\n", reg_value);
	asm volatile("mrc p15, 0, %0, c0, c1, 6" : "=r"(reg_value) );
	printk(KERN_INFO "Memory Model Feature Register 2: 0x%08x\n", reg_value);
	asm volatile("mrc p15, 0, %0, c0, c1, 7" : "=r"(reg_value) );
	printk(KERN_INFO "Memory Model Feature Register 3: 0x%08x\n", reg_value);
	asm volatile("mrc p15, 0, %0, c0, c2, 0" : "=r"(reg_value) );
	printk(KERN_INFO "Instruction Set Attributes Register 0: 0x%08x\n", reg_value);
	asm volatile("mrc p15, 0, %0, c0, c2, 1" : "=r"(reg_value) );
	printk(KERN_INFO "Instruction Set Attributes Register 1: 0x%08x\n", reg_value);
	asm volatile("mrc p15, 0, %0, c0, c2, 2" : "=r"(reg_value) );
	printk(KERN_INFO "Instruction Set Attributes Register 2: 0x%08x\n", reg_value);
	asm volatile("mrc p15, 0, %0, c0, c2, 3" : "=r"(reg_value) );
	printk(KERN_INFO "Instruction Set Attributes Register 3: 0x%08x\n", reg_value);
	asm volatile("mrc p15, 0, %0, c0, c2, 4" : "=r"(reg_value) );
	printk(KERN_INFO "Instruction Set Attributes Register 4: 0x%08x\n", reg_value);
	asm volatile("mrc p15, 0, %0, c0, c2, 5" : "=r"(reg_value) );
	printk(KERN_INFO "Instruction Set Attributes Register 5: 0x%08x\n", reg_value);
	asm volatile("mrc p15, 0, %0, c0, c2, 6" : "=r"(reg_value) );
	printk(KERN_INFO "Instruction Set Attributes Register 6: 0x%08x\n", reg_value);
	asm volatile("mrc p15, 0, %0, c0, c2, 7" : "=r"(reg_value) );
	printk(KERN_INFO "Instruction Set Attributes Register 7: 0x%08x\n", reg_value);
	printk(KERN_INFO "\n");

	// CRn = C0 within CP15, Opcode_1 = 1
	printk(KERN_INFO "CRn = C0 within CP15, Opcode_1 = 1\n");
	asm volatile("mrc p15, 1, %0, c0, c0, 1" : "=r"(reg_value) );
	printk(KERN_INFO "Cache Level ID Register: 0x%08x\n", reg_value);
	asm volatile("mrc p15, 1, %0, c0, c0, 7" : "=r"(reg_value) );
	printk(KERN_INFO "Silicon ID Register: 0x%08x\n", reg_value);
	asm volatile("mrc p15, 1, %0, c0, c0, 0" : "=r"(reg_value) );
	printk(KERN_INFO "Cache Size Identification Register: 0x%08x\n", reg_value);
	printk(KERN_INFO "\n");

	// CRn = C0 within CP15, Opcode_1 = 2
	printk(KERN_INFO "CRn = C0 within CP15, Opcode_1 = 2\n");
	asm volatile("mrc p15, 2, %0, c0, c0, 0" : "=r"(reg_value) );
	printk(KERN_INFO "Cache Size Selection Register: 0x%08x\n", reg_value);
	printk(KERN_INFO "\n");

	// CRn = C1 within CP15, Opcode_1 = 0
	printk(KERN_INFO "CRn = C1 within CP15, Opcode_1 = 0\n");
	asm volatile("mrc p15, 0, %0, c1, c0, 0" : "=r"(reg_value) );
	printk(KERN_INFO "Control Register: 0x%08x\n", reg_value);
	asm volatile("mrc p15, 0, %0, c1, c0, 1" : "=r"(reg_value) );
	printk(KERN_INFO "Auxiliary Control Register: 0x%08x\n", reg_value);
	asm volatile("mrc p15, 0, %0, c1, c0, 2" : "=r"(reg_value) );
	printk(KERN_INFO "Coprocessor Access Control Register: 0x%08x\n", reg_value);

	printk(KERN_INFO "------------------------------------------------\n");
	asm volatile("mrs %0, cpsr" : "=r"(reg_value) );
	printk(KERN_INFO "CPSR/R0 value is: 0x%08x\n", reg_value);
	printk(KERN_INFO "CPSR/R0 value is: 0x%08x\n", asm_get_cpsr());
	asm(
		"mrs	r0, cpsr\n\t"
		"bic	r0, r0, #0x1f\n\t"
		"orr	r0, r0, #0x16\n\t"
		"msr	cpsr_c, r0\n\t"
	);

	asm volatile("mrs r0, cpsr");
	asm volatile("bic r0, r0, #0x1f");
	asm volatile("orr r0, r0, #0x16");
	asm volatile("msr cpsr_c, %0" : "=r"(reg_value) );
	printk(KERN_INFO "R0 value is: 0x%08x\n", reg_value);
	asm volatile("mrs %0, cpsr" : "=r"(reg_value) );
	printk(KERN_INFO "NEW CPSR/R0 value is: 0x%08x\n", reg_value);
	printk(KERN_INFO "------------------------------------------------\n");

#if 0
	asm volatile("mrc p15, 0, %0, c1, c1, 0" : "=r"(reg_value) );
	printk(KERN_INFO "Secure Configuration Register data: 0x%08x\n", reg_value);
	asm volatile("mrc p15, 0, %0, c1, c1, 1" : "=r"(reg_value) );
	printk(KERN_INFO "Secure Debug Enable Register: 0x%08x\n", reg_value);
#endif

	asm volatile("mrc p15, 0, %0, c1, c1, 2" : "=r"(reg_value) );
	printk(KERN_INFO "Nonsecure Access Control Register data: 0x%08x\n", reg_value);
	printk(KERN_INFO "\n");

	// CRn = C2 within CP15, Opcode_1 = 0
	printk(KERN_INFO "CRn = C2 within CP15, Opcode_1 = 0\n");
	asm volatile("mrc p15, 0, %0, c2, c0, 0" : "=r"(reg_value) );
	printk(KERN_INFO "Translation Table Base Register: 0x%08x\n", reg_value);
	asm volatile("mrc p15, 0, %0, c2, c0, 1" : "=r"(reg_value) );
	printk(KERN_INFO "Translation Table Base Register 1: 0x%08x\n", reg_value);
	asm volatile("mrc p15, 0, %0, c2, c0, 2" : "=r"(reg_value) );
	printk(KERN_INFO "Translation Table Base Control Register: 0x%08x\n", reg_value);
	printk(KERN_INFO "\n");

	// CRn = C3 within CP15, Opcode_1 = 0
	printk(KERN_INFO "CRn = C3 within CP15, Opcode_1 = 0\n");
	asm volatile("mrc p15, 0, %0, c3, c0, 0" : "=r"(reg_value) );
	printk(KERN_INFO "Domain Access Control Register: 0x%08x\n", reg_value);
	printk(KERN_INFO "\n");

	// CRn = C7 within CP15, Opcode_1 = 0

	// Define DSB() function
	asm volatile("mcr p15, 0, %0, c7, c10, 4" : : "r" (0) : "memory");	// Data Synchronization Barrier (DSB)
	printk(KERN_INFO "Data Synchronization Barrier (DSB) operation\n");

	// Define ISB() function
	asm volatile("mcr p15, 0, %0, c7, c5, 4" : : "r" (0) : "memory");	// Instruction Synchronization Barrier (ISB)
	printk(KERN_INFO "Instruction Synchronization Barrier (ISB) operation\n");

	// Define DMB() function
	asm volatile("mcr p15, 0, %0, c7, c10, 5" : : "r" (0) : "memory");	// Data Memory Barrier (DMB) operation
	printk(KERN_INFO "Data Memory Barrier (DMB) operation\n");
	printk(KERN_INFO "\n");

	// CRn = C9 within CP15, Opcode_1 = 1
	asm volatile ("mrc p15, 1, %0, c9, c0, 2" : "=r"(reg_value) );
	printk(KERN_INFO "L2 Cache Auxiliary Control Register: 0x%08x\n", reg_value);

	return 0;
}

static int __init cp15_test_init(void) {
	printk(KERN_INFO "cp15_Test init\n");
	return read_cp15_registers();
}

static void __exit cp15_test_exit(void) {
	read_cp15_registers();
	printk(KERN_INFO "cp15_Test exit\n");
}

module_init(cp15_test_init);
module_exit(cp15_test_exit);
