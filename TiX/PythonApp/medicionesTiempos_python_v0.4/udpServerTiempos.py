#!/usr/bin/python

# servidor udp 
# ejemplo de la documentacion de python 
# http://docs.python.org/2/library/socketserver.html
# modificado para permitir el registro del timestamp en la respuesta	

import SocketServer
import datetime
import threading

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
	  socket.sendto(msg[0] + '|' + tstamp +'|' + str(ts()) + '|' + msg[3] + '|' + msg[4], self.client_address)
	else:
	  #Mensaje corto
	  socket.sendto(msg[0]+'|'+ tstamp +'|' + str(ts()) + '|' + msg[3], self.client_address)
	  


class ThreadingUDPServer(SocketServer.ThreadingMixIn, SocketServer.UDPServer):
    pass



if __name__ == "__main__":
    HOST, PORT = "157.92.44.31", 80
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
    
    
