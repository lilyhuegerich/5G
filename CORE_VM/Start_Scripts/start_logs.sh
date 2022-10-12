
gnome-terminal --tab --title="AMF logs" -- tail -f /var/log/open5gs/amf.log
gnome-terminal --tab --title="UPF logs" -- tail -f /var/log/open5gs/upf.log
gnome-terminal --tab --title="wireshark" -- sudo wireshark

