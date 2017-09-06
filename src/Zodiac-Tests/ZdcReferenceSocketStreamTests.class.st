"
ZdcReferenceSocketStreamTests test the reference SocketStream in the image
"
Class {
	#name : #ZdcReferenceSocketStreamTests,
	#superclass : #ZdcAbstractSocketStreamTests,
	#category : #Zodiac-Tests,
	#timestamp : 'SvenVanCaekenberghe 5/20/2011 10:20'
}

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:32'
}
ZdcReferenceSocketStreamTests class>>isAbstract  [
	^ false
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:32'
}
ZdcReferenceSocketStreamTests>>openConnectionToHost: host port: port [
	| stream |
	stream := super openConnectionToHost: host port: port.
	self setReferenceSocketStreamOptions: stream.
	^ stream
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:32'
}
ZdcReferenceSocketStreamTests>>openConnectionToHostNamed: host port: port [
	| stream |
	stream := super openConnectionToHostNamed: host port: port.
	self setReferenceSocketStreamOptions: stream.
	^ stream
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:32'
}
ZdcReferenceSocketStreamTests>>socketStreamClass [
	^ SocketStream 
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:32'
}
ZdcReferenceSocketStreamTests>>socketStreamOn: socket [
	| stream |
	stream := super socketStreamOn: socket.
	self setReferenceSocketStreamOptions: stream.
	^ stream	
]
