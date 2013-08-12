import shutil,errno,os,stat,platform,sys,getopt

def copyanything(src, dst):
    try:
        shutil.copytree(src, dst)
    except OSError as exc: # python >2.5
        if exc.errno == errno.ENOTDIR:
            shutil.copy(src, dst)
        else: raise

def installingStartup():
    startupFile = 'startupscript'
    udpclientFile = 'tix'
    os_system = platform.system()
    installation_ok = False
    print os_system
    if os_system == "Linux":
        print "Creando Directorios..."
        if not os.path.exists("/etc/TIX"):
            os.makedirs("/etc/TIX")
        print "Instalando cliente TIX..."
        script_st = os.stat('./' + udpclientFile)
        os.chmod('./' + udpclientFile, script_st.st_mode | stat.S_IEXEC)
        copyanything("./" + udpclientFile,"/etc/TIX/" + udpclientFile)
        print "Instalando aplicacion en arranque..."
        st = os.stat('./' + startupFile)
        os.chmod('./' + startupFile, st.st_mode | stat.S_IEXEC)
        copyanything("./" + startupFile,"/etc/init.d/" + startupFile)
        os.system("update-rc.d "+ startupFile + " defaults")
        print "Instalacion Finalizada!"
        installation_ok = True
    if os_system == "Darwin":
        print "Estoy en MAC"
        #opyanything("./udpclientFileTiempos.py","/Applications/udpclientFileTiempos.py")
        os.system("osascript -e 'tell application \"System Events\" to make login item at end with properties {path:\"./TIX.app\", hidden:false}'")
        #os.system("osascript -e 'tell application \"System Events\" to get the name of every login item'")
        installation_ok = True
    if os_system == "Windows":
        os_type = platform.release();
        if os_type == "XP":
            print "Estoy en Windows XP"
        if os_type == "Vista":
            print "Estoy en Windows Vista"

        installation_ok = True

    return installation_ok

def unInstallingStartup():
    os_system = platform.system()
    startupFile = 'startupscript'
    udpclientFile = 'tix'
    print os_system
    if os_system == "Linux":
        print("Estoy en Linux")
        if os.path.exists("/etc/init.d"):
            os.remove('/etc/init.d/' + startupFile)
        if os.path.exists("/etc/TIX/"):
            os.remove('/etc/TIX/')    
        os.system("update-rc.d "+ startupFile + " remove")
    if os_system == "Darwin":
        print "Estoy en MAC"
        os.system("osascript -e 'tell application \"System Events\" to delete login item \"TIX\"' ")
    if os_system == "Windows":
        os_type = platform.release();
        if os_type == "XP":
            print "Desinstalo en Windows XP"
        if os_type == "Vista":
            print "Desinstalo en Windows Vista"


if __name__ == "__main__":
    installingStartup()

