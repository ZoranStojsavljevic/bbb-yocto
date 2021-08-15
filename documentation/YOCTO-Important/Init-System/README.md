### 4.16.1 Init System Selection

Changing the init system manager previously required setting a number of different
variables. You can now change the manager by setting the INIT_MANAGER variable and the
corresponding include files (i.e. poky/meta/conf/distro/include/init-manager-*.conf).
Include files are provided for four values:
“none”,
“sysvinit”,
“systemd”,
“mdev-busybox”.
The default value, “none”, for INIT_MANAGER should allow your current settings to
continue working. However, it is advisable to explicitly set INIT_MANAGER in
local.conf .

#### INIT_MANAGER example

The set of commands in local.conf:

	DISTRO_FEATURES_append = " systemd"
	DISTRO_FEATURES_BACKFILL_CONSIDERED_append = " sysvinit"
	VIRTUAL-RUNTIME_init_manager ??= "systemd"
	VIRTUAL-RUNTIME_initscripts ??= "systemd-compat-units"
	VIRTUAL-RUNTIME_login_manager ??= "shadow-base"

Could be replaced with one line since poky 3.0.0:

	INIT_MANAGER ?= "systemd"
