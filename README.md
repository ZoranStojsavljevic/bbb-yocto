### IMPORTANT announcement (latest change: Jun 05th, 2025)

#### WARRANTY of this repo used
git@github.com:ZoranStojsavljevic/bbb-yocto.git

https://github.com/ZoranStojsavljevic/bbb-yocto

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
OTHER DEALINGS IN THE SOFTWARE.

#### Reason why bbb-yocto repo

This effort is just a DEFAULT test bbb YOCTO build system (one
of the variants). Written as is.

This repository is initially written to support BBB initramfs
testing:

	Attempt to create one generic Open Source BBB armv7 A8
	platform reference and testing repo. The YOCTO BeagleBone
	Black YOCTO repo used is described @ the following net
	pointer:
	https://jumpnowtek.com/beaglebone/BeagleBone-Systems-with-Yocto.html

#### Support

Please, do not hesitate to report to author any notifications
about the unknown issues and potential bugs, an issue also can
be created!

#### Creation of the YOCTO environment and usage

The repo bbb-yocto should be cloned with the command:

	$ git clone https://github.com/ZoranStojsavljevic/bbb-yocto.git
or
	$ git clone git@github.com:ZoranStojsavljevic/bbb-yocto.git

The command to be used to run the setup is the following:

	$ cd bbb-yocto

	### For now, the following mandatory command
	### since Yocto scarthgap release is a MUST!

	if <release-name> .GT. nanbield {
		$ git checkout <release-name>
		$ source yocto-setup.sh <release-name>
	} else {
		$ . yocto-setup.sh <release-name>
	}

	### Latest example
	git checkout walnascar
	. yocto-setup.sh walnascar

Please, use ONLY this form of setup command (NOT a ./yocto-setup.sh <release-name>)!

#### BBLAYERS

	BBLAYERS ?= " \
		/home/zoran.s/projects/github/yocto/bbb-yocto/poky/meta \
		/home/zoran.s/projects/github/yocto/bbb-yocto/poky/meta-poky \
		/home/zoran.s/projects/github/yocto/bbb-yocto/poky/meta-yocto-bsp \
	** ==>>	/home/zoran.s/projects/github/yocto/bbb-yocto/meta-jumpnow \
	** ==>>	/home/zoran.s/projects/github/yocto/bbb-yocto/meta-bbb \
		/home/zoran.s/projects/github/yocto/bbb-yocto/meta-openembedded/meta-oe \
		/home/zoran.s/projects/github/yocto/bbb-yocto/meta-openembedded/meta-python \
		/home/zoran.s/projects/github/yocto/bbb-yocto/meta-openembedded/meta-networking \
		/home/zoran.s/projects/github/yocto/bbb-yocto/meta-qt6 \
	** ==>>	/home/zoran.s/projects/github/yocto/bbb-yocto/meta-socketcan \"

These 3 (** ==>>) repos + bbb_yocto are maintained by Scott's
cloned repos, where I advanced the jumpnow technology, making
Scott's jump-now repos walnascar compliant:

	cloned meta-bbb - from now on compliant up to walnascar
	cloned meta-jumpnow - from now on compliant up to walnascar

#### Environment

##### [1] poky/build/conf/local.conf

