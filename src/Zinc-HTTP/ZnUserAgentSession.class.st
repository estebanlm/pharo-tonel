"
I represent a session store for an HTTP client instance of ZnUserAgent. 

I hold the cookie jar for the session and any authentication credentials used by the client.

Part of Zinc HTTP Components.
"
Class {
	#name : #ZnUserAgentSession,
	#superclass : #Object,
	#instVars : [
		'cookiejar',
		'credentials',
		'currentRealm'
	],
	#category : #Zinc-HTTP-Support,
	#timestamp : 'SvenVanCaekenberghe 12/6/2010 13:04'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnUserAgentSession class>>withCookieJar: aCookieJar [
	^ self new cookiejar: aCookieJar; yourself
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnUserAgentSession>>addCredential: aCredential [
	self credentials at: aCredential domain, '@', aCredential realm put: aCredential 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnUserAgentSession>>cookieJar [
	^ cookiejar ifNil: [ cookiejar := ZnCookieJar new ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnUserAgentSession>>cookiejar: anObject [
	cookiejar := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnUserAgentSession>>credentialAt: aRealm forUrl: urlObject [
	^ self credentials at: urlObject authority, '@', aRealm ifAbsent: [ nil ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnUserAgentSession>>credentials [
	^ credentials ifNil: [ credentials := Dictionary new ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnUserAgentSession>>credentials: anObject [
	credentials := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnUserAgentSession>>credentialsForUrl: urlObject [
	^ self credentials values select: [ :cred | urlObject authority includesSubstring: (cred domain) ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnUserAgentSession>>currentRealm [
	^ currentRealm
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnUserAgentSession>>currentRealm: anObject [
	currentRealm := anObject
]

{
	#category : #operations,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnUserAgentSession>>resetCookies [
	cookiejar ifNotNil: [ cookiejar removeAll ]
]
