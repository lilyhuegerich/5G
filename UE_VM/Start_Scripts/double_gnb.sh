
cd /home/lily/UERANSIM
tmux new-session -d -s gnb
tmux split-window -h
tmux send-keys -t 0 "./build/nr-gnb -c /home/lily/5G/UE_VM/Config_Files/"$1"/GNB_files/gnb.yaml" Enter 
tmux send-keys -t 1 "./build/nr-gnb -c /home/lily/5G/UE_VM/Config_Files/"$1"/GNB_files/gnb_2.yaml" Enter
tmux a -t gnb
