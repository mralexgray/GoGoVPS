#!/bin/sh

title="THIS SCRIPT ASSUMES YOU'VE COPIED YOUR OLD PROFILE AND LOADED IT ALREADY ON THE NEW SYSTEM"
prompt="Type the number of the command you would like to run and press enter."
options=( 
"Allow press and hold keys" #1
"SET HOSTNAME IN ALL THE RIGHT PLACES" #2 
"TURN OFF SCREENSAVER PASSWORD DELAY" #3
)

#Define our colors
txtblk='\e[0;30m' # Black - Regular
txtred='\e[0;31m' # Red
txtgrn='\e[0;32m' # Green
txtylw='\e[0;33m' # Yellow
txtblu='\e[0;34m' # Blue
txtpur='\e[0;35m' # Purple
txtcyn='\e[0;36m' # Cyan
txtwht='\e[0;37m' # White
Color_Off='\e[0m' # Text Reset

echo "${txtblu}${title}${Color_Off}"
PS3="$prompt "
select opt in "${options[@]}" "Quit"; do 

    case "$REPLY" in

    1 ) sudo defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false;;
    2 ) sudo scutil --set ComputerName "STRING" && sudo scutil --set HostName "STRING" && sudo scutil --set LocalHostName "STRING" && sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string "STRING";;
    3 ) defaults write com.apple.screensaver askForPassword -int 1 && defaults write com.apple.screensaver askForPasswordDelay -int 0;;

    $(( ${#options[@]}+1 )) ) echo "Good luck!"; break;;
    *) echo "Invalid option seclected. Try another one.";continue;;

    esac

done
		