#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
[ -f ~/.bash_aliases ] && source ~/.bash_aliases
PS1='[\u@\h \W]\$ '


export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

eval "$(starship init bash)"

# Added by the Postman CLI installer
export PATH='/home/kindz/.local/bin':"$PATH"

# opencode
export PATH=/home/kindz/.opencode/bin:$PATH
