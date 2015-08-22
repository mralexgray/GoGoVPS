#!/bin/bash

# # prereqs:
# # remote host's sshd_config must have "PermitRootLogin=no", "AllowUsers user", and "PermitTunnel=yes"
# # "tunctl", in debians it is found in uml-utils, redhats another (dont remember but "yum provides tunctl" must tell)
# # remote user must be able to sudo-as-root
# # can opt by routing as in this case or soft bridge with brctl and you get full remote ethernet segment membership :D
# # that last i think i'll implement later as an option
# # other stuff to do is error checking, etcetc, this is just as came from the oven
# # juako
#
# http://ubuntuforums.org/showthread.php?t=926435&p=7587049#post7587049
#
# Sorry for the thread bump but the "Disabled Privacy Extensions" is probably because you haven't added
#     Tunnel yes
#     TunnelDevice any:any
# to /etc/ssh/ssh_config
#
# http://ubuntuforums.org/showthread.php?t=926435&page=3&p=7886699#post7886699
#
# Ok, I run across so many of these unfinished threads involving OSX and SSH
# interface tunneling (VPNs) that I decided to start suggesting the solution I
# use. For ease of use, I'll avoid describing port and proxy forwarding. Feedback
# is welcome!
#
# Drivers
#
# First, OSX doesn't come with tun/tap drivers. Download them at SourceForge's
# TUN/TAP for OSX project. You'll also need the drivers loaded on any other OS,
# but most UNIX/Linux flavors have them standard.
#
# Privileges
#
# Both the ssh client and the remote login user need enough privileges to
# configure the tun/tap interfaces. This means running ssh as root and loging in
# remotely as root. I will forever be looking for a means around this (setting
# read/write permissions on the tun/tap device files doesn't cut it), but it's
# really not a security threat. Just don't leave a root terminal open and you'll
# be fine.
#
# Server Configuration
#
# You must be able to log in as root. So far, the only user I can get to
# configure tun/tap interfaces is the root user. As far as SSH is concerned,
# PermitRootLogin should default to yes, but make sure it is indeed set to yes.
#

# userhost='user@host'
userhost='root@cloud.mrgray.com'
sshflags= # -Ap 2020 -i /path/to/some/authkey'
vpn='10.0.1.0/24'
rnet=10.132.0.0/16
# 192.168.40.0/24

# START VPN
if [ "$1" == "start" ]; then
  echo setting up local tap ...
  ltap=$(tunctl -b)
  ifconfig $ltap ${vpn%%?/*}2/${vpn##*/} up

  echo setting remote configuration and enabling root login ...
  rtap="ssh $sshflags $userhost sudo 'bash -c \"rtap=\\\$(tunctl -b); echo \\\$rtap; ifconfig \\\$rtap ${vpn%%?/*}1/${vpn##*/} up; iptables -A FORWARD -i \\\$rtap -j ACCEPT; iptables -A FORWARD -o \\\$rtap -j ACCEPT; iptables -t nat -A POSTROUTING -o eth0 -s ${vpn%%?/*}2 -j SNAT --to \\\$(ip r | grep $rnet | sed \\\"s/^.*src \\\(.*\\\$\\\)/\1/g\\\"); sed -i -e \\\"s/\\\(PermitRootLogin\\\).*\\\$/\1 without-password/g\\\" -e \\\"s/\\\(AllowUsers.*\\\)\\\$/\1 root/g\\\" /etc/ssh/sshd_config; /usr/sbin/sshd -t\"'"
  rtap=$(sh -c "$rtap")

  echo setting up local routes ...
  # since my ISP sucks with transparent filters (i can't opt for another where i live), i'll just use my work net as gateway
  ip r a $(ip r | grep default | sed "s/default/${userhost##*@}/")
  ip r c default via ${vpn%%?/*}1 dev $ltap

  echo bringing up the tunnel and disabling root login ...
  ssh $sshflags -f -w ${ltap##tap}:${rtap##tap} -o Tunnel=ethernet -o ControlMaster=yes -o ControlPath=/root/.ssh/vpn-$userhost-l$ltap-r$rtap root@${userhost##*@} bash -c "\"sed -i -e 's/\(PermitRootLogin\).*\$/\1 no/g' -e 's/\(AllowUsers.*\) root\$/\1/g' /etc/ssh/sshd_config; /usr/sbin/sshd -t\""

  echo connected.
# STOP VPN
elif [ "$1" == "stop" ]; then
  echo searching control socket and determining configuration ...
  controlpath=$(echo /root/.ssh/vpn-$userhost*)
  ltap=${controlpath%%-rtap*} && ltap=tap${ltap##*-ltap}
  rtap=${controlpath##*rtap} && rtap=tap${rtap%%-*}

  echo bringing the tunnel down ...
  ssh $sshflags -o ControlPath=$controlpath -O exit $userhost

  echo restoring local routes ...
  ip r c default $(ip r | grep ${userhost##*@} | sed "s/${userhost##*@}\(.*$\)/\1/g")
  ip r d ${userhost##*@}

  echo restoring remote configuration ...
  sh -c "ssh $sshflags $userhost sudo 'bash -c \"tunctl -d $rtap; iptables -D FORWARD -i $rtap -j ACCEPT; iptables -D FORWARD -o $rtap -j ACCEPT; iptables -t nat -D POSTROUTING -o eth0 -s ${vpn%%?/*}2 -j SNAT --to \$(ip r | grep $rnet | sed \"s/^.*src \(.*\$\)/\1/g\")\"'"

  echo deleting local tap ...
  tunctl -d $ltap

  echo disconnected.
fi
