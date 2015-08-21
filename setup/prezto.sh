#!/bin/sh

if ! typeset -f git; then apt-get install -y git; fi

## Setup Prezto

if [ -z "${PREZTODIR=$HOME/.zprezto}" ]; then 
	git clone --recursive https://github.com/mralexgray/prezto.git "$PREZTODIR"
fi

setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

if [[ ! $SHELL =~ .*\/zsh$ ]]; then chsh -s $(which zsh) fi

# if [ $SHELL != "$(which zsh)" ]; then usermod -s $(which zsh) $(whoami); fi
 
# setopt extendedglob

# PO "Installing prezto files as needed.."
# setopt EXTENDED_GLOB
# set -x
# for rcfile in "${ZDOTDIR:-$HOME}/.zprezto/runcoms/^README.md(.N)"; do
#
#   [[ -z "${DEST=${ZDOTDIR:-$HOME}/.${rcfile:t}}" ]] && set -x && ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}" 2>/dev/null
# 	set +x
# done

# for rcfile in ${PREZTODIR}/runcoms/!(README.md); do ln -sF "$rcfile" "$HOME/.$(basename $rcfile)"; done

# ls ${PREZTODIR}/runcoms/!(README.md)

# PO "setting shell to zsh"

