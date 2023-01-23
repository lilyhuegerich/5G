gnome-terminal --tab --title="ue_internet" -- ./ue_internet.sh "$1" 
echo $! > ue.pid
echo "started ue internet"
sleep 2
gnome-terminal --tab --title="ue_iot" -- ./ue_iot.sh "$1"
echo "started ue iot"
sleep .5
gnome-terminal --tab --title="ue_edge" -- ./ue_edge.sh "$1"
echo "started ue edge"
sleep .5
gnome-terminal --tab --title="ue_CustomSlice" -- ./ue_CustomSlice.sh "$1"
echo "started ue CustomSlice"

