### YOCTO-QEMU

#### [yocto] [meta-virtualization][PATCH] libvirt: remove qemu from PACKAGECONFIG for mips n32 and n64
https://www.yoctoproject.org/pipermail/yocto/2018-October/042846.html

#### Xen on ARM and Yocto
https://wiki.xenproject.org/wiki/Xen_on_ARM_and_Yocto

#### Composing Reliable Systems with Virtualization and the Yocto Project
file:///tmp/mozilla_vuser0/YPS_Virtualization_EU20_BOiLxgH.pdf

#### PACKAGECONFIG

This variable provides a means of enabling or disabling features of a recipe
on a per-recipe basis. PACKAGECONFIG blocks are defined in recipes when you
specify features and then arguments that define feature behaviors. Here is the
basic block structure (broken over multiple lines for readability):

	PACKAGECONFIG ??= "f1 f2 f3 ..."
	PACKAGECONFIG[f1] = "\
			      --with-f1, \
			      --without-f1, \
			      build-deps-for-f1, \
			      runtime-deps-for-f1, \
			      runtime-recommends-for-f1, \
			      packageconfig-conflicts-for-f1 \
			      "
	PACKAGECONFIG[f2] = "\
			     ... and so on and so on ...

The PACKAGECONFIG variable itself specifies a space-separated list of the features
to enable. Following the features, you can determine the behavior of each feature
by providing up to six order-dependent arguments, which are separated by commas.

You can omit any argument you like but must retain the separating commas. The order
is important and specifies the following:

Extra arguments that should be added to the configure script argument list
(EXTRA_OECONF or PACKAGECONFIG_CONFARGS) if the feature is enabled.

Extra arguments that should be added to EXTRA_OECONF or PACKAGECONFIG_CONFARGS
if the feature is disabled.

Additional build dependencies (DEPENDS) that should be added if the feature is
enabled.

Additional runtime dependencies (RDEPENDS) that should be added if the feature
is enabled.

Additional runtime recommendations (RRECOMMENDS) that should be added if the
feature is enabled.

Any conflicting (that is, mutually exclusive) PACKAGECONFIG settings for this
feature.

##### QEMU example
https://www.yoctoproject.org/docs/current/mega-manual/mega-manual.html#migration-1.7-changes-to-setting-qemu-packageconfig-options

Consider the following PACKAGECONFIG block taken from the librsvg recipe. In
this example the feature is qemu, which has three arguments that determine the
feature's behavior:

	PACKAGECONFIG[qemu] = "--with-qemu,--without-qemu,qemu"

The --with-qemu and qemu arguments apply only if the feature is enabled. In this
case, --with-qemu is added to the configure script argument list and qemu is added
to DEPENDS. On the other hand, if the feature is disabled say through a .bbappend
file in another layer, then the second argument --without-qemu is added to the
configure script instead.

The basic PACKAGECONFIG structure previously described holds true regardless of
whether you are creating a block or changing a block. When creating a block,
use the structure inside your recipe.

If you want to change an existing PACKAGECONFIG block, you can do so one of two
ways: 

[1] Append file: Create an append file named recipename.bbappend in your layer
and override the value of PACKAGECONFIG. You can either completely override the
variable:

	PACKAGECONFIG = "f4 f5"

Or, you can just append the variable:

	PACKAGECONFIG_append = " f4"

[2] Configuration file: This method is identical to changing the block through
an append file except you edit your local.conf or mydistro.conf file. As with
append files previously described, you can either completely override the
variable:

	PACKAGECONFIG_pn-recipename = "f4 f5"

Or, you can just amend the variable:

	PACKAGECONFIG_append_pn-recipename = " f4"
