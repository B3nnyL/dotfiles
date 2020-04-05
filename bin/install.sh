#!/usr/bin/env bash

set e

# symlink in home directory

FILES="aliases exports zshrc gitignore bin functions"

# ----------------------------------------------------------------------
# create symlinks from the homedir to any files in the dotfiles directory
# specified in $FILES
# ----------------------------------------------------------------------

for FILE in $FILES; do

    # remove old symlinks if present
    if [ -h "$HOME/.$FILE" ]; then
        rm "$HOME/.$FILE"
        echo "$(tput setaf 64)✓$(tput sgr0) Removed old symlink to $(tput setaf 37)$FILE$(tput sgr0)"
    fi

    # symlink files
    ln -s "$PWD/$FILE" "$HOME/.$FILE"
    echo "$(tput setaf 64)✓$(tput sgr0) Created new symlink to $(tput setaf 37)$FILE$(tput sgr0)"

done

# ----------------------------------------------------------------------
# System
# ----------------------------------------------------------------------

echo "Updating da system"
echo "============================================="

bash ./bin/system.sh

echo "                 Nicely done!"
# ----------------------------------------------------------------------
# Homebrew
# ----------------------------------------------------------------------

echo "$(tput setaf 136)           Brewing da beer. "
echo "=============================================$(tput sgr0)"
"" # reset

bash ./bin/install-brew.sh

echo "$(tput setaf 64)---------------------------------------------"
echo "                 Nicely done $(tput sgr0)"

# Switch to using brew-installed zsh as default shell
if ! grep -F -q '/usr/local/bin/zsh' /etc/shells; then
  echo '/usr/local/bin/zsh' | sudo tee -a /etc/shells;
  chsh -s /usr/local/bin/zsh;
fi;

# install https://github.com/robbyrussell/oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
npm i -g pure-prompt

# setup neovim
NEOVIM_FILE="$HOME/.config/nvim/init.vim"
if [ -h $NEOVIM_FILE]; then
				rm -rf $NEOVIM_FILE
fi

mkdir ~/.config/nvim
ln -s "$PWD/init.vim" $NEOVIM_FILE

# ----------------------------------------------------------------------
# source what we just created
# ----------------------------------------------------------------------

# shellcheck source=/dev/null
source "$HOME/.zshrc"

echo "$(tput setaf 64)============================================="
echo "                 Nicely done"
echo "=============================================$(tput sgr0)"
