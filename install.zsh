#!/usr/bin/env zsh

curl -s https://raw.githubusercontent.com/mralexgray/ubuntu/master/install.zsh | bash

# https://raw.githubusercontent.com/mralexgray/ubuntu/master/install.zsh

echo "sudo mkdir -p /git"

# && curl -L https://github.com/mralexgray/ubuntu/install.zsh | tar xz --strip 1 -C homebrew


# curl https://gist.githubusercontent.com/.../raw/install.sh | bash


# GITDIR=

# THISREPO=git@github.com:mralexgray/ubuntu.git

echo "welcome!\n\nchanging shell to zsh!"


echo "chsh -s $(which zsh)"

echo "sudo dpkg-reconfigure console-setup,"""

: '
git clone https://github.com/github/hub.git
cd hub
$ script/build
$ mv ./hub ~/bin # ← move to somewhere in your PATH

# alias it as git
$ alias git=hub

'
