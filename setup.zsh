#!/bin/zsh

dotfiles=(
	.fonts.conf
	.zsh .zshrc .zshenv
	.vim .vimrc .vrapperrc
	.inputrc .screenrc .tmux.conf
	.tigrc
	.source-highlight
)

cd $HOME

for dotfile in ${dotfiles[@]}; do
	if [ -L "$HOME/$dotfile" ]; then
		echo "Removing existing symlink for $dotfile"
		rm "$HOME/$dotfile"
	elif [ -e "$HOME/$dotfile" ]; then
		echo "Backing up existing $dotfile"
		mv "$HOME/$dotfile" "$HOME/$dotfile.backup"
	fi
	
	echo "Creating symlink for $dotfile"
	ln -s "$HOME/.dotfiles/$dotfile" "$HOME/$dotfile"
done

# Source the shell configuration files
if [ -f "$HOME/.zshenv" ]; then
	source "$HOME/.zshenv"
fi

if [ -f "$HOME/.zshrc" ]; then
	source "$HOME/.zshrc"
fi

echo "Dotfiles setup complete!"
