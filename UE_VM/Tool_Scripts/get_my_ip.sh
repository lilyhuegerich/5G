interface=${1:- enp0s3}
ip=$(ifconfig ${interface} | grep 'inet ' | cut -d: -f2 | awk '{print $2}')
echo $ip
