#!/bin/bash

cd /home/lily/open5gs/install/bin

./open5gs-smfd &

echo $! > /home/lily/5G/SHARED/PIDs/smf.pid
