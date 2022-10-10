cd /home/lily/UERANSIM  #RENAME ME
echo $PPID > ue_iot.pid
sudo ./build/nr-ue -c /home/lily/5G/UE_VM/Config_Files/UE_files/ue_iot.yaml

