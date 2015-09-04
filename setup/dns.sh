#!/usr/bin/env zsh

# look for saved IP to make repeat runs less arduous.
[[ -f ${TMPF=/tmp/setupsavefile} ]] && . $TMPF

SAVEIT () {
 	
	echo '' >! $TMPF	
	for x in IP HOSTNAME DNS_USER DNS_PASS; {
		[[ -z ${(P)x} ]] && { echo "$x is NULL!" && exit } || echo "$x=${(P)x}" >>! $TMPF
	}
}

trap 'SAVEIT' SIGHUP SIGINT SIGTERM

DNS(){
	
	read "GET_IP? What is the ipV4 of your new droplet? [$IP]  "
	[[ -n $GET_IP ]]  && IP=$GET_IP
	rx='([1-9]?[0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])'
	[[ $IP =~ ^$rx\.$rx\.$rx\.$rx$ ]] || { echo "IP invalid" && exit 9 }

	read "GET_HOSTNAME? What is the FQDN of your new droplet? [$HOSTNAME]  "
	[[ -n $GET_HOSTNAME ]] 	&& HOSTNAME=$GET_HOSTNAME
	rx='^[a-zA-Z0-9]+([-.]?[a-zA-Z0-9]+)*.[a-zA-Z]+$'
	[[ $HOSTNAME =~ $rx ]] || { echo "HOSTNAME invalid" && exit 9 }

	read "GET_DNS_USER? What is your dns.he.net login? [$DNS_USER]  "
	read "GET_DNS_PASS? What is your dns.he.net pass? [$DNS_PASS]  "

	[[ -n $GET_DNS_USER ]]  && DNS_USER=$GET_DNS_USER
	[[ -n $GET_DNS_PASS ]] 	&& DNS_PASS=$GET_DNS_PASS

	SAVEIT

	echo "Setting up A record on domain:
		${DOMAIN=${HOSTNAME#*.}}
	for host:
		$HOSTNAME
	with ip:
		$IP 
	for dns.he.net user:
		$DNS_USER"

	read "OK? That OK? [Y/n]  "
	[[ -n "$OK" ]] && exit 8

	git clone -f git@github.com:tresni/pyHurricaneDNS.git /tmp/pyHurricaneDNS 2> /dev/null

	echo "adding $HOSTNAME on domain $DOMAIN"

	echo "del $DOMAIN $HOSTNAME" | 							/tmp/pyHurricaneDNS/hurricanednscmd.py $DNS_USER $DNS_PASS 2> /dev/null
	echo "add $DOMAIN ${HOSTNAME/.*/} a $IP" 	| /tmp/pyHurricaneDNS/hurricanednscmd.py $DNS_USER $DNS_PASS 2> /dev/null
	echo "ls $DOMAIN" | 												/tmp/pyHurricaneDNS/hurricanednscmd.py $DNS_USER $DNS_PASS 2> /dev/null
}


[[ -z $HOSTNAME ]] && DNS || {
	read "SETUP?Setup DNS for $HOSTNAME? [y/N]  "
	[[ -n "$SETUP" ]]  && DNS || dig $HOSTNAME
}