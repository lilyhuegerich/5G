sudo xterm -e ./tmux_start_4g.sh &
sleep 1
echo "started 4g components"
sudo xterm -e ./tmux_start_5gcontrol.sh &
echo "started 5g core  components"
sleep 1
sudo xterm -e ./tmux_start_5guser.sh &
echo "started 5g user plane components"
sleep 1
sudo tmux ls
