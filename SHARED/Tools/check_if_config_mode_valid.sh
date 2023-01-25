
vm=${2:-"CORE_VM"}
config_files="/home/lily/5G/$vm/Config_Files"
if [[ $config_files == "UE_VM" ]];then
	non_config_files=("GNB_files")
else
	non_config_files=("Vulnerability_Configs")
fi


default="Classic_Core"


if  [ -z "$1" ]; then
	echo $default
	exit 0
fi
if [ -d "$config_files/$1" ]; then
    echo $1
	exit 0
else
    echo $1
	echo  "Not a valid setup. Options are:"
    for dir in "$config_files"/*/; do
        config=true
        for i in "${non_config_files[@]}"; do
            if [[ "$i" == "$(basename $dir)" ]]; then
                config=false
            fi
        done
        if [ "$config" = true ]; then
            echo "                           "$(basename "$dir")
        fi
    done
fi
exit 1

