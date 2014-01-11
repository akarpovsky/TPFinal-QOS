### Readme for setting up a Linux Environment

Comandos a correr para instalar el entorno en Ubuntu

     sudo apt-get install -y python-software-properties
     sudo add-apt-repository ppa:kivy-team/kivy
     sudo apt-get update
     sudo apt-get install -y python-kivy
     sudo apt-get install python-pip
<<<<<<< HEAD
     # sudo apt-get install virtualenv
     pip intall -r dependencies.txt
     # tratar de instalar por con pip, si una dependencia falla , sacarla y trantar con aptitude
=======
     sudo apt-get install virtualenv


Estamos probando con:

easy_install (apt-get install python-setup-tools)  SUELE USAR PAQUETES
pip          (apt-get install python-pip)          COMPILA
apt-get                                            BAJAR BINARIOS
             Suele ser necesario usar add-apt-repository
>>>>>>> 29642a7f6bd363723cd9a6bad1a239dc88c4da3f
