#!/bin/bash

cd /home/lily/5G/SHARED/Tools

./gen_veth_by_name.sh smf2 21

cd /home/lily/5G/SHARED/open5gs/install/bin

./open5gs-smfd &

echo $! > /home/lily/5G/SHARED/PIDs/smf2.pid
