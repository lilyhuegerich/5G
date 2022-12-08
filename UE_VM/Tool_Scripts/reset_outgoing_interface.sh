sudo ip route flush 0/0

sudo ip route add 10.0.2.0/24 dev enp0s3 proto kernel scope link src 10.0.2.15 metric 100

sudo ip route add default via 10.0.2.1
