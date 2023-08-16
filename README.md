### IMPORTANT announcement (latest change: August 22th, Y2023)

#### WARRANTY of this repo used
https://github.com/ZoranStojsavljevic/bbb-yocto

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

#### Reason why bbb-yocto repo

This effort is just a DEFAULT test bbb YOCTO build system (one of the variants). Written as is.

This repository is initially written to support BBB initramfs testing:

	Attempt to create one generic Open Source BBB armv7 A8 platform reference and testing repo.
	The YOCTO BeagleBone Black YOCTO repo used is described @ the following net pointer:
	https://jumpnowtek.com/beaglebone/BeagleBone-Systems-with-Yocto.html

#### Support

Please, do not hesitate to report to author any notifications about the unknown issues and potential
bugs, and/or you can also create an issue!

#### Usage, creation of the YOCTO environment

Once you have cloned the repo bbb-yocto with the command:

	git clone https://github.com/ZoranStojsavljevic/bbb-yocto.git

The command to use to run the setup is the following:

	cd bbb-yocto
	source yocto-setup.sh <release-name>
	OR:
	. yocto-setup.sh <release-name>
	### Example
	. yocto-setup.sh mickledore

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
		/home/zoran.s/projects/github/yocto/bbb-yocto/meta-qt5 \
	** ==>>	/home/zoran.s/projects/github/yocto/bbb-yocto/meta-socketcan \"

These 3 (** ==>>) repos + bbb_yocto are maintained by Scott's cloned repos, where I advanced
the jump-now technology to the mickledore release (skipping honister release - limitation) and
making Scott's jump-now repos mickledore compliant:

	cloned meta-bbb - from now on compliant up to mickledore
	cloned meta-jumpnow - from now on compliant up tp mickledore

TO DO: to create the Yocto honister release (low prio task, very low prio execution).

#### Environment

##### [1] poky/build/conf/local.conf

Please, do note that (in the conf/local.conf the CONF_VERSION variable is now 2.

	CONF_VERSION = "2"

##### [2] Execution of the DISTRO_VERSION 4.2.2

Important: mickledore's bitbake version went from 2.4.0 onwards.
```
	Build Configuration:
**==>>	BB_VERSION           = "2.4.0"
	BUILD_SYS            = "x86_64-linux"
	NATIVELSBSTRING      = "ubuntu-20.04"
	TARGET_SYS           = "arm-poky-linux-gnueabi"
	MACHINE              = "beaglebone"
	DISTRO               = "poky"
**==>>	DISTRO_VERSION       = "4.2.2"
	TUNE_FEATURES        = "arm vfp cortexa8 neon callconvention-hard"
	TARGET_FPU           = "hard"
	meta
	meta-poky
	meta-yocto-bsp       = "mickledore:0a98281d37b0bd8dc1548c390216cb3978e36e0e"
	meta-jumpnow         = "mickledore:548f19edf4724c6f26a90c813091e74a3fc8d864"
	meta-bbb             = "mickledore:4f7e8b9687c163da9cabaa251eff2251c0c59001"
	meta-oe
	meta-python
	meta-networking      = "mickledore:75cf318cef3b4ee81fad2782cf063ecd69ba8842"
	meta-qt5             = "upstream/mickledore:d86e2e82c15d186141713515dfd1373013aaebd5"
	meta-socketcan       = "master:15406dd37cc568d083cb3a40a3c61bd217a1b8ab"
```
##### [3] /bin/bash environment gets quite a few changes imported form YOCTO

Please, note that /bin/bash environment gets quite a few changes imported from
YOCTO build system. In other words, Yocto pollutes the default env variables.

This might create the problems on the current bash terminal. Please, in such
a case issue the following command on the terminal to reset to default env:

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
for the u-boot-1_2022.01 (added it to the meta-bbb/recipes-bsp).

The meta-bbb/recipes-bsp/u-boot: serves as overlay for the poky/meta/recipes-bsp/u-boot.

##### [3] There are changes to the meta-bbb kernel recipes

The directory recipes-kernel/linux undergoes some investigation from my side.

As my best understanding, there are for quite awhile two types of the Yocto kernel recipes:

	linux-stable kernel recipes (linux-stable_x.yz.bb comming from linux stable repos)
	and linux-yocto kernel recipes (linux-yocto_x.yz.bb comming from Yocto repos)

In the directory conf/machine/conf/<MACHINE>.conf there is a variable PREFERRED_PROVIDER_virtual/kernel
defined as:

	PREFERRED_PROVIDER_virtual/kernel = "linux-stable"
	or
	PREFERRED_PROVIDER_virtual/kernel = "linux-yocto"

There are two include scripts provided for two different PREFERRED_PROVIDER:

	linux-yocto.inc for the linux-yocto type of kernels
	linux-stable.inc for the linux-stable type of kernels

DISCLAIMER: Investigating the linux-yocto recipes, and how to incorporate them

#### bbb-yocto releases should seamlessly compile on the following host platforms

	Fedora 36
	Ubuntu 20.4 (LTS)

This was tested by me on both host platforms, it compiles and makes a release.

WARNING: most like, the following Yocto releases still compile on the native hosts:

	hardknott
	honister
	kirkstone
	langdale

Back in The Past, most likely older hosts (example: Ubuntu 18.04 and Fedora 32) are
required as hosts containers. Usage of the containers are out of the YOCTO scope.

#### Known bbb-yocto (this project) deficiencies

##### [1] The entire compiled and released Yocto kirkstone nad langdale images NOT tested yet

Meaning u-boot, kernel, dtbs, dtbos, modules and rootfs.

I do not have time yet to test released mickledore images on BeagleBone
Black from the poky/build/tmp/deploy/images/beaglebone (~90% probability
it'll work out of the box).

##### [2] Jumped from hardknott straight to kirkstone

TO DO: to create the Yocto honister release (low prio task, very low prio execution).

##### [3] To test the other style Yocto kernel recipes, such as:

	linux-yocto_6.1.bb

Still NEED to understand linux-yocto kernels' recipes' environment.

#### Standalone kernel handling in Yocto

For make menuconfig, please, use the following Yocto command:

	bitbake -c menuconfig virtual/kernel

For make, please, use the following Yocto command:

	bitbake -c compile virtual/kernel

#### The bash script, customized for the owner's projects purposes (substitutions for the KAS tool)
https://github.com/ZoranStojsavljevic/bbb-yocto/blob/master/yocto-setup.sh

Please, follow the strict rules outlined below!

	Step [1]: Look into the script yocto-setup.sh and customize it for your own project
	Step [2]: Make the script yocto-setup.sh executable (permissions 755), and execute it:
		# . ./yocto-setup.sh <yocto_release>
	or
		# source ./yocto-setup.sh <yocto_release>
	Step [3]: After script executes, it'll be in the poky/build/ directory
	Step [4]: Run in build/ bitbake -k core-image-minimal (or whatever core-image-? required)

#### KAS tool passive comments, for now support abandoned (example: kas warrior script)

	Step [1]: Go to bbb-releases/bbb-warrior/ directory and copy kas-bbb-warrior.yml to designated directory for build
	Step [2]: Execute: kas build kas-bbb-warrior.yml ## KAS tool should be installed (go to kas/ for documentation)

#### The test initramfs BBB image description

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

#### Original referent YOCTO Poky BeagleBone distro is @:
git clone https://git.yoctoproject.org/git/poky.git
