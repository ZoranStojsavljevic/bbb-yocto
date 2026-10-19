## wrynose RELEASE_NOTES.md

### [1] Start tracking bbb-yocto layer by <release-name> since scarthgap

Once the repo bbb-yocto is cloned with the command:

	$ git clone git@github.com:ZoranStojsavljevic/bbb-yocto.git

The command to be used to run the setup is the following:

	$ cd bbb-yocto

	### For now, the following mandatory command
	### since Yocto scarthgap release is a MUST!

	if <release-name> .GT. nanbield {
		$ git checkout <release-name>
	}
	$ . yocto-setup.sh <release-name>

	### Latest example
	git checkout wrynose
	. yocto-setup.sh wrynose

### [2] Git repository: https://github.com/Wind-River/meta-secure-core

This is (as noted before) a test feature. To understand how to
incorporate TPM2 security features for true TPM2 HW platforms.

	https://layers.openembedded.org/layerindex/branch/wrynose/layers/

	https://layers.openembedded.org/layerindex/branch/wrynose/layer/meta-tpm2/

Git repository:

	https://github.com/Wind-River/meta-secure-core

Subdirectory:
* [meta-tpm2](https://github.com/Wind-River/meta-secure-core/tree/wrynose/meta-tpm2)

### [3] Git repository: https://github.com/tpm2-software/tpm2-pkcs11/releases/tag/1.9.1

=== WORK IN PROGRESS! This is TPM2 still for walnascar release! ===
=== TPM2 is not included in the wrynose release. Will do later. ===

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

=== WORK IN PROGRESS! This is TPM2 for walnascar release! ===

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

=== END WORK IN PROGRESS! ---

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

#### [5.1] S = "${WORKDIR}"

S = "${WORKDIR}" is no longer supported

Replace the line that sets S to "${WORKDIR}" with the appropriate
path to the source files.

As generic example:

	S = "${WORKDIR}/path/to/source"

#### [5.2] Recipes that set S = "${WORKDIR}/git" or S = "${UNPACKDIR}/git"

linux-stable-6.18.57-r0 do_unpack: Recipes that set
S = "${WORKDIR}/git" or S = "${UNPACKDIR}/git" should remove
that assignment, as S set by bitbake.conf in oe-core now works.

S = "${WORKDIR}/git" should be deleted from or commented in the
kernel recipe!

#### [5.3] The rest of the comments from the kernel recipe

Please, read rest of the comments from the kernel recipe, which
are continuation of [5.2] :

	.../bbb-yocto/meta-bbb/recipes-kernel/linux/linux-stable_6.18.bb

### [6] IMPORTANT - New way how repo poky is set

## Please, it is strongly advised to poky users that they
## should (better say MUST) read the following documentation
## to understand this initial script!
## https://docs.yoctoproject.org/dev-manual/poky-manual-setup.html

Included is a helper script for the poky setup:

	.../bbb-yocto/documentation/YOCTO-POKY/poky_setup.sh

### Devtool helper how to use devtool to produce new patches

Please, read the following file README_DEVTOOL.md:

	.../bbb-yocto/documentation/YOCTO-POKY/README_DEVTOOL.md

### [8] Execution of the DISTRO_VERSION 6.0.4

	bitbake -k core-image-minimal

Important: wrynose's latest bitbake version went to 2.18.1.

Latest commits are with 6.0.4 wrynose release.

	Build Configuration:

	**==>>	BB_VERSION           = "2.18.0"
		BUILD_SYS            = "x86_64-linux"
		NATIVELSBSTRING      = "fedora-42"
		TARGET_SYS           = "arm-poky-linux-gnueabi"
		MACHINE              = "beaglebone-yocto"
		SDKMACHINE           = "x86_64"
		DISTRO               = "poky"
	**==>>	DISTRO_VERSION       = "6.0.4"
		TUNE_FEATURES        = "arm vfp cortexa8 neon callconvention-hard"
		meta                 = "wrynose:636e5d3b12d54951c13d57346648bc29a0e6b24e"
		meta-jumpnow         = "wrynose:ea3165ddebfda60ec1c48171eee86345e2df69af"
		meta-bbb             = "wrynose:babad72813cca9eecce526cf4b5364746ba4a330"
		meta-oe
		meta-python
		meta-networking      = "wrynose:f28a144aa0a0ae05ca2ee91e1aef6aa05f6a12db"
	[6.11]	meta-qt6             = "6.11:ec98b3ab1c8deeab9412ef6cbfd55729dc567b01"
		meta-socketcan       = "wrynose:32db2e32e907adfa9c08bddd866ffe60cfd7ea0e"
		meta-poky
		meta-yocto-bsp       = "wrynose:7c25b11156553145fa6b241a2d4f65d94438f804"

### [9] Changing from meta-qt6 dev branch to meta-qt6 6.11 branch

From meta-qt6 repo at: https://code.qt.io/yocto/meta-qt6.git :

For some reason, meta-qt6 maintainers changed symbolic names
with numbers!

Each Qt release is tagged either as v6.x.y or v6.x.y-lts.

The following table shows the Yocto releases that are used to
test each Qt version (x) and any additional Yocto releases that
are stated in the LAYERSERIES_COMPAT (c).

Yocto \ Qt 	6.11 	6.10 	6.9 	6.8 	6.7 	6.6 	6.5 	6.4 	6.3 	6.2
-------------------------------------------------------------------------------------------
wrynose 	x 			x
whinlatter 	x 	c 	c 	x
walnascar 	c 	c 	c 	c
styhead 	c 	c 	c 	c 	c
scarthgap 	x 	c 	c 	x 	c 	c 	x
nanbield 		c 	c 	c 	c 	c 	c
mickledore 		c 	c 	c 	c 	c 	c 	c
langdale 		c 	c 	c 	c 	c 	c 	c
kirkstone 		c 	c 	x 	c 	c 	c 	c 	c 	c
honister 						c 	c 	c 	c 	c
hardknott 						c 	c 	c 	c 	c
gatesgarth 						c 	c 	c 	c 	c
dunfell							c 	c 	c 	c 	c
-------------------------------------------------------------------------------------------
		stable 	closed 	EOS 	LTS 	EOS 	EOS 	ESM 	EOS 	EOS 	EOS

This issue is to be investigated further.

The code in bash script for YOCTO release setup is temporary
changed such as (for $ReleaseName = wrynose)

	## git checkout upstream/$ReleaseName
	git checkout 6.11
