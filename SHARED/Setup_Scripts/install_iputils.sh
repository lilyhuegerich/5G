
sudo apt-get install libcap-dev
sudo apt-get install xsltproc
git clone https://github.com/iputils/iputils.git
./configure && meson build
cd builddir && meson install
