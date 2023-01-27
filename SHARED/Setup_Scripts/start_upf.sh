cd /home/lily/5G/SHARED/Tools

./gen_veth_by_name.sh upf2 20

./connectivity.sh 2

../PIDs/kill_me.sh upf2.pid

cd /home/lily/open5gs/install/bin

./open5gs-upfd &

echo $! > /home/lily/5G/SHARED/PIDs/upf2.pid
