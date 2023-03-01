#!/bin/bash

is_ip() {
	if [[ $1 =~ ^[0-9]+\.[0-9]+.\[0-9]+\.[0-9]+$ ]];then
		return 0
	else
		return 1
	fi
}

if is_ip "$1"; then
	echo "$1"
	exit 0
else
	interface="$1"
	ip=$(ifconfig "$interface" | grep -oP '(?<=inet\s)\d+\.\d+\.\d+\.\d+' | head -1)
	if [[ -z $ip ]]; then
		echo "Could not find ip for " $1
		exit 1
	else
		echo "$ip"
		exit 0
	fi
fi


