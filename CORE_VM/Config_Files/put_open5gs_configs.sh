dir=${1:-"./"}
cd $dir
cwd=$(pwd)
mode=$(basename $cwd)
name=$(/home/lily/5G/SHARED/Tools/check_if_config_mode_valid.sh $mode CORE_VM)

status=$?
[ $status -eq 0 ] && echo "Mode: " $name || exit 1

#./update_db_mode.sh $name
../../Start_Scripts/change_state_off_all_open5gs_services.sh stop #stop all services so that there are not any left over from previous runs
echo "Setting Configs for " $name

if [ -f put_configs.sh ]; then
	./put_configs.sh #check if folder has its own put configs script 
else
	sudo cp *.yaml /etc/open5gs
fi

if [ -f change_state_off_all_open5gs_services.sh ]; then
	./change_state_off_all_open5gs_services.sh
else
	cd /home/lily/5G/CORE_VM/Config_Files #change me
	../Start_Scripts/change_state_off_all_open5gs_services.sh #restart all services
fi
sleep 2
cd /home/lily/5G/CORE_VM/Config_Files #change me
../Start_Scripts/health_check.sh $name

#src_dir="/home/lily/5G/CORE_VM/Config_Files" #change me
#dst_dir="/etc/open5gs"

#for file in "$src_dir"/*.yaml; do
#	if echo $file | grep -Eq '/[^_]*$'; then
#		sudo cp "$file" "$dst_dir"
#	fi
#done
#cp smf_2.yaml /home/lily/5G/SHARED/open5gs/install/etc/open5gs/smf.yaml

#cp upf_2.yaml /home/lily/5G/SHARED/open5gs/install/etc/open5gs/upf.yaml

