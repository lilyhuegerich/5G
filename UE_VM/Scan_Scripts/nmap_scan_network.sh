network_address=${1:- 10.45.0.0/24}
interface=${2:- uesimtun1}

sudo nmap -n -PE -T4 -e $interface -sI 10.45.0.1 $network_address
