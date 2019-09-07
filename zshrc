
autoload -U promptinit; promptinit
prompt pure

DISABLE_UPDATE_PROMPT="true"
DISABLE_AUTO_TITLE="true"
ENABLE_CORRECTION="true"
HIST_STAMPS="dd-mm-yyyy"

export ZSH="/Users/m/.oh-my-zsh"
ZSH_THEME=""
plugins=(git)
source $ZSH/oh-my-zsh.sh

# User configuration
source ~/.exports
source ~/.aliases
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh