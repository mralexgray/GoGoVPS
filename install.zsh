#!/usr/bin/env zsh

# YES
# bash <(wget -qO- https://raw.githubusercontent.com/mralexgray/ubuntu/master/install.zsh)

# NO curl -s https://raw.githubusercontent.com/mralexgray/ubuntu/master/install.zsh | bash
# RAW https://raw.githubusercontent.com/mralexgray/ubuntu/master/install.zsh

printf "\n\nWelcome to Ubuntu\n\nLet's make you more sudo-y, shall we?"
set -x

sudo echo "$USER ALL=(ALL) NOPASSWD:ALL" | sudo tee -a /etc/sudoers

printf "\n\nLets make a /git folder!\n\n"

sudo mkdir -p /git


# && curl -L https://github.com/mralexgray/ubuntu/install.zsh | tar xz --strip 1 -C homebrew


# curl https://gist.githubusercontent.com/.../raw/install.sh | bash


# GITDIR=

# THISREPO=git@github.com:mralexgray/ubuntu.git

printf "\n\nchanging shell to zsh!\n\n"

chsh -s /bin/zsh


# echo "sudo dpkg-reconfigure console-setup,"""

: '
git clone https://github.com/github/hub.git
cd hub
$ script/build
$ mv ./hub ~/bin # ← move to somewhere in your PATH

# alias it as git
$ alias git=hub

'
