cp upf_2.yaml /home/lily/open5gs/install/etc/open5gs/upf.yaml

cp smf_.yaml /home/lily/open5gs/install/etc/open5gs/smf.yaml
sudo cp smf_2.yaml /etc/open5gs/smf.yaml

src_dir="/home/lily/5G/CORE_VM/Config_Files/Double_upf" 
dst_dir="/etc/open5gs"

for file in "$src_dir"/*.yaml; do
   if echo $file | grep -Eq '/[^_]*$'; then
       sudo cp "$file" "$dst_dir"
   fi
done



