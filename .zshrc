#!/bin/sh
DOTFILES=${HOME}/.dotfiles/.zsh/zshrc

for file in `ls -dF ${DOTFILES}/*.zsh` ; do
    source ${file}
done
