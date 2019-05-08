### [warrior release] bitbake -k core-image-minimal execution traces
```
[user@fedora29-ssd build]$ bitbake -k core-image-minimal
Parsing recipes: 100% |###########################################################################################################| Time: 0:04:20
Parsing of 2253 .bb files complete (0 cached, 2253 parsed). 3332 targets, 116 skipped, 1 masked, 0 errors.
Removing 2 recipes from the allarch sysroot: 100% |###############################################################################| Time: 0:00:00
Removing 62 recipes from the beaglebone sysroot: 100% |###########################################################################| Time: 0:00:26
Removing 59 recipes from the cortexa8hf-neon sysroot: 100% |######################################################################| Time: 0:00:03
Removing 51 recipes from the x86_64 sysroot: 100% |###############################################################################| Time: 0:00:06
Removing 3 recipes from the x86_64_arm sysroot: 100% |############################################################################| Time: 0:00:00
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.42.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-gnueabi"
MACHINE              = "beaglebone"
DISTRO               = "poky"
DISTRO_VERSION       = "2.7"
TUNE_FEATURES        = "arm vfp cortexa8 neon callconvention-hard"
TARGET_FPU           = "hard"
meta-bbb             = "warrior:9d875b0914eb773a9abd09d20e2f52f7d3d9ed69"
meta-networking      
meta-oe              
meta-python          = "warrior:50108c18e5ca21cc5c014a45b81c66c5b110fc8b"
meta-qt5             = "upstream/warrior:f4531ec860071c308725a8539ef5003da11da8a1"
meta-socketcan       = "master:03da3185ba0ce8a232f8b0d5c0cfc12b381fbe2a"
meta                 
meta-poky            = "warrior:1b425a8450872f915c30bd0a35b0b0df92172b70"

Initialising tasks: 100% |########################################################################################################| Time: 0:00:03
Sstate summary: Wanted 1305 Found 0 Missed 1305 Current 0 (0% match, 0% complete)
NOTE: Executing SetScene Tasks
NOTE: Executing RunQueue Tasks
NOTE: Tasks Summary: Attempted 3541 tasks of which 3523 didn't need to be rerun and all succeeded.
```
### kas-bbb-warrior.yml execution traces
```
[user@fedora29-ssd bbb-yocto]$ kas build kas-bbb-warrior.yml
2019-05-09 01:55:19 - INFO     - kas 1.0 started
2019-05-09 01:55:19 - INFO     - /home/user/projects2/beaglebone-black/bbb-yocto$ git rev-parse --show-toplevel
2019-05-09 01:55:19 - INFO     - /home/user/projects2/beaglebone-black/bbb-yocto/meta-bbb$ git cat-file -t 9d875b0914eb773a9abd09d20e2f52f7d3d9ed69
2019-05-09 01:55:19 - INFO     - /home/user/projects2/beaglebone-black/bbb-yocto/poky$ git cat-file -t 1b425a8450872f915c30bd0a35b0b0df92172b70
2019-05-09 01:55:19 - INFO     - /home/user/projects2/beaglebone-black/bbb-yocto/meta-openembedded$ git cat-file -t 50108c18e5ca21cc5c014a45b81c66c5b110fc8b
2019-05-09 01:55:19 - INFO     - /home/user/projects2/beaglebone-black/bbb-yocto/meta-qt5$ git cat-file -t f4531ec860071c308725a8539ef5003da11da8a1
2019-05-09 01:55:19 - INFO     - /home/user/projects2/beaglebone-black/bbb-yocto/meta-socketcan$ git cat-file -t 03da3185ba0ce8a232f8b0d5c0cfc12b381fbe2a
2019-05-09 01:55:19 - INFO     - Repository meta-bbb already contains 9d875b0914eb773a9abd09d20e2f52f7d3d9ed69 as commit
2019-05-09 01:55:19 - INFO     - Repository poky already contains 1b425a8450872f915c30bd0a35b0b0df92172b70 as commit
2019-05-09 01:55:19 - INFO     - Repository meta-openembedded already contains 50108c18e5ca21cc5c014a45b81c66c5b110fc8b as commit
2019-05-09 01:55:19 - INFO     - Repository meta-qt5 already contains f4531ec860071c308725a8539ef5003da11da8a1 as commit
2019-05-09 01:55:19 - INFO     - Repository meta-socketcan already contains 03da3185ba0ce8a232f8b0d5c0cfc12b381fbe2a as commit
2019-05-09 01:55:19 - INFO     - /home/user/projects2/beaglebone-black/bbb-yocto/meta-bbb$ git status -s
2019-05-09 01:55:20 - INFO     - M recipes-kernel/linux/linux-stable-5.0/beaglebone/defconfig
2019-05-09 01:55:20 - INFO     - ?? recipes-kernel/linux/linux-stable-5.0/beaglebone/defconfig.genesis
2019-05-09 01:55:20 - WARNING  - Repo meta-bbb is dirty - no checkout
2019-05-09 01:55:20 - INFO     - /home/user/projects2/beaglebone-black/bbb-yocto/poky$ git status -s
2019-05-09 01:55:20 - INFO     - M meta/recipes-core/images/core-image-base.bb
2019-05-09 01:55:20 - INFO     - M meta/recipes-core/images/core-image-minimal.bb
2019-05-09 01:55:20 - INFO     - ?? meta/recipes-core/images/core-image-base.bb.genesis
2019-05-09 01:55:20 - INFO     - ?? meta/recipes-core/images/core-image-minimal.bb.genesis
2019-05-09 01:55:20 - WARNING  - Repo poky is dirty - no checkout
2019-05-09 01:55:20 - INFO     - /home/user/projects2/beaglebone-black/bbb-yocto/meta-openembedded$ git status -s
2019-05-09 01:55:20 - INFO     - /home/user/projects2/beaglebone-black/bbb-yocto/meta-openembedded$ git rev-parse --verify HEAD
2019-05-09 01:55:20 - INFO     - 50108c18e5ca21cc5c014a45b81c66c5b110fc8b
2019-05-09 01:55:20 - INFO     - Repo meta-openembedded has already been checked out with correct refspec. Nothing to do.
2019-05-09 01:55:20 - INFO     - /home/user/projects2/beaglebone-black/bbb-yocto/meta-qt5$ git status -s
2019-05-09 01:55:20 - INFO     - /home/user/projects2/beaglebone-black/bbb-yocto/meta-qt5$ git rev-parse --verify HEAD
2019-05-09 01:55:20 - INFO     - f4531ec860071c308725a8539ef5003da11da8a1
2019-05-09 01:55:20 - INFO     - Repo meta-qt5 has already been checked out with correct refspec. Nothing to do.
2019-05-09 01:55:20 - INFO     - /home/user/projects2/beaglebone-black/bbb-yocto/meta-socketcan$ git status -s
2019-05-09 01:55:20 - INFO     - /home/user/projects2/beaglebone-black/bbb-yocto/meta-socketcan$ git rev-parse --verify HEAD
2019-05-09 01:55:20 - INFO     - 03da3185ba0ce8a232f8b0d5c0cfc12b381fbe2a
2019-05-09 01:55:20 - INFO     - Repo meta-socketcan has already been checked out with correct refspec. Nothing to do.
2019-05-09 01:55:20 - INFO     - /home/user/projects2/beaglebone-black/bbb-yocto/poky$ /tmp/tmpdo3afjr1 /home/user/projects2/beaglebone-black/bbb-yocto/build
2019-05-09 01:55:20 - INFO     - /home/user/projects2/beaglebone-black/bbb-yocto/build$ /home/user/projects2/beaglebone-black/bbb-yocto/poky/bitbake/bin/bitbake -k -c build core-image-minimal
Loading cache: 100% |###############################################################################################################| Time: 0:00:01
Loaded 3329 entries from dependency cache.
Parsing recipes: 100% |#############################################################################################################| Time: 0:00:08
Parsing of 2253 .bb files complete (2250 cached, 3 parsed). 3332 targets, 116 skipped, 1 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.42.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-gnueabi"
MACHINE              = "beaglebone"
DISTRO               = "poky"
DISTRO_VERSION       = "2.7"
TUNE_FEATURES        = "arm vfp cortexa8 neon callconvention-hard"
TARGET_FPU           = "hard"
meta-bbb             = "warrior:9d875b0914eb773a9abd09d20e2f52f7d3d9ed69"
meta-networking      
meta-oe              
meta-python          = "warrior:50108c18e5ca21cc5c014a45b81c66c5b110fc8b"
meta-qt5             = "upstream/warrior:f4531ec860071c308725a8539ef5003da11da8a1"
meta-socketcan       = "master:03da3185ba0ce8a232f8b0d5c0cfc12b381fbe2a"
meta                 
meta-poky            = "warrior:1b425a8450872f915c30bd0a35b0b0df92172b70"

Initialising tasks: 100% |##########################################################################################################| Time: 0:00:04
Sstate summary: Wanted 0 Found 0 Missed 0 Current 1305 (0% match, 100% complete)
NOTE: Executing SetScene Tasks
NOTE: Executing RunQueue Tasks
NOTE: Tasks Summary: Attempted 3541 tasks of which 3541 didn't need to be rerun and all succeeded.
```
