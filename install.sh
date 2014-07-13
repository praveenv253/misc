#!/bin/bash

# Install packages from reinstall
REINSTALL_FILE="reinstall"
PACKAGES=$(cat $REINSTALL_FILE | sed 's/[#%].*$//' | sed 's/^\s.*//')
sudo apt-get install $PACKAGES

# Install dotvim and vim-bundle
# ssh keys must be set up for this to work
DOTVIM_REPO="git@github.com:praveenv253/dotvim.git"
BUNDLE_REPO="git@github.com:praveenv253/vim-bundle.git"
git clone "$DOTVIM_REPO" "$HOME/.vim"
git clone "$BUNDLE_REPO" "$HOME/.vim/bundle"
cd "$HOME/.vim/bundle"
git submodule init
git submodule update

# Install the patched font
PATCHED_FONT_FILE="DejaVuSansMono-Powerline.ttf"
mkdir "$HOME/.fonts"
cp "$HOME/.vim/$PATCHED_FONT_FILE" "$HOME/.fonts/"
