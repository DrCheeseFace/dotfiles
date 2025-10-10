#!/usr/bin/env zsh 

#specify a command here v
# command='cowsay -e ^^  specify a command at ~/.config/bash/runner.sh!'
# command='cargo run -- -k'
# command='cargo build && ./target/debug/dukit -l'
# command='   make test'
# command='   make debug'
# command='  make  build-debug-spacers && ./bin/spacers LICENSE --check'
# command='   python3 titanic.py'
command='   python3 main.py'
# command='   npm run prettier:write'
# command='npm run start'
# command='go run hello.go'
# command='cargo test'
# command='RUST_BACKTRACE=1 cargo test'
# command='cargo check'
# command='cargo clippy'
# command='cargo run -- -f file.txt'
# command='npm run dev'
# command='npm run tauri dev'
# command='go run main.go'
# command='cargo build && ./target/debug/mahc --tiles 1p 9p 1s 9s 1m 9m rd gd wd Ew Sw Nw WWw -w Ww -p Ew -s Ew -d 2'
# command='cargo build && ./target/debug/mahc -f in.txt -o this.txt'
# command='cargo build && ./target/debug/mahc --tiles 11z NNw SSw WWw rrd wwd ggd -w gd -p Ew -s Ew -d 2 --emoji'
# command='cargo build && ./target/debug/mahc --tiles 123p 123p 999s 111z 99p -w 9p -p Ew -s Ew -d 2'
# command='cargo build && ./target/debug/mahc --tiles 1p 9p 1s 9s 1m 9m rd gd wd Ew Sw Nw WWw -w Ww -p Ew -s Ew -d 2 --json'
# command='cargo build && ./target/debug/mahc --tiles 123p 406p 789p rrrdo 99p -w 9p -p Ew -s Ew --emoji'
# command='cargo build && ./target/debug/mahc --tiles 123p 444s EEEw 9999m 11s -w 1s --dora 1p 3s Nw 8m 9s -p Ew -s Ew -o this.txt'
# command='cargo build && ./target/debug/mahc --tiles rrrd gggd wwwd 999p 11p -w 1p -p Ew -s Ew -d 2'
# command='cargo build && ./target/debug/mahc --tiles rrd 11p 44p SSw 22s 77s wwd -w wd' 
# command='cargo build && ./target/debug/mahc --manual 2 40 --ba 2 --json'
# command='cargo build && ./target/debug/mahc --tiles 234s 345m 88p 234p 567s -w 7s -d 4m --analyse' 
# command='cargo build && ./target/debug/mahc --tiles 1p 2p 3p 1p 2p 3p 1p 2p 3p rd rd rd rd Ew Ew -w Ew --analyse-tiles --json' 
# command='cargo build && ./target/debug/mahc --tiles EEEw NNNw SSSw WWWw 99p -w 9p' 

# debugger things 
# command='cargo build && ~/.config/bash/gdber.sh "//breakpoint" && rust-gdb --tui -x /tmp/gdber.gdb -ex run target/debug/mahc'
# command='make build && ~/.config/bash/gdber.sh "//breakpoint" && gdb --tui -x /tmp/gdber.gdb -ex run main.out'
# command='gcc -o q2.out q2.c -lm -g && valgrind ./q2.out --leak-check=full --show-leak-kings=all --track-origins=yes --verbose > log.txt 2>&1'
# command='gcc -o q1.out q1.c -lm -g -fsanitize=address && ./q1.out'

if tmux list-windows | grep -q "runner"; then
    tmux select-window -t ":runner"
else
    tmux new-window -n "runner" -c "$HOME" 
fi

tmux send-keys -t ":runner" "$command"  C-m

# specific pane switchin
# tmux select-pane -t <session-name>:<window-index>.<pane-index>
# tmux select-pane -t :.+1
# tmux select-pane -t :.-1

# uncomment to return back to "coder" tab after running
# tmux select-window -t ":coder"
