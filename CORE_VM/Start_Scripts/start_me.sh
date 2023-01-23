#!/bin/bash
config_files="/home/lily/5G/CORE_VM/Config_Files"
non_config_files=("Vulnerability_Configs")
default="Classic_Core"

if [ -d "$config_files/$1" ] && [ -n "$1" ]; then
    echo "Starting Setup:" $1
    name=$1
else
    echo $1 "Not a valid setup. Options are:"
    for dir in "$config_files"/*/; do
        config=false
        for i in "${non_config_files[@]}"; do
            if [[ "$i" == "$string_to_check" ]]; then
                config=true
            fi
        done
        if [ "$config" = false ]; then
            echo "              "$(basename "$dir")
        fi
    done
    echo "Will use the default" $default
    name=$default
fi

cd "$config_files"
cd $name 

#mongorestore Open5gs_"$name" #restore subscribers

cd /home/lily/5G/CORE_VM/Start_Scripts
./gen_NF_veths.sh

cd "$config_files"
./put_open5gs_configs.sh $name

sudo sysctl -w net.ipv4.ip_forward=1
sudo iptables -t nat -A POSTROUTING -o enp0s3 -j MASQUERADE

cd /home/lily/open5gs/webui #RENAME ME
npm run dev &
cd /home/lily/5G/CORE_VM/Start_Scripts #RENAME ME
sudo gnome-terminal --title="logs" -- ./start_logs.sh
sleep 8
firefox -new-tab "http://localhost:3000"




