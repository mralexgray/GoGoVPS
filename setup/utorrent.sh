#!/bin/sh

# apt-get install libssl0.9.8:i386
# curl -Co http://download.ap.bittorrent.com/track/beta/endpoint/utserver/os/linux-x64-ubuntu-13-04

if ! which curl 2>&1 /dev/null; then apt-get install -y curl; fi

UTDL=/tmp/utorrent.tar
curl -o $UTDL -c - http://download.ap.bittorrent.com/track/beta/endpoint/utserver/os/linux-x64-ubuntu-13-04
# cd /opt
tar -xvf $UTDL 
x="$(realpath  ./utorrent-server*/utserver)"
ln -sf "$x" /usr/bin
z="$(dirname $x)"
utserver -settingspath  "$z" &
mkdir torrents

# chmod 777 -R 