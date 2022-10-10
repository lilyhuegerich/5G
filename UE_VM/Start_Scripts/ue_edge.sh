cd /home/lily/UERANSIM  #RENAME ME
echo $PPID > ue_edge.pid
sudo ./build/nr-ue -c /home/lily/5G/UE_VM/Config_Files/UE_files/ue_edge.yaml

