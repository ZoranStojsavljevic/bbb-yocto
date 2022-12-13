#!/bin/bash
# Copyright (C) 2019-2021 Systems Software Research, Ltd., Zoran Stojsavljevic
# SPDX-License-Identifier: MIT License
# This program is free software: you can redistribute it and/or modify it under the terms of the MIT Public License.

# This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied
# warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the MIT Public License for more details.

checkout_release () {
	## meta-bbb
	## git clone https://github.com/jumpnow/meta-bbb.git
	git clone https://github.com/ZoranStojsavljevic/meta-bbb.git
	cd meta-bbb
	git checkout $ReleaseName
	cd ..

	## poky
	git clone https://git.yoctoproject.org/git/poky.git
	cd poky
	git checkout $ReleaseName
	cd ..

	## meta-openembedded
	git clone https://github.com/openembedded/meta-openembedded.git
	cd meta-openembedded
	git checkout $ReleaseName
	cd ..

	## meta-qt5
	git clone http://code.qt.io/yocto/meta-qt5.git
	cd meta-qt5
	git checkout upstream/$ReleaseName
	cd ..

	## meta-socketcan
	git clone https://github.com/ZoranStojsavljevic/meta-socketcan.git
	cd meta-socketcan
	git checkout master
	cd ..

	if [[ "$ReleaseName" == "zeus" || "$ReleaseName" == "dunfell" || "$ReleaseName" == "gatesgarth" || "$ReleaseName" == "hardknott" \
		|| "$ReleaseName" == "kirkstone" || "$ReleaseName" == "langdale" ]]; then
		## generic meta-jumpnow YOCTO layer, serving as common
		## layer to seven different boards
		## git clone https://github.com/jumpnow/meta-jumpnow.git
		git clone https://github.com/ZoranStojsavljevic/meta-jumpnow.git
		cd meta-jumpnow
		git checkout $ReleaseName
		cd ..
	fi
	cd $CURRENT_DIR
}

