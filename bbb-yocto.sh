#!/bin/sh
# Copyright (C) 2019, Systems Software Research, Ltd., Zoran Stojsavljevic
# SPDX-License-Identifier: MIT License
# This program is free software: you can redistribute it and/or modify it under the terms of the MIT Public License.

# This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the MIT Public License for more details.

##-------

CURRENT_DIR=`pwd`
echo $CURRENT_DIR

custom_setings () {
    if [ "$ReleaseName" == "warrior" ]; then
	cp custom/defconfig.warrior meta-bbb/recipes-kernel/linux/linux-stable-5.0/beaglebone
	cd meta-bbb/recipes-kernel/linux/linux-stable-5.0/beaglebone
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
    ls -al
    cd $CURRENT_DIR
}

checkout_release () {
    ## meta-bbb
    git clone https://github.com/jumpnow/meta-bbb.git
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
}

if [ $# -ne 1 ] ; then
    echo "Usage: $0 <YOCTO Release Name (starting from sumo release)>"
    exit 1
fi

ReleaseName=$1

names="sumo thud warrior"
for name in $names
do
    if [ "$ReleaseName" == $name ]; then
	echo "Supported YOCTO Release Name entered $name!"
	checkout_release
	custom_setings
	exit 0
    fi
done

echo "Non supported YOCTO Release Name entered $ReleaseName!"
exit 1
