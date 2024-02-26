The following issue from hardknott onwards (for defconfig files):
https://github.com/ZoranStojsavljevic/bbb-yocto/issues/4

Missing the following directory in the YOCTO tree!
https://git.ti.com/cgit/processor-firmware/ti-amx3-cm3-pm-firmware/

For the releases:

	defconfig.hardknott
	defconfig.kirkstone
	defconfig.langdale
	defconfig.mickledore
	defconfig.nanbield

Issue is described @ the following pointer:
https://archlinuxarm.org/forum/viewtopic.php?f=60&t=15933

CONFIG_EXTRA_FIRMWARE is set to empty string:

	#
	# Firmware loader
	#
	CONFIG_FW_LOADER=y
	CONFIG_FW_LOADER_PAGED_BUF=y
	CONFIG_FW_LOADER_SYSFS=y
====>>	CONFIG_EXTRA_FIRMWARE=""
	CONFIG_FW_LOADER_USER_HELPER=y
	# CONFIG_FW_LOADER_USER_HELPER_FALLBACK is not set
	# CONFIG_FW_LOADER_COMPRESS is not set
	CONFIG_FW_CACHE=y
	# CONFIG_FW_UPLOAD is not set
	# end of Firmware loader

Instead to:

CONFIG_EXTRA_FIRMWARE="regulatory.db regulatory.db.p7s am335x-pm-firmware.elf am335x-bone-scale-data.bin am335x-evm-scale-data.bin am43x-evm-scale-data.bin"
CONFIG_EXTRA_FIRMWARE_DIR="/usr/lib/firmware"

Because of this fact, the following compression does not work: LZO.

	|   SORTTAB vmlinux
	|   OBJCOPY arch/arm/boot/Image
	|   Kernel: arch/arm/boot/Image is ready
	|   LDS     arch/arm/boot/compressed/vmlinux.lds
	|   AS      arch/arm/boot/compressed/head.o
	|   LZO     arch/arm/boot/compressed/piggy_data
	| /bin/sh: 1: lzop: not found
	|   CC      arch/arm/boot/compressed/misc.o
	| make[2]: *** [/home/zoran.s/projects/github/yocto/test/bbb-yocto/poky/build/tmp/work-shared/beaglebone/kernel-source/arch/arm/boot/compressed/Makefile:161: arch/arm/boot/compressed/piggy_data] Error 127
	| make[2]: *** Deleting file 'arch/arm/boot/compressed/piggy_data'
	| make[2]: *** Waiting for unfinished jobs....
	| make[1]: *** [/home/zoran.s/projects/github/yocto/test/bbb-yocto/poky/build/tmp/work-shared/beaglebone/kernel-source/arch/arm/boot/Makefile:64: arch/arm/boot/compressed/vmlinux] Error 2
	| make: *** [/home/zoran.s/projects/github/yocto/test/bbb-yocto/poky/build/tmp/work-shared/beaglebone/kernel-source/arch/arm/Makefile:312: zImage] Error 2

So, the LZ4 compression is one chosen onwards, until Yocto crew does not fix the issue!
