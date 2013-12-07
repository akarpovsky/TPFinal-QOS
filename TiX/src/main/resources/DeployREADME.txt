Deploy:

	1) Ejecutar mvn package para generar el .WAR (quedará en el directorio "target").
		En caso de que el esquema de la BD haya cambiado se deberá primero crear un WAR con
		el setup.properties en "CREATE" y luego de que se cree la BD, pasarlo a "VALIDATE"
		para que no se borre todo cada vez que se reinicie el servidor web.
		
		setup.properties para el servidor de producción:
		
		hibernate.show_sql            	= false
		hibernate.hbm2ddl.auto        	= validate
		hibernate.format_sql			= true
		hibernate.use_sql_comments		= true
		hibernate.dialect=org.hibernate.dialect.PostgreSQLDialect
		jdbc.driverClassName=org.postgresql.Driver
		jdbc.url=jdbc:postgresql://localhost:5432/tix_db
		jdbc.username=tix_user_db
		jdbc.password=54bf1n6
	
	2) Copiar vía SCP el .WAR al servidor de TiX de la siguiente forma:
		
		$ scp ./internetqos-1.0-SNAPSHOT.war pfitba@tix.innova-red.net:internetqos.war
		
	3) Mover el .WAR a la carpeta de Tomcat7 (/var/lib/tomcat/webapps) para que sea "explotado":
		
		$ 
		
	4) Para generar el esquema de la DB, hacer un tunel desde la PC local hacia pfitba@tix.innova-red.net 
		de la siguiente forma:

		$ ssh -L8082:localhost:5432 pfitba@tix.innova-red.net

       Y luego ejecutar el pgAdmin en la PC local para hacer los inserts.
       
##########
Para instalar la aplicación udpServerTiempos se necesitan algunas dependencias de Python:

$ wget http://peak.telecommunity.com/dist/ez_setup.py
$ sudo python ez_setup.py
$ sudo apt-get install python-psycopg2
$ sudo apt-get install libpq-dev
$ sudo easy_install Crypto
$ wget https://ftp.dlitz.net/pub/dlitz/crypto/pycrypto/pycrypto-2.6.tar.gz
$ tar -xvzf pycrypto-2.6.tar.gz
$ cd pycrypto-2.6
$ sudo python setup.py install