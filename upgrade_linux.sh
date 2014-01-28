#!/bin/bash

while [ 1 ]
do
   cd TiX/PythonApp/ClientApp/InstallerFiles/
   sudo git clone https://github.com/kshmir/tix-client-files.git
   cd ../../../..
   python ./TiX/PythonApp/ClientApp/InstallerFiles/installStartupUDPClient.py
   sleep 24h
done
