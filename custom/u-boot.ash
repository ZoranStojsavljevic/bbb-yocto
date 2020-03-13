mkimage -n 'Ramdisk Image'  -A arm -O linux -T ramdisk -C gzip -d initramfs.cpio.xz initramfs.cpio.xz.uboot

setenv autoload no
setenv initrd_high 0xffffffff
setenv loadkernel 'tftp 0x82000000 zImage'
setenv loadinitrd 'tftp 0x88080000 initramfs.cpio.xz.uboot; setenv initrd_size ${filesize}'
setenv loadfdt 'tftp 0x88000000 am335x-boneblack.dtb'
setenv bootargs 'console=ttyO0,115200n8 root=/dev/ram0 ip=dhcp'
setenv bootcmd_ram 'dhcp; setenv serverip 192.168.15.2; run loadkernel; run loadinitrd; run loadfdt; bootz 0x82000000 0x88080000 0x88000000'
run bootcmd_ram

setenv fdtfile am335x-boneblack.dtb
setenv bootpart 0:1
setenv bootargs 'console=ttyO0,115200n8 root=/dev/mmcblk0p1 rw rootfstype=ext4 rootwait'
setenv uenvcmd 'run loadimage; run loadfdt; printenv bootargs; bootz ${loadaddr} - ${fdtaddr}'
