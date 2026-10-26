## Quick raw guide (by example) how to use devtool for patch creating

### devtool initial command

.../bbb-yocto/layers/openembedded-core/build$ devtool modify u-boot

	NOTE: Starting bitbake server...

	[snap]

	INFO:	SRC_URI contains some conditional appends/prepends -
		will create branches to represent these
	NOTE:	Resolving any missing task queue dependencies

	Build Configuration:

	BB_VERSION           = "2.18.0"
	BUILD_SYS            = "x86_64-linux"
	NATIVELSBSTRING      = "universal"
	TARGET_SYS           = "arm-poky-linux-gnueabi"
	MACHINE              = "beaglebone-yocto"
	SDKMACHINE           = "x86_64"
	DISTRO               = "poky"
	DISTRO_VERSION       = "6.0.4"
	TUNE_FEATURES        = "arm vfp cortexa8 neon callconvention-hard"
	meta                 = "wrynose:636e5d3b12d54951c13d57346648bc29a0e6b24e"
	meta-jumpnow         = "wrynose:ea3165ddebfda60ec1c48171eee86345e2df69af"
	meta-bbb             = "wrynose:babad72813cca9eecce526cf4b5364746ba4a330"
	meta-oe
	meta-python
	meta-networking      = "wrynose:f28a144aa0a0ae05ca2ee91e1aef6aa05f6a12db"
	meta-qt6             = "6.11:ec98b3ab1c8deeab9412ef6cbfd55729dc567b01"
	meta-socketcan       = "wrynose:32db2e32e907adfa9c08bddd866ffe60cfd7ea0e"
	meta-poky
	meta-yocto-bsp       = "wrynose:7c25b11156553145fa6b241a2d4f65d94438f804"

	Sstate summary: Wanted 0 Local 0 Mirrors 0 Missed 0 Current 30 (0% match, 100% complete)
	Initialising tasks: 100% |###############################################|
	NOTE:	 Executing Tasks
	NOTE:	 Tasks Summary: Attempted 103 tasks of which 100
		 didn't need to be rerun and all succeeded.
	INFO:	 Source tree extracted to
		 .../bbb-yocto/layers/openembedded-core/build/workspace/sources/u-boot
	WARNING: SRC_URI is conditionally overridden in this recipe,
		 thus several devtool-override-* branches have been created,
		 one for each override that makes changes to SRC_URI. It is
		 recommended that you make changes to the devtool branch
		 first, then checkout and rebase each devtool-override-*
		 branch and update any unique patches there (duplicates on
		 those branches will be ignored by devtool finish/update-recipe)
	INFO:	 Recipe u-boot now set up to build from
		 .../bbb-yocto/layers/openembedded-core/build/workspace/sources/u-boot

### devtool final command

.../bbb-yocto/layers/openembedded-core/build$ devtool finish --force-patch-refresh u-boot \
  .../bbb-yocto/meta-bbb/

	NOTE:	 Starting bitbake server...

	[snap]

	INFO:	 Handling main branch (devtool)...
	NOTE:	 Writing append file
		 .../bbb-yocto/meta-bbb/recipes-bsp/u-boot/u-boot_%.bbappend
	NOTE:	 Copying CVE-2026-46728.patch to
		 .../bbb-yocto/meta-bbb/recipes-bsp/u-boot/files/CVE-2026-46728.patch
	NOTE:	 Copying 0001-Customize-config-and-boot-command.patch to
		 .../bbb-yocto/meta-bbb/recipes-bsp/u-boot/files/ \
		 0001-Customize-config-and-boot-command.patch
	INFO:	 Handling branch devtool-override-genericarm64...
	NOTE:	 Writing append file .../bbb-yocto/meta-bbb/recipes-bsp/u-boot/ \
		 u-boot_%.bbappend
	NOTE:	 Copying CVE-2026-46728.patch to ..
		 /bbb-yocto/meta-bbb/recipes-bsp/u-boot/files/CVE-2026-46728.patch
	NOTE:	 Copying 0001-Customize-config-and-boot-command.patch to
		 .../bbb-yocto/meta-bbb/recipes-bsp/u-boot/files/ \
		 0001-Customize-config-and-boot-command.patch
	INFO:	 Handling branch devtool-override-qemuarm64...
	NOTE:	 Writing append file
		 .../bbb-yocto/meta-bbb/recipes-bsp/u-boot/u-boot_%.bbappend
	NOTE:	 Copying CVE-2026-46728.patch to
		 .../bbb-yocto/meta-bbb/recipes-bsp/u-boot/files/CVE-2026-46728.patch
	NOTE:	 Copying 0001-Customize-config-and-boot-command.patch to
		 .../bbb-yocto/meta-bbb/recipes-bsp/u-boot/files/0001-Customize-config-and-boot-command.patch
	INFO:	 Handling branch devtool-override-riscv32...
	NOTE:	 Writing append file
		 .../bbb-yocto/meta-bbb/recipes-bsp/u-boot/u-boot_%.bbappend
	NOTE:	 Copying CVE-2026-46728.patch to
		 .../bbb-yocto/meta-bbb/recipes-bsp/u-boot/files/CVE-2026-46728.patch
	NOTE:	 Copying 0001-Customize-config-and-boot-command.patch to
		 .../bbb-yocto/meta-bbb/recipes-bsp/u-boot/files/0001-Customize-config-and-boot-command.patch
	INFO:	 Handling branch devtool-override-riscv64...
	NOTE:	 Writing append file
		 .../bbb-yocto/meta-bbb/recipes-bsp/u-boot/u-boot_%.bbappend
	NOTE:	 Copying CVE-2026-46728.patch to
		 .../bbb-yocto/meta-bbb/recipes-bsp/u-boot/files/CVE-2026-46728.patch
	NOTE:	 Copying 0001-Customize-config-and-boot-command.patch to
		 .../bbb-yocto/meta-bbb/recipes-bsp/u-boot/files/ \
		 0001-Customize-config-and-boot-command.patch
	INFO:	 Cleaning sysroot for recipe u-boot...
	INFO:	 Preserving source tree in
		 .../bbb-yocto/layers/openembedded-core/build/workspace/attic/sources/ \
		 u-boot.20261021152335

		 If you no longer need it then please delete it manually.
		 It is also possible to reuse it via devtool source tree argument.

### devtool results

Please, the following notes (devtool results) require attention:

	NOTE:	Copying CVE-2026-46728.patch to .../bbb-yocto/ \
		meta-bbb/recipes-bsp/u-boot/files/CVE-2026-46728.patch
	NOTE:	Copying 0001-Customize-config-and-boot-command.patch to
		.../bbb-yocto/meta-bbb/recipes-bsp/u-boot/files/ \
		0001-Customize-config-and-boot-command.patch
