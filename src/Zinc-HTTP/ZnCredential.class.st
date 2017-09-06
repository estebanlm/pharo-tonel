"
I am ZnCredential, an abstract class representing credentials in a domain and realm.

Part of Zinc HTTP Components.
"
Class {
	#name : #ZnCredential,
	#superclass : #Object,
	#instVars : [
		'domain',
		'realm'
	],
	#category : #Zinc-HTTP-Support,
	#timestamp : 'SvenVanCaekenberghe 12/6/2010 12:56'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnCredential class>>authName [
	self subclassResponsibility 
]

{
	#category : #'accessing class hierarchy',
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnCredential class>>findHandlerFor: anAuthHeader [
	| type i |
	i := anAuthHeader indexOf: Character space.
	type := anAuthHeader copyFrom: 1 to: i - 1.
	self allSubclassesDo: [ :subclass |
		subclass authName = type ifTrue: [ ^ subclass ] ].
	^ nil
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnCredential class>>findRealmFor: anAuthHeader [
	(anAuthHeader substrings: ',') do: [ :token |
		"String>>trimBoth: is a grease method, so not sure if we should be using it."
		(token includesSubstring: 'realm=') 
			ifTrue: [ ^ ((token substrings: '=') second) ] ].
	^ nil
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnCredential>>authToken [
	^ self authTokenForUrl: nil method: nil 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnCredential>>authTokenForUrl: urlObject method: method [
	self subclassResponsibility 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnCredential>>domain [
	^ domain
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnCredential>>domain: anObject [
	domain := anObject
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnCredential>>isComplete [
	^ self subclassResponsibility 
]

{
	#category : #operations,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnCredential>>linkToAuthRequest: aHeader [
	"Link this credential to the WWW-Authenticate request in the provided header. 
	Used for authentication methods which require parameters provided by the server
	(e.g. Digest authentication)."
	realm := self class findRealmFor: aHeader
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnCredential>>realm [
	^ realm ifNil: [ realm := '' ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnCredential>>realm: anObject [
	realm := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnCredential>>setAuthorizationHeader: headers for: urlObject method: method [
	headers at: 'Authorization' put: self authToken
]
