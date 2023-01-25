#!/bin/bash
config_files="/home/lily/5G/UE_VM/Config_Files"
non_config_files=("GNB_files")
default="Classic_Core"

if [ -d "$config_files/$1" ] && [ -n "$1" ]; then
    echo "Starting Setup:" $1
    name=$1
else
    echo $1 "Not a valid setup. Options are:"
    for dir in "$config_files"/*/; do
        config=true
        for i in "${non_config_files[@]}"; do
            if [[ "$i" == "$(basename $dir)" ]]; then
                config=false
            fi
        done
        if [ "$config" = true ]; then
            echo "                           "$(basename "$dir")
        fi
    done
    echo "Will use the default" $default
    name=$default
fi

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
