#!/bin/zsh

dotfiles=(
	.fonts
	.zsh .zshrc .zshenv
	.vim .vimrc .vrapperrc
	.inputrc .screenrc .tmux.conf
	.tigrc
	.source-highlight
)

function symbolic(){
	from=$1
	target_dir=$(cd `dirname $2`; pwd)
	absto=$target_dir/`basename $2`
	absfrom=$(cd $target_dir; cd `dirname $from`; pwd)/`basename $from`

	if [ -e $absfrom ]; then
		if [ -L $absto ]; then
			unlink $absto; ln -s $from $absto
		elif [ ! -e $absto ]; then
			ln -s $from $absto
		fi
	fi
}

function install() {
	if ! type $@[1] >/dev/null 2>&1; then
		eval "${inscmd} ${@[1]}" 2>/dev/null
	fi
}

ABSPATH=$(cd `dirname $0`; pwd)/`basename $0`
inscmd="${HOME}/bin/scmd "
if type homebrew >/dev/null 2>&1; then
	inscmd+="homebrew install"
elif type apt-get >/dev/null 2>&1; then
	inscmd+="apt-get install"
elif type yum >/dev/null 2>&1; then
	inscmd+="yum install"
fi

# install vim
# install tmux


# dotfiles
for dotfile in ${dotfiles[@]}; do
	symbolic ./.dotfiles/${dotfile} ./${dotfile}
done


source ~/.zshenv
source ~/.zshrc
