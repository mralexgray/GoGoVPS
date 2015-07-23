#!/usr/bin/env zsh

VAL() { VAR=$1; shift; echo -n "$@ [$VAR]"; read val; echo "${val:-$VAR}"; }

# bash <(wget -qO- https://raw.githubusercontent.com/mralexgray/ubuntu/master/setup.zsh)

# setopt extendedglob
# HOSTNAME=$"{HOSTNAME:-$(hostname)}"
# HOST=$(perl -e 'open IN, "</usr/share/dict/words";rand($.) < 1 && ($n=$_) while <IN>;print $n')
# DOMAIN=$(domainname)

# read -e -p "Enter Your Name:" -i "Ricardo" NAME
TMPF=/tmp/tmpipsavefile

[[ -f $TMPF ]] && IP=$(/bin/cat $TMPF 2> /dev/null)

IP=$(VAL $IP "What is the ipV4 of your new droplet?")

# read -e -p " What is the ipV4 of your new droplet? ..." -i $IP

echo $IP >! $TMPF

# [[ ${IP:=$TMP_IP} != "" ]] && 

echo "IP: $IP saved: $(/bin/cat %TMP)"

read "HOSTNAME? What is the FQDN of your new droplet? [$HOSTNAME] ? "
read "DNS_USER? What is your dns.he.net login? [mralexgray]  "
read "DNS_PASS? What is your dns.he.net pass? []  "
           HOST="$(echo ${${HOSTNAME:-$RANDOM_NAME}/.*/})"
				 DOMAIN="$(echo ${HOSTNAME/*./})"

echo "setting up A record on $DOMAIN for $HOST with ip $IP for ${DNS_USER:-mralexgray} on dns.he.net."

cd /tmp
git clone git@github.com:tresni/pyHurricaneDNS.git

cd pyHurricaneDNS

echo 'echo "exit" | echo "add $DOMAIN $HOST a $IP" | ./hurricanednscmd.py $LOGIN $PASS '
