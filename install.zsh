#!/bin/bash

# YES
# bash <(wget -qO- https://raw.githubusercontent.com/mralexgray/ubuntu/master/install.zsh)

# NO curl -s https://raw.githubusercontent.com/mralexgray/ubuntu/master/install.zsh | bash
# RAW https://raw.githubusercontent.com/mralexgray/ubuntu/master/install.zsh

GITDIR=/git
REPO=ubuntu
REPODIR="${GITDIR}/${REPO}"
INSTALL='apt-get -y install'
GITMAIL="alex@mrgray.com"
GITHUBUSER=mralexgray

trap 'echo Install Failed...' EXIT

printf "\n\nWelcome to Ubuntu\n\nLet's make the z-shell + install git + make a /git folder!\n\n"

set -x

$INSTALL git zsh

ssh-keygen -t rsa -b 4096 -C $GITMAIL -N "" -f ~/.ssh/id_rsa

# cat /dev/zero | ssh-keygen -q -t rsa -b 4096 -C $GITMAIL -N ""
# ssh-keygen -y 

curl -u $GITHUBUSER \
    --data "{\"title\":\"UbuntuDrop_`date +%Y%m%d%H%M%S`\",\"key\":\"`cat ~/.ssh/id_rsa.pub`\"}" \
    https://api.github.com/user/keys


	##
	## Setup Prezto
	##
	
git clone --recursive https://github.com/mralexgray/prezto.git "$HOME/.zprezto"
 
shopt -s extglob

for rcfile in $HOME/.zprezto/runcoms/!(README.md); { ln -s "$rcfile" "$HOME/.$(basename $rcfile)"; }
 
	# XXX since we are using sudo for everything else, this is better than the
	# usual chsh, which would request another password right in the middle of the
	# script execution
usermod -s $(which zsh) "$(whoami)"

 
# set -e
#
# chsh -s $(which zsh)
#
# $INSTALL git

mkdir -p "$GITDIR"

# ssh-keyscan -H github.com >> ~/.ssh/known_hosts

git clone git@github.com:mralexgray/ubuntu.git "$REPODIR"


# Let's make you more sudo-y, shall we?"
# set -x

# sudo echo "$USER ALL=(ALL) NOPASSWD:ALL" | sudo tee -a /etc/sudoers

# && curl -L https://github.com/mralexgray/ubuntu/install.zsh | tar xz --strip 1 -C homebrew


# curl https://gist.githubusercontent.com/.../raw/install.sh | bash


# GITDIR=

# THISREPO=git@github.com:mralexgray/ubuntu.git


# echo "sudo dpkg-reconfigure console-setup,"""


##
## And to finish it, a dist-upgrade to install/update them all.
##
apt-get update && apt-get dist-upgrade -y
 
 
: '
git clone https://github.com/github/hub.git
cd hub
$ script/build
$ mv ./hub ~/bin # ← move to somewhere in your PATH

# alias it as git
$ alias git=hub

'
