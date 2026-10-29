### Systemd Requirements
https://cgit.freedesktop.org/systemd/systemd/tree/README

https://cgit.freedesktop.org/systemd/systemd/tree/README#n38

REQUIREMENTS:
	Linux kernel >= 3.7
	Linux kernel >= 3.8 for Smack support

	Kernel Config Options:
	  CONFIG_DEVTMPFS
	  CONFIG_CGROUPS (it is OK to disable all controllers)
	  CONFIG_INOTIFY_USER
	  CONFIG_SIGNALFD
	  CONFIG_TIMERFD
	  CONFIG_EPOLL
	  CONFIG_NET
	  CONFIG_SYSFS
	  CONFIG_PROC_FS
	  CONFIG_FHANDLE (libudev, mount and bind mount handling)

	udev will fail to work with the legacy sysfs layout:
	  CONFIG_SYSFS_DEPRECATED=n

	Legacy hotplug slows down the system and confuses udev:
	  CONFIG_UEVENT_HELPER_PATH=""

	Userspace firmware loading is not supported and should
	be disabled in the kernel:
	  CONFIG_FW_LOADER_USER_HELPER=n

	Some udev rules and virtualization detection relies on it:
	  CONFIG_DMIID

	Support for some SCSI devices serial number retrieval, to
	create additional symlinks in /dev/disk/ and /dev/tape:
	  CONFIG_BLK_DEV_BSG

	Required for PrivateNetwork and PrivateDevices in service units:
	  CONFIG_NET_NS
	  CONFIG_DEVPTS_MULTIPLE_INSTANCES
	Note that systemd-localed.service and other systemd units use
	PrivateNetwork and PrivateDevices so this is effectively required.

	Optional but strongly recommended:
	  CONFIG_IPV6
	  CONFIG_AUTOFS4_FS
	  CONFIG_TMPFS_XATTR
	  CONFIG_{TMPFS,EXT4,XFS,BTRFS_FS,...}_POSIX_ACL
	  CONFIG_SECCOMP
	  CONFIG_CHECKPOINT_RESTORE (for the kcmp() syscall)

	Required for CPUShares= in resource control unit settings
	  CONFIG_CGROUP_SCHED
	  CONFIG_FAIR_GROUP_SCHED

	Required for CPUQuota= in resource control unit settings
	  CONFIG_CFS_BANDWIDTH

	For systemd-bootchart, several proc debug interfaces are required:
	  CONFIG_SCHEDSTATS
	  CONFIG_SCHED_DEBUG

	For UEFI systems:
	  CONFIG_EFIVAR_FS
	  CONFIG_EFI_PARTITION

	We recommend to turn off Real-Time group scheduling in the
	kernel when using systemd. RT group scheduling effectively
	makes RT scheduling unavailable for most userspace, since it
	requires explicit assignment of RT budgets to each unit whose
	processes making use of RT. As there's no sensible way to
	assign these budgets automatically this cannot really be
	fixed, and it's best to disable group scheduling hence.
	   CONFIG_RT_GROUP_SCHED=n

	Note that kernel auditing is broken when used with systemd's
	container code. When using systemd in conjunction with
	containers, please make sure to either turn off auditing at
	runtime using the kernel command line option "audit=0", or
	turn it off at kernel compile time using:
	  CONFIG_AUDIT=n
	If systemd is compiled with libseccomp support on
	architectures which do not use socketcall() and where seccomp
	is supported (this effectively means x86-64 and ARM, but
	excludes 32-bit x86!), then nspawn will now install a
	work-around seccomp filter that makes containers boot even
	with audit being enabled. This works correctly only on kernels
	3.14 and newer though. TL;DR: turn audit off, still.

	glibc >= 2.16
	libcap
	libmount >= 2.20 (from util-linux)
	libseccomp >= 1.0.0 (optional)
	libblkid >= 2.24 (from util-linux) (optional)
	libkmod >= 15 (optional)
	PAM >= 1.1.2 (optional)
	libcryptsetup (optional)
	libaudit (optional)
	libacl (optional)
	libselinux (optional)
	liblzma (optional)
	liblz4 >= 119 (optional)
	libgcrypt (optional)
	libqrencode (optional)
	libmicrohttpd (optional)
	libpython (optional)
	libidn (optional)
	elfutils >= 158 (optional)
	make, gcc, and similar tools

	During runtime, you need the following additional
	dependencies:

	util-linux >= v2.26 required
	dbus >= 1.4.0 (strictly speaking optional, but recommended)
	dracut (optional)
	PolicyKit (optional)

	When building from git, the following tools are needed:

	pkg-config
	docbook-xsl
	xsltproc
	automake
	autoconf
	libtool
	intltool
	gperf
	python (optional)
	python-lxml (optional, but required to build the indices)
	sphinx (optional)

	The build system is initialized with ./autogen.sh. A tar ball
	can be created with:
	  git archive --format=tar --prefix=systemd-222/ v222 | xz > systemd-222.tar.xz

	When systemd-hostnamed is used, it is strongly recommended to
	install nss-myhostname to ensure that, in a world of
	dynamically changing hostnames, the hostname stays resolvable
	under all circumstances. In fact, systemd-hostnamed will warn
	if nss-myhostname is not installed.

	To build HTML documentation for python-systemd using sphinx,
	please first install systemd (using 'make install'), and then
	invoke sphinx-build with 'make sphinx-<target>', with <target>
	being 'html' or 'latexpdf'. If using DESTDIR for installation,
	pass the same DESTDIR to 'make sphinx-html' invocation.
