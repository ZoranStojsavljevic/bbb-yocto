#!/bin/bash
# Copyright (C) 2019-2025 Systems Software Research, Ltd.,
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
	## meta-bbb
	git clone https://github.com/ZoranStojsavljevic/meta-bbb.git
	## git clone git@github.com:ZoranStojsavljevic/meta-bbb.git
	cd meta-bbb
	git checkout $ReleaseName
	cd ..

	## poky
	git clone https://git.yoctoproject.org/git/poky.git
	cd poky
	git checkout $ReleaseName

	## ------- add meta-secure-core repo to poky
	## meta-secure-core
	git clone https://github.com/Wind-River/meta-secure-core
	cd meta-secure-core
	git checkout $ReleaseName
	cd ..
	## ------- end add meta-secure-core repo to poky
	cd ..

	## meta-openembedded
	git clone https://github.com/openembedded/meta-openembedded.git
	cd meta-openembedded
	git checkout $ReleaseName
	cd ..

	## meta-qt6
	git clone https://code.qt.io/yocto/meta-qt6.git
	cd meta-qt6
	git checkout upstream/$ReleaseName
	git status
	cd ..

	## meta-socketcan
	git clone https://github.com/ZoranStojsavljevic/meta-socketcan.git
	## git clone git@github.com:ZoranStojsavljevic/meta-socketcan.git
	cd meta-socketcan
	git checkout $ReleaseName
	git status
	cd ..

	echo "ReleaseName for meta-jumpnow repo is: "$ReleaseName

	## generic meta-jumpnow YOCTO layer, serving as common
	## layer to seven different boards
	git clone https://github.com/ZoranStojsavljevic/meta-jumpnow.git
	## git clone git@github.com:ZoranStojsavljevic/meta-jumpnow.git
	cd meta-jumpnow
	git checkout $ReleaseName
	cd ..
	cd $CURRENT_DIR
}

custom_setings () {
	if [ "$ReleaseName" == "walnascar" ]; then
		cp custom/defconfig.walnascar meta-bbb/recipes-kernel/linux/linux-stable-6.15/beaglebone
		cd meta-bbb/recipes-kernel/linux/linux-stable-6.15/beaglebone
		mv defconfig defconfig.genesis
		mv defconfig.walnascar defconfig
		cd $CURRENT_DIR
	fi

	cp custom/core-image-minimal.bb.default poky/meta/recipes-core/images
	cp custom/core-image-base.bb.default poky/meta/recipes-core/images
	cd poky/meta/recipes-core/images
	mv core-image-base.bb core-image-base.bb.genesis
	mv core-image-base.bb.default core-image-base.bb
	mv core-image-minimal.bb core-image-minimal.bb.genesis
	mv core-image-minimal.bb.default core-image-minimal.bb
	sed -i 's/_append/:append/g' core-image-minimal.bb
	sed -i 's/_append/:append/g' core-image-base.bb
	ls -al
	cd $CURRENT_DIR
}

set_build_env() {
	cd poky/
	source oe-init-build-env build/ > /dev/null 2>&1

	bitbake-layers add-layer ../../meta-jumpnow/
	bitbake-layers add-layer ../../meta-bbb/
	bitbake-layers add-layer ../../meta-openembedded/meta-oe/
	bitbake-layers add-layer ../../meta-openembedded/meta-python/
	bitbake-layers add-layer ../../meta-openembedded/meta-networking/
	bitbake-layers add-layer ../../meta-qt6/
	bitbake-layers add-layer ../../meta-socketcan/
	bitbake-layers show-layers
	## source oe-init-build-env build/ > /dev/null 2>&1
}

CURRENT_DIR=`pwd`
echo $CURRENT_DIR

if [ $# -ne 1 ] ; then
	echo "Usage: $0 <YOCTO Release Name (starting from hardknott release)>"
	exit 1
fi

ReleaseName=$1
name_bool=false

# Run git status command and filter the line containing the branch name
bbb_yocto_branch=`git status | grep "On branch" | cut -d ' ' -f 3`
echo "Current bbb-yocto's branch is: "$bbb_yocto_branch

name=walnascar

if [ "$ReleaseName" == "walnascar" ]; then
	echo "ONLY APPROVED YOCTO Release Name entered: $name!"
	rm -rf build/
	git checkout $ReleaseName
	checkout_release
	custom_setings
	set_build_env
	cd $CURRENT_DIR

	cp bbb-releases/bbb-$name/local.conf poky/build/conf/local.conf
	cd poky/build
	echo "The system is ready for making the YOCTO images!"
	echo "Example: bitbake -k core-image-minimal"
	echo `pwd`
	name_bool=true
fi

if [ "$name_bool" == false ]; then
	echo "Non supported or approved YOCTO Release Name entered $ReleaseName!"
fi
