gnome-terminal --tab --title="ue_internet" -- ./ue_internet.sh 
echo $! > ue.pid
echo "started ue internet"
sleep 2
gnome-terminal --tab --title="ue_iot" -- ./ue_iot.sh 
echo "started ue iot"
sleep .5
gnome-terminal --tab --title="ue_edge" -- ./ue_edge.sh 
echo "started ue edge"
sleep .5
gnome-terminal --tab --title="ue_CustomSlice" -- ./ue_CustomSlice.sh 
echo "started ue CustomSlice"

