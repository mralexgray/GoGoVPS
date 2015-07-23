#!/bin/bash

set -e

sudo apt-get update
sudo apt-get -y install build-essential git subversion ninja cmake libffi-dev libxml2-dev \
								libgnutls-dev libicu-dev libblocksruntime-dev libkqueue-dev libpthread-workqueue-dev \
								autoconf libtool libjpeg-dev libtiff-dev libffi-dev libcairo-dev libx11-dev:i386 \
								libxt-dev libXft-dev

cd ~
git clone git://github.com/nickhutchinson/libdispatch.git
svn co http://svn.gna.org/svn/gnustep/modules/core
svn co http://svn.gna.org/svn/gnustep/libs/libobjc2/trunk libobjc2
svn co http://llvm.org/svn/llvm-project/llvm/trunk llvm
cd llvm/tools
svn co http://llvm.org/svn/llvm-project/cfe/trunk clang

cd ~/llvm
rm -rf build
mkdir build
cd build
cmake ..
make -j8   # 8=your number of build CPUs

echo "export PATH=\$PATH:~/llvm/build/bin" >> ~/.bashrc
echo "export CC=clang"  >> ~/.bashrc
echo "export CXX=clang++" >> ~/.bashrc
export PATH=$PATH:~/llvm/build/bin
export CC=clang
export CXX=clang++

. ~/.bashrc
clang -v
clang++ -v

cd ~/libobjc2
rm -rf build
mkdir build
cd build
cmake ..
make -j8
sudo -E make install

cd ~/core/make
./configure --enable-debug-by-default --with-layout=gnustep --enable-objc-nonfragile-abi
make && sudo -E make install
echo ". /usr/GNUstep/System/Library/Makefiles/GNUstep.sh" >> ~/.bashrc

. /usr/GNUstep/System/Library/Makefiles/GNUstep.sh

sudo /sbin/ldconfig

cd ~/core/base/
./configure
make -j8
sudo -E make install

cd ~/libdispatch
rm -rf libdispatch-build
mkdir libdispatch-build && cd libdispatch-build
../configure
make
sudo make install
sudo ldconfig

cd ~/core/gui
./configure
make -j8
sudo -E make install

cd ~/core/back
./configure
make -j8
sudo -E make install

echo "Install is done. Open a new terminal or type source ~/.bashrc"
