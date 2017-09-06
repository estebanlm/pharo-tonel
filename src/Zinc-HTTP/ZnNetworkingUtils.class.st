"
I am ZnNetworkingUtils holding various utilities related to HTTP networking.

My class side is a general API.

My instance side is a factory.

ZnNetworkingUtils default socketStreamClass: SocketStream.
ZnNetworkingUtils default socketStreamClass: ZdcSocketStream.

Part of Zinc HTTP Components.
"
Class {
	#name : #ZnNetworkingUtils,
	#superclass : #Object,
	#instVars : [
		'socketStreamClass',
		'secureSocketStreamClass'
	],
	#classVars : [
		'Default',
		'DefaultSocketStreamTimeout'
	],
	#category : #Zinc-HTTP-Support,
	#timestamp : '<historical>'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnNetworkingUtils class>>default [
	^ Default ifNil: [ Default := self new ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnNetworkingUtils class>>default: instance [
	Default := instance 
]

{
	#category : #constants,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnNetworkingUtils class>>defaultSocketStreamTimeout [
	"Global default timeout in seconds for SocketStream IO"
	
	^ DefaultSocketStreamTimeout
]

{
	#category : #constants,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnNetworkingUtils class>>defaultSocketStreamTimeout: seconds [
	"Global default timeout in seconds for SocketStream IO"
	
	^ DefaultSocketStreamTimeout := seconds
]

{
	#category : #'class initialization',
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnNetworkingUtils class>>initialize [
	"The default will try to use ZdcSocketStream and ZdcSecureSocketStream"
	 
	Default := self new.
	DefaultSocketStreamTimeout := 30
]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnNetworkingUtils class>>ipAddressToString: byteArray [
	^ String streamContents: [ :stream |
			byteArray 
				do: [ :each | stream print: each ] 
				separatedBy: [ stream nextPut: $. ] ]
]

{
	#category : #constants,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnNetworkingUtils class>>listenBacklogSize [
	"Server socket backlog size (number of pending connection waiting to be accepted)"
	
	^ 32
]

{
	#category : #proxy,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnNetworkingUtils class>>proxyAuthorizationHeaderValueToUrl: url [
	"Answer the Proxy-Authorization header value for HTTP access to url, or nil if none"
	
	^ self default proxyAuthorizationHeaderValueToUrl: url  
]

{
	#category : #proxy,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnNetworkingUtils class>>proxyUrl [
	"Answer the host:port URL the HTTP/S proxy"
	
	^ self default proxyUrl
]

{
	#category : #networking,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnNetworkingUtils class>>secureSocketStreamOn: socket [
	^ self default 
		secureSocketStreamOn: socket  
]

{
	#category : #networking,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnNetworkingUtils class>>serverSocketOn: port [
	^ self default 
		serverSocketOn: port  
]

{
	#category : #networking,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnNetworkingUtils class>>serverSocketOn: port interface: address [
	^ self default 
		serverSocketOn: port interface: address 
]

{
	#category : #proxy,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnNetworkingUtils class>>shouldProxyUrl: url [
	"Answer if we should proxy HTTP access to url."
	
	^ self default shouldProxyUrl: url  
]

{
	#category : #constants,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnNetworkingUtils class>>socketBufferSize [
	"Size in bytes for Sockets and SocketStream IO buffers"

	^ 4096
]

{
	#category : #networking,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnNetworkingUtils class>>socketStreamOn: socket [
	^ self default 
		socketStreamOn: socket  
]

{
	#category : #constants,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnNetworkingUtils class>>socketStreamTimeout [
	"Access the current timeout in seconds for SocketStream IO"
	
	^ ZnConnectionTimeout value 
		ifNil: [ self defaultSocketStreamTimeout ]
]

{
	#category : #networking,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnNetworkingUtils class>>socketStreamToUrl: url [
	^ self default
		socketStreamToUrl: url  
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnNetworkingUtils>>bufferSize [
	^ self class socketBufferSize
]

{
	#category : #proxy,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnNetworkingUtils>>httpProxyPassword [
	"Return the password for proxy authorization"
	
	^ NetworkSystemSettings proxyPassword 
]

{
	#category : #proxy,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnNetworkingUtils>>httpProxyPort [
	"Return the port of the proxy server to use"
	
	^ NetworkSystemSettings httpProxyPort
]

{
	#category : #proxy,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnNetworkingUtils>>httpProxyServer [
	"Return the hostname of the proxy server to use"
	
	^ NetworkSystemSettings httpProxyServer
]

{
	#category : #proxy,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnNetworkingUtils>>httpProxyUser [
	"Return the user for proxy authorization"
	
	^ NetworkSystemSettings proxyUser
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnNetworkingUtils>>initialize [
	super initialize.
	self socketStreamClass: (Smalltalk globals at: #ZdcSocketStream ifAbsent: [ SocketStream ]).
	self secureSocketStreamClass: (Smalltalk globals at: #ZdcSecureSocketStream ifAbsent: [ nil ])
]

{
	#category : #proxy,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnNetworkingUtils>>isProxyAuthorizationRequired [
	"Does the proxy require authorization ?"
	
	^ self isProxySet and: [ NetworkSystemSettings useNetworkAuthentification ]
]

{
	#category : #proxy,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnNetworkingUtils>>isProxySet [
	"Should a proxy be used ?"
	
	^ NetworkSystemSettings useHTTPProxy 
]

{
	#category : #proxy,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnNetworkingUtils>>proxyAuthorizationHeaderValueToUrl: url [
	"Answer the Proxy-Authorization header value for HTTP access to url, or nil if none"
	
	^ (self isProxyAuthorizationRequired and: [ self shouldProxyUrl: url ])
		ifTrue: [ 'Basic ', (ZnUtils encodeBase64: (self httpProxyUser, ':', self httpProxyPassword)) ] 
		ifFalse: [ nil ]  
]

{
	#category : #proxy,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnNetworkingUtils>>proxyUrl [
	"System settings do currently not support HTTPS proxies."

	^ ZnUrl new
		scheme: #http;
		host: self httpProxyServer;
		port: self httpProxyPort;
		yourself
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnNetworkingUtils>>secureSocketStreamClass [
	^ secureSocketStreamClass ifNil: [ 
		secureSocketStreamClass := Smalltalk globals at: #ZdcSecureSocketStream ifAbsent: [ nil ] ]
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnNetworkingUtils>>secureSocketStreamClass: anObject [
	secureSocketStreamClass := anObject
]

{
	#category : #public,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnNetworkingUtils>>secureSocketStreamOn: socket [
	| stream |
	stream := self secureSocketStreamClass on: socket.
	self setSocketStreamParameters: stream.  
	^ stream
]

{
	#category : #public,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnNetworkingUtils>>serverSocketOn: port [
	| socket |
	socket := Socket newTCP.
	self setServerSocketOptions: socket.
	socket listenOn: port backlogSize: self class listenBacklogSize.
	socket isValid
		ifFalse: [ self error: 'Cannot create socket on port ', port printString ].
	^ socket
]

{
	#category : #public,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnNetworkingUtils>>serverSocketOn: port interface: address [
	| socket |
	socket := Socket newTCP.
	self setServerSocketOptions: socket.
	socket 
		listenOn: port 
		backlogSize: self class listenBacklogSize 
		interface: address.
	socket isValid
		ifFalse: [ self error: 'Cannot create socket on port ', port printString ].
	^ socket
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnNetworkingUtils>>setServerSocketOptions: socket [
	socket
		setOption: 'TCP_NODELAY' value: 1;
		setOption: 'SO_SNDBUF' value: self class socketBufferSize;
		setOption: 'SO_RCVBUF' value: self class socketBufferSize 
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnNetworkingUtils>>setSocketStreamParameters: stream [
	stream 
		binary;
		shouldSignal: true;
		autoFlush: false;
		bufferSize: self bufferSize;
		timeout: self timeout.

]

{
	#category : #proxy,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnNetworkingUtils>>shouldProxyUrl: url [
	"Even when a proxy is set, some URLs should not be proxied.
	There is no setting for this in the image.
	We exclude localhost and explicit exceptions from being proxied."
	
	self isProxySet ifFalse: [ ^ false ].
	^ url isLocalHost not
		and: [ 
			[ (NetworkSystemSettings isAnExceptionFor: url) not ]
				on: MessageNotUnderstood
				do: [ true ] ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnNetworkingUtils>>socketStreamClass [
	^ socketStreamClass ifNil: [ socketStreamClass := SocketStream ]
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnNetworkingUtils>>socketStreamClass: anObject [
	socketStreamClass := anObject
]

{
	#category : #public,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnNetworkingUtils>>socketStreamOn: socket [
	| stream |
	stream := self socketStreamClass on: socket.
	self setSocketStreamParameters: stream.  
	^ stream
]

{
	#category : #proxy,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnNetworkingUtils>>socketStreamToProxy [
	^ self socketStreamToUrlDirectly: self proxyUrl
]

{
	#category : #public,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnNetworkingUtils>>socketStreamToUrl: url [
	url hasHost ifFalse: [ ZnMissingHost signal ].  
	^ (self shouldProxyUrl: url)
		ifTrue: [ self socketStreamToProxy ] 
		ifFalse: [ self socketStreamToUrlDirectly: url ]
]

{
	#category : #public,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnNetworkingUtils>>socketStreamToUrlDirectly: url [
	| stream address |
	address := NetNameResolver addressForName: url host timeout: self timeout. 
	stream := (self streamClassForScheme: url scheme) 
		openConnectionToHost: address
		port: url portOrDefault
		timeout: self timeout.  
	self setSocketStreamParameters: stream. 
	"note that for TLS/SSL, #connect should be called"
	^ stream
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnNetworkingUtils>>streamClassForScheme: scheme [
	(#(http ws) includes: scheme) ifTrue: [ 
		^ self socketStreamClass ].
	(#(https wss) includes: scheme) ifTrue: [ 
		^ self secureSocketStreamClass ifNil: [
			self error: 'No secure socket stream class set or available' ] ].
	(ZnUnknownScheme scheme: scheme) signal
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnNetworkingUtils>>timeout [
	^ self class socketStreamTimeout
]
