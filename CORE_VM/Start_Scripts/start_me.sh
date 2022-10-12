sudo sysctl -w net.ipv4.ip_forward=1
sudo iptables -t nat -A POSTROUTING -o enp0s3 -j MASQUERADE

cd /home/lily/open5gs/webui #RENAME ME
npm run dev &
cd /home/lily/5G/CORE_VM/Start_Scripts #RENAME ME
sudo gnome-terminal --title="logs" -- ./start_logs.sh
sleep 8
firefox -new-tab "http://localhost:3000"




