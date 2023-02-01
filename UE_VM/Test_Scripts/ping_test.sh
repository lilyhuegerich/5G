ues=() 
timer=5
attempts=5
while getopts "u:d:t:a:" opt; do
        case $opt in
                u)
                        OPTIND=$((2))
                        #echo "1:" $OPTIND "${!OPTIND}"
                        while [[ $OPTIND -le $# ]] && [[ "${!OPTIND}" != -* ]]; do
                                ues+=("${!OPTIND}")
                                OPTIND=$((OPTIND +1))                           
                        done
                        ;;
                d)
                        ip_address="$OPTARG"
                        ;;
		t)
			timer="$OPTARG"
			echo "Timer not yet implemented"
			;;
		a)
			attempts="$OPTARG"
			;;
                \?)
                        echo "Invalid option: -$OPTARG" >&2
                        exit 1
                        ;;
        esac
done

echo "UEs: ${ues[@]}, will ping Destination: $ip_address"


UGreen='\033[0;32m'
UYellow='\033[0;33m'
URed='\033[0;31m'

for var in "${ues[@]}"
do
	
	echo -e "$URed"
	packet_loss=100
	packet_loss=$( ping -c "$attempts" -I "$var" "$ip_address" | grep -oP '\d+(?=% packet loss)' )
	#packet_loss=  $packet_loss | awk NF
	if [ -z "$packet_loss" ];then
		echo -e "$URed" "			   	 		ERROR!"
	else
		if [ $packet_loss -eq 0 ];
		then
			Color=$UGreen
			echo -e "$UGreen" ""$var" has "$packet_loss" percent packet loss."
		elif (( packet_loss < 50  ));
		then 
			echo -e "$UYellow" ""WARNING: $var" has "$packet_loss" percent packet loss."
		else (( packet_loss >  49 ));
			echo -e "$URed" ""ERROR: $var" has "$packet_loss" percent packet loss."
		fi
	fi
done
