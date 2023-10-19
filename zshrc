# instantOS zshrc

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

[ -z "$NOTMUX" ] && [ -z "$TMUX" ] && command -v tmux &> /dev/null && exec tmux && exit

# TODO: new colorscheme
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
--color=dark
--color=fg:-1,bg:-1,hl:#CE50DD,fg+:#ffffff,bg+:#626A7E,hl+:#E0527E
--color=info:#4BEC90,prompt:#6BE5E7,pointer:#E7766B,marker:#CFCD63,spinner:#5293E1,header:#579CEF
'

setopt promptsubst
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory
setopt HIST_IGNORE_SPACE
setopt ignoreeof

export VISUAL=`which nvim`
export EDITOR="$VISUAL"

export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"

export FZF_DEFAULT_COMMAND='fd --hidden --no-ignore'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type directory --hidden --no-ignore"

if type brew &>/dev/null
then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

  autoload -Uz compinit
  compinit
fi

ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_USE_ASYNC="true"
bindkey -v
VI_MODE_SET_CURSOR=true
export KEYTIMEOUT=15
# Load aliases
if [ -f ~/dotfiles/.aliases ]; then
    . ~/dotfiles/.aliases
fi
ZSH_ALIAS_FINDER_AUTOMATIC=true

# source antidote
##source ${ZDOTDIR:-~}/.antidote/antidote.zsh
source $(brew --prefix)/opt/antidote/share/antidote/antidote.zsh

# initialize plugins statically with ${ZDOTDIR:-~}/.zsh_plugins.txt
antidote load

export LESS='-R --use-color -Dd+r$Du+b'
# alias ls='ls --color=auto'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/dotfiles/p10k.zsh
typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[[ -e "$HOME/.fzf-extras/fzf-extras.sh" ]] && source "$HOME/.fzf-extras/fzf-extras.sh"

# set autoload path
fpath=(~/dotfiles/.zshfns $fpath)
# move cursor to end of line after history search completion
autoload -Uz cl kp marco polo mkcd fp ks ltree lps utils zranger fdiff

# every time we load .zshrc, ditch duplicate path entries
typeset -U PATH fpath

# You can use whatever you want as an alias, like for Mondays:
eval $(thefuck --alias FUCK)

# the sys-info welcome with the apple
# neofetch

eval "$(zoxide init zsh)"

. /opt/homebrew/opt/asdf/libexec/asdf.sh
