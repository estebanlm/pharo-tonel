"
I am ZnClient, an object to build, execute and process HTTP client requests.

I have a rich protocol to construct requests and to access responses.
I have various error handling options.
I can reuse an existing connection to a specific host:port.
I handle sessions, cookies, redirects and authentication.
I have many options (settings) with sensible defaults.

Simplest possible invocation:

	ZnClient new
		get: 'http://zn.stfx.eu/zn/numbers.txt'.
	
Using some features to make a better HTTP request:

	ZnClient new
		systemPolicy;
		accept: ZnMimeType textPlain;
		http;
		host: 'zn.stfx.eu';
		path: 'zn/numbers.txt';
		contentReader: [ :entity | entity contents lines collect: [ :each | each asNumber ] ];
		ifFail: [ :exception | self inform: 'I am sorry: ', exception printString ];
		get.

Part of Zinc HTTP Components.
"
Class {
	#name : #ZnClient,
	#superclass : #Object,
	#instVars : [
		'request',
		'response',
		'connection',
		'lastUsed',
		'options',
		'session',
		'logLevel'
	],
	#category : #Zinc-HTTP-Client-Server,
	#timestamp : 'SvenVanCaekenberghe 11/8/2011 22:31'
}

{
	#category : #'accessing request',
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnClient>>accept: mimeTypeObject [
	"Set the Accept HTTP header to mimeTypeObject for the current request."

	| mimeType |
	mimeType := mimeTypeObject asZnMimeType.
	self request setAccept: mimeType
]

{
	#category : #'accessing request',
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnClient>>addPart: mimePart [
	"Add mimePart to the multipart/form-data entity of the current request"

	self multiPartFormDataEntity 
		addPart: mimePart 
]

{
	#category : #'accessing request',
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnClient>>addPath: object [
	"Extend the path of the current request with object.
	Either a string or a collection of strings is allowed as argument."
	
	object isString
		ifTrue: [ self addPathSegment: object ] 
		ifFalse: [ object do: [ :each | self addPathSegment: each ] ]
]

{
	#category : #'accessing request',
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnClient>>addPathSegment: pathSegment [
	"Extend the path of the current request with a single pathSegment."
	
	request url 
		ifNil: [ request url: (ZnUrl new addPathSegment: pathSegment; yourself) ]
		ifNotNil: [ request url addPathSegment: pathSegment ]  
]

{
	#category : #'accessing request',
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnClient>>applicationFormUrlEncodedEntity [
	"Initialize the current request to have an application/x-www-form-urlencoded entity.
	Return the existing entity if there is one. 
	Fail if another type was already set."
	
	request hasEntity
		ifTrue: [
			request entity contentType = ZnMimeType applicationFormUrlEncoded 
				ifFalse: [ self error: 'An incompatible entity was already set for the request' ] ]
		ifFalse: [
			request entity: ZnApplicationFormUrlEncodedEntity new ].
	^ request entity
]

{
	#category : #options,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnClient>>autoResetEntityMethods [
	"Return a collection of HTTP methods for which to auto #resetEntity.
	The default is to do this only for HEAD and DELETE, although most people 
	would want it for GET too, but this can be used for forms"
	
	^ self optionAt: #autoResetEntityMethods ifAbsent: [ #(HEAD DELETE) ]
]

{
	#category : #options,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnClient>>autoResetEntityMethods: methods [
	"Set the collection of HTTP methods for which to auto #resetEntity.
	The default is to do this only for HEAD and DELETE, although most people 
	would want it for GET too, but this can be used for forms"
	
	^ self optionAt: #autoResetEntityMethods put: methods
]

{
	#category : #options,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnClient>>beOneShot [
	"Switch me to use connections only for a single request/response cycle.
	By default, I will keep HTTP connections open according to the HTTP 1.1 spec.
	When oneShot is true, I will add a Connection: close header to requests and close after one cycle.
	I cannot be one shot when #streaming is true because the stream would be closed too soon."
	
	self streaming
		ifTrue: [ self error: 'I cannot be one shot when #streaming is true.' ].
	self optionAt: #oneShot put: true   
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnClient>>canReuseConnection [
	self isConnected ifFalse: [ ^ false ].
	lastUsed ifNil: [ ^ false ].
	^ Time totalSeconds - lastUsed < self connectionReuseTimeout
]

{
	#category : #options,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnClient>>certificate [
	"Return the TLS/SSL certificate to be used, or nil for none."
	
	^ self optionAt: #certificate ifAbsent: [ nil ]
]

{
	#category : #options,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnClient>>certificate: anObject [
	"Set the TLS/SSL certificate to be used to anObject, or nil for none.
	See ZdcAbstractSSLSession>>#certificateName: for more information."
	
	^ self optionAt: #certificate put: anObject
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnClient>>cleanupConnection [
	(self isOneShot or: [ request notNil and: [ request wantsConnectionClose ] ])
		ifTrue: [
			self close ]
]

{
	#category : #options,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnClient>>clientId [
	"Return the id for this HTTP client. Defaults to nil.
	Can be used identify different clients' log events."
	
	^ self optionAt: #clientId ifAbsent: [ nil ]
]

{
	#category : #options,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnClient>>clientId: anObject [
	"Set the id for this HTTP client to anObject. Defaults to nil.
	Can be used identify different clients' log events."
	
	^ self optionAt: #clientId put: anObject
]

{
	#category : #cleanup,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnClient>>close [
	"Close any HTTP network connection that I might have kept open."

	connection
		ifNotNil: [ 
			| address port |
			address := [ connection socket remoteAddress ] on: Error do: [ nil ].
			port := [ connection socket remotePort ] on: Error do: [ nil ].
			connection close.
			connection := nil.
			self logConnectionClosedAddress: address port: port ].
	lastUsed := nil
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnClient>>connection [
	"Return the socket stream connection that I am currently using"
	
	^ connection
]

{
	#category : #options,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnClient>>connectionReuseTimeout [
	"Return the timeout in seconds currently used to determine
	if I should try to reuse an open connection. Defaults to 10 seconds."

	^ self optionAt: #connectionReuseTimeout ifAbsent: [ 10 ]
]

{
	#category : #options,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnClient>>connectionReuseTimeout: seconds [
	"Set the timeout used to determine if I should try 
	to reuse an open connection to seconds."

	self optionAt: #connectionReuseTimeout put: seconds
]

{
	#category : #options,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnClient>>contentReader [
	"Return the current content reader, an object conforming 
	to the #value: protocol to convert a response entity
	as used by #contents. Defaults to nil.
	Can be used to parse incoming data."
	
	^ self optionAt: #contentReader ifAbsent: [ nil ]
]

{
	#category : #options,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnClient>>contentReader: object [
	"Set the content reader, an object conforming 
	to the #value: protocol to convert a response entity
	as used by #contents to object.
	Can be used to parse incoming data."

	self optionAt: #contentReader put: object
]

{
	#category : #'accessing request',
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnClient>>contentType: mimeType [
	"Set the content-type of the request entity, provided we have one"
	
	request hasEntity
		ifTrue: [ 
			request entity contentType: mimeType asZnMimeType ]
		ifFalse: [ 
			self error: 'There is no request entity yet, cannot set its content-type' ]
]

{
	#category : #options,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnClient>>contentWriter [
	"Return the current content writer, an object conforming 
	to the #value: protocol to convert an object to a request content entity
	as used by #contents:. Defaults to nil.
	Can be used to format data to be uploaded."

	^ self optionAt: #contentWriter ifAbsent: [ nil ]
]

{
	#category : #options,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnClient>>contentWriter: object [
	"Set current content writer, an object conforming 
	to the #value: protocol to convert an object to a request content entity
	as used by #contents:. Defaults to nil.
	Can be used to format data to be uploaded."

	self optionAt: #contentWriter put: object
]

{
	#category : #'accessing response',
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnClient>>contents [
	"Answer the contents or HTTP payload of the last response, 
	assuming the current request was executed.
	If I have a contentReader, it will be used to compute the contents.
	Otherwise I delegate to ZnResponse>>#contents, unless I am #streaming,
	in which case I return the stream of the streaming entity."

	^ response ifNotNil: [ 
		self contentReader 
			ifNil: [ 
				self streaming
					ifTrue: [  response entity stream ]
					ifFalse: [ response contents ] ]
			ifNotNil: [ :reader | reader value: response entity ] ]  
]

{
	#category : #'accessing request',
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnClient>>contents: object [
	"Set the entity contents of the current request to object.
	I will pass this through my contentWriter if I have one.
	Otherwise I delegate to ZnEntity to convert object to a generic entity."
	
	self contentWriter 
		ifNil: [ self entity: (ZnEntity with: object) ]
		ifNotNil: [ :writer | self entity: (writer value: object) ]
]

{
	#category : #convenience,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnClient>>curl [
	"Create and return a curl command line invocation equivalent to the current request."
	"ZnClient new url: 'http://zn.stfx.eu/zn/small.html'; method: #GET; curl."
	"ZnClient new url: 'http://zn.stfx.eu/echo'; contents: #[2 4 6 8]; method: #POST; curl."
	
	self prepareRequest.
	^ String streamContents: [ :stream |
		request hasEntity ifTrue: [ 
			 stream << 'echo ' << request entity asByteArray hex << ' | xxd -r -p | ' ].
		stream << 'curl'.
		request method = #GET ifFalse: [ stream << ' -X ' << request method ].
		stream space; print: request uri.
		request headersDo: [ :key :value |
			stream << ' -H"' << key << ':' << value << '"' ].
		request hasEntity ifTrue: [ stream << ' --data-binary @-' ] ]
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnClient>>debugPolicy [
	self 
		beOneShot
]

{
	#category : #options,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnClient>>defaultEncoder [
	"The default character encoder to use when none is set in a mime-type"
	
	^ self optionAt: #defaultEncoder ifAbsent: [ ZnDefaultCharacterEncoder value ] 
]

{
	#category : #options,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnClient>>defaultEncoder: encoder [
	"Set the default character encoder to use when none is set in a mime-type"
	
	^ self optionAt: #defaultEncoder put: encoder asZnCharacterEncoder
]

{
	#category : #operations,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnClient>>delete [
	"Execute a HTTP DELETE ont the request set up and return the response #contents."
	
	^ self 
		method: #DELETE; 
		execute
]

{
	#category : #convenience,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnClient>>delete: url [
	"Execute an HTTP DELETE request on url and return the response #contents."
	
	^ self 
		url: url; 
		delete
]

{
	#category : #options,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnClient>>dontFollowRedirects [
	"Disable the default automatic following of HTTP redirects.
	Redirects will be returned as normal responses."

	^ self followRedirects: false
]

{
	#category : #convenience,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnClient>>downloadEntityTo: path [
	"If I hold an entity, download it directly to a file.
	If path describes a file, use that. 
	If path describes a directory, use the last path segment of the URI to construct a file in that directory.
	The URI of the last request is used, which could make a difference when following redirects."

	| target |
	self entity ifNil: [ ^ self ].
	target := ZnFileSystemUtils downloadPathTo: path for: self request uri lastPathSegment.
	ZnFileSystemUtils
		newFileNamed: target
		do: [ :fileStream | 
			fileStream binary.
			self withProgressDo: [ self entity writeOn: fileStream ] ]
]

{
	#category : #convenience,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnClient>>downloadTo: path [
	"Setup streaming, do a GET request and download the entity directly to a file.
	If path describes a file, use that. 
	If path describes a directory, use the last path segment of the URI to construct a file in that directory.
	The URI of the first request is used, which could make a difference when following redirects.
	Return true when successful, false otherwise."

	| target |
	target := ZnFileSystemUtils downloadPathTo: path for: self request uri lastPathSegment.
	self
		streaming: true;
		get.
	^ self isSuccess
		ifTrue: [ 
			self downloadEntityTo: target.
			true ]
		ifFalse: [ false ]
]

{
	#category : #options,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnClient>>enforceAcceptContentType [
	"Return whether or not I enforce that the content type of the
	response matches the content type specified in the accept request header."
	
	^ self optionAt: #enforceAcceptContentType ifAbsent: [ false ]
]

{
	#category : #options,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnClient>>enforceAcceptContentType: boolean [
	"Set whether or not I enforce that the content type of the
	response matches the content type specified in the accept request
	header to boolean."

	self optionAt: #enforceAcceptContentType put: boolean
]

{
	#category : #options,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnClient>>enforceHttpSuccess [
	"Return whether or not I enforce that the response 
	to the request is an HTTP success code."
	
	^ self optionAt: #enforceHttpSuccess ifAbsent: [ false ]
]

{
	#category : #options,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnClient>>enforceHttpSuccess: boolean [
	"Set whether or not I enforce that the response 
	to the request is an HTTP success code to boolean."

	self optionAt: #enforceHttpSuccess put: boolean
]

{
	#category : #'accessing response',
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnClient>>entity [
	"Answer the entity or HTTP payload of the last response, 
	assuming the current request was executed."
	
	^ response ifNotNil: [ response entity ]  
]

{
	#category : #'accessing request',
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnClient>>entity: entity [
	"Set the entity of the current request to enity.
	A ZnEntity subclass or compatible object is expected."
	
	request entity: entity
]

{
	#category : #operations,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnClient>>execute [
	"Execute the currently set up request to generate a response.
	Return the #contents of the response, if any."

	| result |
	self prepareRequest.
	self withProgressDo: [ result := self executeWithTimeout ].
	self prepareNextRequest.
	^ result
]

{
	#category : #'private protocol',
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnClient>>executeRequestResponse [
	| initialMilliseconds requestDuration responseDuration |
	initialMilliseconds := Time millisecondClockValue.
	self writeRequest.
	requestDuration := self logRequestWrittenStarted: initialMilliseconds.
	initialMilliseconds := Time millisecondClockValue.
	self readResponse.
	responseDuration := self logResponseReadStarted: initialMilliseconds.
	self logClientTransactionRequestDuration: requestDuration responseDuration: responseDuration
]

{
	#category : #'private protocol',
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnClient>>executeWithRedirectsRemaining: redirectCount [
	self getConnectionAndExecute.
	response isRedirect 
		ifTrue: [
			(redirectCount > 0 and: [ self followRedirects ])
				ifTrue: [
					self 
						prepareRedirect; 
						executeWithRedirectsRemaining: redirectCount - 1 ]
				ifFalse: [
					self followRedirects 
						ifTrue: [ ZnTooManyRedirects signal ] ] ].
	^ self handleResponse
	
]

{
	#category : #'private protocol',
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnClient>>executeWithRetriesRemaining: retryCount [
	^ [ self executeWithRedirectsRemaining: self maxNumberOfRedirects ]
		on: self retryExceptionSet
		do: [ :exception |
			retryCount > 0
				ifTrue: [
					self 
						handleRetry: exception;
						executeWithRetriesRemaining: retryCount - 1 ]
				ifFalse: [
					exception pass ] ]
]

{
	#category : #'private protocol',
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnClient>>executeWithTimeout [
	^ self withTimeoutDo: [ 
		[ self executeWithRetriesRemaining: self numberOfRetries ]
			on: Error
			do: self ifFailBlock ]
]

{
	#category : #options,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnClient>>followRedirects [
	"Return whether I will automatically following of HTTP redirects.
	This is still subject to #maxNumberOfRedirects. Defaults to true.
	When set to false, redirects will be returned as normal responses."

	^ self optionAt: #followRedirects ifAbsent: [ true ]
]

{
	#category : #options,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnClient>>followRedirects: boolean [
	"Set whether or not I will automatically following of HTTP redirects.
	This is still subject to #maxNumberOfRedirects. Defaults to true.
	When set to false, redirects will be returned as normal responses."

	self optionAt: #followRedirects put: boolean 
]

{
	#category : #'accessing request',
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnClient>>formAdd: association [
	"Add the key->value association to the application/x-www-form-urlencoded 
	entity of the current request."
	
	self applicationFormUrlEncodedEntity 
		add: association 
]

{
	#category : #'accessing request',
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnClient>>formAddAll: keyedCollection [
	"Add all key->value associations of keyedCollection to 
	the application/x-www-form-urlencoded entity of the current request."

	self applicationFormUrlEncodedEntity 
		addAll: keyedCollection 
]

{
	#category : #'accessing request',
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnClient>>formAt: key add: value [
	"Add key equals value to the application/x-www-form-urlencoded 
	entity of the current request. This is for multi-values form fields."

	self applicationFormUrlEncodedEntity 
		at: key add: value
]

{
	#category : #'accessing request',
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnClient>>formAt: key put: value [
	"Set key equal to value in the application/x-www-form-urlencoded 
	entity of the current request."

	self applicationFormUrlEncodedEntity 
		at: key put: value
]

{
	#category : #operations,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnClient>>get [
	"Execute an HTTP GET the request set up and return the response #contents."
	
	^ self 
		method: #GET; 
		execute
]

{
	#category : #convenience,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnClient>>get: url [
	"Execute an HTTP GET request on url and return the response #contents."

	^ self 
		url: url; 
		get
]

{
	#category : #'private protocol',
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnClient>>getConnectionAndExecute [
	self canReuseConnection 
		ifTrue: [ 
			[ ^ self executeRequestResponse; cleanupConnection ] 
				on: Exception 
				do: [ :exception | self logIgnoringExceptionOnReusedConnection: exception; close ] ].
	self newConnectionTo: request url.
	[ self executeRequestResponse ]
		ensure: [ self cleanupConnection ]
]

{
	#category : #'private protocol',
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnClient>>handleResponse [
	self receiveCookies.
	(self enforceHttpSuccess and: [ response isSuccess not ])
		ifTrue: [ 
			(self followRedirects not and: [ response isRedirect ])
				ifFalse: [ (ZnHttpUnsuccessful response: response) signal ] ].
	(self enforceAcceptContentType and: [ self isContentTypeAcceptable not ])
		ifTrue: [ 
			(ZnUnexpectedContentType 
				expected: request accept asZnMimeType 
				actual: response contentType) signal ].
	^ self contents
]

{
	#category : #'private protocol',
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnClient>>handleRetry: exception [
	self logRetrying: exception.
	self close.
	(Delay forSeconds: self retryDelay) wait.

]

{
	#category : #operations,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnClient>>head [
	"Execute a HTTP HEAD on the request set up and return nil."

	^ self 
		method: #HEAD; 
		execute
]

{
	#category : #convenience,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnClient>>head: url [
	"Execute an HTTP HEAD request on url and return nil."

	^ self 
		url: url; 
		head
]

{
	#category : #'accessing request',
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnClient>>headerAddAll: keyedCollection [
	"Add all key/value pairs of keyedCollection as headers.
	Note that #addAllMulti: is used"
	
	request headers 
		addAll: keyedCollection 
]

{
	#category : #'accessing request',
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnClient>>headerAt: key add: value [
	"Add value to key in the HTTP header of the current request.
	This is for multi-values headers."
	
	request headers 
		at: key add: value
]

{
	#category : #'accessing request',
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnClient>>headerAt: key put: value [
	"Set key equals value in the HTTP header of the current request"
	
	request headers 
		at: key put: value   
]

{
	#category : #'accessing request',
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnClient>>host: hostName [
	"Set the host of the current request to hostName."
	
	self url: (ZnUrl new host: hostName; yourself)
]

{
	#category : #'accessing request',
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnClient>>http [
	"Set the scheme of the current request to HTTP."
	
	self url: (ZnUrl new scheme: #http; yourself)
]

{
	#category : #'accessing request',
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnClient>>https [
	"Set the scheme of the current request to HTTPS."
	
	self url: (ZnUrl new scheme: #https; yourself)
]

{
	#category : #options,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnClient>>ifFail: block [
	"Set the block that I will be execute when the request fails.
	The exception of the failure will be passed as argument."
	
	self optionAt: #ifFailBlock put: block
]

{
	#category : #options,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnClient>>ifFailBlock [
	"Return the block that I should execute if the request fails.
	Defaults to #pass-ing the exception up. 
	Accepts an exception as argument."
	
	^ self optionAt: #ifFailBlock ifAbsent: [ [ :exception | exception pass ] ]
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnClient>>initialize [
	request := ZnRequest empty.
	self loggingOn 
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnClient>>interactivePolicy [
	self 
		beOneShot;
		ifFail: [ :exception | 
			self inform: 'HTTP call failed with ', exception printString.
			nil ]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnClient>>isBadRequest [
	"Return true if the last executed HTTP request returned an HTTP bad request response code."
	
	^ response 
		ifNil: [ self error: 'Request not yet executed' ]
		ifNotNil: [ response isBadRequest ]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnClient>>isConnected [
	"Return true if I hold an open HTTP connection."

	^ connection notNil and: [ connection isConnected ]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnClient>>isContentTypeAcceptable [
	"Return true if the contentType of the response of the last executed 
	HTTP request matches the accept header of the request."
	
	^ response 
		ifNil: [ self error: 'Request not yet executed' ]
		ifNotNil: [ 
			response hasEntity not 
				or: [ response contentType matches: request accept asZnMimeType ] ]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnClient>>isCreated [
	"Return true it the last executed HTTP request returned an HTTP created response code."
	
	^ response 
		ifNil: [ self error: 'Request not yet executed' ]
		ifNotNil: [ response isCreated ]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnClient>>isNotFound [
	"Return true it the last executed HTTP request returned an HTTP not found response code."
	
	^ response 
		ifNil: [ self error: 'Request not yet executed' ]
		ifNotNil: [ response isNotFound ]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnClient>>isNotModified [
	"Return true it the last executed HTTP request returned an HTTP not modified response code."
	
	^ response 
		ifNil: [ self error: 'Request not yet executed' ]
		ifNotNil: [ response isNotModified ]
]

{
	#category : #options,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnClient>>isOneShot [
	"Return if I use connections only for a single request/response cycle.
	By default, I will keep HTTP connections open according to the HTTP 1.1 spec.
	When oneShot is true, I will add a Connection: close header to requests."

	^ self optionAt: #oneShot ifAbsent: [ false ]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnClient>>isRedirect [
	"Return true it the last executed HTTP request returned an HTTP redirect response code."
	
	^ response 
		ifNil: [ self error: 'Request not yet executed' ]
		ifNotNil: [ response isRedirect ]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnClient>>isSuccess [
	"Return true it the last executed HTTP request returned an HTTP success response code."
	
	^ response 
		ifNil: [ self error: 'Request not yet executed' ]
		ifNotNil: [ response isSuccess ]
]

{
	#category : #'private logging',
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnClient>>logClientTransactionRequestDuration: requestDuration responseDuration: responseDuration [
	| logEventClass |
	logLevel < 1 ifTrue: [ ^ nil ].
	logEventClass := logLevel = 1
		ifTrue: [ ZnSimplifiedClientTransactionEvent ]
		ifFalse: [ ZnClientTransactionEvent ].
	^ (self newLogEvent: logEventClass)
		request: request;
		requestDuration: requestDuration;
		response: response; 
		responseDuration: responseDuration;
		emit;
		yourself
]

{
	#category : #'private logging',
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnClient>>logConnectionClosedAddress: address port: port [
	logLevel < 3 ifTrue: [ ^ nil ].
	^ (self newLogEvent: ZnClientConnectionClosedEvent)
		address: address;
		port: port;
		emit
]

{
	#category : #'private logging',
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnClient>>logConnectionEstablishedTo: url started: initialMilliseconds [
	| event |
	logLevel < 3 ifTrue: [ ^ nil ].
	(event := self newLogEvent: ZnConnectionEstablishedEvent)
		hostname: url host;
		port: url portOrDefault;
		address: ([ connection socket remoteAddress ] on: Error do: [ nil ]);
		duration: (Time millisecondsSince: initialMilliseconds).
	(ZnNetworkingUtils shouldProxyUrl: url)
		ifTrue: [ event proxy: ZnNetworkingUtils proxyUrl ].
	event emit
]

{
	#category : #'private logging',
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnClient>>logIgnoringExceptionOnReusedConnection: exception [
	logLevel < 3 ifTrue: [ ^ nil ].
	^ (self newLogEvent: ZnClientIgnoringExceptionOnConnectionReuseEvent)
		exception: exception;
		emit
]

{
	#category : #logging,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnClient>>logLevel: integer [
	"Set the log level to integer.
	0 - no logging
	1 - simplified transaction logging
	2 - detailed transaction logging
	3 - log everything"
	
	logLevel := integer
]

{
	#category : #'private logging',
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnClient>>logRedirect: url [
	^ (self newLogEvent: ZnClientFollowingRedirectEvent)
		target: url;
		emit
]

{
	#category : #'private logging',
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnClient>>logRequestWrittenStarted: initialMilliseconds [
	^ logLevel < 3
		ifTrue: [ Time millisecondsSince: initialMilliseconds ]
		ifFalse: [ 
			(self newLogEvent: ZnRequestWrittenEvent)
				request: request;
				duration: (Time millisecondsSince: initialMilliseconds);
				emit;
				duration ]
]

{
	#category : #'private logging',
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnClient>>logResponseReadStarted: initialMilliseconds [
	^ logLevel < 3
		ifTrue: [ Time millisecondsSince: initialMilliseconds ]
		ifFalse: [ 
			(self newLogEvent: ZnResponseReadEvent)
				response: response;
				duration: (Time millisecondsSince: initialMilliseconds);
				emit;
				duration ]
]

{
	#category : #'private logging',
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnClient>>logRetrying: exception [
	logLevel < 3 ifTrue: [ ^ nil ].
	^ (self newLogEvent: ZnClientRetryingEvent)
		exception: exception;
		emit
]

{
	#category : #logging,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnClient>>logToTranscript [
	"Setup logging to the Transcript.
	If logging was completely off, turn it on"

	logLevel isZero ifTrue: [ self loggingOn ].
	ZnLogEvent logToTranscript 
]

{
	#category : #logging,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnClient>>loggingOff [
	"Turn logging completely off - do not generate log events."
	
	self logLevel: 0
]

{
	#category : #logging,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnClient>>loggingOn [
	"Turn full logging on - generate all log events"
	
	self logLevel: 3
]

{
	#category : #options,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnClient>>maxNumberOfRedirects [
	"Return the maximum number of HTTP redirect that will be followed.
	Note that when the #followsRedirect option is false, 
	no redirects will ever be followed regardless of the value of this option.
	Defaults to 3. A ZnTooManyRedirects will be signalled when the count reaches zero."

	^ self optionAt: #maxNumberOfRedirects ifAbsent: [ 3 ]
]

{
	#category : #options,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnClient>>maxNumberOfRedirects: count [
	"Set the maximum number of HTTP redirect that will be followed to count.
	Note that when the #followsRedirect option is false, 
	no redirects will ever be followed regardless of the value of this option.
	A ZnTooManyRedirects will be signalled when the count reaches zero."

	self optionAt: #maxNumberOfRedirects put: count
]

{
	#category : #options,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnClient>>maximumEntitySize [
	"Return the maximum entity size in bytes that I will read from a stream before signalling ZnEntityTooLarge"
	
	^ self optionAt: #maximumEntitySize ifAbsent: [ ZnMaximumEntitySize value ]
]

{
	#category : #options,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnClient>>maximumEntitySize: integer [
	"Set the maximum entity size in bytes that I will read from a stream before signalling ZnEntityTooLarge"
	
	^ self optionAt: #maximumEntitySize put: integer
]

{
	#category : #options,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnClient>>maximumNumberOfDictionaryEntries [
	"Return the maximum number of entries allowed in ZnMutliValueDictionaries before signalling ZnTooManyDictionaryEntries. This protects us from overflow attacks."
		
	^ self
		optionAt: #maximumNumberOfDictionaryEntries
		ifAbsent: [ ZnMaximumNumberOfDictionaryEntries value ]
]

{
	#category : #options,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnClient>>maximumNumberOfDictionaryEntries: anInteger [
	"Set the maximum number of entries allowed in ZnMutliValueDictionaries before signalling ZnTooManyDictionaryEntries. This protects us from overflow attacks."
	
	^ self
		optionAt: #maximumNumberOfDictionaryEntries
		put: anInteger
]

{
	#category : #'accessing request',
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnClient>>method: httpMethod [
	"Set the HTTP method of the current request to httpMethod.
	An uppercase symbol such as #GET is expected.
	Note that for all methods in #autoResetEntityMethods #resetEntity is called automatically,
	since you don't want the entity of a previous request to be sent again"

	(self autoResetEntityMethods includes: httpMethod)
		ifTrue: [ self resetEntity ].
	request method: httpMethod
]

{
	#category : #'accessing request',
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnClient>>multiPartFormDataEntity [
	"Initialize the current request to have an multipart/form-data entity.
	Return the existing entity if there is one. 
	Fail if another type was already set."

	request hasEntity
		ifTrue: [
			(request entity contentType matches: ZnMimeType multiPartFormData)
				ifFalse: [ self error: 'An incompatible entity was already set for the request' ] ]
		ifFalse: [
			request entity: ZnMultiPartFormDataEntity new ].
	^ request entity
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnClient>>newConnectionTo: url [
	| initialMilliseconds |
	self signalHTTPProgress: 'Connecting to ',  url authority.
	initialMilliseconds := Time millisecondClockValue.
	(connection notNil and: [ connection isConnected ]) 
		ifTrue: [ connection close ].
	connection := ZnNetworkingUtils socketStreamToUrl: url.
	url hasSecureScheme
		ifTrue: [ self setupTLSTo: url ].
	self logConnectionEstablishedTo: url started: initialMilliseconds
]

{
	#category : #'private logging',
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnClient>>newLogEvent: logEventClass [
	^ logEventClass new
		clientId: self clientId;
		yourself
]

{
	#category : #options,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnClient>>numberOfRetries [
	"Return how many times I will retry a failed request.
	Defaults to 0."
	
	^ self optionAt: #numberOfRetries ifAbsent: [ 0 ]
]

{
	#category : #options,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnClient>>numberOfRetries: count [
	"Set the number of times I will retry a failed request to count."
	
	self optionAt: #numberOfRetries put: count
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnClient>>optionAt: key ifAbsent: block [
	"Return my option/settings stored under key.
	Execute block if I have no such option/setting.
	This is a generic interface, see my options protocol for specific usages."

	options ifNil: [ ^ block value ].
	^ options at: key ifAbsent: block
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnClient>>optionAt: key put: value [
	"Set my option/setting identified by key to be value.
	This is a generic interface, see my options protocol for specific usages."
	
	options ifNil: [ options := Dictionary new ].
	options at: key put: value
]

{
	#category : #operations,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnClient>>options [
	"Execute an HTTP OPTIONS on the request set up and return the response #contents."
	
	^ self 
		method: #OPTIONS; 
		execute
]

{
	#category : #convenience,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnClient>>options: url [
	"Execute an HTTP OPTIONS request on url and return the response #contents."

	^ self 
		url: url; 
		options
]

{
	#category : #operations,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnClient>>patch [
	"Execute a HTTP PATCH on the request set up and return the response #contents."

	^ self 
		method: #PATCH; 
		execute
]

{
	#category : #convenience,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnClient>>patch: url contents: object [
	"Execute an HTTP PATCH request on url with object as request #contents:
	and return the response #contents."

	^ self 
		url: url; 
		contents: object; 
		patch
]

{
	#category : #'accessing request',
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnClient>>path: pathString [
	"Set the path of the current request to pathString.
	The argument will be merged with of the current/previous request."
	
	self url: pathString
]

{
	#category : #'accessing request',
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnClient>>port: portNumber [
	"Set the port of the current request to portNumber."
	
	self url: (ZnUrl new port: portNumber; yourself)
]

{
	#category : #operations,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnClient>>post [
	"Execute a HTTP POST on the request set up and return the response #contents."

	^ self 
		method: #POST; 
		execute
]

{
	#category : #convenience,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnClient>>post: url contents: object [
	"Execute an HTTP POST request on url with object as request #contents:
	and return the response #contents."

	^ self 
		url: url; 
		contents: object; 
		post
]

{
	#category : #'private protocol',
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnClient>>prepareNextRequest [
	"The request could be modified destructively in the next run,
	but the request can also be part of a log event, hence copy it"
	request := request copy	

]

{
	#category : #'private protocol',
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnClient>>prepareRedirect [
	"We implement the common behavior that POST/PUT redirects turn into GET request
	and that the body data is dropped, except for a 307 or 308 where this is explicitly forbidden.
	Note the cookie handling too."

	| targetUrl |
	targetUrl := self redirectUrl.
	self logRedirect: targetUrl.
	self receiveCookies.
	self prepareNextRequest.
	(#(307 308) includes: response code)
		ifFalse: [  
			(#(POST PUT) includes: request method)
				ifTrue: [ self method: #GET ].
			request hasEntity
				ifTrue: [ request resetEntity: nil ] ].
	self url: targetUrl.
	self sendCookies
]

{
	#category : #'private protocol',
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnClient>>prepareRequest [
	self isOneShot 
		ifTrue: [ request setConnectionClose ].
	request hasEntity
		ifTrue: [ 
			"This is necessary because entities are often modified after first being added empty,
			and a wrong content length is cached at the request level"
			request resetEntity: request entity ].
	self sendCookies.
	self prepareRequestHook 
		ifNotNil: [ :hook | hook value: request ]
]

{
	#category : #options,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnClient>>prepareRequest: hook [
	"Set the current request preparation hook, an object conforming 
	to the #value: protocol that gets the final chance to change a request 
	right before it gets executed. Defaults to nil.
	Typically used to sign requests. See also #prepareRequestHook "

	^ self optionAt: #prepareRequestHook put: hook
]

{
	#category : #options,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnClient>>prepareRequestHook [
	"Return the current request preparation hook, an object conforming 
	to the #value: protocol that gets the final chance to change a request 
	right before it gets executed. Defaults to nil.
	Typically used to sign requests. See also #prepareRequest: "

	^ self optionAt: #prepareRequestHook ifAbsent: [ nil ]
]

{
	#category : #operations,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnClient>>put [
	"Execute a HTTP PUT on the request set up and return the response #contents."

	^ self 
		method: #PUT; 
		execute
]

{
	#category : #convenience,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnClient>>put: url contents: object [
	"Execute an HTTP PUT request on url with object as request #contents:
	and return the response #contents."

	^ self 
		url: url; 
		contents: object; 
		put
]

{
	#category : #'accessing request',
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnClient>>queryAddAll: keyedCollection [
	"Add all key -> value elements of keyedCollection 
	as an HTTP query parameters to the current request."

	keyedCollection keysAndValuesDo: [ :key :value |
		self queryAt: key put: value ]
]

{
	#category : #'accessing request',
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnClient>>queryAt: key add: value [
	"Modify the receiver by adding a query variable key=value.
	If key already exists, value is added to it."

	request url 
		ifNil: [ request url: (ZnUrl new queryAt: key add: value; yourself) ]
		ifNotNil: [ request url queryAt: key add: value ]  
]

{
	#category : #'accessing request',
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnClient>>queryAt: key put: value [
	"Add key equals value as an HTTP query parameter to the current request."
	
	request url 
		ifNil: [ request url: (ZnUrl new queryAt: key put: value; yourself) ]
		ifNotNil: [ request url queryAt: key put: value ]  
]

{
	#category : #'private protocol',
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnClient>>readResponse [
	self signalHTTPProgress: 'Reading response'.
	self withMaximumNumberOfDictionaryEntriesDo: [
		self withDefaultCharacterEncoderDo: [
			response := (#(HEAD CONNECT) includes: request method)
				ifTrue: [ ZnResponse readHeaderFrom: connection ]
				ifFalse: [ 
					self streaming
						ifTrue: [ ZnResponse readStreamingFrom: connection ]
						ifFalse: [ 
							self withMaximumEntitySizeDo: [ ZnResponse readFrom: connection ] ] ] ] ].
	lastUsed := Time totalSeconds
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnClient>>receiveCookies [
	response cookies do: [ :each |
		each defaultDomain: request url host.
		self session cookieJar add: each ]
]

{
	#category : #'private protocol',
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnClient>>redirectUrl [
	"We support relative locations although they are not the standard (http://en.wikipedia.org/wiki/HTTP_location)"

	| redirectUrl |
	redirectUrl := response location asZnUrl.
	^ redirectUrl isAbsolute
		ifTrue: [ redirectUrl ]
		ifFalse: [ redirectUrl inContextOf: request url ]
]

{
	#category : #'accessing request',
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnClient>>request [
	"Return the current request that I am building,
	or the previous request that I executed."
	
	^ request 
]

{
	#category : #'accessing request',
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnClient>>request: aRequest [
	"Replace my current request with aRequest.
	This is a low level operation only needed in special cases."
	
	self validateConnectionForHost: aRequest url host port: aRequest url port.
	request := aRequest
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnClient>>resetCookies [
	session ifNotNil: [ session resetCookies ]
]

{
	#category : #'accessing request',
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnClient>>resetEntity [
	"Make sure that the current request does not hold an entity from a previous request.
	This is sometimes necessary after a POST or PUT. This method will be called automatically
	by #method: for certain requests."
	
	(request notNil and: [ request hasEntity ])
		ifTrue: [ request resetEntity: nil ]
]

{
	#category : #'accessing response',
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnClient>>response [
	"Answer the last response, assuming the current request was executed."

	^ response 
]

{
	#category : #options,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnClient>>retryDelay [
	"Return the number of seconds I will delay retrying a failed request,
	provided I do retry requests. Defaults to 1 seconds."
	
	^ self optionAt: #retryDelay ifAbsent: [ 1 ]
]

{
	#category : #options,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnClient>>retryDelay: seconds [
	"Set the delay before I will delay retrying a failed request to seconds,
	provided I do retry requests."

	self optionAt: #retryDelay put: seconds
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnClient>>retryExceptionSet [
	^ NetworkError, ZnParseError, ZnCharacterEncodingError, ZnUnknownScheme, ZnPortNotANumber
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnClient>>sendCookies [
	| cookies cookiesString |
	session ifNil: [ ^ self ].
	cookies := (session cookieJar cookiesForUrl: request url).
	cookies isEmpty ifTrue: [ ^ self ]. 
	cookiesString := String streamContents: [ :stream |
		cookies
			do: [ :each | each writeNameAndValueOn: stream ]
			separatedBy: [ stream nextPutAll: '; ' ] ].
	request setCookie: cookiesString
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnClient>>session [
	"Return the current HTTP session object that I am using.
	This session object holds cookies among other things."

	^ session ifNil: [ session := ZnUserAgentSession new ]
]

{
	#category : #'accessing request',
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnClient>>setAcceptEncodingGzip [
	"Give the server the hint that we accept gzip content encoding.
	When the server complies, important bandwidth reductions are possible."

	self request setAcceptEncodingGzip
]

{
	#category : #'accessing request',
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnClient>>setBasicAuthenticationUsername: username password: password [
	"Set the username/password for basic authenticationfor the current request."
	
	self request setBasicAuthenticationUsername: username password: password

]

{
	#category : #'accessing request',
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnClient>>setIfModifiedSince: reference [
	"Tell the server that we are only interested in the currently requested URI
	if it was modified since reference, a DateAndTime.
	If the URI was not modified since reference, the response will be #isNotModified."

	self request setIfModifiedSince: reference
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnClient>>setupTLSTo: url [
	(ZnNetworkingUtils shouldProxyUrl: url)
		ifTrue: [ | originalRequest |
			"http://www.ietf.org/rfc/rfc2817.txt (section 5)"
			"https://en.wikipedia.org/wiki/HTTP_tunnel#HTTP_CONNECT_tunneling"
			originalRequest := request copy.
			self method: #CONNECT; writeRequest; readResponse.
			response isSuccess ifFalse: [ self error: 'Failed to CONNECT to proxy for TLS/SSL' ].
			connection := ZnNetworkingUtils secureSocketStreamOn: connection socket.
			request := originalRequest ].
	
	connection sslSession certificateName: self certificate.
	
	[ connection sslSession serverName: url host ] 
		on: PrimitiveFailed 
		do: [ :error | "log it?" ].
		
	connection connect
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnClient>>signalHTTPProgress: message [
	self signalProgress
		ifTrue: [ HTTPProgress signal: message ]
]

{
	#category : #options,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnClient>>signalProgress [
	"Return true if I signal HTTPProgress notifications during execution."
	
	^ self optionAt: #signalProgress ifAbsent: [ false ]
]

{
	#category : #options,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnClient>>signalProgress: boolean [
	"Set whether I will signal HTTPProgress notifications during execution to boolean."
	
	self optionAt: #signalProgress put: boolean
]

{
	#category : #options,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnClient>>streaming [
	"Return whether I will return streaming response objects (see ZnStreamingEntity).
	If true, my users are responsible for actually reading the incoming response entity data stream."
	
	^ self optionAt: #streaming ifAbsent: [ false ]
]

{
	#category : #options,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnClient>>streaming: boolean [
	"Set whether I will return streaming response objects (see ZnStreamingEntity) to boolean.
	If true, my users are responsible for actually reading the incoming response entity data stream.
	I cannot do streaming when #isOneShot is true because the stream would be closed too soon."

	(boolean and: [ self isOneShot ])
		ifTrue: [ self error: 'I cannot do streaming when #isOneShot is true.' ].
	self optionAt: #streaming put: boolean
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnClient>>systemPolicy [
	self 
		enforceHttpSuccess: true;
		enforceAcceptContentType: true;
		numberOfRetries: 2
]

{
	#category : #options,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnClient>>timeout [
	"Return the timeout in seconds for network socket stream operations
	like connecting, reading and writing. Defaults to a global setting."
	
	^ self optionAt: #timeout ifAbsent: [ ZnNetworkingUtils defaultSocketStreamTimeout ]
]

{
	#category : #options,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnClient>>timeout: seconds [
	"Set the timeout for network socket stream operations
	like connecting, reading and writing to seconds."

	self optionAt: #timeout put: seconds
]

{
	#category : #convenience,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnClient>>uploadEntityFrom: path [
	"Set up a ZnStreamingEntity from the binary contents of the file at path.
	The path extension is used to guess the content-type,
	can be overridden using #contentType: if necessary.
	Use the file's length to set the content-length.
	You can then use #put or #post to actually do an upload."
	
	| stream type length |
	stream := ZnFileSystemUtils fileStreamFor: path.
	stream binary.
	type := ZnMimeType forFilenameExtension: (ZnFileSystemUtils extensionFor: path).
	length := ZnFileSystemUtils fileSizeFor: path.
	self entity: (ZnStreamingEntity readFrom: stream usingType: type andLength: length)
]

{
	#category : #'accessing request',
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnClient>>url: urlObject [
	"Modify the URL of the current request object to urlObject.
	This is done using ZnUrl>>#inContextOf: so that either scheme, 
	host, port or path are set and merged.
	Default the URL using ZnUrl>>#asZnUrlWithDefaults to fall back
	to http or the default http/https ports."
	
	| url |
	url := urlObject asZnUrl.
	request url
		ifNotNil: [ url := url inContextOf: request url ].  
	url := url asZnUrlWithDefaults.  
	self validateConnectionForHost: url host port: url port.   
	request url: url.
	url hasUsername & url hasPassword
		ifTrue: [ self setBasicAuthenticationUsername: url username password: url password ]
]

{
	#category : #'accessing request',
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnClient>>username: username password: password [
	"Set the username/password for basic authenticationfor the current request."
	
	self setBasicAuthenticationUsername: username password: password

]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnClient>>validateConnectionForHost: host port: port [
	(connection isNil or: [ request url isNil ]) 
		ifTrue: [ ^ self ].
	(request url host = host and: [ request url port = port ])
		ifFalse: [ self close ]  
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnClient>>withDefaultCharacterEncoderDo: block [
	^ self defaultEncoder = ZnDefaultCharacterEncoder value
			ifTrue: block
			ifFalse: [ 
				ZnDefaultCharacterEncoder 
					value: self defaultEncoder  
					during: block ]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnClient>>withMaximumEntitySizeDo: block [
	^ self maximumEntitySize = ZnMaximumEntitySize value
			ifTrue: block
			ifFalse: [ 
				ZnMaximumEntitySize 
					value: self maximumEntitySize  
					during: block ]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnClient>>withMaximumNumberOfDictionaryEntriesDo: block [
	^ self maximumNumberOfDictionaryEntries = ZnMaximumNumberOfDictionaryEntries value
			ifTrue: block
			ifFalse: [ 
				ZnMaximumNumberOfDictionaryEntries 
					value: self maximumNumberOfDictionaryEntries 
					during: block ]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnClient>>withProgressDo: block [
	^ ZnSignalProgress value
		ifNil: [
			ZnSignalProgress 
				value: self signalProgress 
				during: [ ^ block value ] ]
		ifNotNil: [ 
			block value ]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnClient>>withTimeoutDo: block [
	^ ZnConnectionTimeout value
		ifNil: [
			ZnConnectionTimeout 
				value: self timeout 
				during: [ ^ block value ] ]
		ifNotNil: [ 
			block value ]
]

{
	#category : #'private protocol',
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnClient>>writeRequest [
	self signalHTTPProgress: 'Writing request'.
	self withDefaultCharacterEncoderDo: [ request writeOn: connection ].
	connection flush
]
