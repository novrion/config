#!/bin/bash
brew update
brew upgrade
brew install \
	git \
	btop \
	yazi \
	lazygit \
	tmux \
	ghostty \
	gcc \
	python \
	uv \
	npm \
	ripgrep \
	lua-language-server \
	rust-analyzer \
	pylsp \
	tree-sitter \
	tree
brew install neovim --HEAD 

# html & css LSP + formatting
npm i -g vscode-langservers-extracted typescript typescript-language-server
