"
I scan / tokenize metadata  (package name, version info, ancestry, dependencies, ...) found in .mcz files.

For example, try:

MCScanner scan:  '(name ''MyPackage-ll.6'' message ''Fix bug xxx'' id ''b21dbd73-f1c3-2746-a3cc-92f1d4edea28'')' readStream
"
Class {
	#name : #MCScanner,
	#superclass : #Object,
	#instVars : [
		'stream'
	],
	#category : #'Monticello-Chunk Format',
	#timestamp : 'LaurentLaffont 3/31/2011 21:08'
}

{
	#category : #'public api',
	#timestamp : ' 8/31/2017 07:17:01'
}
MCScanner class>>scan: aStream [
	^ (self new stream: aStream) next
]

{
	#category : #'public api',
	#timestamp : ' 8/31/2017 07:17:01'
}
MCScanner class>>scanTokens: aString [
	"compatibility"
	^ Array with: (self scan: aString readStream)
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCScanner>>next [
	| c |
	stream skipSeparators.
	c := stream peek.
	c = $# ifTrue: [c := stream next; peek].
	c = $' ifTrue: [^ self nextString].
	c = $( ifTrue: [^ self nextArray].
	c isAlphaNumeric ifTrue: [^ self nextSymbol].
	self error: 'Unknown token type'.	
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCScanner>>nextArray [
	stream next. "("
	^ Array streamContents: [:s |
		[	stream skipSeparators.
			(stream peek = $)) or: [stream atEnd]
		] whileFalse: [ s nextPut: self next ].
		stream next = $) 
			ifFalse: [ self error: 'Unclosed array' ]]
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCScanner>>nextString [
	^ stream nextDelimited: $'
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCScanner>>nextSymbol [
	^ (String streamContents:
		[:s |
		[stream peek isAlphaNumeric] whileTrue: [s nextPut: stream next]]) asSymbol
			
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCScanner>>stream: aStream [
	stream := aStream
]
