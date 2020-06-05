#!/usr/bin/env bash

set e

# ----------------------------------------------------------------------
# System
# ----------------------------------------------------------------------

echo "Updating da system"
echo "============================================="

bash ./bin/system.sh

echo "                 System updated!"
# ----------------------------------------------------------------------
# Homebrew
# ----------------------------------------------------------------------

echo "$(tput setaf 136)           Brewing da beer. "
echo "=============================================$(tput sgr0)"

bash ./bin/install-brew.sh

echo "$(tput setaf 64)---------------------------------------------"
echo "                 Software installed $(tput sgr0)"

# Switch to using brew-installed zsh as default shell
if ! grep -F -q '/usr/local/bin/zsh' /etc/shells; then
  echo '/usr/local/bin/zsh' | sudo tee -a /etc/shells;
  chsh -s /usr/local/bin/zsh;
fi;


# ----------------------------------------------------------------------
# create symlinks from the homedir to any files in the dotfiles directory
# specified in $FILES
# ----------------------------------------------------------------------

echo " Remove default zshrc"
rm -rf ~/.zshrc

echo "Linking..."
echo "============================================="

# symlink in home directory

FILES="aliases exports zshrc gitignore bin funs"

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

echo "$(tput setaf 64)---------------------------------------------"
echo "                 dotfile setup $(tput sgr0)"


# ----------------------------------------------------------------------
# pure-prompt
# ----------------------------------------------------------------------


# install https://github.com/robbyrussell/oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
npm i -g pure-prompt


# ----------------------------------------------------------------------
# Neovim
# ----------------------------------------------------------------------

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
# setup neovim
NEOVIM_FILE="$HOME/.config/nvim/init.vim"
if [[ -h $NEOVIM_FILE ]] ; then
  echo "remove nvim"
	rm -rf $NEOVIM_FILE
fi

ln -s "$PWD/init.vim" $NEOVIM_FILE

echo "$(tput setaf 64)---------------------------------------------"
echo "                 vim setup $(tput sgr0)"

# ----------------------------------------------------------------------
# source what we just created
# ----------------------------------------------------------------------

# shellcheck source=/dev/null
source "$HOME/.zshrc"

echo "$(tput setaf 64)============================================="
echo "                 Everything is nicely done"
echo "=============================================$(tput sgr0)"
