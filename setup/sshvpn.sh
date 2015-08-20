
# ssh cloud_LTE 'bash <(wget -qO- https://raw.githubusercontent.com/mralexgray/vps_config/master/setup/sshvpn.sh)'


SYSCTL=/etc/sysctl.conf
if ! egrep '^net.ipv4.ip_forward.*1$' $SYSCTL 1> /dev/null; then
	echo Enabling forwarding in $SYSCTL!!
	sed -i 's/.*net.ipv4.ip_forward.*/net.ipv4.ip_forward=1/g' $SYSCTL
else 	echo Forwarding ALREADY enabled in $SYSCTL!!
fi

IFACES=/etc/network/interfaces
if ! grep tap0 $IFACES 1> /dev/null; then 
	echo Adding tap0 to $IFACES!!
	echo "
	iface tap0 inet static
	    address 10.10.10.1
	    netmask 255.255.255.0
	" >>! $IFACES
else 	echo tap0 ALREADY to $IFACES!!
fi

DCONF=/etc/ssh/sshd_config
if ! egrep '\^PermitTunnel yes\$' $DCONF 1> /dev/null; then
	echo Adding PermitTunnel to $DCONF!!
	sed -i '/^PermitRootLogin yes$/a PermitTunnel yes' $DCONF
	# sed 's/\(PermitRootLogin yes\)/\1\'$'\n''PermitTunnel yes\'$'\n''/' $DCONF | less
	# echo is that OK? [Y/n] 
	# [[ $(read line) == "" ]] && 
	# sed  '/^PermitRootLogin yes$/a PermitTunnel yes' $DCONF | less
	# sed -i 's/PermitRootLogin yes/PermitRootLogin yes\nPermitTunnel yes\n' $DCONF
else
	echo PermitTunnel ALREADY in $DCONF!!
fi	

KEYFILE=.ssh/authorized_keys
# sed '1 i\tunnel="0", command="/sbin/ifdown tun0;/sbin/ifup tun0"' KEYFILE
# sed '1 i\tunnel="0", command="/sbin/ifdown tun0;/sbin/ifup tun0"' KEYFILE
# your_text'KEYS="$(/bin/cat $KEYFILE)"
		 
		
		
# net.ipv6.conf.all.forwarding=1
# net.inet6.ip6.forwarding=0
# " >>! /etc/sysctl.conf

# iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE && iptables-save

# pointopoint 10.60.0.81
# up arp -sD 10.60.0.81 eth1 pub
		