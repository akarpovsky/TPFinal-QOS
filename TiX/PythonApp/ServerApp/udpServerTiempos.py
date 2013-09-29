#!/usr/bin/python

# servidor udp 
# ejemplo de la documentacion de python 
# http://docs.python.org/2/library/socketserver.html
# modificado para permitir el registro del timestamp en la respuesta	

import SocketServer
import datetime
import threading
import ConfigParser
import platform, os
import dbmanager
from Crypto.PublicKey import RSA
from Crypto.Signature import PKCS1_v1_5 
from Crypto.Hash import SHA256 
from base64 import b64decode
from random import randrange


config = ConfigParser.ConfigParser()
config.read('tixserver.cfg')
SERVER_HOST = config.get("TiXServer", "SERVER_HOST") #TODO: Change TEST!
SERVER_PORT = config.getint("TiXServer", "SERVER_PORT")
TEST_SERVER_HOST = config.get("TiXServer", "TEST_SERVER_HOST") #TODO: Change TEST!
TEST_SERVER_PORT = config.getint("TiXServer", "TEST_SERVER_PORT")
installDirUnix = config.get("TiXServer", "installDirUnix")

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
	       
        msg = data.split('!!')
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

            client_pub_key_str = b64decode(large_package_msg[1])
            client_signed_msg = b64decode(large_package_msg[2])
            client_msg_filename = large_package_msg[3]
            client_plain_msg = b64decode(large_package_msg[4])

            print "Data package received!" 
            print "<public key>\n" + client_pub_key_str + "\n</public key>\n"
            print "Signed msg: " + client_signed_msg
            print "Filename: " + client_msg_filename
            print "<plain msg>\n" + client_plain_msg + "\n</plain msg>\n"

            client_pub_key = RSA.importKey(client_pub_key_str) # import pub key from string
            # En el servidor se hace el VERIFY, para esto se necesita tambien la firma!

            signer = PKCS1_v1_5.new(client_pub_key) 
            digest = SHA256.new() 
            digest.update(client_plain_msg) 

            if signer.verify(digest, client_signed_msg): 
              print "Integrity check OK"
              client_data = dbmanager.DBManager.getInstallationAndClientId(client_pub_key_str)
              
              if client_data is not None:
                installation_id = client_data[0]
                client_id = client_data[1]
                #CLIENT FOLDER: IP_cli_CLIENTID_ins_INSID
                print "Saving data to: " + str(self.client_address[0]) + "_cli_" + str(client_id) + "_ins_" + str(installation_id) 
                client_server_folder = str(self.client_address[0]) + "_cli_" + str(client_id) + "_ins_" + str(installation_id) 
                print "Validando existencia de directorios para los records..."
                if not os.path.exists(installDirUnix + "/records/" + client_server_folder ):
                  print "Creando directorio: " + client_server_folder
                  os.makedirs("/etc/TIX/records/" + client_server_folder )
                  
                logFile = open("/etc/TIX/records/" + client_server_folder + "/" + client_msg_filename, 'wb')
                logFile.write(client_plain_msg)
                logFile.close()
                # DBManager.insert_record(20,53,'2013-04-14 16:20:12.345678',55,50,"false","false",1,1,1)
                #downstream,downstreamcongestion,timestamp,upstream,upstreamcongestion,userdowncongestion,userupcongestion,installation_id,isp_id,user_id
                print "Inserting new records in the DB ..."
                isp_id = 1 #TODO -> Find out
                dbmanager.DBManager.insert_record(randrange(100), randrange(100), '2013-04-14 16:20:12.345678',randrange(100),randrange(100),"false","false",installation_id,isp_id,client_id)

          socket.sendto(msg[0] + '|' + tstamp +'|' + str(ts()) + '|' + msg[3] + '|' + msg[4], self.client_address)
        else:
        #Mensaje corto
          socket.sendto(msg[0]+'|'+ tstamp +'|' + str(ts()) + '|' + msg[3], self.client_address)
	  


class ThreadingUDPServer(SocketServer.ThreadingMixIn, SocketServer.UDPServer):
    pass


if __name__ == "__main__":
    print "Creando/validando Directorios para los records..."

    if not os.path.exists("/etc/TIX"):
      os.makedirs("/etc/TIX")
      os.makedirs("/etc/TIX/records")
      
    HOST, PORT = TEST_SERVER_HOST, TEST_SERVER_PORT 
#    HOST='127.0.0.1'
#    PORT=5005
    # Create the server, binding to localhost on port 9999
    #server = SocketServer.UDPServer((HOST, PORT), MyUDPHandler)
    server = ThreadingUDPServer((HOST, PORT), ThreadingUDPRequestHandler)
    
       #Threaded version
    server_thread= threading.Thread(target=server.serve_forever)
    print "Starting thread " + server_thread.name + "..."
    # server_thread.daemon = True
    server_thread.start()

    # Activate the server; this will keep running until you
    # interrupt the program with Ctrl-C
    #server.serve_forever()
    
    
