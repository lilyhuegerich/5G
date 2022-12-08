purple='\033[0;35m'
color_off='\033[0m'

interface=${1:- uesimtun0}
ip=$(ifconfig ${interface} | grep 'inet ' | cut -d: -f2 | awk '{print $2}')

echo -e "${purple} Switching default output to $interface / $ip ."

sudo ip route flush 0/0

sudo ip route delete 10.0.2.0/24 dev enp0s3 proto kernel scope link src 10.0.2.15 metric 100

sudo ip route add default via ${ip}

