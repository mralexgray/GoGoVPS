#!/bin/zsh

# bash <(wget -qO- https://raw.githubusercontent.com/mralexgray/ubuntu/master/setup.zsh)

setopt extendedglob

# HOSTNAME=$"{HOSTNAME:-$(hostname)}"
# HOST=$(perl -e 'open IN, "</usr/share/dict/words";rand($.) < 1 && ($n=$_) while <IN>;print $n')
# DOMAIN=$(domainname)
HOSTNAME=cloud.$(domainname)

read "HOSTNAME? What is the FQDN of your new droplet? [] ? "
read 			 "IP?	What is the ipV4 of your new droplet? []  "
read "DNS_USER? What is your dns.he.net login? [mralexgray]  "
read "DNS_PASS? What is your dns.he.net pass? []  "
           HOST="$(echo ${${HOSTNAME:-$RANDOM_NAME}/.*/})"
				 DOMAIN="$(echo ${HOSTNAME/*./})"

echo "setting up A record on $DOMAIN for $HOST with ip $IP for ${DNS_USER:-mralexgray} on dns.he.net."

cd /tmp
git clone git@github.com:tresni/pyHurricaneDNS.git

cd pyHurricaneDNS

echo 'echo "exit" | echo "add $DOMAIN $HOST a $IP" | ./hurricanednscmd.py $LOGIN $PASS '
