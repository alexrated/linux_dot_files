# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
	for rc in ~/.bashrc.d/*; do
		if [ -f "$rc" ]; then
			. "$rc"
		fi
	done
fi

unset rc

# Enable git completion and git promp:
source ~/.git-completion.bash
source ~/.git-promp.sh

# *************** PARAMETROS PERSONALIZADOS ***************
#
# Valor umask personalizado:
umask 0002
#
# Ignorar duplicado en el historial de comandos:
export HISTCONTROL='ignorspace'

# Variable PS1:
PS1='\[\033[0;37m\]╭─ \A \[\033[1;34m\]\u-\[\033[1;34m\]\h 🐧 \[\033[1;36m\]\w\[\033[1;37m\]$(__git_ps1 " ( %s)")\n\[\033[0;37m\]╰▶ \[\033[0;37m\]$ '

# Editor de texto:
export EDITOR=/usr/bin/vim

# Fuzzy finder and completion
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# Better fzf searching:
export FZF_DEFAULT_COMMAND="fd --type f"

# ************** ALIASES PERSONALIZADOS ******************

# ls con indicador directorio:
alias ls='ls -F --color="auto"'

# Mostrar contenidos en formato largo:
alias ll='ls -lFS --color="auto"'

# Mostrar detalles del contenido de un directorio (con inodos):
alias li='ls -liFS --color="auto"'

# Contenido oculto con directorios marcados:
alias l='ls -lAiShF --color="auto"' 

# Mostrar detalles del directorio actual:
alias ld='ls -ld --color="auto"'

# Realizar búsqueda de un comando en el historial de bash:
alias shi='history | grep'

# Hacer source de bash:
alias src='source ~/.bashrc'

# Atajo a edición de .bashrc:
alias brc='vim ~/.bashrc'

# Atajo a edición de .vimrc:
alias vrc='vim ~/.vimrc'

# Borrar directorio con verbosidad:
alias rmd='rm -rf -v'

# Borrar archivo con mensaje de confirmación:
alias rm='rm -iv'

# Copiar recursivamente un directorio:
alias cpd='cp -riv'

# Mover recursivamente un directorio:
alias mvd='mv -iv'

# Mover o renombrar interactivamente:
alias mv='mv -iv'

# Copiar interactivo y conservando enlaces:
alias cp='cp -ipdv'

# Espacio en disco con tipos de sistemas de archivos y en formato "humano":
alias df='df -Th'

# Memoria del sistema al detalle:
alias mem='cat /proc/meminfo | less'

# uso de disco en el directorio actual:
alias diskusage='sudo find . -maxdepth 1 -type d -exec du --exclude=proc -shx {} \; | sort -hr'

# Entrar a mi SSD 2 (si tengo uno y ya lo he montado):
alias ssd2='cd /home/alexrated/ssd2'

# alias para la configuración de kitty:
alias kittyc='vim ~/.config/kitty/kitty.conf'

# alias para ver imágenes en kitty:
alias icat='kitten icat'

# alias para previsualizar archivos con fzf:
alias fpreview='fzf --preview "bat --color=always {}"'

# alias para buscar un archivo y abrirlo con vim:
alias fvim='vim $(fzf)'
