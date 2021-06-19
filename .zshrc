# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#. ~/.config/env

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

#Custom environment settings for Linux

if [[ $SHELL == *"/usr/bin/zsh"* ]];
then
  if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; 
  then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
  fi

  export ZSH="/home/lux/.oh-my-zsh"

  DISABLE_AUTO_UPDATE="true"

  ZSH_THEME="powerlevel10k/powerlevel10k"

  plugins=(
      git
      zsh-syntax-highlighting
      zsh-autosuggestions
      )
  source $ZSH/oh-my-zsh.sh

  [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
fi

# Ease of Use
alias vi=vim
set -o vi alias dnf="sudo dnf"
alias firewalld="sudo firewalld"
alias weatherd="curl 'https://wttr.in/?format=v2'" 
alias weather="curl 'https://wttr.in'" 

# To Get Alacritty working.
TERM=xterm-256color 
EDITOR='vim'

# Docker Aliases
alias dimg="docker images"
alias dx="docker exec"
alias dps="docker ps -a --format 'table {{.Names}}\t{{.Status}}\t{{.Image}}'"
alias dports="docker ps --format 'table {{.Names}}\t{{.Ports}}'"
alias dvol="docker volume ls"
alias dinspect="docker volume inspect"
alias dcomp="docker-compose"
alias dnet="docker network ls -f driver=bridge --format "{{.ID}}" | xargs docker network inspect | grep Name"
alias dnetwork="docker network ls"
alias dip="docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}'"
alias ytdl='youtube-dl -f bestaudio --extract-audio --audio-format mp3 --audio-quality 0'

export PATH=$PATH:~/.config/bin

#if [[ "$(tty)" == '/dev/tty1' ]]; then
  #exec sway 
#fi
if [ -z "$DISPLAY" ] && [ -n "$XDG_VTNR" ] && [ "$XDG_VTNR" -eq 1 ]; then
    exec startx
fi
