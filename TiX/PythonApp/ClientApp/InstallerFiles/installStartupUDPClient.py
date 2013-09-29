import shutil,errno,os,stat,platform,sys,getopt,subprocess,inspect, ConfigParser
currentdir = os.path.dirname(os.path.abspath(inspect.getfile(inspect.currentframe())))
parentdir = os.path.dirname(currentdir)
sys.path.insert(0,parentdir) 

import keygeneration

# Tomo data del archivo de configuracion
#config = ConfigParser.ConfigParser()
#config.read('installclient.cfg')
#startupFile = config.get("tixclient", "startupFile")
#installDirUnix = config.get("tixclient", "installDirUnix")

startupFile = "startupscript"
installDirUnix = "/etc/TIX"
alternateDirUnix = "./tmpTIX"
udpclientFile = "tix"

def copyanything(src, dst):
    try:
        shutil.copytree(src, dst)
    except OSError as exc: # python >2.5
        if exc.errno == errno.ENOTDIR:
            shutil.copy(src, dst)
        else: raise

def installingStartup():
    os_system = platform.system()
    installation_ok = False
    print os_system
    if os_system == "Linux":
        print "Creando Directorios..."
        if not os.path.exists(installDirUnix):
            os.makedirs(installDirUnix)
        else: # No deberia existir el directorio TiX si es una instalacion nueva; esto ya se valida en TixApp
            return False   
        print "Instalando cliente TIX..."
        print "Creando par de claves publica y privada para la instalacion.."
        keygeneration.generateKeyPair(installDirUnix+'/tix_key.priv',installDirUnix+'/tix_key.pub')

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
        print "Creando Directorios..."
        if not os.path.exists(installDirUnix):
            os.makedirs(installDirUnix)
        else: # No deberia existir el directorio TiX si es una instalacion nueva; esto ya se valida en TixApp
            os.makedirs(alternateDirUnix) 
            installDirUnix = alternateDirUnix
            print "USANDO DIRECTORIO ALTERNATIVO DE TIX"
        print "Creando par de claves publica y privada para la instalacion.."
        publicEncryptionKey = keygeneration.generateKeyPair(installDirUnix+'/tix_key.priv',installDirUnix+'/tix_key.pub')    
        print "Instalando cliente TIX..."
        os.system("osascript -e 'tell application \"System Events\" to make login item at end with properties {path:\"./TIX.app\", hidden:false}'")
        #os.system("osascript -e 'tell application \"System Events\" to get the name of every login item'")
        installation_ok = True
    if os_system == "Windows":
        os_type = platform.release();
        if os_type == "XP":
            print "Estoy en Windows XP"
        if os_type == "Vista":
            print "Estoy en Windows Vista"
            # subprocess.call(['runas', '/user:Administrator', 'C:/my_program.exe'])
        installation_ok = True

    return installation_ok

if __name__ == "__main__":
    print "entre!!!"
    installingStartup()

