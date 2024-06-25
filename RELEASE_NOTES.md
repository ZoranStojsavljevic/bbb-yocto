## scarthgap RELEASE_NOTES.md

### [1] Creation of the YOCTO environment and usage CHANGED!

Once you have cloned the repo bbb-yocto with the command:

	$ git clone https://github.com/ZoranStojsavljevic/bbb-yocto.git

The command to be used to run the setup is the following:

	$ cd bbb-yocto

	### For now, the following mandatory command
	### since Yocto scarthgap release is a MUST!
	if <release-name> .GT. nanbield
		$ git checkout <release-name>
	$ source yocto-setup.sh <release-name>
	OR:
	$ . yocto-setup.sh <release-name>

	### Example
	git checkout scarthgap
	. yocto-setup.sh scarthgap

### [2] Git repository: https://github.com/Wind-River/meta-secure-core

This is (as noted before) a test feature. To understand how to
incorporate TPM2 security features for true TPM2 HW platforms.

https://layers.openembedded.org/layerindex/branch/scarthgap/layer/meta-tpm2/

Git repository: https://github.com/Wind-River/meta-secure-core

Subdirectory:
* [meta-tpm2](https://github.com/Wind-River/meta-secure-core/tree/scarthgap/meta-tpm2)

Credentials:

	Last commit: May 3, 2024 (scarthgap branch)
	Maintainer: Yi Zhao <yi.zhao@windriver.com>
	email: yi.zhao@windriver.com

### [3] Start tracking meta-socketcan layer since scarthgap release

Layer meta-socketcan still holds outdated YOCTO releases, just
in case that somebody else is using my native meta-socketcan
repository.

From conf/layer.conf :

	LAYERSERIES_COMPAT_meta-socketcan =
	"sumo thud warrior zeus dunfell gatesgarth hardknott honister \
		kirkstone langdale mickledore scarthgap nanbield"

From the scarthgap release, meta-socketcan repo will be tracked
via git as Yocto current release. It is easier to unify all the
repos to be on the same release (not some on master (bbb-yocto
and meta-socketcan repos) till nanbield release, inclusive).

### [4] Rebasing 0001-Customize-config-and-boot-command.patch

In dir .../bbb-yocto/meta-bbb/recipes-bsp/u-boot/files the patch:

	0001-Customize-config-and-boot-command.patch

is rebased since u-boot v2024.01 , which is used for scarthgap release.

### [5] Poky 5.0.2-rc1 works

WARNING: Host distribution "fedora-40" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache: 100% |                                                                      | ETA:  --:--:--
Loaded 0 entries from dependency cache.
Parsing recipes: 100% |#####################################################################| Time: 0:04:20
Parsing of 2810 .bb files complete (0 cached, 2810 parsed). 4713 targets, 137 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies
WARNING: preferred version 6.10.% of linux-libc-headers not available (for item linux-libc-headers)
WARNING: versions of linux-libc-headers available: 6.6
WARNING: preferred version 6.10.% of linux-libc-headers not available (for item linux-libc-headers-dev)
WARNING: versions of linux-libc-headers available: 6.6

Build Configuration:

bitbake -k core-image-minimal

```
Build Configuration:
BB_VERSION           = "2.8.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "fedora-40"
TARGET_SYS           = "arm-poky-linux-gnueabi"
MACHINE              = "beaglebone"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0.2"
TUNE_FEATURES        = "arm vfp cortexa8 neon callconvention-hard"
TARGET_FPU           = "hard"
meta
meta-poky
meta-yocto-bsp       = "scarthgap:f7def85be9f99dcb4ba488bead201f670304379b"
meta-jumpnow         = "scarthgap:3efb1aa7d511f0fb44d9dcdb578bada1882dc1b3"
meta-bbb             = "scarthgap:ba69a8e5457bcd36b4fe0ab8c3498ec468455077"
meta-oe
meta-python
meta-networking      = "scarthgap:4a7bb77f7ebe0ac8be5bab5103d8bd993e17e18d"
meta-qt5             = "upstream/scarthgap:eb828418264a49b8d00035cb3d7b12fcea3be801"
meta-socketcan       = "scarthgap:7bba7af8403eb9a28e7d0e7f0d0229e3bffcf65a"

NOTE: Fetching uninative binary shim http://downloads.yoctoproject.org/releases/uninative/4.5/x86_64-nativesdk-libc-4.5.tar.xz;sha256sum=43ee6a25bcf5fce16ea87076d6a96e79ead6ced90690a058d07432f902773473 (will check PREMIRRORS first)
Sstate summary: Wanted 2399 Local 0 Mirrors 0 Missed 2399 Current 0 (0% match, 0% complete) | ETA:  0:00:00
Initialising tasks: 100% |##################################################################| Time: 0:00:04
NOTE: Executing Tasks

NOTE: Fetching uninative binary shim http://downloads.yoctoproject.org/releases/uninative/4.5/x86_64-nativesdk-libc-4.5.tar.xz;sha256sum=43ee6a25bcf5fce16ea87076d6a96e79ead6ced90690a058d07432f902773473 (will check PREMIRRORS first)
Sstate summary: Wanted 2399 Local 0 Mirrors 0 Missed 2399 Current 0 (0% match, 0% complete) | ETA:  0:00:00
Initialising tasks: 100% |##################################################################| Time: 0:00:04
NOTE: Executing Tasks
WARNING: libpng-1.6.42-r0 do_fetch: Failed to fetch URL https://downloads.sourceforge.net/project/libpng/libpng16/libpng-1.6.42.tar.xz, attempting MIRRORS if available
NOTE: Tasks Summary: Attempted 4985 tasks of which 6 didn't need to be rerun and all succeeded.

Summary: There were 6 WARNING messages.
```
