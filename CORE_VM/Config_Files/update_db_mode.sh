cd /home/lily/5G/CORE_VM/Config_Files

if [ "$1" != "$(cat DB_Mode.txt)" ]; then
	echo "Changeing DB mode to $1"
	cd $1
	mongorestore Open5gs_"$1" #restore subscribers
	echo "$1" DB_mode.txt
fi
