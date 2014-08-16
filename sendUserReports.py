import mandrill
import base64

def filetobase64( inputfilename):
        return base64.b64encode(open(inputfilename, 'rb').read())

#f = open("08-2014/jogalin@itba.edu.ar.pdf", "rb")

#try:
#    bytes = f.read(1)
#    while bytes != "":
#        bytes = f.read(1)
#finally:
#    f.close()

#bytes = base64.b64encode(bytes)

bytes = filetobase64("08-2014/jogalin@itba.edu.ar.pdf")

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
     'to': [{'email': 'joseignaciosg9@gmail.com',
             'name': 'Jose Galindo',
             'type': 'to'}],
     'view_content_link': None}
    result = mandrill_client.messages.send(message=message, async=False, ip_pool='Main Pool')

except mandrill.Error, e:
    # Mandrill errors are thrown as exceptions
    print 'A mandrill error occurred: %s - %s' % (e.__class__, e)
    # A mandrill error occurred: <class 'mandrill.UnknownSubaccountError'> - No subaccount exists with the id 'customer-123'
    raise
