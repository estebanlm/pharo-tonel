Extension {
	#name : #SocketStream
}

{
	#category : #'*Fuel',
	#timestamp : ' 8/31/2017 05:26:12'
}
SocketStream>>nextBytesPutAll: aCollection [
	"Append the bytes of aCollection to the sequence of bytes accessible 
	by the receiver. Answer aCollection."

	^ self nextPutAll: aCollection
]
