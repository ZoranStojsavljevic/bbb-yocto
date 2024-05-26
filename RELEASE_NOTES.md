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

### [5] ISSUES in the Poky 5.0.1

These issues supposed to be fixed in Poky 5.0.2

Host distribution "Fedora 40" has not been validated yet

	WARNING: Host distribution "Fedora 40" has not been validated
	with this version of the build system; you may possibly
	experience unexpected failures. It is recommended that you use
	a tested distribution.

Fedora 40 is NOT yet supported as a host distro. To use Fedora
40, there is an effort to support GCC 14.1, which involves
fixing problems like the following:

	[5.1] Incompatibility with Fedora 40 (uninative)
	[5.2] cracklib package to be changed to accomodate gcc 14.1 package

#### [5.1] Incompatibility with Fedora 40 (uninative)

	## TEMPORARY FIX: pzstd: /home/vuser/projects2/yocto/yocto_test2/bbb-yocto/ \
	## poky/build/tmp/sysroots-uninative/x86_64-linux/usr/lib/libstdc++.so.6: \
	## version `CXXABI_1.3.15' not found (required by pzstd)
	## This is an incompatibility with Fedora 40 and uninative, so until this
	## is resolved. please, disable uninative with this in the local.conf:
	INHERIT:remove = "uninative"

#### [5.2] cracklib package to be changed to accomodate gcc 14.1 package

* [cracklib fix - yet to be applied](https://git.openembedded.org/openembedded-core/commit/?id=914128f6bd988cde278e087fb9457a0c70c7e5ec)

Where is the cracklib recipe in poky?

	.../bbb-yocto/poky/meta/recipes-extended/cracklib/cracklib_2.9.11.bb

There is a mandatory patch which should be added to the Fedora 40 release!

	.../bbb-yocto/poky/meta/recipes-extended/cracklib/cracklib/0001-packlib.c-support-dictionary-byte-order-dependent.patch

```
$ git diff meta/recipes-extended/cracklib/cracklib/0001-packlib.c-support-dictionary-byte-order-dependent.patch
diff --git a/meta/recipes-extended/cracklib/cracklib/0001-packlib.c-support-dictionary-byte-order-dependent.patch b/meta/recipes-extended/cracklib/cracklib/0001-packlib.c-support-dictionary-byte-order-dependent.patch
index 20572b55c4..35229ae890 100644
--- a/meta/recipes-extended/cracklib/cracklib/0001-packlib.c-support-dictionary-byte-order-dependent.patch
+++ b/meta/recipes-extended/cracklib/cracklib/0001-packlib.c-support-dictionary-byte-order-dependent.patch
@@ -303,7 +303,7 @@ index 9396e1d..d0bb181 100644
 +          PWDICT tmp_pwp;
 +
 +          memcpy(&tmp_pwp, pwp, sizeof(PWDICT));
-+          HwmsHostToBigEndian(tmp_pwp.hwms, sizeof(tmp_pwp.hwms), en_is32);
++          HwmsHostToBigEndian((char *)tmp_pwp.hwms, sizeof(tmp_pwp.hwms), en_is32);
 +          fwrite(tmp_pwp.hwms, 1, sizeof(tmp_pwp.hwms), pwp->wfp);
        }
      }
```

Resulting in adding a temporary patch in yocto-setup.sh:

	## poky
	git clone https://git.yoctoproject.org/git/poky.git
	cd poky
	git checkout $ReleaseName

	## ------- add to poky meta-secure-core repo
	## meta-secure-core
	git clone https://github.com/Wind-River/meta-secure-core
	cd meta-secure-core
	git checkout $ReleaseName
	cd ..
	## ------- end add to poky meta-secure-core repo

	## Poky 5.0.1 Release - added modified TEMPORARY F40 support patch
	if [[ "$ReleaseName" == "scarthgap" ]]; then
		rm ./meta/recipes-extended/cracklib/cracklib/0001-packlib.c-support-dictionary-byte-order-dependent.patch
		cp ../tmp-patch/0001-packlib.c-support-dictionary-byte-order-dependent.patch \
			./meta/recipes-extended/cracklib/cracklib/
		ls -al ./meta/recipes-extended/cracklib/cracklib/000*
	fi
	## Poky 5.0.1 Release patch - to be removed in 5.0.2 (?)
	cd ..

These patches are temporary added to the current yocto 5.0.1
Final Release.

### [6] Poky 5.0.1 Final Release makes the BBB Poky 5.0.1 to work

bitbake -k core-image-minimal

WARNING: Host distribution "fedora-40" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache: 100% |                                                      | ETA:  --:--:--
Loaded 0 entries from dependency cache.
Parsing recipes: 100% |#####################################################| Time: 0:04:02
Parsing of 2809 .bb files complete (0 cached, 2809 parsed). 4712 targets, 135 skipped, 1 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

```
Build Configuration:
BB_VERSION           = "2.8.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "fedora-40"
TARGET_SYS           = "arm-poky-linux-gnueabi"
MACHINE              = "beaglebone"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0.1" <<<======= Final Poky 5.0.1 Release =======
TUNE_FEATURES        = "arm vfp cortexa8 neon callconvention-hard"
TARGET_FPU           = "hard"
meta
meta-poky
meta-yocto-bsp       = "scarthgap:68f9a4b73d17839e0ec1f12a31fc1d42331cc42f"
meta-jumpnow         = "scarthgap:500080773492dd842d6ea0627ebc80b2f775ca1c"
meta-bbb             = "scarthgap:d3a38f37bb3ca7ebe51c6200258bd9cae0c0203c"
meta-oe
meta-python
meta-networking      = "scarthgap:6de0ab744341ad61b0661aa28d78dc6767ce0786"
meta-qt5             = "upstream/scarthgap:d8eeef0bfd84672c7919cd346f25f7c9a98ddaea"
meta-socketcan       = "scarthgap:3bceabca635c98f06e5e0fb0d411813c3730d805"
```

Sstate summary: Wanted 2404 Local 0 Mirrors 0 Missed 2404 Current 0 (0% match, 0% complete)
Initialising tasks: 100% |##################################################| Time: 0:00:05
NOTE: Executing Tasks
WARNING: libpng-1.6.42-r0 do_fetch: Failed to fetch URL https://downloads.sourceforge.net/project/libpng/libpng16/libpng-1.6.42.tar.xz, attempting MIRRORS if available
WARNING: linux-stable-6.9.1-r0 do_package_qa: QA Issue: Recipe LICENSE includes obsolete licenses GPLv2 [obsolete-license]
NOTE: Tasks Summary: Attempted 4990 tasks of which 6 didn't need to be rerun and all succeeded.

Summary: There were 3 WARNING messages.

