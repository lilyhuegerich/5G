#ssh server
sudo apt install openssh-server #install ssh server
sudo cp ../../Config_Files/sshd_config /etc/ssh/sshd_config #set configs to allow password and root login
sudo /etc/init.d/ssh start #start ssh server

echo "this users name and password will be admin, so as not to forget ;)"
sudo adduser admin

