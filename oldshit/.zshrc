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
# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$HOME/.local/bin:$PATH

typeset -A ZSH_HIGHLIGHT_STYLES
export ZSH_HIGHLIGHT_STYLES[comment]='fg=blue,bold'


export ZSH_AUTOSUGGEST_USE_ASYNC="true"

# Path to your oh-my-zsh installation.
export ZSH="/home/miguel/.oh-my-zsh"

export VISUAL=`which nvim`
export EDITOR="$VISUAL"

export SPICETIFY_INSTALL="/home/miguel/spicetify-cli"
export PATH="$SPICETIFY_INSTALL:$PATH"

export FZF_DEFAULT_COMMAND='fdfind --hidden --no-ignore'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fdfind --type directory --hidden --no-ignore"

setopt HIST_IGNORE_SPACE
setopt ignoreeof
# export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# Use vim key bindings
bindkey -v
export KEYTIMEOUT=15

export PYTHONBREAKPOINT=ipdb.set_trace


# Load aliases
if [ -f ~/.aliases ]; then
    . ~/.aliases
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

# alias tmux=/usr/bin/tmux

# bindkey '^o' clear-screen
bindkey -s '\ez' ' zranger\n'


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/miguel/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/miguel/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/miguel/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/miguel/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(    # #timer
    # #z
    # alias-finder
    # # autoupdate
    # bgnotify
    # colored-man-pages
    # colorize
    # command-not-found
    # common-aliases
    # copyfile
    # cp
    # extract
    # fd
    # git
    # pip
    # python
    # ripgrep
    # sudo
    # tmux
    # vi-mode
    # vscode
    # # zsh-autocomplete
    # # zsh-autosuggestions
    # # zsh-syntax-highlighting
    # # fzf-tab
)

source $ZSH/oh-my-zsh.sh

### Antigen

source ~/.zsh/antigen/antigen.zsh


antigen bundle    alias-finder
# antigen bundle    # autoupdate
antigen bundle    bgnotify
antigen bundle    colored-man-pages
antigen bundle    colorize
antigen bundle    command-not-found
antigen bundle    common-aliases
antigen bundle    copyfile
antigen bundle    cp
antigen bundle    extract
antigen bundle    fd
antigen bundle    git
antigen bundle    pip
antigen bundle    python
antigen bundle    ripgrep
antigen bundle    sudo
antigen bundle    tmux
antigen bundle    vi-mode
antigen bundle    vscode
antigen bundle    web-search
antigen bundle    copydir
antigen bundle    copyfile
antigen bundle    copybuffer

# antigen bundle jeffreytse/zsh-vi-mode

antigen bundle "bckim92/zsh-autoswitch-conda"
antigen bundle "esc/conda-zsh-completion"
antigen bundle Aloxaf/fzf-tab

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting
# Load the theme.
antigen theme romkatv/powerlevel10k
antigen apply
# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[[ -e "$HOME/.fzf-extras/fzf-extras.sh" ]] && source "$HOME/.fzf-extras/fzf-extras.sh"

eval "$(zoxide init zsh)"

zstyle ':autocomplete:list-choices:*' min-input 3
zstyle ':autocomplete:list-choices:*' max-lines 40%
zstyle ':autocomplete:*:too-many-matches' message ''
zstyle ':autocomplete:*:no-matches-yet' message ''
zstyle ':autocomplete:*:no-matches-at-all' message ''

source /home/miguel/.config/broot/launcher/bash/br

# set autoload path
fpath=(~/.zsh/zshfns $fpath)
# move cursor to end of line after history search completion
autoload -Uz cl kp marco polo mkcd fp ks ltree lps utils zranger

# pipx completions
autoload -U bashcompinit
bashcompinit
eval "$(register-python-argcomplete pipx)"

# every time we load .zshrc, ditch duplicate path entries
typeset -U PATH fpath

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

eval $(thefuck --alias)
eval $(thefuck --alias FUCK)

# Load aliases
if [ -f ~/.aliases ]; then
    . ~/.aliases
fi

# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
