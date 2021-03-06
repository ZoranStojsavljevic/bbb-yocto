### This repository is written to support BBB initramfs testing
Attempt to create one generic Open Source BeagleBone Black armv7 A8 platform reference and testing repository.
The YOCTO BeagleBobe Black YOCTO repo used is described @ the following net pointer:

https://jumpnowtek.com/beaglebone/BeagleBone-Systems-with-Yocto.html

### The bash script, customized for the owner's projects purposes (substitutions for the KAS tool)
https://github.com/ZoranStojsavljevic/bbb-yocto/blob/master/yocto-setup.sh

Please, follow the strict rules outlined below!

	Step [1]: Look into the script yocto-setup.sh and customize it for your own project
	Step [2]: Make the script yocto-setup.sh executable (permissions 755), and execute it:
		# . ./yocto-setup.sh <yocto_release>
	or
		# source ./yocto-setup.sh <yocto_release>
	Step [3]: After script executes, it'll be in build/ directory/ Please, check upon build/conf/ dir.
	Step [4]: Run in build/ bitbake -k core-image-minimal (or whatever core-image-? required)

### KAS tool passive comments, not tested (by example: execute kas warrior script)

	Step [1]: Go to bbb-releases/bbb-warrior/ directory and copy kas-bbb-warrior.yml to designated directory for build
	Step [2]: Execute kas script as: kas build kas-bbb-warrior.yml ## KAS tool should be installed (go to kas/ for documentation)

### The test initramfs BBB image description
 Part of the config-initramfs, outlining important part of defconfig (the booting is done solely from initramfs)!

	CONFIG_BLK_DEV_INITRD=y
	CONFIG_RD_GZIP=y
	CONFIG_RD_BZIP2=y
	CONFIG_RD_LZMA=y
	CONFIG_RD_XZ=y
	CONFIG_RD_LZ4=y
	CONFIG_RD_LZO=y
	CONFIG_BLK_DEV_RAM=y
	CONFIG_BLK_DEV_RAM_COUNT=16
	CONFIG_BLK_DEV_RAM_SIZE=16384

### [WARNING] Only last three official YOCTO Releases are actively maintained/supported!

Host Linux distro used: Fedora 33

https://github.com/ZoranStojsavljevic/bbb-yocto/tree/master/bbb-releases/bbb-dunfell

Status: Works

https://github.com/ZoranStojsavljevic/bbb-yocto/tree/master/bbb-releases/bbb-gatesgarth

Status: Works

https://github.com/ZoranStojsavljevic/bbb-yocto/tree/master/bbb-releases/bbb-hardknott

Status: Works

	NOTE: ## "dhcp": obsolete from gatesgarth release, functionally replaced by "dhcpcd" and "kea"
	Please, read http://git.yoctoproject.org/cgit.cgi/poky/tree/documentation/ref-manual/migration-3.2.rst

### Referent YOCTO Poky BeagleBone distro is also supported:
git clone https://git.yoctoproject.org/git/poky.git
