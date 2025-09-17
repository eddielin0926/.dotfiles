# Zinit
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

# Starshio
zinit ice as"command" from"gh-r" \
          atclone"./starship init zsh > init.zsh; ./starship completions zsh > _starship" \
          atpull"%atclone" src"init.zsh"
zinit light starship/starship

# Plugins
zinit light zsh-users/zsh-autosuggestions
zinit light zdharma-continuum/fast-syntax-highlighting

# Alias
alias zshrc="source $XDG_CONFIG_HOME/zsh/.zshrc"
alias ll="eza -l --icons"
alias la="eza -la --icons"
alias lg="eza -l --icons --git "
alias tree="eza --tree --git-ignore"
alias andrew="sshpass -f ~/.ssh/andrew ssh andrew"
alias afs='mkdir -p ~/afs && sshfs eddielin@linux.andrew.cmu.edu: ~/afs -ovolname=Andrew'
alias uafs='diskutil unmount ~/afs && rmdir ~/afs'
alias start_ctf="sshpass -p 'ctfiniq32025!' ssh -f -D 8123 -C -q -N tunneller@ctf.ini.cmu.edu"
alias stop_ctf="pkill -f 'ssh.*tunneller@ctf.ini.cmu.edu'"
