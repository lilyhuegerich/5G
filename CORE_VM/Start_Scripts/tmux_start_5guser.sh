name="User_5G"

tmux new-session -d -s "$name"

tmux split-window -h
tmux select-layout even-horizontal

tmux a -t "$name"
