

cd /home/lily/5G/UE_VM/ #change me!

sudo apt-get install -y libtalloc-dev libmongoc-dev

sudo apt-get install libyaml-de

sudo apt-get install libmicrohttpd-dev

sudo apt-get install libmongoc-dev

sudo apt-get install flex

sudo apt-get install libldap2-dev libidn11-dev

sudo apt-get install bison libcurl4-gnutls-dev libtins-dev meson

sudo apt-get install libidn11-dev libgnutils28-dev libgcrypt-dev libssl-dev libmongoc-dev libbson-dev

sudo apt-get install libnghttp2-dev python3-setuptools build-essential cmake libsctp-dev 

pip3 install meson

pip3 install ninja

git clone https://github.com/open5gs/open5gs

cd open5gs

meson build --prefix=`pwd`/install

ninja -C build

./build/tests/attach/attach

./build/tests/registration/registration

cd build 
meson test -v

ninja install 
cd ../
