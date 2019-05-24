/*
 *  p15_test.c - Demonstrating the module_init() and module_exit() macros.
 *  This is preferred over using init_module() and cleanup_module().
 */
#include <linux/module.h>	/* Needed by all modules */
#include <linux/kernel.h>	/* Needed for KERN_INFO */
#include <linux/init.h>		/* Needed for the macros */

MODULE_LICENSE("GPL");                                ///< The license type -- this affects available functionality
MODULE_AUTHOR("Zoran Stojsavljevic");                 ///< The author -- visible when you use modinfo
MODULE_DESCRIPTION("A simple armv7 A8 test driver");  ///< The description -- see modinfo
MODULE_VERSION("0.01");                               ///< A version number to inform users

static int __init p15_test_init(void) {
        unsigned int reg_value = 0;

	printk(KERN_INFO "p15_Test init\n");
	asm volatile("mrc p15, 0, %0, c0, c0, 0" : "=r"(reg_value) );
	printk(KERN_INFO "reg_value: %x\n", reg_value);
	return 0;
}

static void __exit p15_test_exit(void) {
	unsigned int reg_value = 0;

	asm volatile("mrc p15, 0, %0, c0, c0, 0" : "=r"(reg_value) );
	printk(KERN_INFO "reg_value: %x\n", reg_value);
	printk(KERN_INFO "p15_Test exit\n");
}

module_init(p15_test_init);
module_exit(p15_test_exit);
