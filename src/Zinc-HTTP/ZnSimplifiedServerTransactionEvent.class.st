"
ZnSimplifiedServerTransactionEvent is a ZnServerLogEvent that notes the completion of a served side HTTP transaction (request/response). Only a limited number of simpler data is held. ZnServerTransactionEvent contains much more detailed data.

Instance Variables
	method: HTTP verb
	url: ZnUrl requested
	response:	numeric response code
	size: number of bytes in response
	duration: milliseconds

ZnSimplifiedServerTransactionEvent is ideal for classic HTTP logging with little overhead through its default string representation.

"
Class {
	#name : #ZnSimplifiedServerTransactionEvent,
	#superclass : #ZnServerLogEvent,
	#instVars : [
		'method',
		'url',
		'response',
		'size',
		'duration'
	],
	#category : #Zinc-HTTP-Logging,
	#timestamp : 'SvenVanCaekenberghe 6/16/2014 15:20'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnSimplifiedServerTransactionEvent>>duration [
	^ duration
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnSimplifiedServerTransactionEvent>>method [
	^ method
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnSimplifiedServerTransactionEvent>>printContentsOn: stream [
	super printContentsOn: stream.
	stream space; nextPutAll: method.
	stream space.
	url printPathQueryFragmentOn: stream.
	stream space; print: response.
	size ifNotNil: [ 
		stream space; print: size; nextPut: $B ].
	stream space; print: duration; nextPutAll: 'ms'
]

{
	#category : #initialize,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnSimplifiedServerTransactionEvent>>request: aZnRequest [
	method := aZnRequest method.
	url := aZnRequest url
]

{
	#category : #initialize,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnSimplifiedServerTransactionEvent>>response: aZnResponse [
	response := aZnResponse code.
	aZnResponse hasEntity
		ifTrue: [ size := aZnResponse entity contentLength ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnSimplifiedServerTransactionEvent>>responseCode [
	^ response
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnSimplifiedServerTransactionEvent>>size [
	^ size
]

{
	#category : #initialize,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnSimplifiedServerTransactionEvent>>timing: timing [
	duration := timing totalDuration 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnSimplifiedServerTransactionEvent>>url [
	^ url
]
