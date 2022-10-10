cd /home/lily/5G/UE_VM/Start_Scripts
#kill ue
sudo kill $(pidof ./build/nr-ue ) 
#kill gnb
sudo kill $(pidof ./build/nr-gnb)
GPID= ps -p $PPID -o ppid= |xargs echo -n
echo $GPID
#end terminals of gnb and ue without ending this one.
toKill=$(pidof -o $GPID gnome-terminal-server)
echo $toKill
#sudo kill $toKill
#sudo kill $(pidof -o $PPID gnome-terminal-server)
