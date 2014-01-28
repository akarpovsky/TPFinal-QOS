#!/bin/bash

while [ 1 ]
do
   cd TiX/PythonApp/ClientApp/InstallerFiles/
   sudo git clone https://github.com/kshmir/tix-client-files.git
   cd ../../../..

   sudo python /etc/TIX/app/TixClientApp log
   sleep 24h
done
