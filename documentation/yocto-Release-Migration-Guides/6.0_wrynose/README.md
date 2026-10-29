## Kernel 6.18.57 additional requirements for YOCTO 6.0.4

### Does NOT need EXTRA_OECONF:append:pn-strace = " --enable-bundled=yes"

	Kernel 6.18.57 for YOCTO release 6.0.4 (wrynose) does NOT
	require in all local.conf* files the following command:
	EXTRA_OECONF:append:pn-strace = " --enable-bundled=yes"

	All these comments explaining command and command itself:
	EXTRA_OECONF:append:pn-strace = " --enable-bundled=yes"
	should be deleted!

	## This is a compile-time structure-size mismatch in strace 6.12
	## involving io_uring, not a direct incompatibility between strace
	## 6.12 and Linux kernel 6.18.57.
	##
	## The decisive error is:
	## src/macros.h:141:9: error: static assertion failed:
	## "Unexpected size of arg.pad (6 * sizeof(uint32_t) expected).
	## --enabled-bundled=yes configure option may be used to work around that."
	##
	## src/io_uring.c:812:
	## CHECK_TYPE_SIZE(arg.pad, 6 * sizeof(uint32_t));
	##
	## The strace source expects arg.pad to occupy 24 bytes, but the
	## structure definition visible to the compiler has a different size.
	## This points to a mismatch in the io_uring definitions selected
	## during the build.
	## Importantly, the compiler command targets 32-bit ARM hard-float
	## (Cortex-A8). The kernel version alone doesn't establish why this
	## structure has the wrong size.
	####### EXTRA_OECONF:append:pn-strace = " --enable-bundled=yes"

### Changes considering ${WORKDIR}" variable

#### [1] S = "${WORKDIR}"

	S = "${WORKDIR}" is no longer supported

	Replace the line that sets S to "${WORKDIR}" with the appropriate
	path to the source files.

	As generic example:

	S = "${WORKDIR}/path/to/source"

#### [2] Recipes that set S = "${WORKDIR}/git" or S = "${UNPACKDIR}/git"

	linux-stable-6.18.57-r0 do_unpack: Recipes that set
	S = "${WORKDIR}/git" or S = "${UNPACKDIR}/git" should remove
	that assignment, as S set by bitbake.conf in oe-core now works.

	S = "${WORKDIR}/git" should be deleted from or commented in the
	kernel recipe!

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
