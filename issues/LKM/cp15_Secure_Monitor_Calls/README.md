### TI am335x Sitara armv7 A8 architecture Secure Monitor Calls (IN Progress)

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
Also, the following code, derived from U-Boot:
...u-boot/arch/arm/mach-omap2/lowlevel_init.S

Does not bring the resolution:
```
omap_smc:
	push	{r4-r12, lr}	@ save registers - ROM code may pollute
				@ our registers
	mov	r12, r0		@ Service
	mov	r0, r1		@ Argument

	dsb
	dmb
	smc	0		@ SMC #0 to enter monitor mode
				@ call ROM Code API for the service requested
	pop	{r4-r12, pc}
	movs	pc, lr @ return
```
Since, while compiling it with newest Makefile (executed natively on the target), it produces the following results:
```
	root@beaglebone:~/projects/LKM/cp15_smc# make all
	make -C /lib/modules/5.0.15-jumpnow/build M=/home/root/projects/LKM/cp15_smc modules
	make[1]: Entering directory '/lib/modules/5.0.15-jumpnow/build'
	  AS [M]  /home/root/projects/LKM/cp15_smc/omap_smc.o
	/home/root/projects/LKM/cp15_smc/omap_smc.S: Assembler messages:
	/home/root/projects/LKM/cp15_smc/omap_smc.S:11: Error: selected processor does not support `smc 0' in ARM mode
	make[2]: *** [scripts/Makefile.build:367: /home/root/projects/LKM/cp15_smc/omap_smc.o] Error 1
	make[1]: *** [Makefile:1577: _module_/home/root/projects/LKM/cp15_smc] Error 2
	make[1]: Leaving directory '/lib/modules/5.0.15-jumpnow/build'
	make: *** [Makefile:5: all] Error 2
	root@beaglebone:~/projects/LKM/cp15_smc# 
```
### Hidden arm ROOT/Superuser Supervisor mode handling by armv7 A8 (most likely by A9 and A15) arhhitecture

There are two distinct HW modes dealing with root/superuser:
[1] Executing in user space as root/superuser;
[2] Executing in kernel space as only possible root/superuser.

These two modes are different. One mode is still arm User mode (despite being root/superuser), another is (kernel device driver) arm Supervisor mode!

[1] Executing in user space as root/superuser:
```
#include <stdio.h>

#include <linux/module.h>	/* Needed by all modules */
#include <linux/kernel.h>	/* Needed for KERN_INFO */
// #include <linux/init.h>		/* Needed for the macros */

void asm_read_attr_reg4(void) {
	unsigned int reg_value;

	printf("Start\n");
	asm volatile ("mrc p15, 0, %0, c0, c2, 4" : "=r"(reg_value) );
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
	asm volatile ("mrc p15, 0, %0, c0, c2, 4" : "=r"(reg_value) );
```
Produces message: Illegal instruction!
