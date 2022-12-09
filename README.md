### IMPORTANT announcement: this is LANGDALE experimental branch meta-langdale

	LANGDALE experimental branch meta-langdale
	# git checkout meta-langdale

To try to test the Yocto kernel recipe: linux-yocto_5.19.bb

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
	source yocto-setup.sh
	OR:
	. yocto-setup.sh

Please, use ONLY this form of setup command (NOT a ./yocto-setup.sh)!

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
the jump-now technology to the langdale release (skipping honister release - limitation) and
making Scott's jump-now repos langdale compliant:

	cloned meta-bbb - from now on compliant on langdale
	cloned meta-jumpnow - from now on compliant on langdale

#### Environment

##### [1] poky/build/conf/local.conf

Please, do note that (in the conf/local.conf the CONF_VERSION variable is now 2.

	CONF_VERSION = "2"

##### [2] Execution of the bitbake environment on Langdale 4.1.1

Important: langdale's bitbake version is 2.2.0 onwards.
```
	Build Configuration:
**==>>	BB_VERSION           = "2.2.0"
	BUILD_SYS            = "x86_64-linux"
	NATIVELSBSTRING      = "ubuntu-20.04"
	TARGET_SYS           = "arm-poky-linux-gnueabi"
	MACHINE              = "beaglebone"
	DISTRO               = "poky"
**==>>	DISTRO_VERSION       = "4.1.1"
	TUNE_FEATURES        = "arm vfp cortexa8 neon callconvention-hard"
	TARGET_FPU           = "hard"
```
##### [3] /bin/bash environment gets quite a few changes imported form YOCTO

Please, note that /bin/bash environment gets quite a few changes imported from
YOCTO build system. In other words, Yocto pollutes the default env variables.

This might create the problems on the current bash terminal. Please, in such
a case issue the following command on the terminal to reset to default env:

	$ exec bash

General command (for any $SHELL):

	$ exec $SHELL

####  Langdale changes closer to the metal

##### [1] There are changes in the syntax of the recipes from hardknott to honister
https://github.com/ZoranStojsavljevic/bbb-yocto/blob/master/documentation/YOCTO-Release-Migration-Guides/3.4_honister.md

Please, do note that amount of changes for the new syntax is around 90% .

##### [2] There are changes to the meta-bbb kernel recipes

The directory recipes-kernel/linux undergoes some investigation from my side.

	PREFERRED_PROVIDER_virtual/kernel = "linux-yocto"

#### bbb-yocto langdale release should seamlessly compile on the following host platforms

	Fedora 36
	Ubuntu 20.4 (LTS)

This was tested by me on both host platforms, it compiles and made a release.

WARNING: most likey, the following Yocto releases still compile on the above hosts:

	gatesgarth
	hardknott
	kirkstone
	langdale

Back in The Past, most likely older hosts (example: Ubuntu 18.04 and Fedora 32) are
required as hosts containers. Usage of the containers are out of the YOCTO scope.

I did not have time yet to test released Langdale images on BeagleBone Black from the
poky/build/tmp/deploy/images/beaglebone (probably will not work).

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
