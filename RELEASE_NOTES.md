## Styhead RELEASE_NOTES.md

### [1] Creation of the YOCTO environment and usage CHANGED since scarthgap

Once you have cloned the repo bbb-yocto with the command:

	$ git clone https://github.com/ZoranStojsavljevic/bbb-yocto.git

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
	git checkout styhead
	. yocto-setup.sh styhead

### [2] Git repository: https://github.com/Wind-River/meta-secure-core

This is (as noted before) a test feature. To understand how to
incorporate TPM2 security features for true TPM2 HW platforms.

Still on openembedded.org it is on scarthgap branch (hopefully, it'll be
updated!

https://layers.openembedded.org/layerindex/branch/scarthgap/layer/meta-tpm2/

Git repository: https://github.com/Wind-River/meta-secure-core

Subdirectory:
* [meta-tpm2](https://github.com/Wind-River/meta-secure-core/tree/styhead/meta-tpm2)

Credentials:

	commit a8dd44d08f1318b5954c68dc8d88e04a40429bba
	Author: Yi Zhao <yi.zhao@windriver.com>
	last commit:   Mon Oct 7 12:06:28 2024 +0800

	tpm2-pkcs11: upgrade 1.9.0 -> 1.9.1

	ChangeLog:
	https://github.com/tpm2-software/tpm2-pkcs11/releases/tag/1.9.1

	Signed-off-by: Yi Zhao <yi.zhao@windriver.com>

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

### [4] Statement S = "${WORKDIR}" is no longer supported

S = "${WORKDIR}" is no longer supported

Replace the line that sets S to "${WORKDIR}" with the appropriate
path to the source files.

As generic example: S = "${WORKDIR}/path/to/source"

### [5] Execution of the DISTRO_VERSION 5.1

bitbake -k core-image-minimal

Important: styhead's bitbake version went from 2.9.1 onwards.

	Latest commits with 5.1 styhead release:

NOTE: Resolving any missing task queue dependencies
```
	Build Configuration:
**==>>	BB_VERSION           = "2.9.1"
	BUILD_SYS            = "x86_64-linux"
	NATIVELSBSTRING      = "fedora-40"
	TARGET_SYS           = "arm-poky-linux-gnueabi"
	MACHINE              = "beaglebone-yocto"
	DISTRO               = "poky"
**==>>	DISTRO_VERSION       = "5.1"
	TUNE_FEATURES        = "arm vfp cortexa8 neon callconvention-hard"
	TARGET_FPU           = "hard"
	meta
	meta-poky
	meta-yocto-bsp       = "styhead:86bc5dca182a3fe774e17811a82177a68b27a6bb"
	meta-jumpnow         = "styhead:7adb5044e310819ceb310b3b300ff96704368214"
	meta-bbb             = "styhead:ed13b4ecd30cbf6df0c5127650f5a378c85b6859"
	meta-oe
	meta-python
	meta-networking      = "styhead:461d85a1831318747af5abe86da193bcde3fd9b4"
	meta-qt6             = "dev:abdf375a2efe48e30050bd54c717a970f883357c"
	meta-socketcan       = "styhead:3de33a9b777959a9045579ccd0aa1088eda09199"
```
