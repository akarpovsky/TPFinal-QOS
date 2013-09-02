import psycopg2
import ConfigParser



config = ConfigParser.ConfigParser()
config.read('tixserver.cfg')
databaseName = config.get("TiXServer", "databaseName")
databaseHost = config.get("TiXServer", "databaseHost")
databasePort = config.get("TiXServer", "databasePort")
databaseUsername = config.get("TiXServer", "databaseUsername")
databasePassword = config.get("TiXServer", "databasePassword")
# cursor.execute("INSERT INTO foo VALUES (%s)",["bar"])

# INSERT INTO records VALUES (1,20,53,'2013-04-14 16:20:12.345678',55,50,false,false,1,1,1);

class DBManager(object):
	INSTANCE = None

	def __init__(self):
		if self.INSTANCE is not None:
			raise ValueError("An instantiation already exists!")
		try:
			self.INSTANCE = psycopg2.connect(host=databaseHost,port=databasePort,user=databaseUsername,password=databasePassword,database=databaseName)
			self.INSTANCE.set_isolation_level(0)
	    	# conn = psycopg2.connect("dbname='template1' user='dbuser' host='localhost' password='dbpass'")
		except Exception, e:
			print "Error: I am unable to connect to the database!"
			print e

	@classmethod
	def get_instance(cls):
		if cls.INSTANCE is None:
			cls.INSTANCE = DBManager()
		return cls.INSTANCE

	def get_connection(self):
		if self.INSTANCE is None:
			self.INSTANCE = DBManager()
		return self.INSTANCE

	@classmethod
	def insert_record(cls, record_id, downstream,downstreamcongestion,timestamp,upstream,upstreamcongestion,userdowncongestion,userupcongestion,installation_id,isp_id,user_id):
		DBManagerInst = DBManager.get_instance()
		conn = DBManagerInst.get_connection()
		cursor = conn.cursor()
		try:
			cursor.execute("""INSERT INTO records(id,downstream,downstreamcongestion,timestamp,upstream,upstreamcongestion,userdowncongestion,userupcongestion,installation_id,isp_id,user_id) VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)""", [record_id, downstream,downstreamcongestion,timestamp,upstream,upstreamcongestion,userdowncongestion,userupcongestion,installation_id,isp_id,user_id])
		except Exception, e:
			print "Error: Could not insert record in DB"
			print e

	@classmethod
	def getInstallationAndClientId(cls, publicKey):
		DBManagerInst = DBManager.get_instance()
		conn = DBManagerInst.get_connection()
		cursor = conn.cursor()
		try:
			cursor.execute("""SELECT id, owner_id FROM installation WHERE encryptionkey=%s""", [publicKey])
			data = cursor.fetchone() # data[0] = installation_id, data[1] = user_id
			return data
		except Exception, e:
			print "Error: Could not get record from DB"
			print e

if __name__ == "__main__":
	# DBManager.insert_record(11100,20,53,'2013-04-14 16:20:12.345678',55,50,"false","false",1,1,1)
	key = """-----BEGIN PUBLIC KEY-----
MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDFlr7W90AKh5BDcROE0aPCfJJX
QfAZvppve3C6Ddb8HsCYthPfEqtu7D7kXVHNJISC79g3Mzz4x9wZvk2RWRYs6v/+
KH7nn6+HOEqggqNGgaIPr6tysbRSTemuWu7RU0gsRlGUn8nik/fpz6HPK9Gfg0Em
y5unpkQ9s5kDOCwi7wIDAQAB
-----END PUBLIC KEY-----"""
	print DBManager.getInstallationAndClientId(key)