Please, do note that (in the conf/local.conf the CONF_VERSION
variable is now of value 2.

	CONF_VERSION = "2"

##### [2] Execution of the DISTRO_VERSION 5.2.1

Important: walnascar's bitbake version went from 2.12.0 onwards.

	Latest commits with 5.2.2 walnascar release:

NOTE: Resolving any missing task queue dependencies

```
	Build Configuration:
**==>>	BB_VERSION           = "2.12.0"
	BUILD_SYS            = "x86_64-linux"
	NATIVELSBSTRING      = "universal"
	TARGET_SYS           = "arm-poky-linux-gnueabi"
	MACHINE              = "beaglebone-yocto"
	DISTRO               = "poky"
**==>>	DISTRO_VERSION       = "5.2.2"
	TUNE_FEATURES        = "arm vfp cortexa8 neon callconvention-hard"
	TARGET_FPU           = "hard"
	meta
	meta-poky
	meta-yocto-bsp       = "walnascar:8fe20edf8a7affb88eaad3fcd060021056ded3f7"
	meta-jumpnow         = "walnascar:d75272ddf82f1314d95ad2ccb8737d48d42e9d1f"
	meta-bbb             = "walnascar:01e88d384a80cf8ad48dfd06a44bcff2b7f80606"
	meta-oe
	meta-python
	meta-networking      = "walnascar:c009244a045923a9dfc32d7f2996cb61629870f6"
	meta-qt6             = "dev:cae750cf1964a37a4744166e844cafa280c1356d"
	meta-socketcan       = "walnascar:47a57f2f467e8d18cdaa1f2f682b296e37fec2c2"
```

##### [3] /bin/bash environment gets quite a few changes imported from YOCTO

Please, note that /bin/bash environment gets quite a few changes
imported from YOCTO build system. In other words, Yocto pollutes
the default env variables.

This might create the problems on the current bash terminal.
Please, in such a case issue the following command on the
terminal to reset to default env:

	$ exec bash

General command (for any $SHELL):

	$ exec $SHELL

####  Kirkstone changes closer to the metal

Please, do note then from the YOCTO Release kirkstone, there are major changes introduced
in the YOCTO build system. I made more than 120 changes in the bbb-yocto repos (4 outlined
repos presented in BBLAYERS. There are 4 of the repos I maintain from time to time, as
outlined above (as time allows, since YOCTO is JUST ONE of many projects I am on).

##### [1] There are changes in the syntax of the recipes from hardknott to honister
https://github.com/ZoranStojsavljevic/bbb-yocto/blob/master/documentation/YOCTO-Release-Migration-Guides/3.4_honister.md

Please, do note that amount of changes for the new syntax is around 80% .

##### [2] There are changes to the meta-bbb u-boot recipes

Created meta-bbb/recipes-bsp/u-boot/ with rebased '0001-Customize-config-and-boot-command.patch'
for the u-boot-1_2024.07 (rebased it to the meta-bbb/recipes-bsp).

The meta-bbb/recipes-bsp/u-boot: serves as overlay for the poky/meta/recipes-bsp/u-boot.

##### [3] There are changes to the meta-bbb kernel recipes

The directory recipes-kernel/linux undergoes some investigation from my side.

As my best understanding, there are for quite awhile three types of the Yocto kernel recipes:

	linux-stable kernel recipes (linux-stable_x.yz.bb comming from linux stable repos)
	linux-mainline kernel recipes (linux-mainline_x.yz.bb comming from linux mainline repos)
	linux-yocto kernel recipes (linux-yocto_x.yz.bb comming from Yocto repos)

In the directory conf/machine/conf/<MACHINE>.conf there is a variable PREFERRED_PROVIDER_virtual/kernel
defined as:

	PREFERRED_PROVIDER_virtual/kernel = "linux-stable"
	or
	PREFERRED_PROVIDER_virtual/kernel = "linux-mainline"
	or
	PREFERRED_PROVIDER_virtual/kernel = "linux-yocto"

There are three included scripts provided for three different PREFERRED_PROVIDER:

	linux-stable.inc for the linux-stable type of kernels
	linux-mainline.inc for the linux-mainline type of kernels
	linux-yocto.inc for the linux-yocto type of kernels

DISCLAIMER: Investigating the linux-yocto recipes, and how to incorporate them

#### bbb-yocto releases should seamlessly compile on the following host platforms:

	PRETTY_NAME="Ubuntu 22.04.5 LTS"
	NAME="Ubuntu"
	VERSION_ID="22.04"
	VERSION="22.04.5 LTS (Jammy Jellyfish)"
	VERSION_CODENAME=jammy
	ID=ubuntu
	ID_LIKE=debian

	Fedora 41

This was tested by me on both host platforms, it compiles and makes a release.

WARNING: most like, the following Yocto releases still compile on the native hosts:

	scarthgap
	styhead

Back in The Past, most likely older hosts (example: Ubuntu 20.04
and Fedora 36) are required as hosts containers. Usage of the
containers are out of the scope of this repo.

#### Known bbb-yocto (this project) deficiencies

##### [1] The entire compiled and released Yocto supported releases NOT tested yet

Meaning u-boot, kernel, dtbs, dtbos, modules and rootfs.

I do not have time yet to test released walnascar images on
BeagleBone Black from the poky/build/tmp/deploy/images/beaglebone
(~90% probability it'll work out of the box).

##### [2] Jumped from hardknott straight to kirkstone

TO DO: to create the Yocto honister release (very low prio task).

##### [3] To test the other style Yocto kernel recipes, such as:

	linux-yocto_6.11.bb

Still a NEED to understand linux-yocto kernels' recipes' env.

#### Standalone kernel handling in Yocto

For make menuconfig, please, use the following Yocto command:

	bitbake -c menuconfig virtual/kernel

For make, please, use the following Yocto command:

	bitbake -c compile virtual/kernel

#### The bash script, customized for the own purposes (substitutions for the KAS tool)
https://github.com/ZoranStojsavljevic/bbb-yocto/blob/master/yocto-setup.sh

Please, follow the strict rules outlined below!

	Step [1]: Look into the script yocto-setup.sh (customize it for the given release)
	Step [2]: Make the script yocto-setup.sh executable (permissions 755)
	Step [3]: execute from scarthgap release: $ git checkout <yocto_release>
	Step [4]: start the script:
		$ . ./yocto-setup.sh <yocto_release>
	or
		$ source ./yocto-setup.sh <yocto_release>
	Step [5]: After script executes, cwd will be the poky/build/ directory
	Step [6]: Run: $ bitbake -k core-image-minimal (or whatever core-image-? required)

#### KAS tool passive comments, for now support abandoned

KAS description/documentation:

* [kas latest documentation](https://kas.readthedocs.io/en/latest/)

Repository is located at the following net pointer:

	https://github.com/siemens/kas
	git clone https://github.com/siemens/kas.git

#### The test initramfs BBB image description

Part of the config-initramfs, outlining important part of
defconfig (the booting is done solely from initramfs)!

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

#### Original referent YOCTO Poky distro is @:
* [git.yoctoproject.org poky](https://git.yoctoproject.org/git/poky.git)

