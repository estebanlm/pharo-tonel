"
I am NetworkSystemSettings, a class side API to manage various system network settings, mostly related to HTTP proxying.
"
Class {
	#name : #NetworkSystemSettings,
	#superclass : #Object,
	#classVars : [
		'BlabEmail',
		'HTTPProxyExceptions',
		'HTTPProxyPort',
		'HTTPProxyServer',
		'LastHTTPProxyExceptions',
		'LastHTTPProxyPort',
		'LastHTTPProxyServer',
		'ProxyPassword',
		'ProxyUser',
		'UseHTTPProxy',
		'UseNetworkAuthentification'
	],
	#category : #Network-Kernel,
	#timestamp : '<historical>'
}

{
	#category : #settings,
	#timestamp : ' 8/31/2017 07:16:32'
}
NetworkSystemSettings class>>addHttpProxyException: domainName [
	"Add a (partial, wildcard) domain name to the list of proxy exceptions"
	"HTTPSocket addProxyException: '*.online.disney.com'."

	self httpProxyExceptions add: domainName
]

{
	#category : #settings,
	#timestamp : ' 8/31/2017 07:16:32'
}
NetworkSystemSettings class>>blabEmail [
	^ BlabEmail ifNil: [ BlabEmail := '' ]
]

{
	#category : #settings,
	#timestamp : ' 8/31/2017 07:16:32'
}
NetworkSystemSettings class>>blabEmail: aBlabEmailString [
	BlabEmail := aBlabEmailString
]

{
	#category : #settings,
	#timestamp : ' 8/31/2017 07:16:32'
}
NetworkSystemSettings class>>httpProxyExceptions [
	"Return a list of partial, wildcard domain name strings that define which servers should not be proxied"

	^ HTTPProxyExceptions ifNil: [ HTTPProxyExceptions := OrderedCollection new ]
]

{
	#category : #settings,
	#timestamp : ' 8/31/2017 07:16:32'
}
NetworkSystemSettings class>>httpProxyPort   [
	"Return the HTTP proxy port to use, an Integer"
	
	^ HTTPProxyPort ifNil: [ HTTPProxyPort := 80 ]
]

{
	#category : #settings,
	#timestamp : ' 8/31/2017 07:16:32'
}
NetworkSystemSettings class>>httpProxyPort: aPortNumber [
	"Set the HTTP Proxy port to use to aPortNumber, use nil to reset"
	
	aPortNumber = HTTPProxyPort ifTrue: [ ^ self ].
	LastHTTPProxyPort := HTTPProxyPort.
	HTTPProxyPort := aPortNumber

]

{
	#category : #settings,
	#timestamp : ' 8/31/2017 07:16:32'
}
NetworkSystemSettings class>>httpProxyServer [
	"Return the hostname of the HTTP proxy server to use, a String.
	Can be empty, when no HTTP proxy should be used."
	
	^ HTTPProxyServer ifNil: [ '' ]
]

{
	#category : #settings,
	#timestamp : ' 8/31/2017 07:16:32'
}
NetworkSystemSettings class>>httpProxyServer: aServerName [
	"Set the hostname of the HTTP proxy server to use to aServerName.
	Can be nil or empty, when no HTTP proxy should be used."

	aServerName = HTTPProxyServer ifTrue: [ ^ self ].
	LastHTTPProxyServer := HTTPProxyServer.
	HTTPProxyServer := aServerName ifNotNil: [ aServerName trimBoth ]

]

{
	#category : #settings,
	#timestamp : ' 8/31/2017 07:16:32'
}
NetworkSystemSettings class>>isAnExceptionFor: url [
	"Return true when the host of url matches any of our HTTP proxy exceptions, else return false"

	 ^ self isHttpProxyException: url host
]

{
	#category : #settings,
	#timestamp : ' 8/31/2017 07:16:32'
}
NetworkSystemSettings class>>isHttpProxyException: serverName [
	"Return true when serverName matches any of our HTTP proxy exceptions, else return false"

	^ self httpProxyExceptions anySatisfy: [ :domainName | domainName match: serverName ]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:32'
}
NetworkSystemSettings class>>lastHTTPProxyPort [
	^ LastHTTPProxyPort ifNil: [ LastHTTPProxyPort := HTTPProxyPort ]

]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:32'
}
NetworkSystemSettings class>>lastHTTPProxyServer [
	^ LastHTTPProxyServer ifNil: [ LastHTTPProxyServer := HTTPProxyServer ]

]

{
	#category : #settings,
	#timestamp : ' 8/31/2017 07:16:32'
}
NetworkSystemSettings class>>manageHttpProxyExceptions [
	^ LastHTTPProxyExceptions ifNil:[ LastHTTPProxyExceptions := ''].

]

{
	#category : #settings,
	#timestamp : ' 8/31/2017 07:16:32'
}
NetworkSystemSettings class>>manageHttpProxyExceptions: aStringWithExceptions [
	self removeAllHttpProxyExceptions.
	aStringWithExceptions	ifNotNil:[
		LastHTTPProxyExceptions := aStringWithExceptions.
		( ';' split: aStringWithExceptions) do: [
			:domain  | 
			self addHttpProxyException: domain
		].
	].
]

