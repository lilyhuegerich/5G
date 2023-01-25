UGreen='\033[0;32m'
UYellow='\033[0;33m'
URed='\033[0;31m'

standard_core_services=("mme" "sgwc" "smf" "amf" "sgwu" "upf" "hss" "pcrf" "nrf" "ausf" "udm" "pcf" "nssf" "bsf" "udr" )
mode=${1:-"Classic_Core"}

if [[ $mode == "Double_upf" ]];then
	if pgrep -U lily open5gs-upf > /dev/null ; then	
		echo -e "$UGreen" "second upf is running."
	else
		echo -e "$URed" "second upf is off."
	fi
elif [[ $mode == "MEC" ]];then
	standard_core_services=($(printf '%s\n' "${standard_core_services[@]}" | grep -v "upf"))
fi


for service in "${standard_core_services[@]}"; do
	if pgrep -U open5gs open5gs-$service > /dev/null ; then	
		echo -e "$UGreen" ""$service" is running."
	else
		echo -e "$URed" ""$service" is off."
	fi
done
 

