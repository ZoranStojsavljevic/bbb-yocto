## Git kernel helper (standalone kernel handling in Yocto)

### Making standalone kernel in yocto load

For make menuconfig, please use the following bitbake command:

	$ bitbake -c menuconfig virtual/kernel

For make, please use the following bitbake commands:

	$ bitbake -c compile virtual/kernel
	$ bitbake virtual/kernel

### Deleting standalone kernel from yocto load

To delete virtual/kernel, use the following bitbake commands:

	$ bitbake -c clean virtual/kernel
	$ bitbake -c cleansstate virtual/kernel
	$ bitbake -c cleanall virtual/kernel
