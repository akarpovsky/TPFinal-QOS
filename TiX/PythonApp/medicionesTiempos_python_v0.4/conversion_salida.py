#!/usr/bin/env python
# -*- coding: iso-8859-15 -*-

# Descripción del script:
# Al ejecutar este script se parsea la salida del servidor TCP en nodejs y construye un archivo con el siguiente formato:
# ===================================================================
# sequence|interval[useg]|length[bytes]|rtt|t1[useg]|(t2-t1)[useg]|(t3-t2)[useg]|(t4-t3)[useg]
# ===================================================================
# 1 0 40 0 1349635846377936 1059052 547 -1031432
# 2 997879 1500 0 1349635847375815 1051437 130 -1031301
# 3 999281 40 0 1349635848375096 1045404 69 -1034720
# 4 1001178 1500 0 1349635849376274 1049277 88 -1033440
# 5 1000681 40 0 1349635850376955 1046974 71 -1018986
# ...

import os

#dir_base = 'datosMedidos/'
#clientes = os.listdir(dir_base)

archivos = []
'''for ip in clientes:
	path_dst = dir_base+ip+'/'
	casos = ['_l', '_u']		# Defino los 2 casos posibles, con carga o sin carga
	for c in casos:
		fname = path_dst+ip+c+'.original'
		ftxt = path_dst+ip+c+'.txt'
		if os.path.isfile(fname) == True and os.path.isfile(ftxt) == False:
			archivos.append(fname)
		elif os.path.isfile(fname) == False:
			print 'No existe este caso:',fname


for file_name in archivos:
	# Tiempos cortos
	probes_short = []			# En este vector acumulo todos los tT de paquetes cortos para hacer el histograma
	# Tiempos largos
	probes_large = []			# En este vector acumulo todos los tT de paquetes largos para hacer el histograma
	f = open(file_name, 'r')
	leer = f.readlines()
	f.close()
	for line in leer:
		if line[0] != '#':
			aux_00 = line.split('|')
			print aux_00
			#sec_num = aux_00[0]
			sec_num=0.0
			#interval = float(aux_00[1])
			interval=1.0
			length = aux_00[2]
			#rtt = float(aux_00[3])
			rtt=float(aux_00[4])-float(aux_00[3])
			t1 = float(aux_00[3])
			t2_t1 = float(aux_00[4])-float(aux_00[3])
			t3_t2 = float(aux_00[5])-float(aux_00[4])
			t4_t3 = float(aux_00[6])-float(aux_00[5])
			tT = t4_t3 + t2_t1		# tiempo de transito, Eq. (8) de TiX
			if length == '75':		# Se usa la etiqueta '40'; NO es el tamaño real
				probes_short.append(tT)
			elif length == '4475':		# Se usa la etiqueta '1500'; NO es el tamaño real
				probes_large.append(tT)
'''
archivos.append("log_1h_37634414107")				
for file_name in archivos:
	probes_short = {}
	probes_large = {}
	f = open(file_name, 'r')
	leer = f.readlines()
	f.close()
	i=0
	for line in leer:
		#aux_prev = line.split('): ')
		aux_00 = line.split('|')
		num_sec = i
		i=i+1
		length  = aux_00[2]
		t1  = aux_00[3]
		t2  = aux_00[4]
		t3  = aux_00[5]
		t4  = aux_00[6].split('\n')[0]
		componentes = (t1,t2,t3,t4)
		if length == '75':			# '40' es solo una etiqueta
			probes_short[num_sec] = componentes
		elif length == '4475':		# '1500' es solo una etiqueta
			probes_large[num_sec] = componentes
	
	num_probe = []
	secuencias = {}
	# Secuencias cortas		
	for probe in probes_short:
		aux_00 = probes_short[probe]
		if len(aux_00) == 4:
			t1 = int(aux_00[0])
			t2 = int(aux_00[1])
			t3 = int(aux_00[2])
			t4 = int(aux_00[3])
			#############################################################################
			# Resultado en microsegundos
			diff = t4 -t1
			num_probe.append(int(probe))
			valores = (probe, '75', '0', t1, t2-t1, t3-t2, t4-t3)
			secuencias[probe] = valores

	# Secuencias largas	
	for probe in probes_large:
		aux_00 = probes_large[probe]
		if len(aux_00) == 4:
			t1 = int(aux_00[0])
			t2 = int(aux_00[1])
			t3 = int(aux_00[2])
			t4 = int(aux_00[3])
			#############################################################################
			# Resultado en microsegundos
			diff = t4 -t1
			num_probe.append(int(probe))
			valores = (probe, '4475', '0', t1, t2-t1, t3-t2, t4-t3)
			secuencias[probe] = valores
	
	min_probe = min(num_probe)
	max_probe = max(num_probe)
	size_probes = range(min_probe,max_probe+1)

	'''
	# Para escribir en el lugar correcto
	busco_caso = file_name.split('/')
	ip = busco_caso[len(busco_caso)-2]
	nombre = busco_caso[len(busco_caso)-1].split('_')[0]
	caso = busco_caso[len(busco_caso)-1].split('_')[1]
	if caso == 'l.original':
		fsalida = nombre+'_l.txt'
	elif caso == 'u.original':
		fsalida = nombre+'_u.txt'
	path_dst = dir_base+ip+'/'
	fsalida_abs = path_dst+fsalida
	'''
	f = open("converted_data", 'a')
	cadena = '# sequence | interval[useg] | length[label] | rtt | t1[useg] | (t2-t1)[useg] | (t3-t2)[useg] | (t4-t3)[useg]\n'
	f.write(cadena)
	for i in size_probes:
		compara_00 = secuencias.has_key(i)
		if compara_00 != 0:
			valores = secuencias[i]
			sequence = valores[0]
			length = valores[1]
			rtt = valores[2]
			t1 = valores[3]
			t2_t1 = valores[4]
			t3_t2 = valores[5]
			t4_t3 = valores[6]
			if i == min_probe:
				interval = 0
				t1_anterior = t1
			else:
				interval = t1 - t1_anterior
				t1_anterior = t1
			# A escribir
			cadena = str(sequence)+' '+str(interval)+' '+str(length)+' '+str(rtt)+' '+str(t1)+' '+str(t2_t1)+' '+str(t3_t2)+' '+str(t4_t3)+'\n'
			f.write(cadena)
	f.close()
