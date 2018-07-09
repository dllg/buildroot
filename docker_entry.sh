#!/bin/bash

BUILD_FOLDER=".buildroot/build"
DEFCONFIG="freescale_imx7dsabresd_defconfig"

if ! -e $BUILD_FOLDER; then
    mkdir -p $BUILD_FOLDER
fi

cd /home/$BUILD_FOLDER

make O=$(pwd) -C /buildroot $DEFCONFIG
make
