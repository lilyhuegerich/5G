#!/bin/bash
mode=${1:-"Classic_Core"}
name=$(/home/lily/5G/SHARED/Tools/check_if_config_mode_valid.sh $mode UE_VM)

status=$?
[ $status -eq 0 ] && echo "Mode: " $name || exit 1
exit 0
sudo ip route add 10.0.3.0/24 dev enp0s3 #route to amf
sudo ip route add 10.0.17.0/24 dev enp0s3 # route to upf

cd /home/lily/5G/UE_VM/Start_Scripts
sudo gnome-terminal --title="gnb" -- ./gnb.sh "$name" &
echo "started gnb"
sleep 6
sudo  gnome-terminal --title="ue" -- ./start_all_ue.sh "$name"
sleep 10
if [ "$2" = "w" ]; then
	wireshark &
fi
../Test_Scripts/test_all.sh
