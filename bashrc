if [ -z "$PS1" ]; then
   return
fi

alias .='ffuf -v -c -r -fc 500,403 -request req -w'
clear
cd $HOME/wordlists

bind 'set colored-stats on'
bind 'set colored-completion-prefix on'
bind 'set show-all-if-ambiguous on'
bind 'TAB: menu-complete'
bind '"\e[Z": menu-complete-backward'
bind 'set page-completions on'

shopt -s autocd

alias h='$HOME'
alias urls='gau $URL --o urls --verbose'
alias cd='HOME=~/wordlists cd'
alias cat='pygmentize -g'
alias rm='rm -rf'
alias ..='cd ..'
alias ls='exa -F'
alias la='exa -aF'
alias l='exa -l --sort=size'
alias r='exa -R -S'
alias open=',, $(fz)'
alias route='readlink -f $(fz)'
alias rc=',, $HOME/.bashrc'
alias ,,='nano -f /etc/nanorc'
alias ,='pygmentize -g'
alias ifconfig='ifconfig | rg -e "[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}"'
alias ifc='ifconfig | rg -e "[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}"'
alias ip='ifconfig | rg -e "[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}"'
alias md='mdless'
alias nsub='nmap --script dns-brute --script-args dns-brute.domain=$URL,dns-brute.threads=6 -vv -oN scan'
alias nscan='nmap -F -iL scan --open -oN nscan'
alias nu='nmap -F $URL -v'
alias sub='subfinder -d $URL -o scan'
alias URL='export URL'
alias addk='echo "deb http://http.kali.org/kali kali-rolling main contrib non-free non-free-firmware" | sudo tee /etc/apt/sources.list && sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys ED444FF07D8D0BF6'
alias k='apt-get -y update && apt-get -y -f upgrade && apt-get -y -f full-upgrade && apt-get -y install kali-linux-everything && apt autoremove -y'
alias http=',, $HOME/wordlists/http-status-codes/README.md'
alias t='tree -L 1 -C -h -i --sort=size -r'
alias tr='tree -L 2 -C -h --sort=size -r'
alias tm='tmux'
alias n='nmap -F -v'
alias u='echo $URL'
alias dec64='echo $DEC | base64 -d'
alias install='apt-get -y install'
alias binstall='brew install'
alias b='sudo bash'
alias f='neofetch'
alias e='exit'
alias gc='git clone'
alias dr='ssh root@147.182.198.158'
alias lg='ls -GF | rg'
alias d='dog A AAAA CNAME MX NS PTR SOA $URL'
alias p='pwd'
alias ni='npm install -g'
alias cu='curlie -s $URL'
alias cupr='curl -x "127.0.0.1:8080" $URL'
alias ww='whatweb --no-errors $URL'
alias w='whoami'
alias gi='go install'
alias nf='npm fund'
alias bash='sudo bash'
alias pull='git pull'
alias hak='echo https://$URL | hakrawler'
alias nab='naabu $URL'
alias push='git add .; git status; git commit -m "$(date +"%T - %d/%m/%y" --date="6 hours ago")"; git push'
alias prc='cp $HOME/.bashrc $HOME/bashrc/bashrc; $HOME/bashrc; push; $HOME'
alias prp='$HOME; find . -maxdepth 2 -name .git -type d | rev | cut -c 6- | rev | xargs -I {} git -C {} add .; find . -maxdepth 2 -name .git -type d | rev | cut -c 6- | rev | xargs -I {} git -C {} status;find . -maxdepth 2 -name .git -type d | rev | cut -c 6- | rev | xargs -I {} git -C {} commit -m "$(date +"%T - %d/%m/%y" --date="6 hours ago")"; find . -maxdepth 2 -name .git -type d | rev | cut -c 6- | rev | xargs -I {} git -C {} push'
alias repos='gh repo clone bashrc && gh repo clone Tools && gh repo clone Init && gh repo clone Wordlist && gh repo clone Requests'
alias rmrepos='rm bashrc/ Tools/ Init/ Wordlist/ Requests/'
alias lnx='su lnx'
alias fz='fzf --preview "bat --color "always" {}" -e --color fg:188,bg:233,hl:103,fg+:222,bg+:234,hl+:104 --color info:183,prompt:110,spinner:107,pointer:167,marker:215'
alias bu='brew update && brew upgrade && brew cleanup'
alias netr='netstat -rn'
alias narc='cp /etc/nanorc $HOME/Tools/nanorc'
alias on='networksetup -setwebproxystate "Wi-fi" on && networksetup -setsecurewebproxystate "Wi-fi" on && sudo mitmproxy'
alias off='networksetup -setwebproxystate "Wi-fi" off && networksetup -setsecurewebproxystate "Wi-fi" off'
alias we='curl wttr.in/Zacatecas'
alias log='git log'
alias df='df -h'
alias request='cp Requests/req $HOME/wordlists/req'

export PATH="~/go/bin/:$PATH"
export PATH=/opt/homebrew/bin:$PATH

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

LS_COLORS="$LS_COLORS:di=01;33"

eval export HOMEBREW_PREFIX="/home/linuxbrew/.linuxbrew";
export HOMEBREW_CELLAR="/home/linuxbrew/.linuxbrew/Cellar";
export HOMEBREW_REPOSITORY="/home/linuxbrew/.linuxbrew/Homebrew";
export PATH="/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin${PATH+:$PATH}";
