### bbb-yocto
Attempt to create one generic Open Source BeagleBone Black armv7 A8 platform reference and testing repository.

### The bash script, customized for the owner's projects purposes (substitutions for the KAS tool)

https://github.com/ZoranStojsavljevic/bbb-yocto/blob/master/bbb-yocto.sh
```
  Step [1]: Look into the script and customize it for your own project;
  Step [2]: Make the script bbb-yocto.sh executable (permissions 755), and execute it: ./bbb-yocto.sh ;
  Step [3]: Run command: source poky/poky/oe-init-build-env ;
  Step [4]: Go to bbb-releases/bbb-warrior/ directory and copy local.conf to .../build/conf directory;
  Step [5]: Run bitbake -k core-image-minimal ## or whatever core-image-? you need
```
### The KAS tool (by example: execute kas warrior script)
```
  Step [1]: Go to bbb-releases/bbb-warrior/ directory and copy kas-bbb-warrior.yml to designated directory for build;
  Step [2]: Execute kas script as: kas build kas-bbb-warrior.yml ## KAS tool should be installed (go to kas/ for documentation).
```
### The testing initramfs BBB image
 Part of the config-initramfs, outlining important part of defconfig (the booting is done solely from initramfs)!
```
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
```
### [WARNING] Only last official YOCTO Release (for now warrior) scripts ARE actively maintained!

https://github.com/ZoranStojsavljevic/bbb-yocto/tree/master/bbb-releases/bbb-warrior
