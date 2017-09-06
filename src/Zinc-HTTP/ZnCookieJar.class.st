"
I represent a container for storing HTTP Cookies for a client session.

Part of Zinc HTTP Components.
"
Class {
	#name : #ZnCookieJar,
	#superclass : #Object,
	#instVars : [
		'cookies'
	],
	#category : #Zinc-HTTP-Support,
	#timestamp : 'SvenVanCaekenberghe 12/7/2010 00:01'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnCookieJar>>add: aCookie [
	(self removeIfExpired: aCookie) ifTrue: [ ^ nil ].
	self cookies do: [ :cookie |
		cookie = aCookie ifTrue: [ self cookies remove: cookie ] ].
	self cookies add: aCookie
	
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnCookieJar>>cookieAt: aName forUrl: urlObject [
	(self cookiesForUrl: urlObject) do: [ :cookie | cookie name = aName ifTrue: [ ^ cookie ] ].
	^ nil
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnCookieJar>>cookies  [
	^ cookies ifNil: [ cookies := Bag new ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnCookieJar>>cookiesForUrl: urlObject [
	^ self cookies select: [ :cookie | 
		(cookie isExpired not) & (cookie isInDomain: urlObject) & (cookie isInPath: urlObject) ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnCookieJar>>remove: aCookie [
	self cookies remove: aCookie ifAbsent: [ nil ]
]

{
	#category : #operations,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnCookieJar>>removeAll [
	cookies ifNotNil: [ cookies removeAll ]
]

{
	#category : #operations,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnCookieJar>>removeIfExpired: aCookie [
	^ aCookie isExpired 
		ifTrue: [ 
			self remove: aCookie. 
			true ]
		ifFalse: [
			false ]
]
