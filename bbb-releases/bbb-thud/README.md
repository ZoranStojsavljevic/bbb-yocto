### kas-bbb-thud.yml execution traces
```
  Build Configuration:
  BB_VERSION           = "1.40.0"
  BUILD_SYS            = "x86_64-linux"
  NATIVELSBSTRING      = "universal"
  TARGET_SYS           = "arm-poky-linux-gnueabi"
  MACHINE              = "beaglebone"
  DISTRO               = "poky"
  DISTRO_VERSION       = "2.6.2"
  TUNE_FEATURES        = "arm armv7a vfp neon callconvention-hard cortexa8"
  TARGET_FPU           = "hard"
```
```
-------
```
```
[user@fedora29-ssd bbb-yocto]$ kas build kas-bbb-thud.yml
2019-05-06 11:38:31 - INFO     - kas 1.0 started
2019-05-06 11:38:31 - INFO     - /home/user/projects2/beaglebone-black/bbb-yocto$ git rev-parse --show-toplevel
2019-05-06 11:38:31 - INFO     - /home/user/projects2/beaglebone-black/bbb-yocto$ hg root
2019-05-06 11:38:31 - INFO     - /home/user/projects2/beaglebone-black/bbb-yocto/meta-bbb$ git cat-file -t 139ca8aeb5afeaa93f6b5c03708a902ac30afa98
2019-05-06 11:38:31 - INFO     - /home/user/projects2/beaglebone-black/bbb-yocto/poky$ git cat-file -t 50f33d3bfebcbfb1538d932fb487cfd789872026
2019-05-06 11:38:31 - INFO     - /home/user/projects2/beaglebone-black/bbb-yocto/meta-openembedded$ git cat-file -t 4cd3a39f22a2712bfa8fc657d09fe2c7765a4005
2019-05-06 11:38:31 - INFO     - /home/user/projects2/beaglebone-black/bbb-yocto/meta-qt5$ git cat-file -t 0630018c0033c91fddda62a49f59a82ba6ec6850
2019-05-06 11:38:31 - INFO     - /home/user/projects2/beaglebone-black/bbb-yocto/meta-socketcan$ git cat-file -t 03da3185ba0ce8a232f8b0d5c0cfc12b381fbe2a
2019-05-06 11:38:31 - INFO     - Repository meta-bbb already contains 139ca8aeb5afeaa93f6b5c03708a902ac30afa98 as commit
2019-05-06 11:38:31 - INFO     - Repository poky already contains 50f33d3bfebcbfb1538d932fb487cfd789872026 as commit
2019-05-06 11:38:31 - INFO     - Repository meta-openembedded already contains 4cd3a39f22a2712bfa8fc657d09fe2c7765a4005 as commit
2019-05-06 11:38:31 - INFO     - Repository meta-socketcan already contains 03da3185ba0ce8a232f8b0d5c0cfc12b381fbe2a as commit
2019-05-06 11:38:31 - INFO     - Repository meta-qt5 already contains 0630018c0033c91fddda62a49f59a82ba6ec6850 as commit
2019-05-06 11:38:31 - INFO     - /home/user/projects2/beaglebone-black/bbb-yocto/meta-bbb$ git status -s
2019-05-06 11:38:31 - INFO     - M recipes-kernel/linux/linux-stable-5.0/beaglebone/defconfig
2019-05-06 11:38:31 - INFO     - ?? recipes-kernel/linux/linux-stable-5.0/beaglebone/defconfig.genesis
2019-05-06 11:38:31 - WARNING  - Repo meta-bbb is dirty - no checkout
2019-05-06 11:38:31 - INFO     - /home/user/projects2/beaglebone-black/bbb-yocto/poky$ git status -s
2019-05-06 11:38:32 - INFO     - M meta/recipes-core/images/core-image-base.bb
2019-05-06 11:38:32 - INFO     - M meta/recipes-core/images/core-image-minimal.bb
2019-05-06 11:38:32 - INFO     - ?? meta/recipes-core/images/core-image-base.bb.genesis
2019-05-06 11:38:32 - INFO     - ?? meta/recipes-core/images/core-image-minimal.bb.genesis
2019-05-06 11:38:32 - WARNING  - Repo poky is dirty - no checkout
2019-05-06 11:38:32 - INFO     - /home/user/projects2/beaglebone-black/bbb-yocto/meta-openembedded$ git status -s
2019-05-06 11:38:32 - INFO     - /home/user/projects2/beaglebone-black/bbb-yocto/meta-openembedded$ git rev-parse --verify HEAD
2019-05-06 11:38:32 - INFO     - 4cd3a39f22a2712bfa8fc657d09fe2c7765a4005
2019-05-06 11:38:32 - INFO     - Repo meta-openembedded has already been checked out with correct refspec. Nothing to do.
2019-05-06 11:38:32 - INFO     - /home/user/projects2/beaglebone-black/bbb-yocto/meta-qt5$ git status -s
2019-05-06 11:38:32 - INFO     - /home/user/projects2/beaglebone-black/bbb-yocto/meta-qt5$ git rev-parse --verify HEAD
2019-05-06 11:38:32 - INFO     - 0630018c0033c91fddda62a49f59a82ba6ec6850
2019-05-06 11:38:32 - INFO     - Repo meta-qt5 has already been checked out with correct refspec. Nothing to do.
2019-05-06 11:38:32 - INFO     - /home/user/projects2/beaglebone-black/bbb-yocto/meta-socketcan$ git status -s
2019-05-06 11:38:32 - INFO     - /home/user/projects2/beaglebone-black/bbb-yocto/meta-socketcan$ git rev-parse --verify HEAD
2019-05-06 11:38:32 - INFO     - 03da3185ba0ce8a232f8b0d5c0cfc12b381fbe2a
2019-05-06 11:38:32 - INFO     - Repo meta-socketcan has already been checked out with correct refspec. Nothing to do.
2019-05-06 11:38:32 - INFO     - /home/user/projects2/beaglebone-black/bbb-yocto/poky$ /tmp/tmp8zss78b5 /home/user/projects2/beaglebone-black/bbb-yocto/build
2019-05-06 11:38:32 - INFO     - /home/user/projects2/beaglebone-black/bbb-yocto/build$ /home/user/projects2/beaglebone-black/bbb-yocto/poky/bitbake/bin/bitbake -k -c build core-image-minimal
WARNING: Host distribution "fedora-29" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Parsing recipes: 100% |###################################################################################################| Time: 0:03:25
Parsing of 2183 .bb files complete (0 cached, 2183 parsed). 3149 targets, 114 skipped, 1 masked, 0 errors.
Removing 1 recipes from the allarch sysroot: 100% |#######################################################################| Time: 0:00:00
Removing 4 recipes from the beaglebone sysroot: 100% |####################################################################| Time: 0:00:02
Removing 2 recipes from the cortexa8hf-neon sysroot: 100% |###############################################################| Time: 0:00:00
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.40.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-gnueabi"
MACHINE              = "beaglebone"
DISTRO               = "poky"
DISTRO_VERSION       = "2.6.2"
TUNE_FEATURES        = "arm armv7a vfp neon callconvention-hard cortexa8"
TARGET_FPU           = "hard"
meta-bbb             = "thud:139ca8aeb5afeaa93f6b5c03708a902ac30afa98"
meta-networking      
meta-oe              
meta-python          = "thud:4cd3a39f22a2712bfa8fc657d09fe2c7765a4005"
meta-qt5             = "upstream/thud:0630018c0033c91fddda62a49f59a82ba6ec6850"
meta-socketcan       = "master:03da3185ba0ce8a232f8b0d5c0cfc12b381fbe2a"
meta                 
meta-poky            = "thud:50f33d3bfebcbfb1538d932fb487cfd789872026"

Initialising tasks: 100% |################################################################################################| Time: 0:00:03
Sstate summary: Wanted 926 Found 0 Missed 926 Current 369 (0% match, 28% complete)
NOTE: Executing SetScene Tasks
NOTE: Executing RunQueue Tasks
NOTE: Tasks Summary: Attempted 3519 tasks of which 1685 didn't need to be rerun and all succeeded.

Summary: There was 1 WARNING message shown.
```
