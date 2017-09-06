"
I am ZnEntityReader, I help reading ZnEntities from a stream given meta data in headers.

I deal with chunking and gzip decoding.

I have several options:
	- to read streaming entities, where the client has to do the actual reading
	- to read binary entities, where textual content is not interpreted
	- to allow reading up to end, when there is no content length set

Part of Zinc HTTP Components.
"
Class {
	#name : #ZnEntityReader,
	#superclass : #Object,
	#instVars : [
		'headers',
		'stream',
		'streaming',
		'binary',
		'allowReadingUpToEnd'
	],
	#category : #Zinc-HTTP-Streaming,
	#timestamp : 'SvenVanCaekenberghe 4/7/2012 16:37'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnEntityReader>>allowReadingUpToEnd [
	allowReadingUpToEnd := true
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnEntityReader>>allowsReadingUpToEnd [
	^ allowReadingUpToEnd notNil and: [ allowReadingUpToEnd ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnEntityReader>>binary [
	binary := true
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnEntityReader>>canReadContent [
	^ self hasContentLength or: [ self isChunked or: [ self allowsReadingUpToEnd ] ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnEntityReader>>contentLength [
	^ (self headers includesKey: 'Content-Length')
		ifTrue: [ self headers contentLength ]
		ifFalse: [ nil ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnEntityReader>>contentType [
	^ (self headers includesKey: 'Content-Type') 
		ifTrue: [ self headers contentType ] 
		ifFalse: [ ZnMimeType default ]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnEntityReader>>hasContentLength [
	^ self headers hasContentLength and: [ self headers contentLength > 0 ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnEntityReader>>headers [
	^ headers
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnEntityReader>>headers: znHeaders [
	headers := znHeaders
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnEntityReader>>isBinary [
	^ binary notNil and: [ binary ]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnEntityReader>>isChunked [
	| transferEncoding |
	transferEncoding := self headers at: 'Transfer-Encoding' ifAbsent: [ ^ false ].
	^ transferEncoding = 'chunked' or: [ transferEncoding beginsWith: 'chunked' ]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnEntityReader>>isGzipped [
	| contentEncoding |
	contentEncoding := self headers at: 'Content-Encoding' ifAbsent: [ ^ false ].
	^ contentEncoding = 'gzip'
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnEntityReader>>isIdentityEncoded [
	^ self isGzipped not
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnEntityReader>>isStreaming [
	^ streaming notNil and: [ streaming ]
]

{
	#category : #public,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnEntityReader>>readEntity [
	| entity |
	self canReadContent ifFalse: [ ^ nil ].
	entity := self readEntityFromStream.
	^ entity isEmpty
		ifTrue: [ nil ]
		ifFalse: [ entity ]    
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnEntityReader>>readEntityFromStream [
	| entity decodedEntityLength chunkedStream isChunked |
	chunkedStream := (isChunked := self isChunked) ifTrue: [ stream := ZnChunkedReadStream on: stream ] ifFalse: [ nil ].
	self isGzipped 
		ifTrue: [ 
			self hasContentLength ifTrue: [ stream := ZnLimitedReadStream on: stream limit: self contentLength ].
			decodedEntityLength := nil.
			stream := GZipReadStream on: stream ]
		ifFalse: [ decodedEntityLength := self contentLength ].
	entity := self readFrom: stream usingType: self contentType andLength: decodedEntityLength.
	isChunked ifTrue: [ 
		self isIdentityEncoded ifTrue: [ entity contentLength: stream totalSize ].
		chunkedStream extraHeaders ifNotNil: [ :extraHeaders | self headers addAll: extraHeaders ] ].
	^ entity
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnEntityReader>>readFrom: readStream usingType: contentType andLength: length [
	| entityClass selector |
	entityClass := self isStreaming 
		ifTrue: [ ZnStreamingEntity ]
		ifFalse: [ ZnEntity ].
	selector := self isBinary 
		ifTrue: [ #readBinaryFrom:usingType:andLength: ]
		ifFalse: [ #readFrom:usingType:andLength: ].
	^ entityClass perform: selector 
		with: readStream
		with: contentType 
		with: length
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnEntityReader>>stream [
	^ stream
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnEntityReader>>stream: readStream [
	stream := readStream 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnEntityReader>>streaming [
	streaming := true
]
