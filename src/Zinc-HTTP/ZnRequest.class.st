"
I am ZnRequest, representing an HTTP Request, 
consisting of a request line, headers and an optional entity (body).
I am a ZnMessage.
I can be used for generating and parsing.

Part of Zinc HTTP Components.
"
Class {
	#name : #ZnRequest,
	#superclass : #ZnMessage,
	#instVars : [
		'requestLine'
	],
	#category : #Zinc-HTTP-Core,
	#timestamp : 'SvenVanCaekenberghe 1/18/2011 10:58'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnRequest class>>delete: urlObject [
	^ self method: #DELETE url: urlObject
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnRequest class>>empty [
	^ self new
		requestLine: ZnRequestLine empty;
		headers: ZnHeaders defaultRequestHeaders;
		yourself
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnRequest class>>get: urlObject [
	^ self method: #GET url: urlObject
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnRequest class>>head: urlObject [
	^ self method: #HEAD url: urlObject
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnRequest class>>method: method url: urlObject [
	| url |
	url := urlObject asZnUrl.
	^ self new
		requestLine: (ZnRequestLine method: method uri: url);
		headers: (ZnHeaders requestHeadersFor: url);
		yourself
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnRequest class>>options: urlObject [
	^ self method: #OPTIONS url: urlObject
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnRequest class>>patch: urlObject [
	^ self method: #PATCH url: urlObject
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnRequest class>>post: urlObject [
	^ self method: #POST url: urlObject
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnRequest class>>put: urlObject [
	^ self method: #PUT url: urlObject
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnRequest>>= other [
	^ super = other and: [ self requestLine = other requestLine ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnRequest>>absoluteUrl [
	^ self host 
		ifNil: [ self url ]
		ifNotNil: [ :hostUrl | self url inContextOf: hostUrl ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnRequest>>accept [
	^ self headers at: 'Accept'
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnRequest>>acceptsEncodingGzip [
	| value |
	value := self headers at: 'Accept-Encoding' ifAbsent: [ ^ false ].
	^ value includesSubstring: 'gzip'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnRequest>>authorization [
	^ self headers at: 'Authorization'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnRequest>>basicAuthentication [
	| authorization username password |
	authorization := self authorization findTokens: ' '.
	(authorization size = 2 and: [ authorization first = 'Basic' ]) ifFalse: [ 
		^ NotFound signal: 'Incomplete Basic Authentication' ].
	authorization := (ZnUtils decodeBase64: authorization second) findTokens: ':'.
	authorization size = 2 ifFalse: [
		^ NotFound signal: 'Incomplete Basic Authentication' ].
	^ authorization
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnRequest>>cookies [
	| value cookies |
	value := self headers at: 'Cookie' ifAbsent: [ ^ #() ].
	cookies := value isString
		ifTrue: [ value findTokens: #($;) ]
		ifFalse: [ value ].
	^ cookies collect: [ :each | ZnCookie fromString: each ]
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnRequest>>hash [
	^ super hash bitXor: self requestLine hash
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnRequest>>host [
	| host scheme |
	host := self headers at: 'Host' ifAbsent: [ ^ nil ].
	scheme :=ZnCurrentServer value ifNil: [ #http ] ifNotNil: [ :server | server scheme ].
	^ ZnUrl fromString: host defaultScheme: scheme
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnRequest>>isHttp10 [
	^ self requestLine isHttp10 
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnRequest>>isHttp11 [
	^ self requestLine isHttp11
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnRequest>>mergedFields [
	"Return a new ZnMultiValueDictionary containing all query fields, if any,
	merged with all ZnApplicationFormUrlEncodedEntity fields, if any,
	preserving multi values for identical keys"

	| fields |
	fields := ZnMultiValueDictionary new.
	self uri hasQuery
		ifTrue: [ fields addAllMulti: self uri query ].
	(self contentType = ZnMimeType applicationFormUrlEncoded and: [ self hasEntity ])
		ifTrue: [ fields addAllMulti: self entity fields ].
	^ fields
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnRequest>>method [
	^ self requestLine method 
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnRequest>>method: method [
	self requestLine method: method
]

{
	#category : #copying,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnRequest>>postCopy [
	super postCopy.
	requestLine := requestLine copy
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnRequest>>printOn: stream [
	super printOn: stream.
	stream nextPut: $(.
	self requestLine printMethodAndUriOn: stream.
	stream nextPut: $)
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnRequest>>readHeaderFrom: stream [
	self requestLine: (ZnRequestLine readFrom: stream).
	super readHeaderFrom: stream
	
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnRequest>>relativeUrl [
	^ self url asRelativeUrl 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnRequest>>requestLine [
	^ requestLine 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnRequest>>requestLine: object [
	requestLine := object
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnRequest>>session [
	"Return the current server session.
	If necessary a new session is created.
	This only returns a value during #handleRequest:"

	^ super session
		ifNil: [ 
			| session |
			session := self server sessionFor: self.
			ZnCurrentServerSession value: session.
			session ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnRequest>>setAccept: object [
	self headers at: 'Accept' put: object asString
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnRequest>>setAcceptEncodingGzip [
	self headers at: 'Accept-Encoding' put: 'gzip'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnRequest>>setAuthorization: authorization [
	self headers at: 'Authorization'  put: authorization
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnRequest>>setBasicAuthenticationUsername: username password: password [
	(username isNil | password isNil)
		ifTrue: [
			self headers removeKey: 'Authorization' ifAbsent: []]
		ifFalse: [
			self setAuthorization: 'Basic ', (ZnUtils encodeBase64: (username, ':', password)) ]

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnRequest>>setCookie: cookie [
	self headers at: 'Cookie' put: cookie

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnRequest>>setIfModifiedSince: reference [
	self headers at: 'If-Modified-Since' put: (ZnUtils httpDate: reference)
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnRequest>>uri [
	^ self requestLine uri 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnRequest>>url [
	^ self uri 
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnRequest>>url: url [
	self requestLine uri: url.
	self headers request: self url
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnRequest>>wantsConnectionClose [
	"Return if the HTTP protocol should close the connection after processing the receiver.
	Overwritten to return true in case of the presense of an explicit connection close request header
	or the absense of a keep alive header when using the old HTTP 1.0 protocol."

	^ self isConnectionClose 
		or: [ self isHttp10 and: [ self isConnectionKeepAlive not ] ]
]

{
	#category : #writing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnRequest>>writeOn: stream [
	| bivalentWriteStream |
	bivalentWriteStream := ZnBivalentWriteStream on: stream.
	self requestLine writeOn: bivalentWriteStream.
	super writeOn: bivalentWriteStream
]