custom_setings () {
	if [ "$ReleaseName" == "langdale" ]; then
		cp custom/defconfig.langdale meta-bbb/recipes-kernel/linux/linux-stable-5.19/beaglebone
		cd meta-bbb/recipes-kernel/linux/linux-stable-5.19/beaglebone
		mv defconfig defconfig.genesis
		mv defconfig.langdale defconfig
		cd $CURRENT_DIR
	fi
	if [ "$ReleaseName" == "kirkstone" ]; then
		cp custom/defconfig.kirkstone meta-bbb/recipes-kernel/linux/linux-stable-5.13/beaglebone
		cd meta-bbb/recipes-kernel/linux/linux-stable-5.13/beaglebone
		mv defconfig defconfig.genesis
		mv defconfig.kirkstone defconfig
		ls -al
		cd $CURRENT_DIR
	fi
	if [ "$ReleaseName" == "hardknott" ]; then
		cp custom/defconfig.hardknott meta-bbb/recipes-kernel/linux/linux-stable-5.13/beaglebone
		cd meta-bbb/recipes-kernel/linux/linux-stable-5.13/beaglebone
		mv defconfig defconfig.genesis
		mv defconfig.hardknott defconfig
		ls -al
		cd $CURRENT_DIR
	fi
	if [ "$ReleaseName" == "gatesgarth" ]; then
		cp custom/defconfig.gatesgarth meta-bbb/recipes-kernel/linux/linux-stable-5.10/beaglebone
		cd meta-bbb/recipes-kernel/linux/linux-stable-5.10/beaglebone
		mv defconfig defconfig.genesis
		mv defconfig.gatesgarth defconfig
		ls -al
		cd $CURRENT_DIR
	fi
	if [ "$ReleaseName" == "dunfell" ]; then
		cp custom/defconfig.dunfell meta-bbb/recipes-kernel/linux/linux-stable-5.7/beaglebone
		cd meta-bbb/recipes-kernel/linux/linux-stable-5.7/beaglebone
		mv defconfig defconfig.genesis
		mv defconfig.dunfell defconfig
		ls -al
		cd $CURRENT_DIR
	fi
	if [ "$ReleaseName" == "zeus" ]; then
		cp custom/defconfig.zeus meta-bbb/recipes-kernel/linux/linux-stable-5.6/beaglebone
		cd meta-bbb/recipes-kernel/linux/linux-stable-5.6/beaglebone
		mv defconfig defconfig.genesis
		mv defconfig.zeus defconfig
		ls -al
		cd $CURRENT_DIR
	fi
	if [ "$ReleaseName" == "warrior" ]; then
		cp custom/defconfig.warrior meta-bbb/recipes-kernel/linux/linux-stable-5.4/beaglebone
		cd meta-bbb/recipes-kernel/linux/linux-stable-5.4/beaglebone
		mv defconfig defconfig.genesis
		mv defconfig.warrior defconfig
		ls -al
		cd $CURRENT_DIR
	fi
	if [ "$ReleaseName" == "thud" ]; then
		cp custom/defconfig.thud meta-bbb/recipes-kernel/linux/linux-stable-5.0/beaglebone
		cd meta-bbb/recipes-kernel/linux/linux-stable-5.0/beaglebone
		mv defconfig defconfig.genesis
		mv defconfig.thud defconfig
		ls -al
		cd $CURRENT_DIR
	fi
	if [ "$ReleaseName" == "sumo" ]; then
		cp custom/defconfig.sumo meta-bbb/recipes-kernel/linux/linux-stable-4.19/beaglbone
		cd meta-bbb/recipes-kernel/linux/linux-stable-4.19/beaglebone
		mv defconfig defconfig.genesis
		mv defconfig.sumo defconfig
		ls -al
		cd $CURRENT_DIR
	fi

	cp custom/core-image-minimal.bb.default poky/meta/recipes-core/images
	cp custom/core-image-base.bb.default poky/meta/recipes-core/images
	cd poky/meta/recipes-core/images
	mv core-image-base.bb core-image-base.bb.genesis
	mv core-image-base.bb.default core-image-base.bb
	mv core-image-minimal.bb core-image-minimal.bb.genesis
	mv core-image-minimal.bb.default core-image-minimal.bb
	if [[ "$ReleaseName" == "kirkstone" || "$ReleaseName" == "langdale" ]]; then
		sed -i 's/_append/:append/g' core-image-minimal.bb
		sed -i 's/_append/:append/g' core-image-base.bb
	fi
	ls -al
	cd $CURRENT_DIR
}

set_build_env() {
	source oe-init-build-env build/ > /dev/null 2>&1
	if [[ "$ReleaseName" == "zeus" || "$ReleaseName" == "dunfell" || "$ReleaseName" == "gatesgarth" || "$ReleaseName" == "hardknott" \
		|| "$ReleaseName" == "kirkstone" || "$ReleaseName" == "langdale" ]]; then
		bitbake-layers add-layer ../../meta-jumpnow/
	fi
	bitbake-layers add-layer ../../meta-bbb/
	bitbake-layers add-layer ../../meta-openembedded/meta-oe/
	bitbake-layers add-layer ../../meta-openembedded/meta-python/
	bitbake-layers add-layer ../../meta-openembedded/meta-networking/
	bitbake-layers add-layer ../../meta-qt5/
	bitbake-layers add-layer ../../meta-socketcan/
	bitbake-layers show-layers
	## source oe-init-build-env build/ > /dev/null 2>&1
}

CURRENT_DIR=`pwd`
echo $CURRENT_DIR

if [ $# -ne 1 ] ; then
	echo "Usage: $0 <YOCTO Release Name (starting from sumo release)>"
	exit 1
fi

ReleaseName=$1

names="sumo thud warrior zeus dunfell gatesgarth hardknott kirkstone langdale"
for name in $names
do
	if [ "$ReleaseName" == $name ]; then
		echo "Supported YOCTO Release Name entered $name!"
		rm -rf build/
		checkout_release
		custom_setings
		cd poky/
		set_build_env
		cd $CURRENT_DIR

		cp bbb-releases/bbb-$name/local.conf poky/build/conf/local.conf
		cd poky/build
		echo "The system is ready for making the YOCTO images!"
		echo "Example: bitbake -k core-image-minimal"
		echo `pwd`
	fi
done

if [ "$ReleaseName" != $name ]; then
	echo "Non supported YOCTO Release Name entered $ReleaseName!"
fi
