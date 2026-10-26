### IMPORTANT announcement (latest change: Oct 21th, 2025.)

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

	## For now, the following commands are used:

	$ git checkout <release-name>
	$ . yocto-setup.sh <release-name>

	## Latest example:
	$ git checkout wrynose
	$ . yocto-setup.sh wrynose

Please, use ONLY this form of setup command (NOT a ./yocto-setup.sh <release-name>)!

#### BBLAYERS

	BBLAYERS ?= " \
		/home/vuser/projects/github/bbb-yocto/layers/openembedded-core/meta \
		/home/vuser/projects/github/bbb-yocto/meta-openembedded/meta-oe \
		/home/vuser/projects/github/bbb-yocto/meta-openembedded/meta-perl \
		/home/vuser/projects/github/bbb-yocto/meta-openembedded/meta-python \
		/home/vuser/projects/github/bbb-yocto/meta-openembedded/meta-networking \
	** ==>>	/home/vuser/projects/github/bbb-yocto/meta-bbb \
		/home/vuser/projects/github/bbb-yocto/meta-qt6 \
	** ==>>	/home/vuser/projects/github/bbb-yocto/meta-socketcan \
		/home/vuser/projects/github/bbb-yocto/layers/meta-yocto/meta-poky \
		/home/vuser/projects/github/bbb-yocto/layers/meta-yocto/meta-yocto-bsp \
	** ==>>	/home/vuser/projects/github/bbb-yocto/meta-jumpnow \
		/home/vuser/projects/github/bbb-yocto/layers/meta-secure-core/meta-signing-key \
		/home/vuser/projects/github/bbb-yocto/layers/meta-secure-core/meta-secure-core-common \
		/home/vuser/projects/github/bbb-yocto/layers/meta-secure-core/meta-tpm2 \
		/home/vuser/projects/github/bbb-yocto/layers/meta-secure-core/meta-efi-secure-boot \
		/home/vuser/projects/github/bbb-yocto/layers/meta-secure-core/meta-integrity \
		/home/vuser/projects/github/bbb-yocto/layers/meta-secure-core/meta-encrypted-storage \
		"

These 2 (meta-bbb and meta-jumpnow) repos are maintained by
Scott's cloned repos, where author tries to advance the jumpnow
technology, making Scott's jump-now repos wrynose compliant:

	cloned meta-bbb - from now on compliant up to wrynose
	cloned meta-jumpnow - from now on compliant up to wrynose

#### Environment

##### [1] poky/build/conf/local.conf

