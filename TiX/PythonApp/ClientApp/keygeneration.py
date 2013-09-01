from Crypto.PublicKey import RSA

def generateKeyPair(privateKeyFile, publicKeyFile):
	keys = RSA.generate(1024)
	exportableKeys = []
	privHandle = open(privateKeyFile, 'wb')
	exportableKeys.append(keys.exportKey())
	privHandle.write(keys.exportKey())
	privHandle.close()

	pubHandle = open(publicKeyFile, 'wb')
	pubHandle.write(keys.publickey().exportKey())
	exportableKeys.append(keys.publickey().exportKey())
	pubHandle.close()

	return exportableKeys[1]

if __name__ == "__main__":
	generateKeyPair("/etc/TIX/tix_key.priv", "/etc/TIX/tix_key.pub")