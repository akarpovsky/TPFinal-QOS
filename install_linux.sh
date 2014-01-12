#!/bin/bash

echo "### TIX instalation script is running ###"

echo "### installing python... ###"
sudo apt-get install -y python-software-properties

echo "### installing kivy... ###"
sudo add-apt-repository ppa:kivy-team/kivy
sudo apt-get update
sudo apt-get install -y python-kivy

echo "### installing pip... ###"
sudo apt-get install python-pip

echo "### installing pip dependencies.. ###"
pip install -r dependencies.txt

echo "### installing iphython... ###"
sudo easy_install ipython

echo "### intalling psycopg2.... ###"
sudo apt-get install python-psycopg2

echo "### installing rsa 3.1.2... ###"
sudo  easy_install rsa

echo "### installing requests module... ###"
sudo easy_install requests
