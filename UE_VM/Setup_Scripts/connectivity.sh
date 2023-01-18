sudo ip tuntap add name ogstun2 mode tun
sudo ip addr add 10.47.0.1/16 dev ogstun2
sudo ip link set ogstun2 up


sudo sysctl -w net.ipv6.conf.all.forwarding=1
sudo iptables -t nat -A POSTROUTING -s 10.47.0.0/16 ! -o ogstun2 -j MASQUERADE

sudo ufw disable
sudo ufw status
