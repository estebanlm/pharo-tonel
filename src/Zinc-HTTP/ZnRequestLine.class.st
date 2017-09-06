"
I am an HTTP Request Line.
I consist of an HTTP method, an URI and an HTTP protocol version.
I can be used for generating and parsing.

Part of Zinc HTTP Components.
"
Class {
	#name : #ZnRequestLine,
	#superclass : #Object,
	#instVars : [
		'method',
		'uri',
		'version'
	],
	#category : #Zinc-HTTP-Core,
	#timestamp : '<historical>'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnRequestLine class>>empty [
	^ self new
		version: ZnConstants defaultHTTPVersion;
		yourself 
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnRequestLine class>>method: method uri: uri [
	^ self new
		method: method;
		uri: uri;
		version: ZnConstants defaultHTTPVersion;
		yourself 
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnRequestLine class>>readFrom: stream [
	^ self new
		readFrom: stream;
		yourself
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnRequestLine>>= other [
	self class = other class ifFalse: [ ^ false ].
	^ self method = other method
		and: [ self uri asRelativeUrl = other uri asRelativeUrl
			and: [ self version = other version ] ]
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnRequestLine>>hash [
	^ (self method hash bitXor: self uri hash) bitXor: self version hash
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnRequestLine>>isHttp10 [
	^ self version = 'HTTP/1.0'
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnRequestLine>>isHttp11 [
	^ self version = 'HTTP/1.1'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnRequestLine>>method [
	^ method
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnRequestLine>>method: string [
	method := ZnConstants knownHTTPMethods 
		detect: [ :each | each = string ] 
		ifNone: [ (ZnUnknownHttpMethod method: string) signal ] 
]

{
	#category : #copying,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnRequestLine>>postCopy [
	uri := uri copy
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnRequestLine>>printMethodAndUriOn: stream [
	(self method notNil and: [ self uri notNil ])
		ifFalse: [ ^ self ].
	stream
		nextPutAll: self method;
		space.
	self uri printPathQueryFragmentOn: stream
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnRequestLine>>printOn: stream [
	super printOn: stream.
	(self method notNil and: [ self uri notNil ])
		ifFalse: [ ^ self ].
	stream nextPut: $(.
	self printMethodAndUriOn: stream.
	stream nextPut: $)
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnRequestLine>>readFrom: stream [
	| line lineStream |
	line := (ZnLineReader on: stream) nextLine.
	lineStream := line readStream.
	self method: (lineStream upTo: Character space).
	self uri: (lineStream upTo: Character space).
	self version: (lineStream upToEnd)
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnRequestLine>>uri [
	^ uri
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnRequestLine>>uri: anURI [
	uri := anURI asZnUrl.
	uri enforceKnownScheme
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnRequestLine>>uriPathQueryFragment [
	^ String streamContents: [ :stream | 
			self uri printPathQueryFragmentOn: stream ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnRequestLine>>version [
	^ version
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnRequestLine>>version: string [
	version := ZnConstants knownHTTPVersions 
		detect: [ :each | each = string ] 
		ifNone: [ (ZnUnknownHttpVersion version: string) signal ] 
]

{
	#category : #writing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnRequestLine>>writeOn: stream [
	| writeStream |
	writeStream := ZnBivalentWriteStream on: stream.
	writeStream nextPutAll: self method; space.
	(ZnNetworkingUtils shouldProxyUrl: self uri)
		ifTrue: [ 
			self uri hasSecureScheme 
				ifTrue: [
					"See also ZnClient>>#setupTLSTo:"
					method = #CONNECT
						ifTrue: [ writeStream nextPutAll: uri authorityWithPort ]
						ifFalse: [ self uri printPathQueryFragmentOn: writeStream ] ]
				ifFalse: [ self uri printOn: writeStream ] ]
		ifFalse: [ self uri printPathQueryFragmentOn: writeStream ].
	writeStream space; nextPutAll: self version; nextPutAll: String crlf 
]
