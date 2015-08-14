# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

source ~/.bash_svn

# User specific environment and startup programs

PATH=$PATH:$HOME/bin
alias c="clear"
alias m="make"
alias mc="make clean"
alias mm="make menuconfig"
alias mu="make uImage"
alias l="ls"
alias cr="ctags -R && cscope -Rbq -f .cscope.out"
alias grepd='grep --color=always --exclude-dir=\.svn --exclude=*.cmd --exclude=.tags -rn'
alias fstyle="astyle -A1 -s4 -n -z2 -K -S"

export PATH
