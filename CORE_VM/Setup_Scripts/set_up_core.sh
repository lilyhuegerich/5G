cd /home/user/5G/CORE_VM/Setup_Scripts

./python_packages.sh #install python packages
./tools.sh 	#install tools



# install mongo db

sudo apt update
sudo apt install wget gnupg
wget -qO - https://www.mongodb.org/static/pgp/server-6.0.asc | sudo apt-key add -

echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/6.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-6.0.list

sudo apt update
sudo apt install -y mongodb-org
sudo systemctl start mongod 
sudo systemctl enable mongod 



#./../Config_Files/put_open5gs_configs.sh # place config files

