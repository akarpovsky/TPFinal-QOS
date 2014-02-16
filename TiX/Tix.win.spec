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
          Tree(base_path),
          a.scripts,
          a.binaries,
          a.zipfiles,
          a.datas,
          name='Tix.exe',
          strip=None,
          debug=True,
          upx=True,
          console=True)
