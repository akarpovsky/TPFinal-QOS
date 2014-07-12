#!/bin/bash
#TEMP_FILE=/dev/stdout
TEMP_FILE=install.log

gksudo echo

echo "### TIX package environment is installing itself ###"

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

