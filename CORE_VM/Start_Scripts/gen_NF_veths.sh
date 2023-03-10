cd /home/lily/5G/SHARED/Tools

interfaces=("amf" "ausf" "bsf" "hss" "mme" "nrf" "nssf" "pcf" "pcrf" "sgwc" "sgwu" "smf" "udm" "udr" "upf")

for interface in "${interfaces[@]}"
do
	./gen_veth_by_name.sh "$interface"
done

./gen_veth_by_name.sh smf2 22 #for the second smf in slice scenario this should probably only be called if slice is used, todo
