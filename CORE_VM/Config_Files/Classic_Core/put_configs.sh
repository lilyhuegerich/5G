cp upf.yaml /home/lily/open5gs/install/etc/open5gs/upf.yaml

src_dir="/home/lily/5G/CORE_VM/Config_Files/Classic_Core" 
dst_dir="/etc/open5gs"

for file in "$src_dir"/*.yaml; do
   if echo $file | grep -Eq '/[^_]*$'; then
       sudo cp "$file" "$dst_dir"
   fi
done



