cd /home/lily/5G/UE_VM/Start_Scripts
sudo gnome-terminal --title="gnb" -- ./gnb.sh &
#echo $! > gnb.pid
echo "started gnb"
sleep 3
sudo  gnome-terminal --title="ue" -- ./start_all_ue.sh
sleep 10
../Test_Scripts/test_all.sh
