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

static int __init cp15_test_init(void) {
	unsigned int reg_value = 0;

	printk(KERN_INFO "cp15_Test init\n");
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
	return 0;
}

static void __exit cp15_test_exit(void) {
	unsigned int reg_value = 0;

	printk(KERN_INFO "cp15_Test init\n");
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
	printk(KERN_INFO "cp15_Test exit\n");
}

module_init(cp15_test_init);
module_exit(cp15_test_exit);
