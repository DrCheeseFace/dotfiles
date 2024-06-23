#!/usr/bin/env bash

header="Sessions:"
sessions=$(tmux list-sessions -F "#S" 2>/dev/null) \
    || header="No active sessions!"

fzf_opts=(
    --print-query
    --reverse
    --header "$header"
    --no-info
    --preview "tmux lsw -t {}"
)

mapfile -t selections <<<"$(fzf "${fzf_opts[@]}" <<<"$sessions")"
query=${selections[0]}
session=${selections[1]}

[[ -z "$query" && -z "$session" ]] && exit

if [[ -z "$session" ]]; then
    printf "Creating new tmux session named [$query]\n"
    tmux new-session -d -s "$query" && session="$query"
fi

printf "Switching to tmux session named [$session]\n"
[[ -z "$TMUX" ]] && action="attach" || action="switch-client"
tmux $action -t "$session"
