#!/usr/bin/env sh

apt-get install squid

# Then squid is successfully installed and you need to setup squid to access internet because its currently set only for localhost

# squid’s config file is huge so we need to find some lines using nano on squid config file.

# Issue this commands to open squid config file with NANO text editor.

CONF=/etc/squid/squid.conf