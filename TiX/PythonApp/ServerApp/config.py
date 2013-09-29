import ConfigParser

parser = ConfigParser.ConfigParser()
parser.read('tixserver.cfg')
config = {}
config['databaseName'] = parser.get("TiXServer", "databaseName")
config['databaseHost'] = parser.get("TiXServer", "databaseHost")
config['databasePort'] = parser.get("TiXServer", "databasePort")
config['databaseUsername'] = parser.get("TiXServer", "databaseUsername")
config['databasePassword'] = parser.get("TiXServer", "databasePassword")
