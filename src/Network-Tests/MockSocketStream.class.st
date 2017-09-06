"
A test mock for socket streams
"
Class {
	#name : #MockSocketStream,
	#superclass : #Stream,
	#instVars : [
		'atEnd',
		'inStream',
		'outStream'
	],
	#category : #Network-Tests-Kernel,
	#timestamp : 'TorstenBergmann 2/5/2014 10:10'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:29'
}
MockSocketStream class>>on: socket [
	^self basicNew initialize
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:29'
}
MockSocketStream>>atEnd [
	^self inStream atEnd.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:29'
}
MockSocketStream>>atEnd: aBoolean [
	atEnd := aBoolean.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:29'
}
MockSocketStream>>inStream [
	^inStream
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:29'
}
MockSocketStream>>initialize [
	super initialize.
	self resetInStream.
	self resetOutStream.
]

{
	#category : #'stream in',
	#timestamp : ' 8/31/2017 05:26:29'
}
MockSocketStream>>nextLine [
	^self nextLineCrLf
]

{
	#category : #'stream in',
	#timestamp : ' 8/31/2017 05:26:29'
}
MockSocketStream>>nextLineCrLf [
	^(self upToAll: String crlf).
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:29'
}
MockSocketStream>>outStream [
	^outStream
]

{
	#category : #'stream in',
	#timestamp : ' 8/31/2017 05:26:29'
}
MockSocketStream>>resetInStream [
	inStream := String new writeStream.
]

{
	#category : #'stream out',
	#timestamp : ' 8/31/2017 05:26:29'
}
MockSocketStream>>resetOutStream [
	outStream := String new writeStream.
]

{
	#category : #'stream out',
	#timestamp : ' 8/31/2017 05:26:29'
}
MockSocketStream>>sendCommand: aString [
	self outStream
		nextPutAll: aString;
		nextPutAll: String crlf.
]

{
	#category : #'stream in',
	#timestamp : ' 8/31/2017 05:26:29'
}
MockSocketStream>>upToAll: delims [
	^self inStream upToAll: delims.
]
