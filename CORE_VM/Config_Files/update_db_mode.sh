cd /home/lily/5G/CORE_VM/Config_Files
name=${1%/}
if [ "$name" != "$(cat DB_mode.txt)" ]; then
	echo "Changeing DB mode to $name"
	cd $name
	mongorestore Open5gs_"$name" #restore subscribers
	cd ../
	echo ${name} > DB_mode.txt
fi
