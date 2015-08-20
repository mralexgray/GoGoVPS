
# bash <(wget -qO- https://raw.githubusercontent.com/mralexgray/vps_config/master/setup/sshvpn.sh)

SYSCTL=/etc/sysctl.conf
if ! egrep '^net.ipv4.ip_forward.*1$' $SYSCTL 1> /dev/null; then
	echo Enabling forwarding in $SYSCTL!!
	sed -i 's/.*net.ipv4.ip_forward.*/net.ipv4.ip_forward=1/g' $SYSCTL
	REBOOT=1
else 	echo Forwarding ALREADY enabled in $SYSCTL!!
fi

IFACES=/etc/network/interfaces
if ! grep tap0 $IFACES 1> /dev/null; then 
	echo Adding tap0 to $IFACES!!
	echo -e "\niface tap0 inet static\n\taddress 10.10.10.1\n" >> $IFACES
	REBOOT=1
else 	echo tap0 ALREADY to $IFACES!!
fi

DCONF=/etc/ssh/sshd_config
if ! egrep '\^PermitTunnel yes\$' $DCONF 1> /dev/null; then
	echo Adding PermitTunnel to $DCONF!!
	sed -i '/^PermitRootLogin yes$/a PermitTunnel yes' $DCONF
	REBOOT=1
else
	echo PermitTunnel ALREADY in $DCONF!!
fi	

RCFILE='.bashrc'
if ! grep tap0 $RCFILE; then
	echo "Adding Tunnel Setup to $RCFILE!!"
	echo -e '\n[[ -n $SSH_CONNECTION ]] && /sbin/ifup tap0\n' >> $RCFILE
	REBOOT=1
else
	echo "$RCFILE ALREADY has tunnel command, etc!!"
fi

iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE && iptables-save

# [[ -a $REBOOT ]] && echo Rebooting && reboot

echo "Reconnect with -W, reset the route locally.... and you shpuld be good to go!
ssh -w root@$(hostname)
sudo route delete default
sudo route add default 10.10.10.1
"
reboot

# for x in ssh networking; { echo Restarting $x;  service $x restart; }
# sed '1 i\tunnel="0", command="/sbin/ifup tun0"' KEYFILE
# sed '1 i\tunnel="0", command="/sbin/ifdown tun0;/sbin/ifup tun0"' KEYFILE
# your_text'KEYS="$(/bin/cat $KEYFILE)"
# net.ipv6.conf.all.forwarding=1
# net.inet6.ip6.forwarding=0
# " >>! /etc/sysctl.conf
# iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE && iptables-save
# pointopoint 10.60.0.81
# up arp -sD 10.60.0.81 eth1 pub
# KEYFILE=.ssh/authorized_keys
# sed -ie 's:^:Tunnel="0" :' $KEYFILE
		