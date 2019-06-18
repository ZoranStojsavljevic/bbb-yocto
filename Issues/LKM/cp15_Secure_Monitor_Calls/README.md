### TI am335x Sitara armv7 A8 architecture Secure Monitor Calls (still in progress)

In order to solve the issue with Secure Monitor Mode:
https://github.com/ZoranStojsavljevic/bbb-yocto/issues/1

The cp15_smc.c driver (demonstrating the Secure Monitor Calls in am335x TI armv7 A8 architecture) was created.

Unfortunately, still not able to compile/to handle intrinsinc commands:
```
	__dsb();		// data synchronization barrier operation
	__isb();		// instruction synchronization barrier operation
	__dmb();		// data memory barrier operation
	__asm("smc #1");	// secure monitor call SMC (previously SMI)
```
### [Possibility] Hidden arm ROOT/Superuser Supervisor mode handling by armv7 A8 (most likely by A9 and A15) arhhitecture

It seems that there are two distinct HW modes dealing with root/superuser:
[1] Executing in user space as root/superuser;
[2] Executing in kernel space as only possible root/superuser!

These two modes stay different. One mode is still arm User mode (despite being root/superuser), another is (kernel device driver) Supervisor mode!

[1] Executing in user space as root/superuser:
```
#include <stdio.h>

#include <linux/module.h>	/* Needed by all modules */
#include <linux/kernel.h>	/* Needed for KERN_INFO */
// #include <linux/init.h>		/* Needed for the macros */

void asm_read_attr_reg4(void) {
	unsigned int reg_value;

	printf("Start\n");
	asm volatile ("mrc p15, 0, r0, c0, c2, 4" : "=r"(reg_value) );
	printf("Instruction Set Attributes Register 4: 0x%08x\n", reg_value);
	if (0x000f0000 & reg_value) {
		printf("The processor does support DMB, DSB and ISB instructions\n");
	}
	else {
		printf("The processor does NOT support DMB, DSB and ISB instructions\n");
	}
}

void main(void) {
	asm_read_attr_reg4();
}
```
[2] And the same code adopted as device driver!

Since [1] for the instruction:
```
	asm volatile ("mrc p15, 0, r0, c0, c2, 4" : "=r"(reg_value) );
```
Produces message: Illegal instruction!
