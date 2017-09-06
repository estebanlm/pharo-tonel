"
ZnUnexpectedContentType is signalled when a different content type (mime type) was expected.

I hold the expected and actual content types.

Part of Zinc HTTP Components. 
"
Class {
	#name : #ZnUnexpectedContentType,
	#superclass : #Error,
	#instVars : [
		'expectedContentType',
		'actualContentType'
	],
	#category : #Zinc-HTTP-Exceptions,
	#timestamp : 'SvenVanCaekenberghe 12/20/2011 12:52'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnUnexpectedContentType class>>expected: expectedMimeType actual: actualMimeType [
	^ self new
		expectedContentType: expectedMimeType;
		actualContentType: actualMimeType;
		yourself
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnUnexpectedContentType>>actualContentType [
	^ actualContentType
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnUnexpectedContentType>>actualContentType: anObject [
	actualContentType := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnUnexpectedContentType>>expectedContentType [
	^ expectedContentType
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnUnexpectedContentType>>expectedContentType: anObject [
	expectedContentType := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnUnexpectedContentType>>messageText [
	"Overwritten to initialiaze the message text to a standard text if it has not yet been set"
	
	^ messageText ifNil: [ messageText := self standardMessageText ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnUnexpectedContentType>>standardMessageText [
	"Generate a standard textual description"
	
	^ String streamContents: [ :stream |
		self expectedContentType ifNotNil: [ :contentType |
			stream << 'expected '; print: contentType ].
		self actualContentType ifNotNil: [ :contentType |
			self expectedContentType ifNotNil: [ stream space ].
			stream << 'actual '; print: contentType ] ]
]
