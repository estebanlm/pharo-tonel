"
I'm the base class for converting some data from a MIME type to another. Subclasses should implement #mimeDecode and #mimeEncode.
"
Class {
	#name : #MimeConverter,
	#superclass : #Object,
	#instVars : [
		'dataStream',
		'mimeStream'
	],
	#category : #Network-MIME,
	#timestamp : 'LaurentLaffont 6/8/2011 22:18'
}

{
	#category : #convenience,
	#timestamp : ' 8/31/2017 07:16:37'
}
MimeConverter class>>forEncoding: encodingString [
	"Answer a converter class for the given encoding or nil if unknown"
	encodingString ifNil: [^nil].
	^ encodingString asLowercase caseOf: 
		{ ['base64'] -> [Base64MimeConverter].
		  ['quoted-printable'] -> [QuotedPrintableMimeConverter]}
		otherwise: [].

]

{
	#category : #convenience,
	#timestamp : ' 8/31/2017 07:16:37'
}
MimeConverter class>>mimeDecode: aStringOrStream as: contentsClass [
	^ contentsClass streamContents: [:out |
		self mimeDecode: aStringOrStream to: out]
]

{
	#category : #convenience,
	#timestamp : ' 8/31/2017 07:16:37'
}
MimeConverter class>>mimeDecode: aStringOrStream to: outStream  [
	self new
		mimeStream: (aStringOrStream isStream 
				ifTrue: [ aStringOrStream ]
				ifFalse: [ aStringOrStream readStream ]);
		dataStream: outStream;
		mimeDecode
]

{
	#category : #convenience,
	#timestamp : ' 8/31/2017 07:16:37'
}
MimeConverter class>>mimeEncode: aCollectionOrStream [
	^ String streamContents: [:out |
		self mimeEncode: aCollectionOrStream to: out]
]

{
	#category : #convenience,
	#timestamp : ' 8/31/2017 07:16:37'
}
MimeConverter class>>mimeEncode: aCollectionOrStream to: outStream  [
	self new
		dataStream: (aCollectionOrStream isStream 
				ifTrue: [ aCollectionOrStream ]
				ifFalse: [ aCollectionOrStream readStream ]);
		mimeStream: outStream;
		mimeEncode
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:37'
}
MimeConverter>>dataStream [
	^dataStream
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:37'
}
MimeConverter>>dataStream: anObject [
	dataStream := anObject
]

{
	#category : #conversion,
	#timestamp : ' 8/31/2017 07:16:37'
}
MimeConverter>>mimeDecode [
	"Do conversion reading from mimeStream writing to dataStream"

	self subclassResponsibility
]

{
	#category : #conversion,
	#timestamp : ' 8/31/2017 07:16:37'
}
MimeConverter>>mimeEncode [
	"Do conversion reading from dataStream writing to mimeStream"

	self subclassResponsibility
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:37'
}
MimeConverter>>mimeStream [
	^mimeStream
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:37'
}
MimeConverter>>mimeStream: anObject [
	mimeStream := anObject
]
