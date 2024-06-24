#!/usr/bin/env bash
selected=`cat ~/.config/bash/tmux-cht-languages ~/.config/bash/tmux-cht-command | fzf`
if [[ -z $selected ]]; then
    exit 0
fi

read -p "Enter Query: " query
query=`echo $query | tr ' ' '+'`
if grep -q $selected ~/.config/bash/tmux-cht-languages; then
    tmux neww zsh -c "curl -s cht.sh/$selected/$query | batcat -p --paging=always"
else
    tmux neww zsh -c "curl -s cht.sh/$selected~$query | batcat -p --paging=always"
fi

