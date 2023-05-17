sudo tmux send-keys -t Control_5G.3 "sudo ip netns exec netamf ls /usr/bin" Enter

source nf_all.sh

for i in "${!nf[@]}"; do
	item="${nf[$i]}"
	arg="${item%%:*}"
	arg2="${item#*:}"
	echo "$arg, $arg2"
	cmd="sudo tmux send-keys -t $arg.$arg2 'C-c' Enter"
	eval "$cmd"
done
