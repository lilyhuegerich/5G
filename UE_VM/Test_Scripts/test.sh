ues=()

while getopts "u:d:" opt; do
	case $opt in
		u)
			OPTIND=$((2))
			#echo "1:" $OPTIND "${!OPTIND}"
			while [[ $OPTIND -le $# ]] && [[ "${!OPTIND}" != -* ]]; do
				ues+=("${!OPTIND}")
				OPTIND=$((OPTIND +1))				
			done
			;;
		d)
			ip_address="$OPTARG"
			;;
		\?)
			echo "Invalid option: -$OPTARG" >&2
			exit 1
			;;
	esac
done

echo "UEs: ${ues[@]}"
echo "Destination: $ip_address"
