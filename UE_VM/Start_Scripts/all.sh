cd /home/lily/5G/UE_VM/Start_Scripts
sudo gnome-terminal --title="gnb" -- ./gnb.sh &
#echo $! > gnb.pid
echo "started gnb"
sleep 3
sudo  gnome-terminal --title="ue_internet" -- ./ue_internet.sh &
#echo $! > ue.pid
echo "started ue internet"
sleep 2
sudo  gnome-terminal --title="ue_iot" -- ./ue_iot.sh &
echo "started ue iot"
sleep .5
sudo  gnome-terminal --title="ue_edge" -- ./ue_edge.sh &
echo "started ue edge"
sleep .5
sudo  gnome-terminal --title="ue_CustomSlice" -- ./ue_CustomSlice.sh &
echo "started ue CustomSlice"