Please, do note that (in the conf/local.conf the CONF_VERSION
variable is now of value 2.

	CONF_VERSION = "2"

##### [2] Execution of the DISTRO_VERSION 6.0.4

Important: wrynose's bitbake version went from 2.18.0 onwards.

Latest commits with yocto 6.0.4 wrynose release:

	Build Configuration:

	**==>>	BB_VERSION             = "2.18.0"
		BUILD_SYS              = "x86_64-linux"
		NATIVELSBSTRING        = "universal"
		TARGET_SYS             = "arm-poky-linux-gnueabi"
		MACHINE                = "beaglebone-yocto"
		SDKMACHINE             = "x86_64"
		DISTRO                 = "poky"
	**==>>	DISTRO_VERSION         = "6.0.4"
		TUNE_FEATURES          = "arm vfp cortexa8 neon callconvention-hard"
		meta                   = "wrynose:884a91e689d545238cfabd7926c93663950ca286"
		meta-oe
		meta-perl
		meta-python
		meta-networking        = "wrynose:f28a144aa0a0ae05ca2ee91e1aef6aa05f6a12db"
		meta-bbb               = "wrynose:8d6683d3bea33bf9800c3faec5386d5e46a89881"
	[6.11]	meta-qt6               = "6.11:ec98b3ab1c8deeab9412ef6cbfd55729dc567b01"
		meta-socketcan         = "wrynose:32db2e32e907adfa9c08bddd866ffe60cfd7ea0e"
		meta-poky
		meta-yocto-bsp         = "wrynose:7c25b11156553145fa6b241a2d4f65d94438f804"
		meta-jumpnow           = "wrynose:ea3165ddebfda60ec1c48171eee86345e2df69af"
		meta-signing-key
		meta-secure-core-common
		meta-tpm2
		meta-efi-secure-boot
		meta-integrity
		meta-encrypted-storage = "wrynose:07a99ae241acd488a2feda1ededf87dc70dfde80"

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
for the u-boot-1_2026.01 (rebased it to the meta-bbb/recipes-bsp).

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

#### bbb-yocto releases should seamlessly build on the following host platforms:

	PRETTY_NAME="Ubuntu 22.04.5 LTS"
	NAME="Ubuntu"
	VERSION_ID="22.04"
	VERSION="22.04.5 LTS (Jammy Jellyfish)"
	VERSION_CODENAME=jammy
	ID=ubuntu
	ID_LIKE=debian

	Fedora 42 (with the new gcc version 15.2.1 introduced)

```
NOTE: About the native Fedora 42 latest GCC compiler (gcc version 15.2.1
	20250808 (Red Hat 15.2.1-1) (GCC)):

/usr/lib64/ccache/gcc -v
Using built-in specs.
COLLECT_GCC=/usr/bin/gcc
COLLECT_LTO_WRAPPER=/usr/libexec/gcc/x86_64-redhat-linux/15/lto-wrapper
OFFLOAD_TARGET_NAMES=nvptx-none:amdgcn-amdhsa
OFFLOAD_TARGET_DEFAULT=1
Target: x86_64-redhat-linux
Configured with: ../configure --enable-bootstrap --enable-languages=c,c++,fortran,objc,obj-c++,ada,go,d,m2,cobol,lto --prefix=/usr --mandir=/usr/share/man --infodir=/usr/share/info --with-bugurl=http://bugzilla.redhat.com/bugzilla --enable-shared --enable-threads=posix --enable-checking=release --enable-multilib --with-system-zlib --enable-__cxa_atexit --disable-libunwind-exceptions --enable-gnu-unique-object --enable-linker-build-id --with-gcc-major-version-only --enable-libstdcxx-backtrace --with-libstdcxx-zoneinfo=/usr/share/zoneinfo --with-linker-hash-style=gnu --enable-plugin --enable-initfini-array --with-isl=/builddir/build/BUILD/gcc-15.2.1-build/gcc-15.2.1-20250808/obj-x86_64-redhat-linux/isl-install --enable-offload-targets=nvptx-none,amdgcn-amdhsa --enable-offload-defaulted --without-cuda-driver --enable-gnu-indirect-function --enable-cet --with-tune=generic --with-arch_32=i686 --build=x86_64-redhat-linux --with-build-config=bootstrap-lto --enable-link-serialization=1
Thread model: posix
Supported LTO compression algorithms: zlib zstd
gcc version 15.2.1 20250808 (Red Hat 15.2.1-1) (GCC)
```

This was tested by author on both host platforms, it compiles
and makes a release.

WARNING: most like, the following Yocto releases still compile
on the native hosts (Ubuntu 22.04 and Fedora 42):

	scarthgap
	styhead
	walnascar
	wrynose

Back in The Past, most likely older releases require older
hosts (example: Ubuntu 20.04 and Fedora 36) to exist as hosts
containers. Usage of the containers are out of the scope of
bbb-yocto repo.

#### Known bbb-yocto (this project) deficiencies

##### [1] The entire compiled and released Yocto supported releases NOT tested yet

Meaning u-boot, kernel, dtbs, dtbos, modules and rootfs.

Author does not have time yet to test released images on
BeagleBone Black from the .../build/tmp/deploy/images/beaglebone
(~90% probability it'll work out of the box).

##### [2] Releases not covered by bbb-yocto repo:

	honister (yocto 3.4)
	whinlatter (yocto 5.3)
	most likely upcoming release blacksail (yocto 6.1)

I decided to support ONLY even releases onward.

##### [3] To test the other style Yocto kernel recipe:

Still NEED to understand linux-yocto kernels' recipes env.

	PREFERRED_PROVIDER_virtual/kernel = "linux-yocto"

#### Standalone kernel handling in Yocto

For make menuconfig, please use the following Yocto command:

	$ bitbake -c menuconfig virtual/kernel

For make, please use the following Yocto commands:

	$ bitbake -c compile virtual/kernel
	$ bitbake virtual/kernel

To delete virtual/kernel, use the following Yocto commands:

	$ bitbake -c clean virtual/kernel
	$ bitbake -c cleansstate virtual/kernel
	$ bitbake -c cleanall virtual/kernel

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

KAS description/documentation (not used in bbb-yocto):

* [kas latest documentation](https://kas.readthedocs.io/en/latest/)

Repository is located at the following net pointer:

	## https://github.com/siemens/kas
	$ git clone https://github.com/siemens/kas.git

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
