#!/bin/bash
TEMP_FILE=/dev/stdout
#TEMP_FILE=install.log

gksudo echo

echo "### TIX instalation script is running ###"

echo "### installing python... ###"
sudo apt-get install -y python-software-properties 2>&1 >> $TEMP_FILE

echo "### installing kivy... ###"
sudo add-apt-repository ppa:kivy-team/kivy 2>&1 >> $TEMP_FILE
sudo apt-get update 2>&1 >> $TEMP_FILE
sudo apt-get install -y python-kivy 2>&1 >> $TEMP_FILE

echo "### installing pip... ###"
sudo apt-get install -y python-pip 2>&1 >> $TEMP_FILE

echo "### installing pip dependencies.. ###"
pip install -r dependencies.txt 2>&1 >> $TEMP_FILE

#echo "### installing iphython... ###"
#sudo easy_install ipython 2>&1 >> $TEMP_FILE

echo "### installing postgresql...###"
sudo apt-get install -y postgresql 2>&1 >> $TEMP_FILE
sudo apt-get install -y postgresql-server-dev-9.1 2>&1 >> $TEMP_FILE

echo "### intalling psycopg2.... ###"
sudo apt-get install -y python-psycopg2 2>&1 >> $TEMP_FILE

echo "### installing rsa 3.1.2... ###"
sudo  easy_install rsa 2>&1 >> $TEMP_FILE

echo "### installing requests module... ###"
sudo easy_install requests 2>&1 >> $TEMP_FILE

echo "### Launching Installation... ###"
sudo python TiX/PythonApp/ClientApp/TixApp.py 2>&1 >> $TEMP_FILE
