#!/usr/bin/zsh

# Written by Tobias Lensing, http://tlensing.org
# For more information see http://blog.tlensing.org/2013/02/24/objective-c-on-linux-setting-up-gnustep-clang-llvm-objective-c-2-0-blocks-runtime-gcd-on-ubuntu-12-04/
#

# ENSURE(){
#
#   if dpkg-query -W -f='${Status}' $1 2>/dev/null | grep -c "ok installed") -eq 0 ]
# 	then 	sudo apt-get install -y $1
# 	else 	exit 99
# 	fi
# }

apt-get-install curl

# PKG_OK=$(dpkg-query -W --showformat='${Status}\n' curl | grep "install ok installed")
# echo "Checking for curl": $PKG_OK
# if [ "" == "$PKG_OK" ]; then
#   sudo apt-get install curl -y
# fi

set -x

mkdir -p tmp

OBJCDL=libobjc2-1.7.tgz

GNUSTEPLIBS=(
${GMAKE=make-2.6.7.tar.gz}
${GBASE=base-1.24.8.tar.gz}
${GGUI=gui-0.24.1.tar.gz}
${GBACK=back-0.24.1.tar.gz}
)

if [ ! -f tmp/$OBJCDL ]
then 
	echo "$FG[red]Downloading libobjc2 $FX[none]"
	# curl -O http://download.gna.org/gnustep/libobjc2-1.6.tar.gz
	curl -O http://download.gna.org/gnustep/$OBJCDL
fi

DL() { echo "Downloading GNUstep ${1%-*}"

	if [ ! -f tmp/gnustep-$1 ]
	then 
		echo "$FG[red]Downloading $gnustep-$1 $FX[none]"
		curl -o tmp/gnustep-$1 -O ftp://ftp.gnustep.org/pub/gnustep/core/gnustep-$1
	else echo "$FG[green] skipping $gnustep-$1 $FX[none]"
	fi
}

for x in $GNUSTEPLIBS; do DL $x; done

# curl -o tmp/gnustep-$x -O ftp://ftp.gnustep.org/pub/gnustep/core/gnustep-$x


# echo Downloading GNUstep Make
# curl -O ftp://ftp.gnustep.org/pub/gnustep/core/gnustep-make-2.6.2.tar.gz
# curl -O ftp://ftp.gnustep.org/pub/gnustep/core/

# echo Downloading GNUstep Base
# curl -O ftp://ftp.gnustep.org/pub/gnustep/core/gnustep-base-1.24.8.tar.gz #ok

# echo Downloading GNUstep GUI
# curl -O ftp://ftp.gnustep.org/pub/gnustep/core/gnustep-gui-0.22.0.tar.gz
# curl -O ftp://ftp.gnustep.org/pub/gnustep/core/gnustep-gui-0.24.1.tar.gz

# echo Downloading GNUstep Backend
# curl -O ftp://ftp.gnustep.org/pub/gnustep/core/gnustep-back-0.22.0.tar.gz
# curl -O ftp://ftp.gnustep.org/pub/gnustep/core/gnustep-back-0.24.1.tar.gz

PKG_OK=$(dpkg-query -W --showformat='${Status}\n' libdispatch-dev | grep "install ok installed")
echo Checking for libdispatch-dev: $PKG_OK
if [ "" != "$PKG_OK" ]; then
	sudo apt-get remove libdispatch-dev -y
fi
 
set -e


ESSENTIALS=(
build-essential
clang 
libblocksruntime-dev 
libkqueue-dev 
libpthread-workqueue-dev 
gobjc 
libxml2-dev 
libjpeg-dev 
libtiff-dev 
libpng12-dev 
libcups2-dev 
libfreetype6-dev 
libcairo2-dev 
libxt-dev 
libgl1-mesa-dev 
)
echo "Installing ${#ESSENTIALS} required packages."
sudo apt-get install -y $ESSENTIALS


echo Unpacking archives
tar xvfz $OBJCDL #libobjc2-1.6.tar.gz
for x in $ESSENTIALS; do tar xvfz gnustep-$x; done

# tar xvfz gnustep-base-1.24.0.tar.gz
# tar xvfz gnustep-gui-0.22.0.tar.gz
# tar xvfz gnustep-back-0.22.0.tar.gz

echo Installing libobjc2
export CC=clang
cd ${OBJCDL%.tgz} # libobjc2-1.6
make clean
make
sudo make install

cd ../${GMAKE%.tar.gz} # gnustep-make-2.6.2
./configure
sudo make install

cd ../${GBASE%.tar.gz} # gnustep-base-1.24.0
./configure
make clean
make
sudo make install

cd ../${GGUI%.tar.gz} # cd ../gnustep-gui-0.22.0
./configure
make clean
make
sudo make install

cd ../${GBACK%.tar.gz} #cd ../gnustep-back-0.22.0
./configure
make clean
make
sudo make install

sudo apt-get install libdispatch-dev

echo Installation script finished successfully