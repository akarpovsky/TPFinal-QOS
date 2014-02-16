#!/bin/bash
#TEMP_FILE=/dev/stdout
TEMP_FILE=install.log

gksudo echo

echo "### TIX instalation script is running ###"

echo "### installing python... ###"
sudo apt-get install -y python-software-properties >> $TEMP_FILE 2>&1

echo "### installing kivy... ###"
echo "press [ENTER]"
sudo add-apt-repository ppa:kivy-team/kivy >> $TEMP_FILE 2>&1

sudo apt-get update >> $TEMP_FILE 2>&1
sudo apt-get install -y python-kivy kivy-tools >> $TEMP_FILE 2>&1

echo "### installing pip... ###"
sudo apt-get install -y python-pip >> $TEMP_FILE 2>&1

echo "### installing pip dependencies.. ###"
pip install -r dependencies.txt >> $TEMP_FILE 2>&1

echo "### installing rsa 3.1.2... ###"
sudo  easy_install rsa >> $TEMP_FILE 2>&1

echo "### installing requests module... ###"
sudo easy_install requests >> $TEMP_FILE 2>&1

echo "### installing git... ###"
sudo apt-get install -y git-core 2>&1

echo "### registering update script ###"
sudo cp update_linux.sh /etc/init.d/update_linux.sh 2>&1
sudo chmod +x update_linux.sh
sudo chmod +x /etc/init.d/update_linux.sh  2>&1

echo "### Launching Installation... ###"
cd TiX/PythonApp/ClientApp/
sudo python TixApp.py >> $TEMP_FILE 2>&1
cd ../../..
