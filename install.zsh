#!/usr/bin/env zsh

# YES
# bash <(wget -qO- https://raw.githubusercontent.com/mralexgray/ubuntu/master/install.zsh)

# NO curl -s https://raw.githubusercontent.com/mralexgray/ubuntu/master/install.zsh | bash
# RAW https://raw.githubusercontent.com/mralexgray/ubuntu/master/install.zsh

GITDIR=/git
REPO=ubuntu
REPODIR="${GITDIR}/${REPO}"

trap 'echo Install Failed...' EXIT

printf "\n\nWelcome to Ubuntu\n\nLet's make the z-shell + install git + make a /git folder!\n\n"

set -x
if ! which zsh; then apt-get install zsh; fi
set -e
chsh -s $(which zsh)

apt-get install git
mkdir -p "$GITDIR"
git clone git@github.com:mralexgray/ubuntu.git "$REPODIR"


# Let's make you more sudo-y, shall we?"
# set -x

# sudo echo "$USER ALL=(ALL) NOPASSWD:ALL" | sudo tee -a /etc/sudoers

# && curl -L https://github.com/mralexgray/ubuntu/install.zsh | tar xz --strip 1 -C homebrew


# curl https://gist.githubusercontent.com/.../raw/install.sh | bash


# GITDIR=

# THISREPO=git@github.com:mralexgray/ubuntu.git


# echo "sudo dpkg-reconfigure console-setup,"""

: '
git clone https://github.com/github/hub.git
cd hub
$ script/build
$ mv ./hub ~/bin # ← move to somewhere in your PATH

# alias it as git
$ alias git=hub

'
