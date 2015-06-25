#!/usr/bin/env zsh

# bash <(wget -qO- https://raw.githubusercontent.com/mralexgray/ubuntu/master/install.zsh)

echo "what is the hostname of your new droplet?"
read HOSTNAME
echo "what is the ipV4 of your new droplet?"
read IP
echo "what is your dns.he.net login?"
read LOGIN
echo "what is your dns.he.net pass?"
read PASS


  HOST=${HOSTNAME/*./}
DOMAIN=${HOSTNAME/.*/}

echo "setting up A record on $DOMAIN for $HOST with ip $IP for $LOGIN."

cd /tmp
git clone git@github.com:tresni/pyHurricaneDNS.git

cd pyHurricaneDNS

echo 'echo "exit" | echo "add $DOMAIN $HOST a $IP" | ./hurricanednscmd.py $LOGIN $PASS '
