#!/usr/bin/env bash

IFS=$'\n'
i=0

sudo -v
cd "${0%/*}"

if [[ $(command -v brew) == "" ]]; then
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
	brew analytics off
	export HOMEBREW_NO_AUTO_UPDATE=1
	cat packages.txt | while read line || [[ -n $line ]]; do
		if [[ "$line" == "#"* ]]; then
		continue
		fi

		if [[ i -eq 0 && -n "$line" ]]; then
		brew tap $line
		elif [[ i -eq 0 ]]; then
		let "i++"
		continue
		fi

		if [[ i -eq 1 && -n "$line" ]]; then
		brew install $line
		elif [[ i -eq 1 ]]; then
		let "i++"
		continue
		fi

		if [[ i -eq 2 && -n "$line" ]]; then
		brew cask install $line
		elif [[ i -eq 2 ]]; then
		let "i++"
		continue
		fi

		if [[ i -eq 3 && -n "$line" ]]; then
		mas lucky $line
		elif [[ i -eq 3 ]]; then
		let "i++"
		continue
		fi
	done
	echo 'Installation Complete'
else
	brew update && brew upgrade && brew cleanup && mas upgrade
	echo 'Upgrading Complete'
fi
