#!/usr/bin/env zsh 
#specify a command here v
command='cargo test'
tmux select-window -t ":runner"

# tmux send-keys -t ":runner" "$command"  C-m
tmux send-keys -t ":runner" "cowsay -e ^^  specify a command at ~/.config/bash/runner.sh!"  C-m

# specific pane switching
# tmux select-pane -t <session-name>:<window-index>.<pane-index>
# tmux select-pane -t :.+1
# tmux select-pane -t :.-1

# uncomment to return back to "coder" tab after running
# tmux select-window -t ":coder"

