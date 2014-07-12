./prepare_linux.sh 
sudo apt-get install python-pip
sudo apt-get install python-dev
sudo apt-get install build-essential
sudo apt-get install libpython-dev
sudo pip install -r dependencies.txt 
sudo pip install pyinstaller
sudo apt-get install rubygems
sudo gem install fpm
./package_linux.sh 
sudo dpkg -i tix_0.1_i386.deb 
