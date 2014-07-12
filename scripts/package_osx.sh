#!/bin/bash

set -e

rm -rf dist/* build/*
sed -i '' 's/IOError/Exception/' /Applications/Kivy.app/Contents/Resources/lib/sitepackages/pygame/macosx.py
kivy `which pyinstaller` TiX/Tix.unix.spec
mv dist/TixApp dist/TixApp.app
hdiutil create Tix.dmg -srcfolder dist/TixApp.app -ov
