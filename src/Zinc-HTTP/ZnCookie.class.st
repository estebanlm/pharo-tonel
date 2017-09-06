"
I represent an HTTP Cookie token.

Part of Zinc HTTP Components.
"
Class {
	#name : #ZnCookie,
	#superclass : #Object,
	#instVars : [
		'attributes'
	],
	#category : #Zinc-HTTP-Support,
	#timestamp : 'SvenVanCaekenberghe 12/7/2010 00:01'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnCookie class>>fromString: aString [
	^ self new 
		fromString: aString; 
		yourself
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnCookie class>>fromString: aString for: urlObject [
	| cookie |
	cookie := self fromString: aString.
	"Ensures a domain value if none provided by the cookie"
	cookie defaultDomain: urlObject host.
	^ cookie
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnCookie class>>name: nameString value: value [
	^ self new
		name: nameString;
		value: value;
		yourself
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnCookie>>= aCookie [
	(aCookie isKindOf: self class) ifFalse: [ ^ false ].
	^ (aCookie name = self name) & (aCookie path = self path) & (aCookie domain = self domain)
	
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnCookie>>defaultDomain: aDomain [
	self domain ifNil: [ self domain: aDomain ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnCookie>>domain [
	^ attributes at: 'domain' ifAbsent: [ nil ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnCookie>>domain: aDomain [
	attributes at: 'domain' put: aDomain
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnCookie>>expires [
	^ attributes at: 'expires' ifAbsent: [ nil ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnCookie>>expires: anExpiration [
	attributes at: 'expires' put: anExpiration
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnCookie>>expiresTimeStamp [
	self expires ifNil: [ ^ DateAndTime now + 1 day ].
	^ ZnUtils parseHttpDate: self expires
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnCookie>>extraAttributes [
	"Answer all attributes except name and value"
	^ attributes associationsSelect: [ :ea | (ea key = 'name' or: [ ea key = 'value' ]) not ]
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnCookie>>fromString: aString [
	| tokens val data i |
	tokens := aString substrings: ';'.
	i := tokens first indexOf: $=.
	val := tokens first copyFrom: 1 to: i - 1.
	data := tokens first copyFrom: i + 1 to: tokens first size. 
	self name: val trimBoth; value: data trimBoth.
	2 to: tokens size do: [ :index | 
		self readAttribute: (tokens at: index) ]
]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnCookie>>fullString [
	^ String streamContents: [ :stream | 
		self writeOn: stream ]
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnCookie>>hash [
	^ (self name hash bitXor: self path hash) bitXor: self domain hash
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnCookie>>httponly [
	"This is not an RFC cookie attribute, but a supplement found in MS Internet Explorer and supported in PHP.
	 See http://msdn.microsoft.com/en-us/library/ms533046.aspx"
	^ attributes at: 'httponly' ifAbsent: [ false ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnCookie>>httponly: aBoolean [
	attributes at: 'httponly' put: aBoolean
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnCookie>>initialize [
	attributes := Dictionary new.
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnCookie>>isExpired [
	^ (self expiresTimeStamp asUTC < DateAndTime now asUTC) or: [ self expires = 0 ]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnCookie>>isInDomain: urlObject [
	| domain |
	domain := (self domain beginsWith: '.')
		ifTrue: [ self domain copyFrom: 2 to: self domain size ]
		ifFalse: [ self domain ].
	^ urlObject host includesSubstring: domain
	
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnCookie>>isInPath: urlObject [
	^ urlObject pathPrintString includesSubstring: self path
	
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnCookie>>maxage [
	^ self expires
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnCookie>>name [
	^ attributes at: 'name'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnCookie>>name: aName [
	attributes at: 'name' put: aName
]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnCookie>>nameValueString [
	^ String streamContents: [ :stream | 
		self writeNameAndValueOn: stream ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnCookie>>path [
	^ attributes at: 'path' ifAbsent: [ '/' ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnCookie>>path: aPath [
	attributes at: 'path' put: aPath
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnCookie>>printOn: stream [
	self writeOn: stream
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnCookie>>readAttribute: aToken [
	| i key data |
	i := aToken indexOf: $=.
	i > 0
		ifTrue: [
			key := (aToken copyFrom: 1 to: i - 1) trimBoth asLowercase.
			data := (aToken copyFrom: i + 1 to: aToken size) trimBoth ]
		ifFalse: [ 
			key := (aToken copyFrom: 1 to: aToken size) trimBoth asLowercase.
			data := true ].
	attributes at: key put: data
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnCookie>>secure [
	^ attributes at: 'secure' ifAbsent: [ false ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnCookie>>secure: aBoolean [
	attributes at: 'secure' put: aBoolean
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnCookie>>value [
	^ attributes at: 'value' ifAbsent: [ nil ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnCookie>>value: aValue [
	attributes at: 'value' put: aValue
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnCookie>>writeExtraAttributesOn: aStream [
	self extraAttributes
		associationsDo: [ :ea | 
			aStream
				nextPutAll: '; ';
				nextPutAll: ea key.
			(ea value isKindOf: Boolean)
				ifFalse: [ 
					aStream
						nextPutAll: '=';
						nextPutAll: ea value ] ]
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnCookie>>writeNameAndValueOn: aStream [
	aStream
		nextPutAll: self name;
		nextPutAll: '=';
		nextPutAll: self value
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnCookie>>writeOn: aStream [
	self
		writeNameAndValueOn: aStream;
		writeExtraAttributesOn: aStream 
]
