sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get install -y gawk gperf grep gettext automake bison flex texinfo help2man libtool libtool-bin git wget make libncurses-dev python python-serial python-dev python-pip
sudo pip install pyserial
mkdir -p ~/esp
cd ~/esp
git clone -b xtensa-1.22.x https://github.com/espressif/crosstool-NG.git
cd crosstool-NG
./bootstrap && ./configure --enable-local && make install
./ct-ng xtensa-esp32-elf
cat .config|sed "s:CT_PARALLEL_JOBS=0:CT_PARALLEL_JOBS=1:g" > .config.tmp
mv .config.tmp .config
./ct-ng build build.1
chmod -R u+w builds/xtensa-esp32-elf