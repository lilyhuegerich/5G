sudo tmux send-keys -t Control_5G.3 "sudo ip netns exec netamf ls /usr/bin" Enter

source nf_commands.sh

for i in "${!nf[@]}"; do
	item="${nf[$i]}"
	arg="${item%%:*}"
	remaining="${item#*:}"
	arg2="${remaining%%:*}"
	cmd="sudo tmux send-keys -t $arg.$arg2 'sudo ip netns exec net${remaining#*:}' Enter"
	eval "$cmd"
done
