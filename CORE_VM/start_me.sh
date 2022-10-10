cd /home/lily/open5gs/webui
npm run dev &
sudo gnome-terminal --title="AMF logs" -- tail -f /var/log/open5gs/amf.log
sleep 8
firefox -new-tab "http://localhost:3000"




