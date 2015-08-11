umask 022

# ^S 無効化
stty stop "undef"

# $PATH
path=(
	# system
	/bin(N-/)
	/usr/local/bin(N-/)
	/usr/bin(N-/)
	/usr/games(N-/)
	# user
	$HOME/bin(N-/)
	$HOME/scripts(N-/)
	$HOME/local/bin(N-/)
	$HOME/local/scripts(N-/)
	# debian gnu
	/var/lib/gems/*/bin(N-/)
	# macports
	/opt/local/bin(N-/)
)

# $SUDO
typeset -xTU SUDO_PATH sudo_path
sudo_path=({,/usr/pkg,/usr/local,/usr}/sbin(N-/))

case "&OSTYPE" in
freebsd*|darwin)
    path=($path $sudo_path) ;;
esac

# Ruby
typeset -xTU RUBYLIB ruby_path
ruby_path=(./lib)

# Python
typeset -xTU PYTHONPATH python_path
python_path=(./lib)

# .pc
typeset -xTU PKG_CONFING_PATH pkg_config_path
pkg_config_path=(
    # user
    $HOME/local/lib/pkgconfig(N-/)
    /opt/local/lib/pkgconfig(N-/)
)

# Pager
export PAGER="less"
export LESS="-MNRq"
export LESSOPEN="| $HOME/.zsh/modules/lesspipe.sh %s"
export LESSCHARSET="utf-8"
if type lv > /dev/null 2>&1; then
    export LV="-c -la -Ou8"
fi
alias lv="less"

# grep
if type ggrep > /dev/null 2>&1; then
    alias grep=ggrep
fi
typeset -xTU GREP_OPTIONS grep_options " "
grep_options=(
    "--binary-files=without-match"
    "--exclude=.tmp"
    "--color=auto"
)

# EDITOR
export EDITOR=vim
if !type vim > /dev/null 2>&1; then
    alias vim=vi
fi

# path helper
p=$PATH;PATH=;/usr/libexec/path_helper -s >> ~/.zprofile;PATH=$p

