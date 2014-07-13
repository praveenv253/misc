#!/bin/bash

# misc repo path
MISC_REPO=$(pwd)

# Install packages from reinstall
REINSTALL_FILE="$MISC_REPO/reinstall"
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

# Make shortcuts
cd "$HOME"
ln -s "$MISC_REPO/bashrc" .bashrc
ln -s "$MISC_REPO/bash_aliases" .bash_aliases
ln -s "$MISC_REPO/inputrc" .inputrc
ln -s "$MISC_REPO/gitconfig" .gitconfig
ln -s "$MISC_REPO/gitignore_global" .gitignore_global
mkdir "$HOME/bin"
cd "$HOME/bin"
ln -s "$MISC_REPO/tasks.py" tasks
ln -s "$MISC_REPO/tvim.sh" tvim
mkdir -p "$HOME/.local/share/applications"
cd "$HOME/.local/share/applications"
ln -s "$MISC_REPO/tvim.desktop"
