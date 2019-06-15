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
