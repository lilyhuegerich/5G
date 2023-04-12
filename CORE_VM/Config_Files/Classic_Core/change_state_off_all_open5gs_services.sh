change=${1:-RESTART}

declare -l change #make lower case just in case
change=$change

if [ "$change" == "start" ] || [ "$change" == "stop" ] ;
then
	echo Will $change all open5gs functions.
else
	echo Will use default action: restart.
	change=restart
fi


#Apparently the order of starting the NFs matters.
standard_core_services=("mme" "sgwc" "smf" "amf" "sgwu")

for service in "${standard_core_services[@]}"
do
	sudo systemctl "$change" open5gs-"$service"d
done

if [ "$change" == "restart" ] || [ "$change" == "stop" ] ;
then
	
	/home/lily/5G/SHARED/PIDs/kill_me.sh /home/lily/5G/SHARED/PIDs/upf2.pid
fi


if [ "$change" == "restart" ] || [ "$change" == "start" ] ;
then
	/home/lily/5G/SHARED/Setup_Scripts/start_upf.sh
fi

#sleep 1
#Finally the rest.
standard_core_services=("hss" "pcrf" "nrf" "scp" "ausf" "udm" "pcf" "nssf" "bsf" "udr")

for service in "${standard_core_services[@]}"
do
	sudo systemctl "$change" open5gs-"$service"d
done 
