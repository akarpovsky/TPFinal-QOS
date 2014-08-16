import mandrill
import base64
import datetime
from optparse import OptionParser


def filetobase64( inputfilename):
        return base64.b64encode(open(inputfilename, 'rb').read())

if __name__ == "__main__":
	parser = OptionParser()
	parser.add_option("-u", "--user", dest="user",
                  help="write the user e-mail")

	(options, args) = parser.parse_args()

	user = options.user
	print "Sending report to " + user
	date  = datetime.datetime.now().strftime('%m-%Y')

	bytes = filetobase64(date + "/" + user + ".pdf")

	try:
	    mandrill_client = mandrill.Mandrill('0iyTUdh05IIJ8NqQfYrIkg')
	    message = {'attachments': [{'content': bytes,
                      'name': 'report.pdf',
                      'type': 'application/pdf'}],
	     'from_email': 'joseignaciosg9@gmail.com',
	     'from_name': 'TiX',
	     'subject': '[TiX] Monthly User Report',
	     'tags': ['password-resets'],
	     'text': 'Here is your monthly report.',
	     'to': [{'email': user,
	             'name': 'Tix User',
	             'type': 'to'}],
	     'view_content_link': None}
	    result = mandrill_client.messages.send(message=message, async=False, ip_pool='Main Pool')

	except mandrill.Error, e:
	    # Mandrill errors are thrown as exceptions
	    print 'A mandrill error occurred: %s - %s' % (e.__class__, e)
	    # A mandrill error occurred: <class 'mandrill.UnknownSubaccountError'> - No subaccount exists with the id 'customer-123'
	    raise
