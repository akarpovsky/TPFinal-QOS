#!/usr/bin/python

import time
import datetime
import threading
import sys




if __name__ == "__main__":

	arch=open("log51841048117","r")
	i=0
	for line in arch:
	  data= line.split('|')
	  print "id:", i, ", Hora: ",data[1], ", longitud: ", data[2], ", t1: ", data[3], ", t2: ", data[4], ", t3: ", data[5], ", t4: ", data[6], '\n'
	  i=i+1
	arch.close()
	
