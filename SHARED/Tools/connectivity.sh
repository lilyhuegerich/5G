
val=${1:-""}
tmp_name="ogstun"
name="$tmp_name$val"

if [ -z $val ]; then
	tmp_addr=45
elif [[ $val =~ ^-?[0-9]+$ ]]; then
	let tmp_addr=45+$val
else
	echo $val "not a valid input, needs to be either empty or an int."
	exit 1
fi
addr="10.$tmp_addr.0.1/16"

echo "Will configure device " $name " with ip addresses " $addr "."

sudo ip tuntap add name "$name" mode tun
sudo ip addr add "$addr" dev "$name"
sudo ip link set "$name" up

sudo sysctl -w net.ipv4.ip_forward=1
sudo sysctl -w net.ipv6.conf.all.forwarding=1
sudo iptables -t nat -A POSTROUTING -s "$addr" ! -o "$name" -j MASQUERADE

sudo ufw disable
sudo ufw status
