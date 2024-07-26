# russell bashrc
#

# set path, other variables
PATH=$HOME/bin:/usr/local/bin:/usr/local/sbin:/bin:/usr/bin:/sbin:/usr/sbin:/opt/homebrew/bin:/Users/russell/Library/Python/3.9/bin:${PATH}

MANPATH=/usr/share/man:/usr/local/share/man:/usr/local/MacGPG2/share/man:/opt/homebrew/share/man:$MANPATH; export MANPATH

EDITOR=vi; export EDITOR
GPG_TTY=$(tty); export GPG_TTY
LC_COLLATE=C; export LC_COLLATE
SHELL=/bin/bash; export SHELL

# set SSH_AUTH_SOCK so that SSH will use gpg agent instead of ssh agent
SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket); export SSH_AUTH_SOCK

HISTSIZE=64
HISTFILESIZE=16

# strict file protection
# umask 027
# open file protection
 umask 022

# custom bash prompt
# current working dir, newline, host, uid-specific prompt terminator
#PS1='\w\n\h\$ '
# BLUE current working dir, newline, host, uid-specific prompt terminator
PS1='\[\033[01;34m\]\w\[\033[00m\]\n\h\$ '

# command line editing with VI
set -o vi

# shell behavior, use ~/.inputrc
#set bell-style none
#set show-all-if-ambiguous on

# aliases
# alias alias_name="command"
alias ls="ls --color=always"
alias ll="ls -alF"
alias clk="date '+%D %r'"
alias clkk="date '+%b %d %H:%M'"
alias psg="pgrep -afil"
alias gvi="vi --noplugin -i NONE -n -x"
alias ipa="networksetup -getinfo Wi-Fi"
alias mtop="top -o rsize"


# mimic tcsh pushd settings
# set dunique, set pushdtohome, set pushdsilent, alias cd pushd
cd() {
   local i MAX LEN p

   MAX=16
   LEN=${#DIRSTACK[@]}

   if [ $# -eq 0 ] || [ "$1" = "-" ]; then
      builtin cd "$@" || return 1
      pushd -n $OLDPWD > /dev/null
   else
      pushd "$@" > /dev/null || return 1
   fi

   if [ $LEN -gt 1 ]; then
      for ((i=1; i <= LEN ; i++)); do
         eval p=~$i
         if [ "$p" = "$PWD" ]; then
            popd -n +$i > /dev/null
            break
         fi
      done
   fi

   if [ $LEN -ge $MAX ]; then
      popd -n -0 > /dev/null
   fi
}

# manage man pages
function myman() {
   if [ $# -eq 0 ]; then
      return 1
   else      
      /usr/bin/nroff -man $1 | /usr/bin/less -s
   fi
}

