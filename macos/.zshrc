# russell zshrc
# 

# define path, other variables
# 
# scalar PATH, mirrored to array path
# set path unique
typeset -aU path
PATH=$HOME/bin:/usr/local/bin:/usr/local/sbin:/bin:/usr/bin:/sbin:/usr/sbin:/opt/homebrew/bin:/Users/russell/Library/Python/3.8/bin:${PATH}

typeset -aU manpath
MANPATH=/usr/share/man:/usr/local/share/man:/usr/local/MacGPG2/share/man:/opt/homebrew/share/man:$MANPATH; export MANPATH

SHELL=/bin/zsh; export SHELL

GPG_TTY=$(tty); export GPG_TTY

# zsh options; see man zshoptions
# https://zsh.sourceforge.io/Doc/Release/Options.html
setopt NO_BEEP
setopt NO_CASE_GLOB

# changing directories
setopt AUTO_PUSHD
setopt CD_SILENT
setopt PUSHD_IGNORE_DUPS
setopt PUSHD_SILENT
setopt PUSHD_TO_HOME

SAVEHIST=64
HISTSIZE=16
setopt HIST_IGNORE_DUPS
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS
setopt HIST_REDUCE_BLANKS
setopt HIST_VERIFY

setopt CORRECT
setopt CORRECT_ALL

# aliases 
# beginning of command; note 'which alias'
alias ll="ls -alF"
alias clk="date '+%D %r'"
alias clkk="date '+%b %d %H:%M'"
alias psg="pgrep -afil"
alias gvi="vi --noplugin -i NONE -n -x"
# global aliases; anywhere in command; note 'which \alias'
# alias -g ll="ls -al"
#

# functions
fpath+=~/.zsh_functions

# tab completion
# add zstyle configurations commands before this line
# enable && initialize
autoload -Uz compinit && compinit

# prompt
# https://zsh.sourceforge.io/Doc/Release/Prompt-Expansion.html
# https://www.ditig.com/publications/256-colors-cheat-sheet
#
#precmd() { print -rP "%F{magenta}%~%f" }
#export PROMPT="%(?.%F{green}√.%F{red}?%?)%f %m%# "
precmd() { print -rP "%F{45}%~%f" }
#export PROMPT="%m%# "
export PROMPT="%m%(!.#.%%) "

# vi command mode
bindkey -v

# strict file protection
#umask 027
# open file protection
umask 022

