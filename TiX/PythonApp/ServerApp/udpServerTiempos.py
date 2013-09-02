#!/usr/bin/python

# servidor udp 
# ejemplo de la documentacion de python 
# http://docs.python.org/2/library/socketserver.html
# modificado para permitir el registro del timestamp en la respuesta	

import SocketServer
import datetime
import threading
from Crypto.PublicKey import RSA
import ConfigParser
import dbmanager
import platform, os


config = ConfigParser.ConfigParser()
config.read('tixserver.cfg')
SERVER_HOST = config.get("TiXServer", "SERVER_HOST") #TODO: Change TEST!
SERVER_PORT = config.getint("TiXServer", "SERVER_PORT")

def ts():
  # time en microsegundos
  timestamp= datetime.datetime.now().strftime("%H:%M:%S:%f").split(':')
  en_microsegundos=float(timestamp[0])*3600*(10**6)+float(timestamp[1])*60*(10**6)+float(timestamp[2])*(10**6)+float(timestamp[3])
  #print timestamp 
  #print en_microsegundos
  return str(int(en_microsegundos)) # <- en microsegundos, en hexa
  

class ThreadingUDPRequestHandler(SocketServer.BaseRequestHandler):
    """
    This class works similar to the TCP handler class, except that
    self.request consists of a pair of data and client socket, and since
    there is no connection the client address must be given explicitly
    when sending data back via sendto().
    """

    def handle(self):
        tstamp=ts() 
        data = self.request[0].strip()
        socket = self.request[1]
	       
        msg = data.split('|')
        #este_thread=threading.current_thread() 
        #threads_activos=threading.activeCount() #threading.enumerate()
        
        #print "{} wrote:".format(self.client_address[0])
#	print msg[0]+'|'+msg[1]+'|'+msg[2]+'1'+msg[3]        

        if len(msg)>4:# depende de si es un mensaje corto o un mensaje largo
        #Mensaje largo
          large_package_msg = msg[4].split(';;')
          if len(large_package_msg)>=3 and large_package_msg[0]=='DATA':
            # Tengo datos para procesar dentro del mensaje largo
            #Cliente envia al server: DATA|publicKeyPlain|signedMeessage|msg

            client_pub_key_str = large_package_msg[1]
            client_signed_msg = large_package_msg[2]
            client_plain_msg = large_package_msg[3]

            client_pub_key = RSA.importKey(client_pub_key_str) # import pub key from string
            if client_pub_key.verify(client_plain_msg, client_signed_msg): # En el servidor se hace el VERIFY, para esto se necesita tambien la firma!
              client_data = DBManager.getInstallationAndClientId(client_pub_key_str)
              
              if client_data is not None:
                installation_id = client_data[0]
                client_id = client_data[1]
                client_server_folder = "cli_" + client_id + "_ins_" + installation_id
                os_system = platform.system()
                print "Creando/validando Directorios para los records..."
                if os_system == "Linux":
                  if not os.path.exists("/etc/TIX/records/" + client_server_folder ):
                    os.makedirs("/etc/TIX/records/" + client_server_folder )
                  
                  logFile = open("/etc/TIX/records/" + client_server_folder + "/log" + ts(), 'wb')
                  logFile.write(client_plain_msg)
                  logFile.close()
                  
                if os_system == "Darwin":
                  if not os.path.exists("/etc/TIX/records/" + client_server_folder ):
                    os.makedirs("/etc/TIX/records/" + client_server_folder)

                  logFile = open("/etc/TIX/records/" + client_server_folder + "/log" + ts(), 'wb')
                  logFile.write(client_plain_msg)
                  logFile.close()

                if os_system == "Windows":
                  os_type = platform.release();
                  if os_type == "XP":
                    print "Estoy en Windows XP"
                  if os_type == "Vista":
                    print "Estoy en Windows Vista"


          socket.sendto(msg[0] + '|' + tstamp +'|' + str(ts()) + '|' + msg[3] + '|' + msg[4], self.client_address)
        else:
        #Mensaje corto
          socket.sendto(msg[0]+'|'+ tstamp +'|' + str(ts()) + '|' + msg[3], self.client_address)
	  


class ThreadingUDPServer(SocketServer.ThreadingMixIn, SocketServer.UDPServer):
    pass


if __name__ == "__main__":
    os_system = platform.system()
    print "Creando/validando Directorios para los records..."
    if os_system == "Linux":
      if not os.path.exists("/etc/TIX"):
        os.makedirs("/etc/TIX")
        os.makedirs("/etc/TIX/records")
      
    if os_system == "Darwin":
      if not os.path.exists("/etc/TIX"):
        os.makedirs("/etc/TIX")
        os.makedirs("/etc/TIX/records")

    if os_system == "Windows":
      os_type = platform.release();
      if os_type == "XP":
         print "Estoy en Windows XP"
      if os_type == "Vista":
        print "Estoy en Windows Vista"

    HOST, PORT = SERVER_HOST, SERVER_PORT 
#    HOST='127.0.0.1'
#    PORT=5005
    # Create the server, binding to localhost on port 9999
    #server = SocketServer.UDPServer((HOST, PORT), MyUDPHandler)
    server = ThreadingUDPServer((HOST, PORT), ThreadingUDPRequestHandler)
    
       #Threaded version
    server_thread= threading.Thread(target=server.serve_forever)
    #print server_thread.name
    #server_thread.daemon = True
    server_thread.start()

    # Activate the server; this will keep running until you
    # interrupt the program with Ctrl-C
    #server.serve_forever()
    
    
