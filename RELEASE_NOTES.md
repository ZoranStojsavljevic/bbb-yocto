## wrynose RELEASE_NOTES.md

### [1] Start tracking bbb-yocto layer by <release-name> since scarthgap

Once the repo bbb-yocto is cloned with the command:

	$ git clone git@github.com:ZoranStojsavljevic/bbb-yocto.git

The command to be used to run the setup is the following:

	$ cd bbb-yocto

	## For now, the following commands are used:

	$ git checkout <release-name>
	$ . yocto-setup.sh <release-name>

	## Latest example:
	$ git checkout wrynose
	$ . yocto-setup.sh wrynose

Please, use ONLY this form of setup command (NOT a
./yocto-setup.sh <release-name>)!

### [2] Git repository: https://github.com/Wind-River/meta-secure-core

Repo meta-secure-core is cloned into ./layers/meta-secure-core .
The directory structure looks like this:

	 bbb-yocto/
	 └──layers/
	    ├── meta-openembedded/
	    │   ├── meta-oe/
	    │	├──meta-perl
	    │   └── build/
	    │	    └── conf/
	    │		└── bblayers.conf
	    └── meta-secure-core/
		├── meta-signing-key/
		├── meta-secure-core-common/
		├── meta-efi-secure-boot/
		├── meta-integrity/
		├── meta-encrypted-storage/
		└── meta-tpm2/

Please, do note that there is a very powerful command:

	$ tree -L <depth>

Repo meta-secure-core (as noted before) is a test feature.
To understand how to incorporate TPM2 security features for
true TPM2 HW platforms.

Git repository:

	https://github.com/Wind-River/meta-secure-core

