### Git repository: https://github.com/Wind-River/meta-secure-core

This is (as noted before) a test feature. To understand how to
incorporate TPM2 security features for true TPM2 HW platforms.

https://layers.openembedded.org/layerindex/branch/scarthgap/layer/meta-tpm2/

Git repository: https://github.com/Wind-River/meta-secure-core

Subdirectory:

* [meta-tpm2](https://github.com/Wind-River/meta-secure-core/tree/scarthgap/meta-tpm2)

	Last commit: May 3, 2024 (scarthgap branch)
	Maintainer: Mingli-Yu
	email: 

#### Layer meta-socketcan

Layer meta-socketcan still holds outdated YOCTO releases, just
in case that somebody else is using my native meta-socketcan
repository.

From conf/layer.conf :

	LAYERSERIES_COMPAT_meta-socketcan =
	"sumo thud warrior zeus dunfell gatesgarth hardknott honister \
		kirkstone langdale mickledore scarthgap nanbield"

From the scarthgap release, meta-socketcan repo will be tracked
as well via git.
