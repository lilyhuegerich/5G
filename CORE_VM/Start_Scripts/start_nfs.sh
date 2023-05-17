sudo tmux send-keys -t Control_5G.3 "sudo ip netns exec netamf ls /usr/bin" Enter

source nf_commands.sh

for i in "${!nf[@]}"; do
	item="${nf[$i]}"
	arg="${item%%:*}"
	remaining="${item#*:}"
	arg2="${remaining%%:*}"
	cmd="${remaining#*:}"
	echo " '$arg', and '$arg2', and '$cmd'"
done
