#!/bin/sh
DOTFILES=${HOME}/.dotfiles/.zsh/zshenv

for file in `ls -dF ${DOTFILES}/*.zsh` ; do
    source ${file}
done
