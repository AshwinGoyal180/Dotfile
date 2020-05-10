# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block, everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
#POWERLEVEL9K_INSTANT_PROMPT=off

autoload -U colors && colors
export TERM=rxvt-unicode

ssh_info() {
  [[ "$SSH_CONNECTION" != '' ]] && echo '%(!.%{$fg[red]%}.%{$fg[yellow]%})%n%{$reset_color%}@%{$fg[green]%}%m%{$reset_color%}:' || echo ''
}

local ret_status="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )"
PROMPT="%F%(!.%{$fg[red]%}.%{$fg[green]%})[%(!.%{$fg[red]%}.%{$fg[green]%})%n%(!.%{$fg[red]%}.%{$fg[green]%})@%(!.%{$fg[red]%}.%{$fg[green]%})%M %{$fg[white]%}%c%(!.%{$fg[red]%}.%{$fg[green]%})]%{$reset_color%}%f${ret_status}%{$reset_color%}"
autoload -U compinit
zstyle ':completion:*' menu select
zstyle ':completion:*:processes' command 'ps -A'
zmodload zsh/complist
compinit
# Include hidden files in autocomplete:
_comp_options+=(globdots)

LS_COLORS='rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=01;05;37;41:mi=01;05;37;41:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arc=01;31:*.arj=01;31:*.taz=01;31:*.lha=01;31:*.lz4=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.tzo=01;31:*.t7z=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.dz=01;31:*.gz=01;31:*.lrz=01;31:*.lz=01;31:*.lzo=01;31:*.xz=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.alz=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.cab=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.axv=01;35:*.anx=01;35:*.ogv=01;35:*.ogx=01;35:*.pdf=00;32:*.ps=00;32:*.txt=00;32:*.patch=00;32:*.diff=00;32:*.log=00;32:*.tex=00;32:*.doc=00;32:*.aac=00;36:*.au=00;36:*.flac=00;36:*.m4a=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.axa=00;36:*.oga=00;36:*.spx=00;36:*.xspf=00;36:'


alias lc="colorls --sd -X "
#alias code="~/Documents/eYFI-IDE/VSCode-linux-x64/code"
alias lx="colorls -A --sd -X"
alias pbcopy='xsel --clipboard --input'
alias tmux='tmux -2 -u'
alias dotfiles='/usr/bin/git --git-dir=/home/ashwin/Documents/Dotfiles/ --work-tree=$HOME'
export PATH="$PATH:/home/ashwin/.gem/ruby/2.6.0/bin"
#xport PATH="$HOME/.rbenv/bin:$PATH"
#eval "$(rbenv init -)"
# export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"
export VISUAL="vim"
export PATH="$PATH:/home/ashwin/development/flutter/bin"
export PATH="$PATH:/home/ashwin/Android/Sdk/emulator"
export PATH="$PATH:/home/ashwin/Android/Sdk/platform-tools"
export PATH="$HOME/.dynamic-colors/bin:$PATH"
export PATH="$PATH:/home/ashwin/bin"
export PATH="$PATH:/home/ashwin/.scripts"
export PATH="$PATH:/opt/android-sdk/platform-tools"
#source /usr/share/zsh-theme-powerlevel9k/powerlevel9k.zsh-theme

bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char
# Use vim cli mode
bindkey '^P' up-history
bindkey '^N' down-history

# backspace and ^h working even after
# returning from command mode
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char

# ctrl-w removed word backwards
bindkey '^w' backward-kill-word

# ctrl-r starts searching history backward
bindkey '^r' history-incremental-search-backward

export KEYTIMEOUT=1




# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'

  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select

zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init

# Use beam shape cursor on startup.
echo -ne '\e[5 q'
# Use beam shape cursor for each new prompt.
preexec() { echo -ne '\e[5 q' ;}

# Use lf to switch directories and bind it to ctrl-o
lfcd () {
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        if [ -d "$dir" ]; then
            if [ "$dir" != "$(pwd)" ]; then
                cd "$dir"
            fi
        fi
    fi
}

bindkey -s '^o' 'lfcd\n'  # zsh


autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

HISTFILE=~/.zsh_history
HISTSIZE=SAVEHIST=10000
setopt sharehistory
setopt extendedhistory
# setopt  autocd autopushd \ pushdignoredups


source /home/ashwin/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
  typeset -g POWERLEVEL9K_INSTANT_PROMPT=off
#zmodload zsh/zprof
source /home/ashwin/.config/zsh/zsh-z.plugin.zsh
source /home/ashwin/.config/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
#source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
#source ~/.config/zsh/git.plugin.zsh

# Better searching in command mode
bindkey -M vicmd '/' history-incremental-search-backward
bindkey -M vicmd '?' history-incremental-search-forward

autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search # Up
bindkey "^[[B" down-line-or-beginning-search # Down
bindkey -M vicmd "k" up-line-or-beginning-search
bindkey -M vicmd "j" down-line-or-beginning-search

#ESP32
export IDF_PATH=~/esp/esp-idf
export PATH="$HOME/esp/xtensa-esp32-elf/bin:$PATH"

PATH="/home/ashwin/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/ashwin/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/ashwin/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/ashwin/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/ashwin/perl5"; export PERL_MM_OPT;
