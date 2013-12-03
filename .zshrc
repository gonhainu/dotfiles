# ---------------------------
# General Settings
# ---------------------------
PATH=/usr/local/sbin:/usr/local/bin:$HOME/bin:$PATH
MANPATH=/usr/local/share/man:$MANPATH
EDITOR=/Applications/MacVim.app/Contents/MacOS/Vim
KCODE=u
AUTOFEATURE=true
LANG=ja_JP.UTF-8
RSENSE_HOME="/usr/local/Cellar/rsense/0.3/libexec"


setopt no_beep
setopt auto_cd
setopt auto_pushd
setopt correct
setopt magic_equal_subst
setopt notify
setopt equals

### Complement ###
autoload -U compinit; compinit -u
setopt auto_list
setopt auto_menu
setopt list_packed
setopt list_types
bindkey "^[[Z" reverse-menu-complete
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

### Glob ###
setopt extended_glob
unsetopt caseglob

### History ###
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt bang_hist
setopt extended_history
setopt hist_ignore_dups
setopt share_history
setopt hist_reduce_blanks

# マッチしたコマンドのヒストリを表示できるようにする
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

# すべてのヒストリを表示する
function hitory-all { history -E 1 }

### alias ###
alias vi='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
alias vim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
alias ls='gls --color=auto'
alias ll='ls -l'
alias la='ls -a'
alias rm='rm -i'
alias mi="open -a mi"
alias emacs="open -a Emacs"
#alias gnuplot="GNUTERM=aqua /usr/local/bin/gnuplot"
#alias gnuplot="/usr/local/bin/gnuplot"
alias octave="/Applications/Octave.app/Contents/Resources/bin/octave"
alias chrome="open -a /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --args --disable-background-mode --disable-java --incognito"
alias w3m='w3m -cookie'
#alias tmux="tmuxx"
alias p="qlmanage -p *"  
alias pong='perl -nle '\''print "display notification \"$_\" with title \"Terminal\""'\'' | osascript'

# key
bindkey '^f' zaw-open-file
bindkey -v

# ---------------------------
# Look And Feel Settings
# ---------------------------
### Ls Color ###
# 色の設定
export LSCOLORS=Exfxcxdxbxegedabagacad
# 補完時の色の設定
export LS_COLORS='di=01;34:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
# ZLS_COLORSとは？
export ZLS_COLORS=$LS_COLORS
# lsコマンド時、自動で色がつく(ls -Gのようなもの？)
export CLICOLOR=true
# 補完候補に色を付ける
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

### Setup my theme {{{
#

# Theme.
ZSH_THEME='gonhainu'
#ZSH_THEME='yonchu-2lines'

# Remove any right prompt from display when accepting a command line.
# This may be useful with terminals with other cut/paste methods.
#setopt transient_rprompt

# Certain escape sequences may be recognised in the prompt string.
# e.g. Environmental variables $WINDOW
setopt prompt_subst

# Certain escape sequences that start with `%' are expanded.
#setopt prompt_percent

if [ ${UID} -eq 0 ]; then
    # Prompt for "root" user (all red characters).
    # Note: su - or sudo -s を行った場合は環境変数が引き継がれない
    PROMPT="${reset_color}${fg[red]}[%n@%m:%~]%#${reset_color} "
    PROMPT2="${reset_color}${fg[red]}%_>${reset_color} "
    SPROMPT="${reset_color}${fg[red]}%r is correct? [n,y,a,e]:${reset_color} "
else
    # Prompt for "normal" user.
    # Loading theme
    if [ -f ~/.zsh/themes/"$ZSH_THEME".zsh-theme ]; then
        echo "Loading theme: $ZSH_THEME"
        source ~/.zsh/themes/"$ZSH_THEME".zsh-theme
    else
        echo "Error: could not load the theme '$ZSH_THEME'"
    fi
fi
# }}}

### Title (user@hostname) ###
case "${TERM}" in
kterm*|xterm*|)
	precmd() {
		echo -ne "\033]0;${USER}@${HOST%%.*}\007"
	}
	;;
esac

# ---------------------------
# Other Settings
# ---------------------------
### RVM ###
#if [[ -s ~/.rvm/scripts/rvm ]]; then source ~/.rvm/scripts/rvm; fi

### Macports ###
# case "${OSTYPE}" in
# 	darwin*)
# 		export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# 		export MANPATH=/opt/local/share/man:/opt/local/man:$MANPATH
# 	;;
# esac

### rbenv ###
PATH="$HOME/.rbenv/bin:$HOME/.rbenv/shims:$PATH"
eval "$(rbenv init -)"

### plenv ###
PATH="$HOME/.plenv/bin:$HOME/.plenv/shims:$PATH"
eval "$(plenv init -)"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

### Added by the Cabal
PATH=${HOME}/.cabal/bin:$PATH

### Added by the TeXLive2012
PATH=/usr/texbin:$PATH

### Solarized
eval $(gdircolors ~/.dircolors-solarized)

