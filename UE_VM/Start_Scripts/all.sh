#!/bin/bash
sudo ip route add 10.0.3.0/24 dev enp0s3 #route to amf
sudo ip route add 10.0.17.0/24 dev enp0s3 # route to upf

cd /home/lily/5G/UE_VM/Start_Scripts
sudo gnome-terminal --title="gnb" -- ./gnb.sh &
echo "started gnb"
sleep 6
sudo  gnome-terminal --title="ue" -- ./start_all_ue.sh
sleep 10
if [ -z "$1" ]
then	
	echo "wireshark &" TODO
fi
../Test_Scripts/test_all.sh
