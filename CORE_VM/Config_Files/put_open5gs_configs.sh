dir=${1:-"./"}
cd $dir
cwd=$(pwd)
name=$(basename $cwd)
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



