#!/bin/bash

name="UEs"

tmux new-session -d -s "$name"


tmux split-window -v
tmux split-window -h
tmux select-pane -t 0
tmux split-window -h


tmux send-keys -t 0 "./ue_internet.sh "$1"" Enter
sleep .5
tmux send-keys -t 1 "./ue_iot.sh "$1"" Enter
sleep .5
tmux send-keys -t 2 "./ue_edge.sh "$1"" Enter
sleep .5
tmux send-keys -t 3 "./ue_CustomSlice.sh "$1"" Enter
sleep .5



tmux a -t "$name"
