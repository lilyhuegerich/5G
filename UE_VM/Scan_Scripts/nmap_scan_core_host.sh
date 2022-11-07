host =${1:- 10.45.0.1} # 5g core host address
interface =${2:- uesimtun0}
sudo nmap -v -O -e "$interface" "$host"
