#!/usr/bin/env zsh

# bash <(wget -qO- https://raw.githubusercontent.com/mralexgray/GoGoVPS/master/setup.zsh)

# Set up DNS
. ${0}/../setup/dns.zsh

# Connect
[[ $(hostname) != $HOSTNAME ]] && ssh root@${HOSTNAME}

