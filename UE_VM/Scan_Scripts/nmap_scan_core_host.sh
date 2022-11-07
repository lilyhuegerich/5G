purple='\033[0;35m'
color_off='\033[0m'

host=${1:- 10.45.0.1} # 5g core host address
interface=${2:- uesimtun0}

echo -e "${purple} Scanning host,  $host on interface $interface . "
echo -e "${color_off}"
#sudo nmap -v -O -e $interface $host #try to check host os.
#nnamp -v -e $interface $host # check host ports
#nmap -v -Pn -e $interfave $host #if the hosts is bloking the pings try parralel dns

#sudo nmap -p0- -A -T3 -e $interface $host # getting more aggresive
sudo nmap -p ssh -e $interface $host #check ssh

