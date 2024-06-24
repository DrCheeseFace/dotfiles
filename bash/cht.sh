#!/usr/bin/env bash
selected=`cat ~/.config/bash/tmux-cht-languages ~/.config/bash/tmux-cht-command | fzf`
if [[ -z $selected ]]; then
    exit 0
fi

read -p "Enter Query: " query
query=`echo $query | tr ' ' '+'`
tmux neww zsh -c "curl -s cht.sh/$selected/$query | more"