### MacUIM
XMODIFIERS=@im=uim
GTK_IM_MODULE=uim

### Added by the Android SDK
#PATH=/Applications/adt-bundle-mac/sdk/tools:$PATH

### w3mでgoogle検索
function google() {
local str opt
if [ $ != 0 ]; then
  for i in $*; do
    str="$str+$i"
  done
  str=`echo  $str | sed 's/^\+//'`
  opt='search?num=50&hl=ja&lr=lang_ja'
  opt="${opt}&q=${str}"
fi
w3m http://www.google.co.jp/$opt
}


### tmux自動起動
if [ -z "$TMUX" -a -z "$STY" ]; then
    if type tmuxx >/dev/null 2>&1; then
        tmuxx
    elif type tmux >/dev/null 2>&1; then
        if tmux has-session && tmux list-sessions | /usr/bin/grep -qE '.*]$'; then
            tmux attach && echo "tmux attached session "
        else
            tmux new-session && echo "tmux created new session"
        fi
    elif type screen >/dev/null 2>&1; then
        screen -rx || screen -D -RR
    fi
fi

#. ~/.vim/bundle/powerline/powerline/bindings/zsh/powerline.zsh

function chpwd() {
  touch ~/dotfiles/dir0.txt && \rm ~/dotfiles/dir0.txt && echo $PWD > ~/dotfiles/dir0.txt
  ls
}


if ! whereis autoload >/dev/null 2>&1; then
    return # if not zsh
fi

autoload -U add-zsh-hook

#
# Notification of local host command
# ----------------------------------
#
# Automatic notification via growlnotify / notify-send
#
#
# Notification of remote host command
# -----------------------------------
#
# "==ZSH LONGRUN COMMAND TRACKER==" is printed after long run command execution
# You can utilize it as a trigger
#
# ## Example: iTerm2 trigger( http://qiita.com/yaotti/items/3764572ea1e1972ba928 )
#
#  * Trigger regex: ==ZSH LONGRUN COMMAND TRACKER==(.*)
#  * Parameters: \1
#

#export __timetrack_threshold=20 # seconds

#function __my_preexec_start_timetrack() {
#    local command=$1

#    export __timetrack_start=`date +%s`
#    export __timetrack_command="$command"
#}
#
#function __my_preexec_end_timetrack() {
#    local exec_time
#    local command=$__timetrack_command
#    local notify_method
#    local message
#
#    export __timetrack_end=`date +%s`
#
#    if test -n "${REMOTEHOST}${SSH_CONNECTION}"; then
#        notify_method="remotehost"
#    elif which growlnotify >/dev/null 2>&1; then
#        notify_method="growlnotify"
#    elif which notify-send >/dev/null 2>&1; then
#        notify_method="notify-send"
#    else
#        return
#    fi
#
#    if [ -z "$__timetrack_start" ] || [ -z "$__timetrack_threshold" ]; then
#        return
#    fi
#
#    exec_time=$((__timetrack_end-__timetrack_start))
#    if [ -z "$command" ]; then
#        command="<UNKNOWN>"
#    fi
#
#    message="Command finished!\nTime: $exec_time seconds\nCOMMAND: $command"
#
#    if [ "$exec_time" -ge "$__timetrack_threshold" ]; then
#        case $notify_method in
#            "remotehost" )
#        # show trigger string
#                echo -e "\e[0;30m==ZSH LONGRUN COMMAND TRACKER==$(hostname -s): $command ($exec_time seconds)\e[m"
#        sleep 1
#        # wait 1 sec, and then delete trigger string
#        echo -e "\e[1A\e[2K"
#                ;;
#            "growlnotify" )
#                echo "$message" | growlnotify -n "ZSH timetracker" --appIcon Terminal
#                ;;
#            "notify-send" )
#                notify-send "ZSH timetracker" "$message"
#                ;;
#        esac
#    fi
#
#    unset __timetrack_start
#    unset __timetrack_command
#}
#
#if which growlnotify >/dev/null 2>&1 ||
#    which notify-send >/dev/null 2>&1 ||
#    test -n "${REMOTEHOST}${SSH_CONNECTION}"; then
#    add-zsh-hook preexec __my_preexec_start_timetrack
#    add-zsh-hook precmd __my_preexec_end_timetrack
#fi

function feedly() {
  url=`currentwebpage -u`
  open -a Google\ Chrome "http://www.feedly.com/home#subscription/feed/$url"
}

# ディレクトリごとに区切る
# http://mollifier.hatenablog.com/entry/20081214/1229229752
autoload -Uz select-word-style
select-word-style default
zstyle ':zle:*' word-chars " /=;@+{},|"
zstyle ':zle:*' word-style unspecified

source /Users/nobu/dotfiles/.zsh/plugin/zaw/zaw.zsh
source /Users/nobu/dotfiles/.zsh/tool/growl.zsh
source /Users/nobu/dotfiles/.zsh/tool/clipboard.zsh
