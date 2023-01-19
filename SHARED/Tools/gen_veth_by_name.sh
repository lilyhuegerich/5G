
if [ $# -eq 0 ]
then 
	echo "No name supplied, need to add veth name."
	exit 1
fi


name=$1

net_name="net$name"

veth_name="veth_$name"

veth_peer="veth_$net_name"

#echo $net_name $veth_name $veth_peer

veths=( $(ifconfig | grep veth -A1))

start=${2:-2}

for veth in "${veths[@]}": 
do
	if [[ $veth == *"$veth_name"* ]]; then
		echo "Veth with name" $name "already exists."
		exit 1

	elif [[ $veth == *"10.0"* ]]; then
		tmp=( $(echo $veth | cut -d"." -f3))
		if [ "$tmp" -gt "$start" ]; then
			start=$tmp
		fi
	fi
done

let start++

ip_addr="10.0.$start.1/24"

ip_short="10.0.$start.1"

peer_ip_addr="10.0.$start.2/24"

peer_ip_short="10.0.$start.2"

sudo ip netns add "$net_name"

sudo ip link add "$veth_name" type veth peer name "$veth_peer"

sudo ip link set "$veth_peer" netns "$net_name"

sudo ip addr add "$ip_addr" dev "$veth_name"

sudo ip netns exec "$net_name" ip addr add "$peer_ip_addr" dev "$veth_peer"

sudo ip link set "$veth_name" up

sudo ip netns exec "$net_name" ip link set "$veth_peer" up

sudo iptables -A FORWARD -o enp0s3 -i "$veth_name" -j ACCEPT

sudo iptables -A FORWARD -i enp0s3 -o "$veth_name" -j ACCEPT

sudo iptables -t nat -A POSTROUTING -s "$peer_ip_addr" -o enp0s3 -j MASQUERADE

sudo ip netns exec "$net_name" ip route add default via "$ip_short"

echo Added veth $veth_name in namespace $net_name with peer veth $veth_peer and ip $ip_addr
