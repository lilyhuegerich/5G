UGreen='\033[0;32m'
UYellow='\033[0;33m'
URed='\033[0;31m'

for var in "$@"
do
	packet_loss=100
	packet_loss=$( ping -c 1 -I "$var" 8.8.8.8 | grep -oP '\d+(?=% packet loss)' )
	#packet_loss=  $packet_loss | awk NF
	#echo $packet_loss
	if (( packet_loss == 0 ));
	then
		Color=$UGreen
		echo -e "$UGreen" ""$var" has "$packet_loss" percent packet loss."
	elif (( packet_loss < 50  ));
	then 
		echo -e "$UYellow" ""WARNING: $var" has "$packet_loss" percent packet loss."
	else (( packet_loss >  49 ));
		echo -e "$URed" ""ERROR: $var" has "$packet_loss" percent packet loss."
	fi
done
