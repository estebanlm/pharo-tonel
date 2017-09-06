"
I am ZnResponse, representing an HTTP Response 
consisting of a status line, headers and an optional entity (body).
I am a ZnMessage.
I can be used for generating and parsing.

Part of Zinc HTTP Components.
"
Class {
	#name : #ZnResponse,
	#superclass : #ZnMessage,
	#instVars : [
		'statusLine'
	],
	#category : #Zinc-HTTP-Core,
	#timestamp : 'SvenVanCaekenberghe 1/18/2011 10:59'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnResponse class>>accepted [
	^ self statusLine: ZnStatusLine accepted
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnResponse class>>badRequest: request [
	| message |
	message := String streamContents: [ :out |
		out << 'Bad Request '; << request method; space.
		request uri printPathQueryFragmentOn: out ].
	^ self 
		badRequest: request 
		entity: (ZnEntity textCRLF: message)
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnResponse class>>badRequest: request entity: entity [
	^ (self statusLine: ZnStatusLine badRequest)
		entity: entity;
		yourself
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnResponse class>>created: url [
	^ self 
		created: url 
		entity: (ZnEntity textCRLF: 'Created ' , url asString)
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnResponse class>>created: url entity: entity [
	^ (self statusLine: ZnStatusLine created)
		setLocation: url asString;
		entity: entity;
		yourself
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnResponse class>>methodNotAllowed: request [
	| message |
	message := String streamContents: [ :out |
		out << 'Method Not Allowed '; << request method; space.
		request uri printPathQueryFragmentOn: out ].
	^ self 
		methodNotAllowed: request
		entity: (ZnEntity textCRLF: message)
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnResponse class>>methodNotAllowed: request entity: entity [
	^ (self statusLine: ZnStatusLine methodNotAllowed)
		entity: entity;
		yourself
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnResponse class>>noContent [
	^ self statusLine: ZnStatusLine noContent
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnResponse class>>notFound: url [
	^ self
		notFound: url
		entity: (ZnEntity textCRLF: 'Not Found ' , url asZnUrl pathQueryFragmentPrintString)
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnResponse class>>notFound: url entity: entity [
	^ (self statusLine: ZnStatusLine notFound)
		entity: entity;
		yourself
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnResponse class>>notModified [
	^ self statusLine: ZnStatusLine notModified
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnResponse class>>ok: entity [
	^ (self statusLine: ZnStatusLine ok)
		entity: entity;
		yourself
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnResponse class>>redirect: url [
	^ self
		redirect: url
		entity: (ZnEntity textCRLF: 'Redirect ' , url asString)
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnResponse class>>redirect: url entity: entity [
	^ (self statusLine: ZnStatusLine redirect)
		setLocation: url asString;
		entity: entity;
		yourself
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnResponse class>>serverError: string [
	^ self serverErrorWithEntity: (ZnEntity textCRLF: string)
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnResponse class>>serverErrorWithEntity: entity [
	^ (self statusLine: ZnStatusLine internalServerError)
		entity: entity;
		yourself
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnResponse class>>statusCode: httpResponeCode [
	^ self statusLine: (ZnStatusLine code: httpResponeCode)
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnResponse class>>statusLine: statusLine [
	^ self new
		statusLine: statusLine;
		headers: ZnHeaders defaultResponseHeaders;
		yourself
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnResponse class>>unauthorized [
	^ self unauthorized: 'Basic realm=ZincHTTPComponents'
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnResponse class>>unauthorized: authString [
	^ self
		unauthorized: authString
		entity: (ZnEntity textCRLF: 'Unauthorized')
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnResponse class>>unauthorized: authString entity: entity [
	^ (self statusLine: ZnStatusLine unauthorized)
		setWWWAuthenticate: authString;
		entity: entity;
		yourself
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnResponse>>= other [
	^ super = other and: [ self statusLine = other statusLine ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnResponse>>addCookie: cookie [
	self headers at: 'Set-Cookie' add: cookie fullString

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnResponse>>code [
	^ self statusLine code
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnResponse>>cookies [
	| value cookies |
	value := self headers at: 'Set-Cookie' ifAbsent: [ ^ #() ].
	cookies := value isString
		ifTrue: [ Array with: value ]
		ifFalse: [ value ].
	^ cookies collect: [ :each | ZnCookie fromString: each ]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnResponse>>entityReaderOn: stream [
	"Reading undefined content is allowed for responses"
	
	^ (super entityReaderOn: stream)  
		allowReadingUpToEnd;
		yourself
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnResponse>>hasContentEncoding [
	^ self headers includesKey: 'Content-Encoding'
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnResponse>>hasTransferEncoding [
	^ self headers includesKey: 'Transfer-Encoding'
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnResponse>>hash [
	^ super hash bitXor: self status hash
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnResponse>>isAuthenticationRequired [
	^ self code = 401 
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnResponse>>isBadRequest [
	^ self code = 400
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnResponse>>isCreated [
	^ self code = 201
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnResponse>>isError [
	^self code > 399
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnResponse>>isInformational [
	^ self code between: 100 and: 199
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnResponse>>isNoContent [
	^ self code = 204
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnResponse>>isNotFound [
	^ self code = 404 
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnResponse>>isNotModified [
	^ self code = 304
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnResponse>>isRedirect [
	^ #(301 302 303 307) includes: self code
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnResponse>>isSuccess [
	^ #(200 201 202 204) includes: self code
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnResponse>>location [
	^ self headers at: 'Location'
]

{
	#category : #copying,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnResponse>>postCopy [
	super postCopy.
	statusLine := statusLine copy
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnResponse>>printOn: stream [
	super printOn: stream.
	stream nextPut: $(.
	self statusLine printCodeAndReasonOn: stream.
	self hasEntity ifTrue: [ 
		stream space.
		self entity printContentTypeAndLengthOn: stream ].
	stream nextPut: $)
	
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnResponse>>readEntityFrom: stream [
	(self isInformational or: [ self isNoContent or: [ self isNotModified ] ])
		ifFalse: [ super readEntityFrom: stream ]
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnResponse>>readHeaderFrom: stream [
	self statusLine: (ZnStatusLine readFrom: stream).
	super readHeaderFrom: stream
	
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnResponse>>setConnectionCloseFor: request [
	request wantsConnectionClose 
		ifTrue: [ self setConnectionClose ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnResponse>>setContentEncodingGzip [
	self headers at: 'Content-Encoding' put: 'gzip'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnResponse>>setKeepAliveFor: request [
	(request isHttp10 and: [ request isConnectionKeepAlive ])
		ifTrue: [ self setConnectionKeepAlive ]
	
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnResponse>>setLocation: uriString [
	self headers at: 'Location' put: uriString
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnResponse>>setTransferEncodingChunked [
	self headers 
		at: 'Transfer-Encoding' put: 'chunked';
		clearContentLength
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnResponse>>setWWWAuthenticate: string [
	self headers at: 'WWW-Authenticate' put: string
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnResponse>>status [
	^ self statusLine code
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnResponse>>statusLine [
	^ statusLine
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnResponse>>statusLine: object [
	statusLine := object
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnResponse>>useConnection: connection [
	"Hook method that can be overwritten to give subclasses the chance to 
	keep using connection in the current thread/process after the server wrote the response"
]

{
	#category : #writing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnResponse>>writeOn: stream [
	| bivalentWriteStream |
	bivalentWriteStream := ZnBivalentWriteStream on: stream.
	self statusLine writeOn: bivalentWriteStream.
	super writeOn: bivalentWriteStream
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnResponse>>wwwAuthenticate [
	^ self headers at: 'WWW-Authenticate'
]
