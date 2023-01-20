
cd /home/lily/5G/CORE_VM/Config_Files #change me

#sudo cp *.yaml /etc/open5gs

src_dir="/home/lily/5G/CORE_VM/Config_Files" #change me
dst_dir="/etc/open5gs"

for file in "$src_dir"/*.yaml; do
	if echo $file | grep -Eq '/[^_]*$'; then
		sudo cp "$file" "$dst_dir"
	fi
done
cp smf_2.yaml /home/lily/5G/SHARED/open5gs/install/etc/open5gs/smf.yaml

cp upf_2.yaml /home/lily/5G/SHARED/open5gs/install/etc/open5gs/upf.yaml

../Start_Scripts/change_state_off_all_open5gs_services.sh #restart all services
