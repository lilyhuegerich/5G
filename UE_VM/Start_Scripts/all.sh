#!/bin/bash
mode=${1:-"Classic_Core"}
name=$(/home/lily/5G/SHARED/Tools/check_if_config_mode_valid.sh $mode UE_VM)

status=$?
[ $status -eq 0 ] && echo "Mode: " $name || ( echo $name  && exit 1 )

#Needed for bridged adapter mode
#sudo ip addr add 10.0.2.15 dev enp0s3 #Config address of UE_VM
#sudo ip route add 10.0.2.4 dev enp0s3 #Route to Core_vm manual address add

cd /home/lily/5G/UE_VM/Start_Scripts

sudo ./end_me.sh #kill all proccesses from last run

if [[ $mode == "Double_upf" ]]; then
	sudo ip route del 10.0.21.0/24 dev veth_upf2
	sudo ip route del local 10.0.21.1
	sudo ip route add 10.0.21.1 dev enp0s3 via 10.0.21.2 #route to second upf
fi
sudo ip route add 10.0.3.2 dev enp0s3
sudo ip route add 10.0.3.1 dev enp0s3 via 10.0.3.2 #route to amf
sudo ip route add 10.0.17.2 dev enp0s3
sudo ip route add 10.0.17.1 dev enp0s3 via 10.0.17.2 # route to upf

if [[ $mode == "Double_ran" ]]; then
	sudo ip addr add 10.0.2.14 dev enp0s3 # addr for gnb 2
	sudo xterm -e ./double_gnb.sh "$name" &
	echo $! > /home/lily/5G/UE_VM/Start_Scripts/pids/gnb_window.pid
else
	sudo xterm -e ./gnb.sh "$name" &
	echo $! > /home/lily/5G/UE_VM/Start_Scripts/pids/gnb_window.pid
fi

echo "started gnb"
sleep 6

sudo  xterm -e ./start_all_ue.sh "$name" &
echo $! > /home/lily/5G/UE_VM/Start_Scripts/pids/ue_window.pid

sleep 10
if [ "$2" = "w" ]; then
	wireshark &
fi
../Test_Scripts/test_all.sh
