cd /home/lily/UERANSIM  #RENAME ME
sudo ./build/nr-ue -c /home/lily/5G/UE_VM/Config_Files/"$1"/UE_files/ue_edge.yaml 
echo $! > /home/lily/5G/UE_VM/Start_Scripts/pids/ue_edge.pid

