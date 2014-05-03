import psycopg2
import ConfigParser

config = ConfigParser.ConfigParser()
config.read('/home/pfitba/ServerAppProduction/tixserver.cfg')
databaseName = config.get("TiXServer", "databaseName")
databaseHost = config.get("TiXServer", "databaseHost")
databasePort = config.get("TiXServer", "databasePort")
databaseUsername = config.get("TiXServer", "databaseUsername")
databasePassword = config.get("TiXServer", "databasePassword")

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
	def insert_record(cls, calidad_down,utiliz_down,h_rs_down,h_wave_down,timestamp,calidad_up,utiliz_up,h_rs_up,h_wave_up,userdowncongestion,userupcongestion,installation_id,isp_id,user_id):
		DBManagerInst = DBManager.get_instance()
		conn = DBManagerInst.get_connection()
		cursor = conn.cursor()
		try:
			cursor.execute("""INSERT INTO records(calidad_down,utiliz_down,h_rs_down,h_wave_down,timestamp,calidad_up,utiliz_up,h_rs_up,h_wave_up,userdowncongestion,userupcongestion,installation_id,isp_id,user_id) VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)""", [calidad_down,utiliz_down,h_rs_down,h_wave_down,timestamp,calidad_up,utiliz_up,h_rs_up,h_wave_up,userdowncongestion,userupcongestion,installation_id,isp_id,user_id])
			cursor.query
		except Exception, e:
			cursor.query
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
	key = "LS0tLS1CRUdJTiBSU0EgUFVCTElDIEtFWS0tLS0tCk1FZ0NRUUN4MHlHNHp0bDhoMy9oSkNMNEVtZTBtdCtxM3Z4VWJ3LzV6MWFBTTJhWDBFRUpHQ3lsenUxNUwrdUUKZVhQWW8yYWF4dDhCZ0l1MWpMRlgrSnh0OGo5eEFnTUJBQUU9Ci0tLS0tRU5EIFJTQSBQVUJMSUMgS0VZLS0tLS0K"
	key2 = """-----BEGIN RSA PUBLIC KEY-----
MEgCQQCgNdYXbjBaXkkHqcTUrUKLfVOTIw2IG248G1GBvoT4uHuSfgxrLf09H1DU
irG0ncvFZVdMworutHgcbWGUfY4HAgMBAAE=
-----END RSA PUBLIC KEY-----"""
	key3 = """-----BEGIN RSA PUBLIC KEY-----
MEgCQQDPy+46xqQe4fCFKEde3rBlQWJPu1YuhYW3xnORrIgsfo6XphuFXBeIyV7I
vnp1RBrZYnYWV2ml704ONkidCie3AgMBAAE=
-----END RSA PUBLIC KEY-----"""


	print DBManager.getInstallationAndClientId(key)
