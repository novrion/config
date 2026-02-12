#!/bin/bash
CURRENT_DIR=$(pwd)

sudo pacman -Syu

# AUR package manager
sudo pacman -S --needed base-devel git
cd $HOME/git/
mkdir -p AUR/
cd AUR/
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

yay -S neovim-nightly

sudo pacman -Syu --needed \
	bspwm \
	sxhkd \
	ly \
	firefox \
	mpv \
	rofi \
	kitty \
	btop \
	yazi \
	lazygit \
	gcc \
	python \
	uv \
	npm \
	ripgrep \
	lua-language-server \
	python-lsp-server \
	python-lsp-black \
	python-pyflakes \
	python-pycodestyle \
	rust_analyzer \
	tree-sitter \
	tree \
	typescript

# html & css LSP + formatting
yay -S vscode-langservers-extracted typescript-language-server

cd "$CURRENT_DIR"
