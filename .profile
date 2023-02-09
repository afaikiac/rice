# XDG
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
export XDG_STATE_HOME=$HOME/.local/state

# Home
export PATH=$HOME/bin:$PATH
export PATH=$HOME/.local/bin:$PATH

# Rust
if command -v ruby &>/dev/null; then
  export CARGO_HOME="$XDG_DATA_HOME/cargo"
  export PATH=$CARGO_HOME/bin:$PATH
fi

# [Ruby](https://wiki.archlinux.org/title/ruby#Setup)
if command -v ruby &>/dev/null; then
	export GEM_HOME="$(ruby -e 'puts Gem.user_dir')"
	export PATH="$PATH:$GEM_HOME/bin"
fi

# pyenv
if command -v pyenv &>/dev/null; then
  export PYENV_ROOT="$XDG_DATA_HOME/pyenv"
  export PATH=$PYENV_ROOT/shims:$PATH
fi

# R
export R_LIBS_USER=$HOME/.local/lib/R/library

# GnuPG
export GPG_TTY=$(tty)

if command -v lvim &>/dev/null; then
	export VISUAL=lvim
	export EDITOR="$VISUAL"
  export MANPAGER='lvim +Man!'
fi

# if vim --version 2>/dev/null >/dev/null; then
# 	export MANPAGER='/bin/bash -c "vim -MRn -c \"set buftype=nofile showtabline=0 ft=man ts=8 nomod nolist norelativenumber nonu noma foldmethod=indent foldnestmax=1 foldenable\" -c \"hi Folded ctermbg=NONE\" -c \"normal L\" -c \"nmap q :qa<CR>\"</dev/tty <(col -b)"'
# fi

# PAGER
if command -v bat &>/dev/null; then
	export PAGER="bat"
fi

# TERMINAL
if command -v alacritty &>/dev/null; then
	export TERMINAL="alacritty -e "
fi

# default shell
if command -v fish &>/dev/null; then
	export SHELL="/usr/bin/fish"
fi

# libvirt
export LIBVIRT_DEFAULT_URI="qemu:///system"

# pass
export PASSWORD_STORE_ENABLE_EXTENSIONS=true
export PASSWORD_STORE_DIR="$XDG_DATA_HOME/pass"

# xorg
export XCURSOR_SIZE=29
export XAUTHORITY="$XDG_RUNTIME_DIR/.Xauthority"

# ~/. clean up
export PARU_CONF="$XDG_CONFIG_HOME/paru/paru.conf"
export HISTFILE="$XDG_STATE_HOME/bash/history"
export DOCKER_CONFIG="$XDG_CONFIG_HOME/docker"
export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export GOPATH="$XDG_DATA_HOME/go"
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc"
export IPYTHONDIR="$XDG_CONFIG_HOME/ipython"
export JUPYTER_CONFIG_DIR="$XDG_CONFIG_HOME/jupyter"
export STACK_ROOT="$XDG_DATA_HOME/stack"
export XSERVERRC="$XDG_CONFIG_HOME/X11/xserverrc"
export XINITRC="$XDG_CONFIG_HOME/X11/xinitrc"
export TEXMFVAR="$XDG_CACHE_HOME/texlive/texmf-var"
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
export ANSIBLE_HOME="$XDG_DATA_HOME/ansible"
export WGETRC="$XDG_CONFIG_HOME/wget/wgetrc"

# Greeter for xinit
if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
	echo
	read -p "Hi, cool man! Do you want to access Xmonad? [Y/n]: " -n 1 -r
	echo
	if [[ $REPLY =~ ^[yY]$ ]]; then
		exec xinit xmonad
	fi
fi
