#!/bin/bash

sudo ip addr add 10.0.2.4 dev enp0s3 #IP address used in configs for Core vm
sudo ip route add 10.0.2.15 dev enp0s3 #Route to UE_vm (its manual configured ip address)

mode=${1:-"Classic_Core"}
name=$(/home/lily/5G/SHARED/Tools/check_if_config_mode_valid.sh $mode CORE_VM)
status=$?
[ $status -eq 0 ] && echo "Mode: " $name || exit 1

cd /home/lily/5G/CORE_VM/Config_Files
cd $name 

#mongorestore Open5gs_"$name" #restore subscribers

cd /home/lily/5G/CORE_VM/Start_Scripts
./gen_NF_veths.sh

cd "$config_files"
./put_open5gs_configs.sh $name
sleep 2
cd ../Start_Scripts
./health_check.sh $name

sudo sysctl -w net.ipv4.ip_forward=1
sudo iptables -t nat -A POSTROUTING -o enp0s3 -j MASQUERADE

cd /home/lily/open5gs/webui #RENAME ME
npm run dev &
cd /home/lily/5G/CORE_VM/Start_Scripts #RENAME ME
sudo gnome-terminal --title="logs" -- ./start_logs.sh
sleep 8
firefox -new-tab "http://localhost:3000"




