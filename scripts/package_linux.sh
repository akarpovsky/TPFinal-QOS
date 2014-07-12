#!/bin/bash
pyinstaller Tix/Tix.linux.spec
cd dist/TixApp
fpm -n tix -s dir -t deb -v 0.1 .=/usr/share/tix TiX.desktop=/usr/share/applications/TiX.desktop
cp *.deb ..
cd ../..
