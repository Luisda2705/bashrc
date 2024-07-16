if [ -z "$PS1" ]; then
   return
fi


SERVER=161.35.239.218
clear
cd $HOME

bind 'set colored-stats on'
bind 'set colored-completion-prefix on'
bind 'set show-all-if-ambiguous on'
bind 'TAB: menu-complete'
bind '"\e[Z": menu-complete-backward'
bind 'set page-completions on'
shopt -s autocd

#------ No Category -----#
alias h='$HOME'
alias rm='rm -rf'
alias ..='cd ..'
alias ,,='nano -f /etc/nanorc'
alias ,='pygmentize -g'
alias rc=',, $HOME/.bashrc'
alias md='mdless'
alias httpcodes=',, $HOME/wordlists/http-status-codes/README.md'
alias tm='tmux'
alias dec64='echo $DEC | base64 -d'
alias ins='apt-get -y install'
alias bins='brew install'
alias sb='sudo bash'
alias f='neofetch'
alias e='exit'
alias gc='git clone'
alias serv='ssh root@$SERVER'
alias p='pwd'
alias ni='npm install -g'
alias cupx='curl $URL -x "127.0.0.1:8080"'
alias w='whoami'
alias gi='go install'
alias npf='npm fund'
alias bash='sudo bash'
alias pull='git pull'
alias lx='su lx'
alias brup='brew update && brew upgrade && brew cleanup'
alias rn='netstat -rn'
alias cpnano='cp /etc/nanorc $HOME/Tools/nanorc'
alias we='curl wttr.in/Zacatecas'
alias log='git log'
alias df='df -h'
alias request='cp HTTP/req $HOME/wordlists/req'
alias cmd='cat $HOME/Tools/Commands | rg'
alias c='cmatrix'
alias tools=',, $HOME/Tools/Tools.sh'
alias root='sudo su -'

#----------- General Bash ----------#
alias cd='HOME=~/ cd'
alias cat='pygmentize -g'
alias bat='batcat'

#------------- List Files ---------------------#
alias ls='eza -F'
alias la='eza -aF'
alias l='eza -l --sort=size -abgl --grid'
alias r='eza -R -S'
alias lg='ls -GF | rg'
alias t='tree -L 1 -C -h -i --sort=size -r'
alias tr='tree -L 2 -C -h --sort=size -r'

#-------- Security Utilities -----------#
alias .='ffuf -v -c -r -fc 500,403 -u https://URL/FUZZ -w'
alias URL='export URL'
alias u='echo $URL'
alias urls='gau $URL --o urls --verbose'
alias sub='subfinder -d $URL -o scan'
alias ww='whatweb --no-errors $URL'
alias w='whoami'
alias n='nmap -F -v'
alias nsub='nmap --script dns-brute --script-args dns-brute.domain=$URL,dns-brute.threads=6 -vv -oN scan'
alias nscan='nmap -F -iL scan --open -oN nscan'
alias nu='nmap -F $URL -v'
alias nab='naabu $URL'
alias hak='echo https://$URL | hakrawler'
alias d='dog $URL A AAAA NS MX CNAME TXT PTR SOA'
alias cu='curlie -s $URL'
alias addk='echo "deb http://http.kali.org/kali kali-rolling main contrib non-free non-free-firmware" | sudo t>'

#------- Update Github Repos ----------#
alias push='git add .; git status; git commit -m "$(date +"%T - %d/%m/%y" --date="6 hours ago")"; git push'
alias pr='cp find . -maxdepth 2 -name .git -type d | rev | cut -c 6- | rev | xargs -I {} git -C {} add .; find . -maxdepth 2 -name .git -type d | rev | cut -c 6- | rev | xargs -I {} git -C {} status;find . -maxdepth 2 -name .git -type d | rev | cut -c 6- | rev | xargs -I {} git -C {} commit -m "$(date +"%T - %d/%m/%y" --date="6 hours ago")"; find . -maxdepth 2 -name .git -type d | rev | cut -c 6- | rev | xargs -I {} git -C {} push; cd $OLDPWD'
alias ubash='cp $HOME/.bashrc $HOME/bashrc/bashrc'
alias repos='h; gh repo list Luisda2705 --limit 4000 | while read -r repo _; do   gh repo clone "$repo" "$repo"; done; mv Luisda2705/* $HOME; rm Luisda2705/; cd $OLDPWD'
alias rmrep='$HOME; rm *; cd $OLDPWD'
alias k='apt-get -y update && apt-get -y -f upgrade && apt-get -y -f full-upgrade && apt-get -y install kali-* && apt purge --autoremove -y'

#------ Read Files and Print Route -----#
alias fz='fzf --preview "batcat --color "always" {}" -e --color fg:255,bg:000,hl:140,fg+:140,bg+:000,hl+:140 --color info:183,prompt:110,spinner:107,pointer:167,marker:215'
alias rt='readlink -f $(fz)'
alias rf=',, $(fz)'

#------------ Network Setup ------------#
alias on='networksetup -setwebproxystate "Wi-fi" on && networksetup -setsecurewebproxystate "Wi-fi" on && sudo mitmproxy'
alias off='networksetup -setwebproxystate "Wi-fi" off && networksetup -setsecurewebproxystate "Wi-fi" off'
alias ifconfig='ifconfig | rg -e "[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}"'
alias ifc='ifconfig | rg -e "[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}"'
alias i='ifconfig | rg -e "[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}"'
alias ip='ifconfig | rg -e "[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}"'

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

LS_COLORS="$LS_COLORS:di=01;34"

eval export HOMEBREW_PREFIX="/home/linuxbrew/.linuxbrew";
export HOMEBREW_CELLAR="/home/linuxbrew/.linuxbrew/Cellar";
export HOMEBREW_REPOSITORY="/home/linuxbrew/.linuxbrew/Homebrew";
export PATH="/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin${PATH+:$PATH}";
