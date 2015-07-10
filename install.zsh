#!/usr/bin/env zsh

# bash <(wget -qO- https://raw.githubusercontent.com/mralexgray/ubuntu/master/install.zsh)

     PO() { for x in "$@"; { echo "\n$x" } }
INSTALL() {

	for x in $@; do 
		if ! dpkg-query -l | grep $x 
		then 
			PO "Installing $x..."
			apt-get install $x -y
		else
			PO "$x already installed"
		fi
	done
}

COLOR() { echo -e "\033[%@m" }

	    THIS="$(realpath $(pwd)/$0)"
	  GITDIR="/git"
      REPO="ubuntu"
   REPODIR="${GITDIR}/${REPO}"

   GITMAIL=alex@mrgray.com
   GITUSER=mralexgray
   KEYFILE="${HOME}/.ssh/id_rsa"

# set -e
# set -x

PO "Welcome to Ubuntu - $(date -r $THIS)"\
	 "Let's make the z-shell + install git + make a /git folder!"

# COLOR "35;40"

# zshexit() { printf "\n\n\nInstall Failed...\n\n\n"; sleep 1; }  # zsh specific

# trap 'echo trap; sleep 1' EXIT     # POSIX

# trap 'printf "\n\n\nInstall Failed...\n\n\n' EXIT


INSTALL python-software-properties git zsh curl

PO "Adding Mosh repository."
add-apt-repository ppa:keithw/mosh -y 2> /dev/null
INSTALL mosh 

git config --global user.name "Alex Gray"
git config --global user.email $GITMAIL

# apt-get update -y
# apt-get install mosh -y

if [[ -z "$KEYFILE" && -z "$KEYFILE.pub" ]]; then
	
	ssh-keygen -t rsa -b 4096 -C $GITMAIL -N "" -f $KEYFILE

	curl -u $GITHUBUSER \
  		--data "{\"title\":\"UbuntuDrop_`date +%Y%m%d%H%M%S`\",\"key\":\"`cat ~/.ssh/id_rsa.pub`\"}" \
    	 https://api.github.com/user/keys
fi

# cat /dev/zero | ssh-keygen -q -t rsa -b 4096 -C $GITMAIL -N ""
# ssh-keygen -y 



	##
	## Setup Prezto
	##


	
if [ -z "${PREZTODIR=$HOME/.zprezto}" ]; then 
	git clone --recursive https://github.com/mralexgray/prezto.git "$PREZTODIR"
fi

# if [ $SHELL != "$(which zsh)" ]; then usermod -s $(which zsh) $(whoami); fi
 
# setopt extendedglob

PO "Installing prezto files as needed.."
setopt EXTENDED_GLOB
# set -x
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
	
  [[ -z "${DEST=${ZDOTDIR:-$HOME}/.${rcfile:t}}" ]] && set -x && ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}" 2>/dev/null 
	set +x
done

# for rcfile in ${PREZTODIR}/runcoms/!(README.md); do ln -sF "$rcfile" "$HOME/.$(basename $rcfile)"; done

# ls ${PREZTODIR}/runcoms/!(README.md)

PO "setting shell to zsh"

chsh -s /bin/zsh

PO "inserting /git/ubuntu into path setup shit, as needed"

if ! grep '/git/ubuntu' /root/.zprofile; then 
 	sed -i '46i\  /git/ubuntu\' /root/.zprofile
	PO "DONE"
else
	PO "Already done!"
fi

# set -e
	# XXX since we are using sudo for everything else, this is better than the
	# usual chsh, which would request another password right in the middle of the
	# script execution

 
# set -e
#
# chsh -s $(which zsh)
#
# $INSTALL git

mkdir -p "$GITDIR"

# ssh-keyscan -H github.com >> ~/.ssh/known_hosts

if [ ! -d "$REPODIR" ]; then git clone git@github.com:mralexgray/$REPONAME.git "$REPODIR"; fi


# Let's make you more sudo-y, shall we?"
# set -x

# sudo echo "$USER ALL=(ALL) NOPASSWD:ALL" | sudo tee -a /etc/sudoers

# && curl -L https://github.com/mralexgray/ubuntu/install.zsh | tar xz --strip 1 -C homebrew


# curl https://gist.githubusercontent.com/.../raw/install.sh | bash


# GITDIR=

# THISREPO=git@github.com:mralexgray/ubuntu.git


# echo "sudo dpkg-reconfigure console-setup,"""


##
## And to finish it, a dist-upgrade to install/update them all.
##

# set +e
# set -x
# 
# apt-get update

# apt-get -y dist-upgrade
 
 
# : '
# git clone https://github.com/github/hub.git
# cd hub
# $ script/build
# $ mv ./hub ~/bin # ← move to somewhere in your PATH
#
# # alias it as git
# $ alias git=hub
#
# '

# NO curl -s https://raw.githubusercontent.com/mralexgray/ubuntu/master/install.zsh | bash
# RAW https://raw.githubusercontent.com/mralexgray/ubuntu/master/install.zsh


