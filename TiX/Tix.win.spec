# -*- mode: python -*-
import os

from kivy.tools.packaging.pyinstaller_hooks import install_hooks
install_hooks(globals())
pwd = os.getcwd()

base_path = '%s/Tix/PythonApp/ClientApp/' % pwd

a = Analysis(['%s/TixApp.py' % base_path],
             pathex=[base_path],
             )
pyz = PYZ(a.pure)
exe = EXE(pyz,
          a.scripts,
          exclude_binaries=True,
          name='Tix.exe',
          strip=None,
          debug=True,
          upx=True,
          console=True)
coll = COLLECT(exe, 
               Tree(base_path),
               a.binaries,
               a.zipfiles,
               a.datas,
               debug=True,
               strip=None,
               upx=True,
               name='Tix.exe')