{
	#category : #settings,
	#timestamp : ' 8/31/2017 07:16:32'
}
NetworkSystemSettings class>>networkSettingsOn: aBuilder  [
	<systemsettings> 
	(aBuilder group: #network) 
		label: 'Network';
		description: 'All network related settings';
		noOrdering;
		with: [ 
			(aBuilder setting: #useHTTPProxy)      
				label: 'Use HTTP proxy' ;   
				noOrdering;
		 		description: 'If checked then the you will be able to set a port number and a server name. If unchecked, then no http proxy is used.';
				with: [
					(aBuilder setting: #httpProxyPort)
						label: 'Port' ;
						description: 'The HTTP proxy port'.
					(aBuilder setting: #httpProxyServer)
						label: 'Server' ;
						description: 'The HTTP proxy server (i.e. proxy.univ-brest.fr)'.
					(aBuilder setting: #manageHttpProxyExceptions)
						label: 'Exceptions' ;
						target: NetworkSystemSettings;
						description: 'Domains to avoid to proxy (separated by ;)'
				].
			(aBuilder setting: #useNetworkAuthentification) 
				label: 'Proxy authentication' ;
				noOrdering;
		 		description: 'If checked then you will be able to enter a user name and a password for network authentification. Store  HTTP 1.0 basic authentication credentials. Note: this is an ugly hack that stores your password in your image.  It''s just enought to get you going if you use a firewall that requires authentication';
				with: [
					(aBuilder setting: #proxyUser)
						label: 'User name' ;
						description: 'The proxy user name'.
					(aBuilder setting: #proxyPassword)
						type: #Password;
						label: 'Password' ;
						description: 'The user password'].
			(aBuilder setting: #blabEmail)
				label: 'Blab email' ;
				ghostHelp: 'somebody@some.where';
				description: 'Enter blab email of the form ''somebody@some.where''. It can be empty']
]

{
	#category : #settings,
	#timestamp : ' 8/31/2017 07:16:32'
}
NetworkSystemSettings class>>proxyPassword [
	"Return the HTTP proxy password to use, if any. Can be empty."

	^ ProxyPassword 
		ifNil: [ '' ]
		ifNotNil: [ ProxyPassword base64Decoded ]
]

{
	#category : #settings,
	#timestamp : ' 8/31/2017 07:16:32'
}
NetworkSystemSettings class>>proxyPassword: aPassword [
	"Set the HTTP proxy password. Can be empty or nil to reset"
	
	ProxyPassword := aPassword ifNotNil: [ aPassword base64Encoded ]

]

{
	#category : #settings,
	#timestamp : ' 8/31/2017 07:16:32'
}
NetworkSystemSettings class>>proxyUser [
	"Return the HTTP proxy user to use, if any. Can be empty."

	^ ProxyUser
		ifNil: [ '' ]
		ifNotNil: [ ProxyUser base64Decoded ]
]

{
	#category : #settings,
	#timestamp : ' 8/31/2017 07:16:32'
}
NetworkSystemSettings class>>proxyUser: aUser [
	"Set the HTTP proxy user. Can be empty or nil to reset"
	
	ProxyUser := aUser ifNotNil: [ aUser base64Encoded ]


]

{
	#category : #settings,
	#timestamp : ' 8/31/2017 07:16:32'
}
NetworkSystemSettings class>>removeAllHttpProxyExceptions [
	HTTPProxyExceptions removeAll.
]

{
	#category : #settings,
	#timestamp : ' 8/31/2017 07:16:32'
}
NetworkSystemSettings class>>removeHttpProxyException: domainName [
	"Remove a (partial, wildcard) domain name from the list of proxy exceptions"

	self httpProxyExceptions remove: domainName ifAbsent: []
]

{
	#category : #settings,
	#timestamp : ' 8/31/2017 07:16:32'
}
NetworkSystemSettings class>>useHTTPProxy [
	"Should an HTTP proxy be used ? This is a global switch."

	^ UseHTTPProxy ifNil: [ UseHTTPProxy := false ]
]

{
	#category : #settings,
	#timestamp : ' 8/31/2017 07:16:32'
}
NetworkSystemSettings class>>useHTTPProxy: aBoolean [
	"Set whether an HTTP proxy should be used. This is a global switch."

	UseHTTPProxy = aBoolean ifTrue: [ ^ self ].
	UseHTTPProxy := aBoolean.
	self useHTTPProxy
		ifTrue: [
			self httpProxyPort: self lastHTTPProxyPort.
			self httpProxyServer: self lastHTTPProxyServer ]
		ifFalse: [
			self httpProxyPort: nil.
			self httpProxyServer: nil ]
]

{
	#category : #settings,
	#timestamp : ' 8/31/2017 07:16:32'
}
NetworkSystemSettings class>>useNetworkAuthentification [
	"Should authentication be used when accessing the HTTP proxy ?
	This is a switch over username/password."

	^ UseNetworkAuthentification ifNil: [ UseNetworkAuthentification := false ]
]

{
	#category : #settings,
	#timestamp : ' 8/31/2017 07:16:32'
}
NetworkSystemSettings class>>useNetworkAuthentification: aBoolean [
	"Set whether authentication should be used when accessing the HTTP proxy.
	This is a switch over username/password."

	UseNetworkAuthentification := aBoolean
]
