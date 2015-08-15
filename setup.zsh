#!/usr/bin/env zsh

REPO=GoGoVPS

# bash <(wget -qO- https://raw.githubusercontent.com/mralexgray/GoGoVPS/master/setup.zsh)

# set -x 

# Make sure we're installed, otherwise do it.
[[ $(basename $(realpath ${0:h})) != $REPO || ! "$(git remote -v)" =~ $REPO ]] && {
	
	echo "danger, not the right git repo!"
	exit

} || {

	git submodule update --init --recursive
	
}

# Set up DNS
. ${0}/../setup/dns.zsh

# Connect
[[ $(hostname) != $HOSTNAME ]] && ssh root@${HOSTNAME} 'bash <(wget -qO- https://raw.githubusercontent.com/mralexgray/GoGoVPS/master/setup/install.zsh)'

