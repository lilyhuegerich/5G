cd /home/lily/UERANSIM

./build/nr-gnb -c /home/lily/5G/UE_VM/Config_Files/"$1"/GNB_files/gnb_2.yaml 
echo $! > /home/lily/5G/UE_VM/Start_Scripts/pids/gnb_2.pid

