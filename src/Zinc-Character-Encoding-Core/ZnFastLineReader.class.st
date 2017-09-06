"
I am ZnFastLineReader, a helper to efficiently read CR, LF or CRLF terminated lines from a character stream.
"
Class {
	#name : #ZnFastLineReader,
	#superclass : #Object,
	#instVars : [
		'readStream',
		'cr',
		'lf',
		'bufferStream'
	],
	#category : #Zinc-Character-Encoding-Core,
	#timestamp : 'SvenVanCaekenberghe 12/11/2014 14:10'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:51'
}
ZnFastLineReader class>>on: characterReadStream [
	^ self new 
		on: characterReadStream;
		yourself
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:51'
}
ZnFastLineReader>>atEnd [
	^ readStream atEnd
]

{
	#category : #initialize,
	#timestamp : ' 8/31/2017 07:16:51'
}
ZnFastLineReader>>beWide [
	self bufferStream: (WideString new: 32) writeStream
]

{
	#category : #initialize,
	#timestamp : ' 8/31/2017 07:16:51'
}
ZnFastLineReader>>bufferStream: characterWriteStream [
	^ bufferStream := characterWriteStream
]

{
	#category : #initialize,
	#timestamp : ' 8/31/2017 07:16:51'
}
ZnFastLineReader>>close [
	readStream close
]

{
	#category : #initialize,
	#timestamp : ' 8/31/2017 07:16:51'
}
ZnFastLineReader>>initialize [
	super initialize.
	cr := Character cr.
	lf := Character lf
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:51'
}
ZnFastLineReader>>linesDo: block [
	[ self atEnd ]
		whileFalse: [ 
			| line |
			line := self nextLine.
			line isNil
				ifFalse: [ block value: line ] ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:51'
}
ZnFastLineReader>>nextLine [
	"Read a CR, LF or CRLF terminated line, returning the contents of the line without the EOL. Return nil when the receiver is #atEnd."
	
	self atEnd ifTrue: [ ^ nil ].
	^ self streamContents: [ :out | | eol char |
		eol := false.
		[ eol ] whileFalse: [ 
			char := readStream next.
			(char isNil or: [ char == lf ])
				ifTrue: [ eol := true ]
				ifFalse: [ 
					char == cr 
						ifTrue: [ eol := true. readStream peekFor: lf ]
						ifFalse: [  out nextPut: char ] ] ] ]
]

{
	#category : #initialize,
	#timestamp : ' 8/31/2017 07:16:51'
}
ZnFastLineReader>>on: characterReadStream [
	readStream := characterReadStream 
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:51'
}
ZnFastLineReader>>streamContents: block [
	"Like readStream collectionSpecies streamContents: block
	but reusing the underlying buffer for improved efficiency"
	
	bufferStream 
		ifNil: [ 
			bufferStream := (readStream collectionSpecies new: 32) writeStream ].
	bufferStream reset.
	block value: bufferStream.
	^ bufferStream contents
]
