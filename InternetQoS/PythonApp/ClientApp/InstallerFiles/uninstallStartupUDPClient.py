import shutil,errno,os,stat,platform,sys,getopt,subprocess


def unInstallingStartup():
    os_system = platform.system()
    startupFile = 'startupscript'
    udpclientFile = 'tix'
    print os_system
    if os_system == "Linux":
        print("Estoy en Linux")
        if os.path.exists("/etc/init.d"):
            if os.path.isfile("/etc/init.d/" + startupFile):
                os.remove('/etc/init.d/' + startupFile)
        if os.path.exists("/etc/TIX/"):
            shutil.rmtree('/etc/TIX/')
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
    unInstallingStartup()