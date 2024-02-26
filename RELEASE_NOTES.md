## Release_Notes (mickledore to nanbield)

### Why nanbield release (because of meta-tpm2 layer)?

The primary reason I wanted to do this release is NOT to proceed
to the new release. I wanted actually to include to the nanbield
release THE very important (additional) package: meta-tpm2!

https://layers.openembedded.org/layerindex/branch/nanbield/layer/meta-tpm2/

Please, do understand that this addendum is a test feature,
since TI am335x armv7 A8 does NOT include internal TPM
circuitry, neither TPM 2.0, neither TPM 1.2 one.

This is just to prove a concept that tpm2-tools code could be
added to the YOCTO nanbield release, emulating the another x86
(x86_64) commertial platform which has included TPM circuitry,
TPM 2.0 one.

https://octavosystems.com/forums/topic/high-security-hs-device/#post-6306

"Unfortunately, we do not offer a high-secure variant of the
OSD335x. The AM335x inside the OSD335x family is a general
purpose (GP) processor and does not support the TI secure boot
flow nor the Trustzone extensions within the Cortex A8. In
order to achieve secure boot, you must have external circuitry,
i.e. a TPM (Trusted Platform Module) and secure NOR flash. You
can find these components on the OSD3358-SM-RED:"

https://octavosystems.com/octavo_products/osd3358-sm-red

### Feature Presentation

#### [1] Addition of the RELEASE_NOTES

The RELEASE_NOTES.md is added to the repo.

#### [2] Addition of the meta-tpm2 package for the test purposes

https://layers.openembedded.org/layerindex/branch/nanbield/layer/meta-tpm2/

Git repository: https://github.com/Wind-River/meta-secure-core

Subdirectory:

* [meta-tpm2](https://github.com/Wind-River/meta-secure-core/tree/nanbield/meta-tpm2)

	Last commit: 5 months ago (nanbield branch)
	Maintainer: Jia Zhang (Author and maintainer)
	email: lans.zhang2008@gmail.com

	Recipe name			Version	Description
	----------------------------------------------------------------------------------------------
	packagegroup-tpm2		1.0	Packagegroup for TPM2 TCG TSS userspace and utilities.
	packagegroup-tpm2-initramfs	1.0	Packagegroup for TPM2 TCG TSS userspace and utilities.
	tpm2-abrmd			3.0.0	TPM2 Access Broker & Resource Manager
	tpm2-tools			5.5	Trusted Platform Module 2.0 tools
	tpm2-tss			4.0.1	Software stack for TPM2.

#### [3] Cleanup of the old unsupported yocto releases

	removed:	sumo release
	removed:	thud release
	removed:	warrior release
	removed:	zeus release

#### [4] IMPORTANT! Recipe Upgrades in nanbield

	libxcrypt: upgrade 4.4.33 -> 4.4.36

Since with the addition of the meta-tpm2 package in mickledore
release package libcrypt stopped compiling, and libxcrypt has
way to many dependencies to fix it in mickledore (the package
upgrade from 4.4.33 -> 4.4.36 in nanbield fixed it).

#### [5] Rebasing 0001-Customize-config-and-boot-command.patch

In bbb-yocto/meta-bbb/recipes-bsp/u-boot/files the patch:

	0001-Customize-config-and-boot-command.patch

is rebased since the u-boot v2023.10 is used for nanbield release.

#### [6] ERROR: u-boot-1_2023.10-r0 do_patch: QA Issue: Missing Upstream-Status in patch

	ERROR: u-boot-1_2023.10-r0 do_patch: QA Issue: Missing Upstream-Status in patch
	/home/vuser/projects2/yocto/bbb-yocto/meta-bbb/recipes-bsp/u-boot/files/0001-Customize-config-and-boot-command.patch
	Please add according to https://docs.yoctoproject.org/contributor-guide/recipe-style-guide.html#patch-upstream-status . [patch-status]
	ERROR: u-boot-1_2023.10-r0 do_patch: Fatal QA errors were found, failing task.
	ERROR: Logfile of failure stored in: /home/vuser/projects2/yocto/bbb-yocto/poky/build/tmp/work/beaglebone-poky-linux-gnueabi/u-boot/2023.10/temp/log.do_patch.1965726
	ERROR: Task (/home/vuser/projects2/yocto/bbb-yocto/poky/meta/recipes-bsp/u-boot/u-boot_2023.10.bb:do_patch) failed with exit code '1'

Solved by adding a line (temporary solution) in local.conf:

	ERROR_QA:remove:pn-u-boot = "patch-status"

A workaround. Must be permanently fixed in the next release!

#### [7] Layer meta-socketcan

Layer meta-socketcan still holds outdated YOCTO releases, just
in case that somebody else is using my native meta-socketcan
repository.

From conf/layer.conf :

	LAYERSERIES_COMPAT_meta-socketcan =
	"sumo thud warrior zeus dunfell gatesgarth hardknott honister \
		kirkstone langdale mickledore scarthgap nanbield"

