### Kernel 6.18.57 additional requirements for YOCTO 5.2.4

Kernel 6.18.57 for YOCTO release 5.2.4 (walnascar) for kernel
6.18.57 requires in all local.conf the following command:
EXTRA_OECONF:append:pn-strace = " --enable-bundled=yes"

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
	EXTRA_OECONF:append:pn-strace = " --enable-bundled=yes"

This requirement is not required for YOCTO 6.0.4 (wrynose).
