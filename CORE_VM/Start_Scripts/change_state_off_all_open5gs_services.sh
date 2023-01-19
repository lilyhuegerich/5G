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

standard_core_services=("mme" "sgwc" "amf" "sgwu" "upf" "hss" "pcrf" "nrf" "smf" "ausf" "udm" "pcf" "nssf" "bsf" "udr")

for service in "${standard_core_services[@]}"
do
	sudo systemctl "$change" open5gs-"$service"d
done



