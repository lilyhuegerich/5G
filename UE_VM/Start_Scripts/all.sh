#!/bin/bash
cd /home/lily/5G/UE_VM/Start_Scripts
sudo gnome-terminal --title="gnb" -- ./gnb.sh &
echo "started gnb"
sleep 6
sudo  gnome-terminal --title="ue" -- ./start_all_ue.sh
sleep 10
if (($#>0))
then	
	wireshark &
fi
../Test_Scripts/test_all.sh
