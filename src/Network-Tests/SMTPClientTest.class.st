"
SUnit tests for SMTP client
"
Class {
	#name : #SMTPClientTest,
	#superclass : #TestCase,
	#instVars : [
		'smtp',
		'socket'
	],
	#category : #Network-Tests-Protocols,
	#timestamp : 'TorstenBergmann 2/5/2014 10:11'
}

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:29'
}
SMTPClientTest>>setUp [
	socket := MockSocketStream on: ''.
	smtp := SMTPClient new.
	smtp stream: socket.
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:29'
}
SMTPClientTest>>testMailFrom [
	smtp mailFrom: 'frank@angband.za.org'.
	self assert: socket outStream contents = ('MAIL FROM: <frank@angband.za.org>', String crlf).
	
	socket resetOutStream.
	smtp mailFrom: '<frank@angband.za.org>'.
	self assert: socket outStream contents = ('MAIL FROM: <frank@angband.za.org>', String crlf).
	
	socket resetOutStream.
	smtp mailFrom: 'Frank <frank@angband.za.org>'.
	self assert: socket outStream contents = ('MAIL FROM: <frank@angband.za.org>', String crlf).
]
