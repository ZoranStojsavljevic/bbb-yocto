## walnascar RELEASE_NOTES.md

### [1] Start tracking bbb-yocto layer by <release-name> since scarthgap

Once the repo bbb-yocto is cloned with the command:

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

### [2] Git repository: https://github.com/Wind-River/meta-secure-core

This is (as noted before) a test feature. To understand how to
incorporate TPM2 security features for true TPM2 HW platforms.

https://layers.openembedded.org/layerindex/branch/walnascar/layers/

https://layers.openembedded.org/layerindex/branch/walnascar/layer/meta-tpm2/

Git repository: https://github.com/Wind-River/meta-secure-core

Subdirectory:
* [meta-tpm2](https://github.com/Wind-River/meta-secure-core/tree/walnascar/meta-tpm2)

### [3] Git repository: https://github.com/tpm2-software/tpm2-pkcs11/releases/tag/1.9.1

Release 1.9.1 is still included for the walnascar DISTRO_VERSION = "5.2.4" :

	tpm2-pkcs11 [1.9.1]

```
.../bbb-yocto$ find . -iname tpm2-pkcs11
./poky/meta-secure-core/meta-tpm2/recipes-tpm/tpm2-pkcs11
.../bbb-yocto$ cd ./poky/meta-secure-core/meta-tpm2/recipes-tpm/tpm2-pkcs11
.../bbb-yocto/poky/meta-secure-core/meta-tpm2/recipes-tpm/tpm2-pkcs11$ ls -al
total 12
drwxr-xr-x.  2 vuser vboxusers 4096 Oct 20 06:14 .
drwxr-xr-x. 10 vuser vboxusers 4096 Oct 20 06:14 ..
-rw-r--r--.  1 vuser vboxusers 1731 Oct 20 06:14 tpm2-pkcs11_1.9.1.bb
```

#### [3.1] Git repository: https://github.com/tpm2-software/tpm2-pkcs11/releases/tag/1.9.2

Newest release (still NOT included in the walnascar DISTRO_VERSION = "5.2.4"):

	tpm2-pkcs11 [1.9.2] - 2025-09-29

Fixed:

	Fix tpm2_ptool destroy command failures.
	Warning "UserWarning: Unknown distribution option: 'tests_require'"
	  from setup.py.
	Missing SHA1-RSA-PKCS from CKM_ALLOWED_MECHANISMS.
	In tests requiring Python, don't override HOME as it may be needed for
	  user installed packages.
	Certificate finding logic in pkcs11-tool usage where --label was used
	  instead of --token-label.
	Configure: Fix detection of javac.
	Configure: Fix detection of pkcs11 python module.
	Fix incorrect logging statement in create_pkcs_store.sh.
	Fix links in documentation.
	Fix OpenSuse Leap CI builds.
	Fix improper handling of chunks across IV multi-part handling.
	Fix memory leak.

Added:

	Add support for importing persistent TPM2 keys with tpm2_ptool.

### [4] Start tracking meta-socketcan layer by <release-name> since scarthgap

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

### [5] Statement S = "${WORKDIR}" is no longer supported

S = "${WORKDIR}" is no longer supported

Replace the line that sets S to "${WORKDIR}" with the appropriate
path to the source files.

As generic example: S = "${WORKDIR}/path/to/source"

### [6] meta-qt6 repo replacing meta-qt5 one

	## meta-qt6
	git clone https://code.qt.io/yocto/meta-qt6.git
	cd meta-qt6
	git checkout upstream/$ReleaseName

### [7] Execution of the DISTRO_VERSION 5.2.4

bitbake -k core-image-minimal

Important: walnascar's latest bitbake version went to 2.12.1.

	Latest commits with 5.2.4 walnascar release:

NOTE: Resolving any missing task queue dependencies

```
	Build Configuration:
**==>>	BB_VERSION           = "2.12.1"
	BUILD_SYS            = "x86_64-linux"
	NATIVELSBSTRING      = "universal"
	TARGET_SYS           = "arm-poky-linux-gnueabi"
	MACHINE              = "beaglebone-yocto"
	DISTRO               = "poky"
**==>>	DISTRO_VERSION       = "5.2.4"
	TUNE_FEATURES        = "arm vfp cortexa8 neon callconvention-hard"
	TARGET_FPU           = "hard"
	meta
	meta-poky
	meta-yocto-bsp       = "walnascar:d0b46a6624ec9c61c47270745dd0b2d5abbe6ac1"
	meta-jumpnow         = "walnascar:d75272ddf82f1314d95ad2ccb8737d48d42e9d1f"
	meta-bbb             = "walnascar:977dfd6abc0d6e70fa009c289e3faf2d7720d280"
	meta-oe
	meta-python
	meta-networking      = "walnascar:07330a98cf93806b7a4e0170a541b94962ff3960"
	meta-qt6             = "dev:c01d4217149a1960b2e12a23156000817e53b455"
	meta-socketcan       = "walnascar:47a57f2f467e8d18cdaa1f2f682b296e37fec2c2"
```
