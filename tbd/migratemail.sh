#!/bin/bash

usage(){ echo "usage $(basename $0) ACCT1 ACCT1PASS ACCT2 ACCT2PASS"; exit 2; }

[[ $# < 4 ]] && usage 

    ACCT1="$1"
ACCT1PASS="$2"
    ACCT2="$3"
ACCT2PASS="$4"

imapsync --host1 imap.gmail.com --port1 993 --user1 $ACCT1 --password1 $ACCT1PASS --ssl1 \
         --host2 imap.gmail.com --port2 993 --user2 $ACCT2 --password2 $ACCT2PASS --ssl2 \
				 --authmech1 LOGIN --authmech2 LOGIN 	\
				 --split1      100 --split2 	   100 	\
         --syncinternaldates  								\
				 --allowsizemismatch									\
				 --useheader Message-ID


# OR 

while ! imapsync --host1 imap.gmail.com --port1  993 --user1 $ACCT1 --password1 $ACCT1PASS --ssl1 \
                 --host2 imap.gmail.com --port2  993 --user2 $ACCT2 --password2 $ACCT2PASS --ssl2 \
                 --split1 100           --split2 100 --authmech1 LOGIN       --authmech2 LOGIN             \
                 --allowsizemismatch \
                 --useheader Message-ID \
                 --syncinternaldates
do
        echo imapsync not complete
done