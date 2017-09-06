"
I am ZnBasicAuthenticator.
I help servers handle HTTP Basic Authentication.
I implement the required #authenticateRequest:do:

I have a credentials dictionary with username->password associations.

Part of Zinc HTTP Components.
"
Class {
	#name : #ZnBasicAuthenticator,
	#superclass : #Object,
	#instVars : [
		'credentials',
		'realm'
	],
	#category : #Zinc-HTTP-Support,
	#timestamp : 'SvenVanCaekenberghe 9/30/2010 15:37'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnBasicAuthenticator class>>defaultRealm [
	^ 'ZincHTTPComponents'
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnBasicAuthenticator class>>new [
	^ super new 
		initialize;
		yourself
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnBasicAuthenticator class>>username: username password: password [
	^ self new
		atUsername: username putPassword: password;
		yourself
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnBasicAuthenticator class>>username: username password: password realm: realm [
	^ self new
		atUsername: username putPassword: password;
		realm: realm;
		yourself
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnBasicAuthenticator>>atUsername: username putPassword: password [
	credentials at: username put: password
]

{
	#category : #public,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnBasicAuthenticator>>authHeader [
	^ 'Basic realm=', self realm
]

{
	#category : #public,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnBasicAuthenticator>>authenticateRequest: request do: block [
	^ (self isRequestAuthenticated: request)
		ifTrue: [ block value ]
		ifFalse: [ ZnResponse unauthorized: self authHeader ]
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnBasicAuthenticator>>initialize [
	credentials := Dictionary new
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnBasicAuthenticator>>isRequestAuthenticated: request [
	| authorization username password |
	authorization := [ request basicAuthentication ] on: Error do: [ ^ false ].
	username := authorization first.
	password := authorization second.
	^ (credentials at: username ifAbsent: [ nil ]) = password
	
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnBasicAuthenticator>>realm [
	^ realm ifNil: [ realm := self class defaultRealm ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnBasicAuthenticator>>realm: anObject [
	realm := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnBasicAuthenticator>>removeAll [
	credentials removeAll
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnBasicAuthenticator>>removeUsername: username [
	credentials removeKey: username
]
