name="Core_4G"

tmux new-session -d -s "$name"

tmux split-window -h
tmux split-window -h

tmux select-layout even-horizontal

tmux select-pane -t 0
tmux split-pane -v
tmux select-pane -t 2
tmux split-pane -v


tmux a -t "$name"
