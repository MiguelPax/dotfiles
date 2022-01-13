# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

[ -z "$SSH_CONNECTION" ] && ZSH_TMUX_AUTOSTART="true"
export ZSH_TMUX_AUTOSTART_ONCE=false
export ZSH_ALIAS_FINDER_AUTOMATIC=true
export ZSH_TMUX_AUTOQUIT=false

typeset -A ZSH_HIGHLIGHT_STYLES
# export ZSH_HIGHLIGHT_STYLES[comment]='fg=blue,bold'

export ZSH_AUTOSUGGEST_USE_ASYNC="true"

export VISUAL=`which nvim`
export EDITOR="$VISUAL"

# export SPICETIFY_INSTALL="/home/miguel/spicetify-cli"
# export PATH="$SPICETIFY_INSTALL:$PATH"

export FZF_DEFAULT_COMMAND='fd --hidden --no-ignore'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type directory --hidden --no-ignore"

setopt HIST_IGNORE_SPACE
setopt ignoreeof

# Use vim key bindings
bindkey -v
export KEYTIMEOUT=15

export PYTHONBREAKPOINT=ipdb.set_trace


# Load aliases
if [ -f ~/.dotfiles/.aliases ]; then
    . ~/.dotfiles/.aliases
fi

VI_MODE_SET_CURSOR=true


function zle-line-init zle-keymap-select {
    VIM_PROMPT="%{$fg_bold[yellow]%} [% NORMAL]%  %{$reset_color%}"
    # RPS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/} $EPS1"
    RPS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/}$(git_custom_status) $EPS1"

    zle reset-prompt
}
zle -N zle-line-init
zle -N zle-keymap-select

# bindkey '^o' clear-screen
bindkey -s '\ez' ' zranger\n'


# Load Antigen
source /opt/homebrew/share/antigen/antigen.zsh

# Load Antigen configurations
antigen init ~/.antigenrc


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[[ -e "$HOME/.fzf-extras/fzf-extras.sh" ]] && source "$HOME/.fzf-extras/fzf-extras.sh"

eval "$(zoxide init zsh)"

zstyle ':autocomplete:list-choices:*' min-input 3
zstyle ':autocomplete:list-choices:*' max-lines 40%
zstyle ':autocomplete:*:too-many-matches' message ''
zstyle ':autocomplete:*:no-matches-yet' message ''
zstyle ':autocomplete:*:no-matches-at-all' message ''

# broot directory overview

# set autoload path
fpath=(~/.dotfiles/.zshfns $fpath)
# move cursor to end of line after history search completion
autoload -Uz cl kp marco polo mkcd fp ks ltree lps utils zranger

# every time we load .zshrc, ditch duplicate path entries
typeset -U PATH fpath

eval $(thefuck --alias)
eval $(thefuck --alias FUCK)

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