Subdirectory:
* [meta-tpm2](https://github.com/Wind-River/meta-secure-core/tree/wrynose/meta-tpm2)

### [3] Git repository: https://github.com/tpm2-software/tpm2-pkcs11/releases/tag/1.9.1

Release tpm2-pkcs11 1.9.1 is still included for the wrynose
DISTRO_VERSION = "6.0.4" :

	tpm2-pkcs11 [1.9.1]

```
.../bbb-yocto$ cd ./layers/meta-secure-core/meta-tpm2/recipes-tpm/
.../bbb-yocto/layers/meta-secure-core/meta-tpm2/recipes-tpm/

.../bbb-yocto/layers/meta-secure-core/meta-tpm2/recipes-tpm$ ls -al
	total 40
	drwxr-xr-x. 10 vuser vboxusers 4096 Oct 25 16:19 .
	drwxr-xr-x.  6 vuser vboxusers 4096 Oct 25 16:19 ..
	drwxr-xr-x.  3 vuser vboxusers 4096 Oct 25 16:19 tpm2-abrmd
	drwxr-xr-x.  2 vuser vboxusers 4096 Oct 25 16:19 tpm2-openssl
	drwxr-xr-x.  2 vuser vboxusers 4096 Oct 25 16:19 tpm2-pkcs11
	drwxr-xr-x.  2 vuser vboxusers 4096 Oct 25 16:19 tpm2-pytss
	drwxr-xr-x.  3 vuser vboxusers 4096 Oct 25 16:19 tpm2-tools
	drwxr-xr-x.  2 vuser vboxusers 4096 Oct 25 16:19 tpm2-totp
	drwxr-xr-x.  3 vuser vboxusers 4096 Oct 25 16:19 tpm2-tss
	drwxr-xr-x.  3 vuser vboxusers 4096 Oct 25 16:19 tpm2-tss-engine

.../bbb-yocto$ cd ./layers/meta-secure-core/meta-tpm2/recipes-tpm/tpm2-pkcs11 

.../bbb-yocto/layers/meta-secure-core/meta-tpm2/recipes-tpm/tpm2-pkcs11$ ls -al
	total 12
	drwxr-xr-x.  2 vuser vboxusers 4096 Oct 25 16:19 .
	drwxr-xr-x. 10 vuser vboxusers 4096 Oct 25 16:19 ..
	-rw-r--r--.  1 vuser vboxusers 1731 Oct 25 16:19 tpm2-pkcs11_1.9.1.bb

.../bbb-yocto/layers/meta-secure-core/meta-tpm2/recipes-tpm/tpm2-pkcs11$ git status
	On branch wrynose
	Your branch is up to date with 'origin/wrynose'.
```

#### [3.1] Relationship between OpenSSL, TPM 2.0, and tpm2-pkcs11

What is the relationship between OpenSSL, TPM 2.0, and
tpm2-pkcs11? Working with Yocto and tpm2-pkcs11, this
relationship is particularly relevant.

				Application
				     |
			Uses cryptographic operations
				     |
				  OpenSSL
				     |
		Provides cryptographic APIs and TLS functionality
				     |
			 PKCS#11 provider or engine
				     |
	   Connects compatible applications to a cryptographic token
				     |
				tpm2-pkcs11
				     |
	   Exposes TPM-managed cryptographic objects through PKCS#11
				     |
			     TPM 2.0 hardware
				     |
    Can protect private keys and perform supported cryptographic operations
    -----------------------------------------------------------------------

	- OpenSSL (Secure Sockets Layer) provides cryptographic
	  functionality and APIs.
	- TPM 2.0 provides hardware-backed security capabilities.
	- tpm2-pkcs11 lets compatible applications access TPM-backed
	- cryptographic objects through the PKCS#11 interface.

In a Yocto project, OpenSSL is commonly included as a separate
recipe and may be a dependency of other security-related
components.

#### [3.2] Git repo: https://github.com/tpm2-software/tpm2-pkcs11/releases/tag/1.9.1

Newest release (included in the wrynose DISTRO_VERSION = "6.0.4"):

	tpm2-pkcs11 [1.9.1] - long term

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
in case that somebody else is using native meta-socketcan
repository, presented under author's name.

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

```
## linux-stable-6.18.57-r0 do_unpack: Recipes that set
## S = "${WORKDIR}/git" or S = "${UNPACKDIR}/git" should remove
## that assignment, as S set by bitbake.conf in oe-core now works.
##
	## S = "${WORKDIR}/git"
##
## BitBake checks out the repository into a directory named
## after ${BP} under ${UNPACKDIR}. The additional files, such
## as the .dtsi files, are also unpacked there according to
## their subdir settings.
##
## ${WORKDIR} is the recipe's working area
## ${UNPACKDIR} is the area for unpacked source files
## ${S} identifies the source directory used by the build tasks.
##
## ${UNPACKDIR} = .../bbb-yocto/layers/openembedded-core/build/tmp/work/ \
##                beaglebone_yocto-poky-linux-gnueabi/linux-stable/6.18.57/sources
## ${BP} = linux-stable-6.18.57
##
## ${S} = .../beaglebone_yocto-poky-linux-gnueabi/linux-stable/6.18.57/sources/linux-stable-6.18.57

	S = "${UNPACKDIR}/${BP}"

## The command to inspect the actual values at any time is:
## bitbake -e linux-stable | grep -E '^(WORKDIR|UNPACKDIR|BP|S)='
```

### [6] IMPORTANT - New way how repo poky is set

	## Please, it is strongly advised to poky users that they
	## should (better say MUST) read the following documentation
	## to understand this initial script!
	## https://docs.yoctoproject.org/dev-manual/poky-manual-setup.html

Included is a helper script for the poky setup:

	.../documentation/yocto-Release-Migration-Guides/6.0_wrynose/poky_setup.script

### [7] Devtool helper how to use devtool to produce new patches

Please, read the following file README_DEVTOOL.md:

	.../documentation/yocto-Release-Migration-Guides/6.0_wrynose/README_DEVTOOL.md

### [8] Execution of the DISTRO_VERSION 6.0.4

	$ bitbake -k core-image-minimal

Important: wrynose's latest bitbake version went to 2.18.0.

Latest commits are with 6.0.4 wrynose release.

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
		meta                   = "wrynose:ae5a301091f5b0574ea7444aab40b309b6d9f3f2"
		meta-oe
		meta-perl
		meta-python
		meta-networking        = "wrynose:f28a144aa0a0ae05ca2ee91e1aef6aa05f6a12db"
		meta-bbb               = "wrynose:a744739bb31d61316bb4bb290ad6f8aa33f5daa8"
	[6.11]	meta-qt6               = "6.11:ec98b3ab1c8deeab9412ef6cbfd55729dc567b01"
		meta-socketcan         = "wrynose:32db2e32e907adfa9c08bddd866ffe60cfd7ea0e"
		meta-poky
		meta-yocto-bsp         = "wrynose:79b6d87030178bed0088ad3b00aa6dfbabac37c4"
		meta-jumpnow           = "wrynose:ea3165ddebfda60ec1c48171eee86345e2df69af"
		meta-signing-key
		meta-secure-core-common
		meta-tpm2
		meta-efi-secure-boot
		meta-integrity
		meta-encrypted-storage = "wrynose:07a99ae241acd488a2feda1ededf87dc70dfde80"

### [9] Changing from meta-qt6 dev branch to meta-qt6 6.11 branch

From meta-qt6 repo at: https://code.qt.io/yocto/meta-qt6.git :

For some reason, meta-qt6 maintainers changed symbolic names
with numbers!

Each Qt release is tagged either as v6.x.y or v6.x.y-lts.

The following table shows the Yocto releases that are used to
test each Qt version (x) and any additional Yocto releases that
are stated in the LAYERSERIES_COMPAT (c).
```
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
```
The code in bash script for YOCTO release setup is temporary
changed such as (for $ReleaseName = wrynose)

	## git checkout upstream/$ReleaseName
	$ git checkout 6.11
