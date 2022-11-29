purple='\033[0;35m'
color_off='\033[0m'

interface=${1:- uesimtun0}
ip=$(ifconfig ${interface} | grep 'inet ' | cut -d: -f2 | awk '{print $2}')

echo -e "${purple} Switching default output to $interface / $ip ."

sudo ip route flush 0/0

sudo ip route add default via ${ip}

