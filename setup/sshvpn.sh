# bash <(wget -qO- https://raw.githubusercontent.com/mralexgray/vps_config/master/setup/sshvpn.sh)


SYSCTL=/etc/sysctl.conf
if egrep '^net.ipv4.ip_forward.*1$' $SYSCTL; then

	echo $SYSCTL  needs help!!
	# sed -i 's/.*net.ipv4.ip_forward.*/net.ipv4.ip_forward=1/g' $SYSCTL
fi

IFACES=/etc/network/interfaces
if ! grep tap0 $IFACES; then 

	echo $IFACES  needs tap0!!
# echo "
# iface tap0 inet static
#     address 10.10.10.1
#     netmask 255.255.255.0
# " >>! $IFACES
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
		