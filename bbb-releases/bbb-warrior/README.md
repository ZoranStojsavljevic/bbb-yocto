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

TBD!
