#!/usr/bin/python

import shutil,errno,os,stat,platform,sys,getopt,subprocess,inspect, ConfigParser, rsa

# currentdir = os.path.dirname(os.path.abspath(inspect.getfile(inspect.currentframe())))
# parentdir = os.path.dirname(currentdir)
# sys.path.insert(0,parentdir) 

# import keygeneration

# Tomo data del archivo de configuracion
#config = ConfigParser.ConfigParser()
#config.read('installclient.cfg')
#startupAppCaller = config.get("tixclient", "startupAppCaller")
#installDirUnix = config.get("tixclient", "installDirUnix")

startupAppCaller = "startupAppCaller.sh" #This app will call on startup to the UDP Client app
installDirUnix = "/etc/TIX"
installDirUnixApp = installDirUnix + '/app'
udpClientFile = "TixClientApp"
udpClientFileCFG = "udpclienttiempos.cfg"
installDirUnixAppExecutable = installDirUnixApp + '/' + udpClientFile

def generateKeyPair(privateKeyFile, publicKeyFile):
    (pubkey, privkey) = rsa.newkeys(512)
    exportableKeys = []
    privHandle = open(privateKeyFile, 'wb')
    exportableKeys.append(privkey.save_pkcs1(format='PEM'))
    privHandle.write(privkey.save_pkcs1(format='PEM'))
    privHandle.close()

    pubHandle = open(publicKeyFile, 'wb')
    pubHandle.write(pubkey.save_pkcs1(format='PEM'))
    exportableKeys.append(pubkey.save_pkcs1(format='PEM'))
    pubHandle.close()

    return exportableKeys[1]

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
            os.makedirs(installDirUnixApp)
        else: # No deberia existir el directorio TiX si es una instalacion nueva; esto ya se valida en TixApp
            return False   
        print "Instalando cliente TIX..."
        print "Creando par de claves publica y privada para la instalacion.."
        generateKeyPair(installDirUnix+'/tix_key.priv',installDirUnix+'/tix_key.pub')

        print "Copiando el ejecutable..."
        os.system("pwd")
        script_st = os.stat('./InstallerFiles/toBeCopied/' + udpClientFile)
        os.chmod('./InstallerFiles/toBeCopied/' + udpClientFile, script_st.st_mode | stat.S_IEXEC)
        copyanything("./InstallerFiles/toBeCopied/" + udpClientFile,installDirUnixApp + '/' + udpClientFile)
        print "Instalando aplicacion en arranque..."
        st = os.stat('./InstallerFiles/toBeCopied/' + startupAppCaller)
        os.chmod('./InstallerFiles/toBeCopied/' + startupAppCaller, st.st_mode | stat.S_IEXEC)
        copyanything("./InstallerFiles/toBeCopied/" + startupAppCaller,"/etc/init.d/" + startupAppCaller)
        copyanything("./InstallerFiles/toBeCopied/" + udpClientFileCFG,installDirUnixApp + '/' + udpClientFileCFG)
        os.system("update-rc.d " + startupAppCaller + " defaults")
        os.spawnl(os.P_NOWAIT, "sudo /etc/TIX/app/TixClientApp log")
        installation_ok = True
        print "Instalacion Finalizada!"
    if os_system == "Darwin":
        print "Estoy en MAC"
        #opyanything("./udpClientFileTiempos.py","/Applications/udpClientFileTiempos.py")
        print "Creando Directorios..."
        if not os.path.exists("/etc/TIX"):
            os.makedirs("/etc/TIX")
            os.makedirs(installDirUnixApp)
        else: # No deberia existir el directorio TiX si es una instalacion nueva; esto ya se valida en TixApp
            return False
        print "Creando par de claves publica y privada para la instalacion.."
        generateKeyPair(installDirUnix+'/tix_key.priv',installDirUnix+'/tix_key.pub')    
        
        print "Copiando el ejecutable..."
        script_st = os.stat('./InstallerFiles/toBeCopied/' + udpClientFile)
        os.chmod('./InstallerFiles/toBeCopied/' + udpClientFile, script_st.st_mode | stat.S_IEXEC)
        copyanything("./InstallerFiles/toBeCopied/" + udpClientFile,installDirUnixApp + '/' + udpClientFile)
        copyanything("./InstallerFiles/toBeCopied/" + udpClientFileCFG,installDirUnixApp + '/' + udpClientFileCFG)
        st = os.stat('./InstallerFiles/toBeCopied/' + startupAppCaller)
        os.chmod('./InstallerFiles/toBeCopied/' + startupAppCaller, st.st_mode | stat.S_IEXEC)
        copyanything("./InstallerFiles/toBeCopied/" + startupAppCaller,installDirUnixApp + '/' + startupAppCaller)
        print "Instalando cliente TIX en el arranque..."
        os.system("osascript -e 'tell application \"System Events\" to make login item at end with properties {path:\""+installDirUnixApp + '/' + startupAppCaller +"\", hidden:false}'")
        os.spawnl(os.P_NOWAIT, "/etc/init.d/" + startupAppCaller)
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
    installingStartup()

