
#### FIG ENV VARIABLES ####
# Please make sure this block is at the start of this file.
[ -s ~/.fig/shell/pre.sh ] && source ~/.fig/shell/pre.sh
#### END FIG ENV VARIABLES ####
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
export ZSH_TMUX_ITERM2=false

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
autoload -Uz cl kp marco polo mkcd fp ks ltree lps utils zranger fdiff

# every time we load .zshrc, ditch duplicate path entries
typeset -U PATH fpath

eval $(thefuck --alias)
eval $(thefuck --alias FUCK)

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

neofetch

#### FIG ENV VARIABLES ####
# Please make sure this block is at the end of this file.
[ -s ~/.fig/fig.sh ] && source ~/.fig/fig.sh
#### END FIG ENV VARIABLES ####

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/miguel/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/miguel/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/miguel/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/miguel/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

