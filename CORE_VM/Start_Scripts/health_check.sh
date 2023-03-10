UGreen='\033[0;32m'
UYellow='\033[0;33m'
URed='\033[0;31m'

standard_core_services=("mme" "sgwc" "smf" "amf" "sgwu" "upf" "hss" "pcrf" "nrf" "ausf" "udm" "pcf" "nssf" "bsf" "udr" )
mode=${1:-"Classic_Core"}

if [[ $mode == "Double_upf" ]];then #in double upf there is one upf called manual and the smf is also called manually
	if pgrep -U lily open5gs-upf > /dev/null ; then	
		echo -e "$UGreen" "second upf is running."
	else
		echo -e "$URed" "second upf is off."
	fi

	if pgrep -U lily open5gs-smf > /dev/null ; then	
		echo -e "$UGreen" "smf is running."
	else
		echo -e "$URed" "smf is off."
	fi
	standard_core_services=($(printf '%s\n' "${standard_core_services[@]}" | grep -v "smf")) # since we only have one smf and its called manual we need to remove it from the core services list.


elif [[ $mode == "Slice" ]];then #in slice there are two smf and two upf
	if pgrep -U lily open5gs-upf > /dev/null ; then	
		echo -e "$UGreen" "second upf is running."
	else
		echo -e "$URed" "second upf is off."
	fi

	if pgrep -U lily open5gs-smf > /dev/null ; then	
		echo -e "$UGreen" "second smf is running."
	else
		echo -e "$URed" "second smf is off."
	fi

elif [[ $mode == "MEC" ]];then
	standard_core_services=($(printf '%s\n' "${standard_core_services[@]}" | grep -v "upf")) #in MEC the UPF is running at the base station so should not be checked here.
fi


for service in "${standard_core_services[@]}"; do
	if pgrep -U open5gs open5gs-$service > /dev/null ; then	
		echo -e "$UGreen" ""$service" is running."
	else
		echo -e "$URed" ""$service" is off."
	fi
done
 

