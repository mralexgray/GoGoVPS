#!/usr/bin/env zsh

REPO=GoGoVPS

# bash <(wget -qO- https://raw.githubusercontent.com/mralexgray/GoGoVPS/master/setup.zsh)

# Make sure we're installed, otherwise do it.
[[ $(basename $0) != $REPO  || ! $(git remote -b) =~ $REPO ]] && {
	
	echo "danger, not the right git repo!"
	exit

} || {

	git submodule update --init --recursive
	
}

# Set up DNS
. ${0}/../setup/dns.zsh

# Connect
[[ $(hostname) != $HOSTNAME ]] && ssh root@${HOSTNAME}

