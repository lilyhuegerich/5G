UGreen='\033[0;32m'
UYellow='\033[0;33m'
URed='\033[0;31m'


standard_core_services=("mme" "sgwc" "smf" "amf" "sgwu" "upf" "hss" "pcrf" "nrf" "ausf" "udm" "pcf" "nssf" "bsf" "udr" )

for service in "${standard_core_services[@]}"; do
	if pgrep -U open5gs open5gs-$service > /dev/null ; then	
		echo -e "$UGreen" ""$service" is running."
	else
		echo -e "$URed" ""$service" is off."
	fi
done
 

