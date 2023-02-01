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

/home/lily/5G/SHARED/PIDs/kill_me.sh /home/lily/5G/SHARED/PIDs/upf2.pid #make sure these is no rogue upf still going
/home/lily/5G/SHARED/PIDs/kill_me.sh /home/lily/5G/SHARED/PIDs/smf.pid #make sure these is no rogue smf still going

standard_core_services=("mme" "sgwc" "smf" "amf" "sgwu" "upf" "hss" "pcrf" "nrf" "scp" "ausf" "udm" "pcf" "nssf" "bsf" "udr")
for service in "${standard_core_services[@]}"
do
	sudo systemctl "$change" open5gs-"$service"d
done


