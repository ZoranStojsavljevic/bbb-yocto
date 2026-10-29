## Quick raw guide (using u-boot as example) how to use devtool for creating a patch

### devtool initial command

.../bbb-yocto/layers/openembedded-core/build$ devtool modify u-boot

	NOTE: Starting bitbake server...

	[snap]

	INFO:	SRC_URI contains some conditional appends/prepends -
		will create branches to represent these
	NOTE:	Resolving any missing task queue dependencies

	[snap]

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

.../bbb-yocto/layers/openembedded-core/build$ devtool finish --force-patch-refresh u-boot .../bbb-yocto/meta-bbb/

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
