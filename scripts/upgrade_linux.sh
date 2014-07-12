#!/bin/bash

while [ 1 ]
do
   cd TiX/PythonApp/ClientApp/InstallerFiles/
   sudo git clone https://github.com/kshmir/tix-client-files.git
   cd ../../../..

   sudo python /etc/TIX/app/TixClientApp log
   sleep 24h

  # este proceso cuandos e instala se debe registrar para cuando se reinicie la maquina y se debe ejecutar
  # se debe fijar si está registrado y si no lo está registrarse
  # estar seguro que la misma estructura de directorios está en el repo git
  # hacer un git clone
  # hacer un while con con sleep (que pida cada 24 horas)
  # si no hay nada nuevo, no hacer nada
  # si hay algo nuevo... (se reemplazan los archivos)
  # registrar el mismo proceso para cuando se prenda la máquina
  # encontrar el proceso que está corriendo que tira las estadísticas
  # matarlo
  # y correr el nuevo proceso nuevamente
  # una vez que esto ante en mac tendría que andar de la misma forma probar esto en mac ta

done
