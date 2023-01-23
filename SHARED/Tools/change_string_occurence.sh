#!/bin/bash

dir=${3:-"./"}
old_string=${1}
new_string=${2}

echo "Are you sure you want to replace all occurences of the String '$old_string' with '$new_string' in the directory $dir? (y/N)"

read choice

if [ "$choice" == "y" ]; then
	echo "Replacing strings."
	grep -rl "$old_string" "$dir" | xargs sed -i "s/$old_string/$new_string/g"

else
	echo "Will not replace strings."
fi

	
