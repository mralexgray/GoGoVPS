#!/bin/bash
#
# Written by Tobias Lensing, http://tlensing.org
# For more information see http://blog.tlensing.org/2013/02/24/objective-c-on-linux-setting-up-gnustep-clang-llvm-objective-c-2-0-blocks-runtime-gcd-on-ubuntu-12-04/
#

PKG_OK=$(dpkg-query -W --showformat='${Status}\n' curl | grep "install ok installed")
echo Checking for curl: $PKG_OK
if [ "" == "$PKG_OK" ]; then
  sudo apt-get install curl -y
fi

echo Downloading libobjc2
curl -O http://download.gna.org/gnustep/libobjc2-1.6.tar.gz

echo Downloading GNUstep Make
curl -O ftp://ftp.gnustep.org/pub/gnustep/core/gnustep-make-2.6.2.tar.gz

echo Downloading GNUstep Base
curl -O ftp://ftp.gnustep.org/pub/gnustep/core/gnustep-base-1.24.0.tar.gz

echo Downloading GNUstep GUI
curl -O ftp://ftp.gnustep.org/pub/gnustep/core/gnustep-gui-0.22.0.tar.gz

echo Downloading GNUstep Backend
curl -O ftp://ftp.gnustep.org/pub/gnustep/core/gnustep-back-0.22.0.tar.gz

PKG_OK=$(dpkg-query -W --showformat='${Status}\n' libdispatch-dev | grep "install ok installed")
echo Checking for libdispatch-dev: $PKG_OK
if [ "" != "$PKG_OK" ]; then
	sudo apt-get remove libdispatch-dev -y
fi

set -e

echo Installing required packages
sudo apt-get install build-essential clang libblocksruntime-dev libkqueue-dev libpthread-workqueue-dev gobjc libxml2-dev libjpeg-dev libtiff-dev libpng12-dev libcups2-dev libfreetype6-dev libcairo2-dev libxt-dev libgl1-mesa-dev -y

echo Unpacking archives
tar xvfz libobjc2-1.6.tar.gz
tar xvfz gnustep-make-2.6.2.tar.gz
tar xvfz gnustep-base-1.24.0.tar.gz
tar xvfz gnustep-gui-0.22.0.tar.gz
tar xvfz gnustep-back-0.22.0.tar.gz

echo Installing libobjc2
export CC=clang
cd libobjc2-1.6
make clean
make
sudo make install
cd ../gnustep-make-2.6.2
./configure
sudo make install

cd ../gnustep-base-1.24.0
./configure
make clean
make
sudo make install

cd ../gnustep-gui-0.22.0
./configure
make clean
make
sudo make install

cd ../gnustep-back-0.22.0
./configure
make clean
make
sudo make install

sudo apt-get install libdispatch-dev

echo Installation script finished successfully