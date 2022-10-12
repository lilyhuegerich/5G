
UGreen='\033[0;32m'
UYellow='\033[0;33m'
URed='\033[0;31m'

for var in "$@"
do
	packet_loss=$( ping -c 1 -I "$var" -- 8.8.8.8 | grep -oP '\d+(?=% packet loss)' )
	#packet_loss=  $packet_loss | awk NF
	#echo $packet_loss
	if [ $packet_loss -eq 0 ]
	then
		Color=$Ugreen
	fi
	if [ [ $packet_loss -lt 50 ] && [ $packet_loss -gt 0 ] ]
	then 
		color=$UYellow
	fi
	if [ $packet_loss -gt 49 ]
	then
		color=$URed
	fi
	echo -e "${color}"$var" has "$packet_loss" percent packet loss."
done
