if [ -z "$PS1" ]; then
   return
fi

alias ,.='ffuf -v -c -r -fc 500'
clear
cd $HOME/wordlists

bind 'set colored-stats on'
bind 'set colored-completion-prefix on'
bind 'set show-all-if-ambiguous on'
bind 'TAB: menu-complete'
bind '"\e[Z": menu-complete-backward'
bind 'set page-completions on'

shopt -s autocd

alias urls='gau $URL'
alias cd='HOME=~/wordlists cd'
alias cat='pygmentize -g'
alias rm='rm -rf'
alias ..='cd ..'
alias ls='exa -F'
alias l='exa -l --sort=size'
alias r='exa -R -S'
alias find='fdfind'
alias rc='nano /etc/bashrc'
alias ,,='nano'
alias ,='pygmentize -g'
alias route='readlink -f'
alias i='ifconfig | rg -e "[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}" '
alias ifconfig='ifconfig | rg -e "[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}" '
alias ip='ifconfig | rg -e "[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}" '
alias md='mdless'
alias nsub='nmap --script dns-brute --script-args dns-brute.domain=$URL,dns-brute.threads=6 -vv -oN scan'
alias nall='nmap -F -iL scan --open -oN nall'
alias nu='nmap -F $URL -v'
alias sub='subfinder -d $URL -o scan'
alias URL='export URL'
alias k='apt-get -y update && apt-get -y -f upgrade && apt-get -y full-upgrade && apt-get -y -f install kali-linux-large'
alias http=',, $HOME/wordlists/http-status-codes/README.md'
alias t='tree -L 1 -C -h -i --sort=size -r'
alias n='nmap -F -v'
alias u='echo $URL'
alias dec64='echo $DEC | base64 -d'
alias install='apt-get -y install'
alias b='bash'
alias f='neofetch'
alias e='exit'
alias g='git clone'
alias dr='ssh root@143.198.146.147'
alias lg='ls -GF | rg'
alias d='dog A AAAA CNAME MX NS PTR SOA $URL'
alias a='apt-get autoremove -y'
alias p='pwd'
alias w='/bin/bash Wordlists.sh'
alias ni='npm install -g'

export PATH="~/go/bin/:$PATH"
function decu() { : "${*//+/ }"; echo -e "${_//%/\\x}"; }

command_not_found_handle () {
       printf "";
	clear
       return 127
}

function x {
  if [ -z "$1" ]; then
    echo "Usage: extract <path/file_name>.<zip|rar|bz2|gz|tar|tbz2|tgz|Z|7z|xz|ex|tar.bz2|tar.gz|tar.xz>"
  else
    if [ -f $1 ]; then
      case $1 in
        *.tar.bz2)   tar xvjf $1    ;;
        *.tar.gz)    tar xvzf $1    ;;
        *.tar.xz)    tar xvJf $1    ;;
        *.lzma)      unlzma $1      ;;
        *.bz2)       bunzip2 $1     ;;
        *.rar)       unrar x -ad $1 ;;
        *.gz)        gunzip $1      ;;
        *.tar)       tar xvf $1     ;;
        *.tbz2)      tar xvjf $1    ;;
        *.tgz)       tar xvzf $1    ;;
        *.zip)       unzip $1       ;;
        *.Z)         uncompress $1  ;;
        *.7z)        7z x $1        ;;
        *.xz)        unxz $1        ;;
        *.exe)       cabextract $1  ;;
        *)           echo "extract: '$1' - unknown archive method" ;;
      esac
    else
      echo "$1 - file does not exist"
    fi
  fi
}


PS1='\$ '


# Make bash check its window size after a process completes
shopt -s checkwinsize
[ -r "/etc/bashrc_$TERM_PROGRAM" ] && . "/etc/bashrc_$TERM_PROGRAM"

LS_COLORS="$LS_COLORS:di=01;34"
