#!/bin/bash
pid_directory="/home/lily/5G/UE_VM/Start_Scripts/pids"
kill_me_script="/home/lily/5G/SHARED/PIDs/kill_me.sh"
for file in "$pid_directory"/*; do 
	if [ -f "$file" ]; then
		"$kill_me_script" "$file"
	fi
done

sudo /home/lily/5G/UE_VM/Start_Scripts/kill_tmux.sh
