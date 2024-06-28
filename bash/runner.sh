#!/usr/bin/env zsh 

#specify a command here v
# command='cargo build'
command='cargo build && ~/.config/bash/gdber.sh "//breakpoint" && gdb --tui -x /tmp/gdber.gdb -ex run target/debug/leet '

if tmux list-windows | grep -q "runner"; then
    tmux select-window -t ":runner"
else
    tmux new-window -n "runner" -c "$HOME" 
fi


# tmux send-keys -t ":runner" "cowsay -e ^^  specify a command at ~/.config/bash/runner.sh!"  C-m
tmux send-keys -t ":runner" "$command"  C-m


# specific pane switching
# tmux select-pane -t <session-name>:<window-index>.<pane-index>
# tmux select-pane -t :.+1
# tmux select-pane -t :.-1

# uncomment to return back to "coder" tab after running
# tmux select-window -t ":coder"




