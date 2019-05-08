### bbb-yocto
Attempt to create one generic Open Source BeagleBone Black armv7 A8 platform reference and testing repository.

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
