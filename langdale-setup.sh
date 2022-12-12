#!/bin/bash
# Copyright (C) 2020, Systems Software Research, Ltd., Zoran Stojsavljevic
# SPDX-License-Identifier: MIT License
# This program is free software: you can redistribute it and/or modify it under the terms of the MIT Public License.

# This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied
# warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the MIT Public License for more details.

checkout_release () {
	## meta-bbb
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

	## meta-jumpnow
	git clone https://github.com/ZoranStojsavljevic/meta-jumpnow.git
	cd meta-jumpnow
	git checkout $ReleaseName
	cd ..

	cd $CURRENT_DIR
}

custom_setings () {
	cp custom/defconfig.langdale meta-bbb/recipes-kernel/linux/linux-stable-5.19/beaglebone
	cd meta-bbb/recipes-kernel/linux/linux-stable-5.19/beaglebone
	mv defconfig defconfig.genesis
	mv defconfig.langdale defconfig
	cd $CURRENT_DIR

	cp custom/defconfig.langdale meta-bbb/recipes-kernel/linux/linux-stable-5.13/beaglebone
	cd meta-bbb/recipes-kernel/linux/linux-stable-5.13/beaglebone
	mv defconfig defconfig.genesis
	mv defconfig.langdale defconfig

	ls -al
	cd $CURRENT_DIR

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
	source oe-init-build-env build/ > /dev/null 2>&1
	bitbake-layers add-layer ../../meta-jumpnow/
	bitbake-layers add-layer ../../meta-bbb/
	bitbake-layers add-layer ../../meta-openembedded/meta-oe/
	bitbake-layers add-layer ../../meta-openembedded/meta-python/
	bitbake-layers add-layer ../../meta-openembedded/meta-networking/
	bitbake-layers add-layer ../../meta-qt5/
	bitbake-layers add-layer ../../meta-socketcan/
	bitbake-layers show-layers
}

CURRENT_DIR=`pwd`
echo $CURRENT_DIR

if [ $# -ne 0 ] ; then
	echo "Usage: . langdale-setup.sh"
	exit 1
fi

ReleaseName=langdale

echo "Supported YOCTO Release Name langdale"
rm -rf build/
checkout_release
custom_setings
cd poky/
set_build_env
cd $CURRENT_DIR

cp bbb-langdale/local.conf poky/build/conf/local.conf
echo "The system is ready for making the YOCTO images!"
echo "Example: bitbake -k core-image-minimal"
echo `pwd`
