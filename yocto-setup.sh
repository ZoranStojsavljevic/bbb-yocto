#!/bin/bash
# Copyright (C) 2019-2026 Systems Software Research, Ltd.,
# Zoran Stojsavljevic
#
# SPDX-License-Identifier: MIT License
# This program is free software: you can redistribute it and/or
# modify it under the terms of the MIT Public License.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# MIT Public License for more details.

checkout_release () {
	cd $CURRENT_DIR

	## meta-openembedded
	git clone https://github.com/openembedded/meta-openembedded.git
	cd meta-openembedded
	git checkout $ReleaseName
	cd $CURRENT_DIR

	## meta-bbb
	git clone https://github.com/ZoranStojsavljevic/meta-bbb.git
	## git clone git@github.com:ZoranStojsavljevic/meta-bbb.git
	cd meta-bbb
	git checkout $ReleaseName
	cd $CURRENT_DIR

	## meta-qt6
	git clone https://code.qt.io/yocto/meta-qt6.git
	cd meta-qt6
	## For some reason, meta-qt6 changed symbolic names with numbers
	## git checkout upstream/$ReleaseName
	git checkout 6.11
	cd $CURRENT_DIR

	## meta-socketcan
	git clone https://github.com/ZoranStojsavljevic/meta-socketcan.git
	## git clone git@github.com:ZoranStojsavljevic/meta-socketcan.git
	cd meta-socketcan
	git checkout $ReleaseName
	cd $CURRENT_DIR

	echo "ReleaseName for meta-jumpnow repo is: "$ReleaseName

	## generic meta-jumpnow YOCTO layer, serving as common
	## layer to seven different boards
	git clone https://github.com/ZoranStojsavljevic/meta-jumpnow.git
	## git clone git@github.com:ZoranStojsavljevic/meta-jumpnow.git
	cd meta-jumpnow
	git checkout $ReleaseName
	cd $CURRENT_DIR

	## New poky release (since wrynose release)
	## Please, it is strongly advised to poky users that they should
	## read the following documentation to understand new poky setup!
	## https://docs.yoctoproject.org/dev-manual/poky-manual-setup.html
	mkdir layers/
	git clone -b wrynose https://github.com/Wind-River/meta-secure-core ./layers/meta-secure-core
	git clone -b yocto-6.0.4 https://git.openembedded.org/bitbake ./layers/bitbake > /dev/null 2>&1
	git clone -b wrynose https://git.yoctoproject.org/meta-yocto ./layers/meta-yocto
	git clone -b wrynose https://git.openembedded.org/openembedded-core ./layers/openembedded-core

	cd layers/bitbake
	git checkout -b wrynose yocto-6.0.4
	echo "the current directory is: `pwd`"

	cd $CURRENT_DIR
}

custom_setings () {
	cd $CURRENT_DIR

	if [ "$ReleaseName" == "wrynose" ]; then
		cp custom/defconfig.wrynose meta-bbb/recipes-kernel/linux/linux-stable-6.18/beaglebone
		cd meta-bbb/recipes-kernel/linux/linux-stable-6.18/beaglebone
		mv defconfig defconfig.genesis
		mv defconfig.wrynose defconfig
		cd $CURRENT_DIR
	else
		echo "Non supported or approved YOCTO Release Name entered $ReleaseName!"
		exit 1
	fi

	cp custom/core-image-minimal.bb.default layers/openembedded-core/meta/recipes-core/images
	cp custom/core-image-base.bb.default layers/openembedded-core/meta/recipes-core/images
	cd layers/openembedded-core/meta/recipes-core/images
	mv core-image-base.bb core-image-base.bb.genesis
	mv core-image-base.bb.default core-image-base.bb
	mv core-image-minimal.bb core-image-minimal.bb.genesis
	mv core-image-minimal.bb.default core-image-minimal.bb
	## sed -i 's/_append/:append/g' core-image-minimal.bb
	## sed -i 's/_append/:append/g' core-image-base.bb

	cd $CURRENT_DIR
}

set_build_env() {
	cd $CURRENT_DIR

	## Old build env setup
	## cd poky/
	## source oe-init-build-env build/ > /dev/null 2>&1

	## New build env setup (since wrynose release)
	cd ./layers/openembedded-core/
	source oe-init-build-env build/ > /dev/null 2>&1
	cd $CURRENT_DIR

	echo "start bitbake-layers"
	bitbake-layers add-layer meta-openembedded/meta-oe/
	bitbake-layers add-layer meta-openembedded/meta-perl/
	bitbake-layers add-layer meta-openembedded/meta-python/
	bitbake-layers add-layer meta-openembedded/meta-networking/
	bitbake-layers add-layer meta-bbb/
	bitbake-layers add-layer meta-qt6/
	bitbake-layers add-layer meta-socketcan/
	bitbake-layers add-layer layers/openembedded-core/meta/
	bitbake-layers add-layer layers/meta-yocto/meta-poky/
	bitbake-layers add-layer layers/meta-yocto/meta-yocto-bsp/
	bitbake-layers add-layer meta-jumpnow/

	## Set meta-secure layers in layers/
	bitbake-layers add-layer layers/meta-secure-core/meta-signing-key
	bitbake-layers add-layer layers/meta-secure-core/meta-secure-core-common/
	bitbake-layers add-layer layers/meta-secure-core/meta-tpm2/
	bitbake-layers add-layer layers/meta-secure-core/meta-efi-secure-boot/
	bitbake-layers add-layer layers/meta-secure-core/meta-integrity/
	bitbake-layers add-layer layers/meta-secure-core/meta-encrypted-storage/
	bitbake-layers show-layers

	cd $CURRENT_DIR
}

CURRENT_DIR=`pwd`
echo $CURRENT_DIR

if [ $# -ne 1 ] ; then
	echo "Usage: $0 <YOCTO Release Name (starting from hardknott release)>"
	exit 1
fi

ReleaseName=$1

# Run git status command and filter the line containing the branch name
bbb_yocto_branch=`git status | grep "On branch" | cut -d ' ' -f 3`
echo "Current bbb-yocto's branch is: "$bbb_yocto_branch

name=wrynose

if [ "$ReleaseName" == "wrynose" ]; then
	echo "ONLY APPROVED YOCTO Release Name entered: $name!"
	rm -rf build/
	git checkout $ReleaseName
	checkout_release
	custom_setings
	set_build_env
	cd $CURRENT_DIR

	cp bbb-releases/bbb-$name/local.conf layers/openembedded-core/build/conf/local.conf
	cd layers/openembedded-core/build
	echo "The system is ready for making the YOCTO images!"
	echo "Example: bitbake -k core-image-minimal"
	echo `pwd`
else
	echo "Non supported or approved YOCTO Release Name entered $ReleaseName!"
fi
