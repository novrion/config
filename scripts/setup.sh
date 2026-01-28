#!/bin/bash

if [ $# -ne 1 ]; then
	echo "Usage: $0 <system>"
	echo "<system> : arch, macos"
	exit 1
fi

if [ "$1" = "arch" ]; then
	echo "Setting up Arch Linux system..."
elif [ "$1" = "macos" ]; then
	echo "Setting up MacOS system..."
else
	echo "Unsupported system: $1"
	exit 1
fi



chmod +x scripts/*.sh
mkdir -p $HOME/.config/
mkdir -p $HOME/git/

cp -r nvim "$HOME/.config/"
cp -r btop "$HOME/.config/"
cp -r yazi "$HOME/.config/"

cp -r scripts "$HOME/"
SCRIPTS="$HOME/scripts"
rm "$SCRIPTS/setup.sh"



########## Arch Linux ##########
if [ "$1" = "arch" ]; then
	./scripts/install_arch.sh
	cp -r bspwm "$HOME/.config/"
	cp -r sxhkd "$HOME/.config/"
	cp -r kitty "$HOME/.config/"
	cp -r rofi "$HOME/.config/"
	cp .bashrc $HOME/.bashrc
	cp .xinitrc $HOME/

	rm "$SCRIPTS/install_macos.sh"
	mv "$SCRIPTS/open_github_arch.sh" "$SCRIPTS/open_github.sh"
	rm "$SCRIPTS/open_github_macos.sh"

########### MacOS ##########
elif [ "$1" = "macos" ]; then
	./scripts/install_macos.sh
	cp -r ghostty "$HOME/.config/"
	cp -r tmux "$HOME/.config/"
	cp -r yabai "$HOME/.config/"
	cp -r skhd "$HOME/.config/"
	cp .zshrc "$HOME/.zshrc"

	rm "$SCRIPTS/install_arch.sh"
	mv "$SCRIPTS/open_github_macos.sh" "$SCRIPTS/open_github.sh"
	rm "$SCRIPTS/open_github_arch.sh"
	rm "$SCRIPTS/quit_to_login_manager.sh"
fi



./scripts/store_git_credentials.sh

echo "Done"
