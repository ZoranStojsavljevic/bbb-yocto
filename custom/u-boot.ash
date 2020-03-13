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

=> setenv fdtfile am335x-boneblack.dtb
=> setenv bootpart 0:1
=> setenv bootargs 'console=ttyO0,115200n8 root=/dev/mmcblk0p1 rw rootfstype=ext4 rootwait'
=> setenv uenvcmd 'run loadimage; run loadfdt; printenv bootargs; bootz ${loadaddr} - ${fdtaddr}'
=> run uenvcmd
loading /am335x-boneblack.dtb ...
bootargs=console=ttyO0,115200n8 root=/dev/mmcblk0p1 rw rootfstype=ext4 rootwait
=> bootz
=> run bootz
## Error: "bootz" not defined
=> boot
board_name=[A335BNLT] ...
board_rev=[0A5C] ...
switch to partitions #0, OK
mmc0 is current device
SD/MMC found on device 0
Running uenvcmd ...
loading /am335x-boneblack.dtb ...
bootargs=console=ttyO0,115200n8 root=/dev/mmcblk0p1 rw rootfstype=ext4 rootwait
switch to partitions #0, OK
mmc0 is current device
Scanning mmc 0:1...
gpio: pin 56 (gpio 56) value is 0
gpio: pin 55 (gpio 55) value is 0
gpio: pin 54 (gpio 54) value is 0
gpio: pin 53 (gpio 53) value is 1
switch to partitions #0, OK
mmc0 is current device
gpio: pin 54 (gpio 54) value is 1
Checking for: /uEnv.txt ...
Checking for: /boot.scr ...
Checking for: /boot/boot.scr ...
Checking for: /boot/uEnv.txt ...
gpio: pin 55 (gpio 55) value is 1
754 bytes read in 39 ms (18.6 KiB/s)
Loaded environment from /boot/uEnv.txt
Checking if uname_r is set in /boot/uEnv.txt...
gpio: pin 56 (gpio 56) value is 1
Running uname_boot ...
** Invalid partition 2 **
** Invalid partition 3 **
** Invalid partition 4 **
** Invalid partition 5 **
** Invalid partition 6 **
** Invalid partition 7 **
switch to partitions #0, OK
mmc1(part 0) is current device
Scanning mmc 1:1...
gpio: pin 56 (gpio 56) value is 0
gpio: pin 55 (gpio 55) value is 0
gpio: pin 54 (gpio 54) value is 0
gpio: pin 53 (gpio 53) value is 1
switch to partitions #0, OK
mmc1(part 0) is current device
gpio: pin 54 (gpio 54) value is 1
Checking for: /uEnv.txt ...
26 bytes read in 5 ms (4.9 KiB/s)
gpio: pin 55 (gpio 55) value is 1
Loaded environment from /uEnv.txt
Importing environment from mmc ...
Checking if uenvcmd is set ...
gpio: pin 56 (gpio 56) value is 1
Running uenvcmd ...
754 bytes read in 38 ms (18.6 KiB/s)
Checking if client_ip is set ...
Checking for: /boot.scr ...
Checking for: /boot/boot.scr ...
Checking for: /boot/uEnv.txt ...
gpio: pin 55 (gpio 55) value is 1
33 bytes read in 61 ms (0 Bytes/s)
Loaded environment from /boot/uEnv.txt
Checking if uname_r is set in /boot/uEnv.txt...
gpio: pin 56 (gpio 56) value is 1
Running uname_boot ...
** Invalid partition 3 **
** Invalid partition 4 **
** Invalid partition 5 **
** Invalid partition 6 **
** Invalid partition 7 **
starting USB...
USB0:   Port not available.
cpsw Waiting for PHY auto negotiation to complete......... TIMEOUT !
using musb-hdrc, OUT ep1out IN ep1in STATUS ep2in
MAC 90:59:af:5b:80:df
HOST MAC de:ad:be:af:00:00
RNDIS ready
The remote end did not respond in time.missing environment variable: pxeuuid
Retrieving file: pxelinux.cfg/01-90-59-af-5b-80-df
cpsw Waiting for PHY auto negotiation to complete......... TIMEOUT !
using musb-hdrc, OUT ep1out IN ep1in STATUS ep2in
MAC 90:59:af:5b:80:df
HOST MAC de:ad:be:af:00:00
RNDIS ready
