cat .bashrc
bash <(wget -qO- https://raw.githubusercontent.com/mralexgray/vps_config/master/setup/sshvpn.sh)
nano .ssh/authorized_keys 
bash <(wget -qO- https://raw.githubusercontent.com/mralexgray/vps_config/master/setup/sshvpn.sh)
nano .ssh/authorized_keys 
nano /etc/ssh/sshd_config 
man sshd
nano /etc/ssh/sshd_config 
nano .ssh/authorized_keys 
ifconfig
ifup tap0
reboot
ifconfig
ifup tap0
ifconfig
nano .bashrc
RCFILE=.bashrc
PHRASE='\n[[ -n $SSH_CONNECTION ]] && /sbin/ifup tap0\n'
if ! grep "$PHRASE" $RCFILE; then    echo Adding Tunnel Setup to $RCFILEif ! grep "$PHRASE" $RCFILE; then 
else
fi
RCFILE=.bashrc
PHRASE='\n[[ -n $SSH_CONNECTION ]] && /sbin/ifup tap0\n'
if ! grep "$PHRASE" $RCFILE; then    echo Adding Tunnel Setup to $RCFILEif ! grep "$PHRASE" $RCFILE; then 
else
fi
RCFILE='.bashrc'
PHRASE='\\n[[ -n \$SSH_CONNECTION ]] && /sbin/ifup tap0\\n'
if ! grep "$PHRASE" $RCFILE; then    echo Adding Tunnel Setup to $RCFILEif ! grep "$PHRASE" $RCFILE; then 
else
fi
RCFILE='.bashrc'
PHRASE='\\n[[ -n \$SSH_CONNECTION ]] && /sbin/ifup tap0\\n'
if ! grep "$PHRASE" $RCFILE; then   echo "Adding Tunnel Setup to $RCFILEif ! grep "$PHRASE" $RCFILE; then";   echo -e "$PHRASE" >> $RCFILE;   REBOOT=1; else   echo "$RCFILE ALREADY has tunnel command, etcif ! grep "$PHRASE" $RCFILE; then   echo "Adding Tunnel Setup to $RCFILEif ! grep "$PHRASE" $RCFILE; then";   echo -e "$PHRASE" >> $RCFILE;   REBOOT=1; else"; fi
nano .bashrc
ifup tap0
ifconfig
bash <(wget -qO- https://raw.githubusercontent.com/mralexgray/vps_config/master/setup/sshvpn.sh)
ifconfig
service networking restart
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE && iptables-save
ifconfig
man ssh
openssl speed
ifconfigtype=tap UDP-LISTEN:12345
ifconfig
ifconfig inet6 tap0 2604:a880:800:10::7f:b002/64
ifconfig tap0 2604:a880:800:10::7f:b002/64
ifconfig --help
ifconfig tap0 add 2604:a880:800:10::7f:b002/64
ifconfig
nano /etc/network/interfaces
ip -6 addr show
ping6 google.com
sysctl -a | grep forwar
nano /etc/sysctl.conf 
ifconfig
iptables
iptables --list
iptables --help
iptables --list-rules
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE && iptables-save
ifconfig
apt-get install sshfs
mkdir /mnt/macosx
sshfs localadmin@19.10.10.100:/ /mnt/macosx
sshfs localadmin@10.10.10.100:/ /mnt/macosx
fusermount  -u
fusermount  -u /mnt/macosx
sshfs localadmin@10.10.10.100:/ /mnt/macosx
ls /mnt/macosx
/mnt/macosx/sd/vps_config/setup/utorrent.sh
ls /mnt/macosx/sd/vps_config/setup/
ls /mnt/macosx/sd/vps_config/
man sshfs
fusermount  -u /mnt/macosx
sshfs -o follow_symlinks localadmin@10.10.10.100:/ /mnt/macosx
ls /mnt/macosx/sd/vps_config/
/mnt/macosx/sd/vps_config/setup/utorrent.sh
;s
ls
lpwd
pwd
ls /opt
/mnt/macosx/sd/vps_config/setup/utorrent.sh
ls
/mnt/macosx/sd/vps_config/setup/utorrent.sh
ls 5"(pwd)/utorrent-server*/"
ls "5(pwd)/utorrent-server*/"
ls utorrent-server*
x="5(pwd)/utorrent-server*/utserver"
echio #x
echi #x
echo #x
x="$(ls 5(pwd)/utorrent-server*/utserver)"
x="$(realpath ./utorrent-server*/utserver)"
echo #x
echo $x
/mnt/macosx/sd/vps_config/setup/utorrent.sh
A
/mnt/macosx/sd/vps_config/setup/utorrent.sh
netstat
ps  aux | grep torr
kill -9 5558
/mnt/macosx/sd/vps_config/setup/utorrent.sh
ps  aux | grep torr
kill -9 5558
killall utserver
/mnt/macosx/sd/vps_config/setup/utorrent.sh
ls utorrent-server-alpha-v3_3/
ls utorrent-server-alpha-v3_3/share/
mkdir torrents
ps  aux | grep torr
if ping 10.10.10.100; then echo yes; fi
if ping -c1 10.10.10.100; then echo yes; fi
if ping -c1 127.0.0.5; then echo yes; fi
if ping -c1 127.1.0.5; then echo yes; fi
if ping -c1 5.5.5.5; then echo yes; fi
man oping
man ping
if ping -w1 127.1.0.5; then echo yes; fi
if ping -w1 -c1 127.1.0.5; then echo yes; fi
man ssh_config
env
nano .bashrc
if ip tap0; then echo yes; fi
if ifconfig tap0; then echo yes; fi
if ifconfig tap1 2>&1 /dev/null then echo yes; fi
f ifconfig tap1 2>&1 /dev/null then echo yes; fi
f ifconfig tap1 2>&1 /dev/null; then echo yes; fi
f ifconfig tap1 2&1> /dev/null; then echo yes; fi
f ifconfig tap1 2> /dev/null; then echo yes; fi
if ifconfig tap1 2&1> /dev/null; then echo yes; fi
if ifconfig tap1 2>1& /dev/null; then echo yes; fi
if ifconfig tap1 2&>1 /dev/null; then echo yes; fi
if ifconfig tap1 > /dev/null; then echo yes; fi
if ifconfig tap1 > /dev/null 2>&1; then echo yes; fi
if ! ifconfig tap1 > /dev/null 2>&1; then echo yes; fi
if ! ifconfig tap0 > /dev/null 2>&1; then echo yes; fi
if ! ifconfig tap1 > /dev/null 2>&1; then echo yes; fi
ifconfig
ping 10.10.10.100
env
env|sort
bash <(wget -qO- https://raw.githubusercontent.com/mralexgray/vps_config/master/setup/sshvpn.sh)
ifconfig
nano /etc/ssh/sshd_config 
restart ssh
systemctl ssh restart
systemctl restart ssh
reboot
ls /mnt
ping 10.10.10.100
ifconfig

iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE && iptables-save
apt-cache search block
reset
apt-cache search block
apt-cache search block ad
apt-cache search block | grep ad
apt-cache search block | grep -i ad | grep -i block
apt-cache search squid
apt-cache search squid | grep -i block
apt-cache search squid | grep -i ad
apt-cache search ad-block
apt-cache search easylist
apt-cache search easy list
apt-cache search "easy list"
apt-cache search "ad" block
apt-cache search proxy | grep -i block
apt-get install squidguard
man ip
ip -6 etho0 show
ip -6 eth0 show
ip -6 show eth0
ip -6  eth0
ip --help
ip eth0 help
ip eth0
ifconfig
ip addr show
ip addr show -6 
ip -6 addr show 
ip -6 addr show eth0
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE && iptables-save
nano .bashrc
ls /etc/systemd/system/
reset
ls /mnt/
nano .bashrc
eval $(wget -qO- https://raw.githubusercontent.com/mralexgray/vps_config/master/config/vps_config.rc)
wget -qO- https://raw.githubusercontent.com/mralexgray/vps_config/master/config/vps_config.rc
vps_config_source
eval "$(wget -qO- https://raw.githubusercontent.com/mralexgray/vps_config/master/config/vps_config.rc)
eval "$(wget -qO- https://raw.githubusercontent.com/mralexgray/vps_config/master/config/vps_config.rc)"
. <( echo "$(wget -qO- https://raw.githubusercontent.com/mralexgray/vps_config/master/config/vps_config.rc)" )
echo "$(wget -qO- https://raw.githubusercontent.com/mralexgray/vps_config/master/config/vps_config.rc)"
cat  <( echo "$(wget -qO- https://raw.githubusercontent.com/mralexgray/vps_config/master/config/vps_config.rc)" )
cat <( wget -qO- https://raw.githubusercontent.com/mralexgray/vps_config/master/config/vps_config.rc )
. <( wget -qO- https://raw.githubusercontent.com/mralexgray/vps_config/master/config/vps_config.rc )
. <( wget -qO- https://raw.githubusercontent.com/mralexgray/vps_config/master/config/vps_config.rc ) --xtrace
set -x
. <( wget -qO- https://raw.githubusercontent.com/mralexgray/vps_config/master/config/vps_config.rc ) --xtrace
bash -t <( wget -qO- https://raw.githubusercontent.com/mralexgray/vps_config/master/config/vps_config.rc ) 
bash -n <( wget -qO- https://raw.githubusercontent.com/mralexgray/vps_config/master/config/vps_config.rc ) 
man bash
bash -n <( wget -qO- https://raw.githubusercontent.com/mralexgray/vps_config/master/config/vps_config.rc ) 
ping 10.0.10.1
ping 10.10.10.100
ping google.com
ifconfig
bash -n <( wget -qO- https://raw.githubusercontent.com/mralexgray/vps_config/master/config/vps_config.rc ) 
nano .bashrc
. .bashrc

./.bashrc
bash .bashrc
. .bashrc
nano .bashrc
login
env | osrt
env | sort
/bin/bash
echo $VARIABLE
echo $SHELL
bash
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE && iptables-save
ifdown tap0

ifconfig tap0
ping 10.10.10.1
ping 10.10.10.100
iptables-restore
man iptables
iptables -t nat -A POSTROUTING -j MASQUERADE
iptables-save
reboot
ping 10.10.10.100
ifconfig
ifup tap0
ifconfig
ifup tap0
env
banner
apt-get install sysvbanner
banner
sysvbanner
banner
nano .bashr
nano .bashrc
fff
iptables -F
iptables-save
systemctl --status-all
systemctl status
systemctl status iptables
systemctl list
systemctl 
systemctl list unit-files
systemctl list-unit-files
systemctl list-unit-files | grep ipt
systemctl list-unit-files | grep init
systemctl list-unit-files | grep fire
systemctl | grep fire
vps_config
ping 10.10.10.100
vps_config
ls  /etc/iptables
locate iptables
ls /etc
bash <(wget -qO- https://raw.githubusercontent.com/mralexgray/vps_config/master/setup/sshvpn.sh)
vps_config
dialog --clear  --menu "Use [UP/DOWN] key to move" 12 60 6     "DNS"       "Configure DDNS entries for droplet." 
vps_config
dialog --title 'Message' --msgbox 'Hello, world!' 5 20
ping 10.10.10.100
ls /mnt
. .bashrc
ls /mnt
. .bashrc
man sshfs
. .bashrc
ls /mnt/100
ls /100
ls /mnt/100
env | sort
vps_config
which vps_config
which -a vps_config
alias
ssh localadmin@localhost -p 2222
 10.10.10.100
ssh localadmin@10.10.10.100
which vpn_config
whcih ls
which cat
alias
which vps_config
which ll
which -a ll
man which
ls
ping 10.10.10.100
ls
ping 10.10.10.100
ls
ping fark.com
ping 10.10.10.100
ifconfig
nano .bashrc
ls /etc
ls ~/.config/
ls ~/.config
ls
ifup tap0
ls /mnt
ba
ls /mnt
nano .bashrc
ls
ifconfig
ifup tap0
utserver"
utserver
x="$(realpath ./utorrent-server*/utserver)"
$x
cd utorrent-server-alpha-v3_3/
ks
ls
./utserver 
drive
ping 10.10.10.1
ifup tap0
utserver
cd utorrent-server-alpha-v3_3/
./utserver &
killall utserver
ls
cd ..
ls
x="$(realpath ./utorrent-server*/utserver)"
echo $x
cd
cd utorrent-server-alpha-v3_3/
./utserver 
./utserver --damon
./utserver --daemon
./utserver -daemon
cd ..
pwd
mkdir downloads
ls /tmp
ls /tmp/ssh-MT6JEa3RRv/
ls /tmp/ssh-MT6JEa3RRv/agent.1575 
ls /tmp/ssh-MT6JEa3RRv/agent.1575/
ls /tmp/systemd-private-aa93c7eab6ac46518da9192b6eff5484-systemd-timesyncd.service-DJTHCP/
ls utorrent-server-alpha-v3_3/
ls utorrent-server-alpha-v3_3/share/
ls
ls downloads/
nano .bashrc
nano .bashrc
nano .bashrc.bak 
mv .bashrc.bak  .bashrc
bash
ifconfig
ifup tap0
ifconfig
ifup tap0

cd utorrent-server-alpha-v3_3/
./utserver --daemon
./utserver -daemon
..
git clone https://github.com/mralexgray/vps_config.git
apt-get install git
git clone https://github.com/mralexgray/vps_config.git
cd vps_config
./bin/drive-linux-amd64 
../
cd ..
ls
du "Queen - Greatest Hits I - II - III Platinum Collection - 3CD - 2002-HEB"
./vps_config/bin/drive-linux-amd64 upload -f "Queen - Greatest Hits I - II - III Platinum Collection - 3CD - 2002-HEB"
ls
ls utserver 
cd ..
ls
du "Terminator.Genisys.2015.1080p.HDRip.KORSUB.x264.AAC2.0-RARBG"
ls "Terminator.Genisys.2015.1080p.HDRip.KORSUB.x264.AAC2.0-RARBG"
./vps_config/bin/drive-linux-amd64 upload -f "Terminator.Genisys.2015.1080p.HDRip.KORSUB.x264.AAC2.0-RARBG"
mv utorrent-server-alpha-v3_3/vps_config .; ./vps_config/bin/drive-linux-amd64 upload -f "Terminator.Genisys.2015.1080p.HDRip.KORSUB.x264.AAC2.0-RARBG"
./vps_config/bin/drive-linux-amd64 
nano ~/.gdrive
ls

nano .gdrive/
ls .gdrive/
nano  .gdrive/config.json 
rm -r .gdrive
./vps_config/bin/drive-linux-amd64 upload -f "downloads/A Troublesome Inheritance"
./vps_config/bin/drive-linux-amd64 upload -f "BackUp_Gmail_v1.9.1/"
drive file list
drive list
./vps_config/bin/drive-linux-amd64  list
./vps_config/bin/drive-linux-amd64  list -t Chicke
./vps_config/bin/drive-linux-amd64  download 0B3swL5sLfqGwUV9BcTh2LVdDZGc
./vps_config/bin/drive-linux-amd64  download -i 0B3swL5sLfqGwUV9BcTh2LVdDZGc
ffmpeg -i The.Private.Life.Of.Chickens.720p.HDTV.x264-PVR.mkv -c:v libx264 -preset ultrafast -qp 0 The.Private.Life.Of.Chickens.720p.mkv 
ls
ls downloads
./vps_config/bin/drive-linux-amd64 upload -f "A Troublesome Inheritance_ Genes, Race a (850)"
./vps_config/bin/drive-linux-amd64 upload -f "downloads/A Troublesome Inheritance_ Genes, Race a (850)"
ls
./vps_config/bin/drive-linux-amd64 upload -f "I Love NY (2015) - DVDRiP - 1xCD - x264 - AAC - ESubs - Chapters - [DDR]"
ls downloads/
./vps_config/bin/drive-linux-amd64 upload -f "downloads/1594204462TI.epub"
./vps_config/bin/drive-linux-amd64 upload -f "downloads/Queen - Greatest Hits I - II - III Platinum Collection - 3CD - 2002-HEB"
apt-get install ffmpeg
apt-get install ffmpeg --fix-missing
apt-get update
apt-get install ffmpeg --fix-missing
ifup tap0
apt-get install ffmpeg --fix-missingffmpeg -i The.Private.Life.Of.Chickens.720p.HDTV.x264-PVR.mkv -c:v libx264 -preset ultrafast -qp 0 The.Private.Life.Of.Chickens.720p.mkv
ffmpeg -i The.Private.Life.Of.Chickens.720p.HDTV.x264-PVR.mkv -c:v libx264 -preset ultrafast -qp 0 The.Private.Life.Of.Chickens.720p.mkv
ffmpeg -i The.Private.Life.Of.Chickens.720p.HDTV.x264-PVR.mkv -c:v libx264 -preset ultrafast -qp 0 The.Private.Life.Of.Chickens.720p.mkv &
apt-get install tmux
tmux -CC
ifup tap0
netstat
ifconfig
nano  /
nano /etc/network/interfaces
ls
ls downloads/
rm -r downloads/*
ls -la
cat bashrc
cat .bashrc
nano /etc/network/interfaces
tap0 up
ifup tap0
restart networking
systemctl restart networking
ifconfig
ifup tap0
ifconfig
ping 10.10.10.1
ip
ifconfig | grep net6
nano /etc/network/interfaces
ifconfig

ip -6 addr show eth0
ping6 google.com
sysctl -a net.ipv6.conf.eth0.forwarding
sysctl -a | grep forwarding
nano /etc/sysctl.conf
sysctl -w net.ipv6.conf.all.forwarding=1
ifup tap0
ifconfig 
route print
route 
route6 
route6 -6
route6 -inet6
route6 -net6
route6 net6
route6 inet6
route inet6
route --inet6
route -inet6 get google.com
traceroute --inet6 google.com
./vps_config/bin/apt-get-install inetutils-traceroute
traceroute --inet6 google.com
man traceroutegoogle.com
man tracerout
man traceroute
dig -6 google.com
dig -6 ipv6.google.com
traceroute 2001:4860:4860::8844
traceroute [2001:4860:4860::8844]
ip -6 route show eth0
ip -6 route show dev eth0
ip -6 route show dev tap0
env
cat /etc/
cat /etc/passwd
apropos shells
shellslls
shells
man shells
cat /etc/shells
apt-get install -y zsh
cat /etc/shells
tunctl
scp -r /usr/share/doc/cloud-init/examples localadmin@10.10.10.100:/sd/vps_config
/bin/cat /etc/ssh/sshd_config | ssh localadmin@10.10.10.100 pbcopy
cat /etc/ufw/sysctl.conf
cat /etc/default/ufw
ls
l downloads
ls downloads
ls downloads/
ls utorrent-server-alpha-v3_3/
rm -r  utorrent-server-alpha-v3_3/Queen*
ls utorrent-server-alpha-v3_3/
ls
