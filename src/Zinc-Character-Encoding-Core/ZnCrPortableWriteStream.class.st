"
I am a write stream wrapping a second stream. Whenever they ask me to write a cr, a lf, or a crlf I'll instead print a portable new line depending on the platform I'm on.

stream := '' writeStream.
converter := ZnCrPortableWriteStream on: stream.
converter cr; cr; lf; nextPut: $a.
stream contents
"
Class {
	#name : #ZnCrPortableWriteStream,
	#superclass : #WriteStream,
	#instVars : [
		'stream',
		'previous'
	],
	#category : #Zinc-Character-Encoding-Core,
	#timestamp : 'GuillermoPolito 7/28/2017 20:37'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:51'
}
ZnCrPortableWriteStream class>>on: aStream [

	^ self basicNew
		stream: aStream;
		yourself
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:51'
}
ZnCrPortableWriteStream>>newLine [
	previous := nil.
	stream nextPutAll: OSPlatform current lineEnding
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:51'
}
ZnCrPortableWriteStream>>nextPut: aCharacter [

	(String crlf includes: aCharacter )
		ifFalse: [ 
			previous ifNotNil: [ self newLine ].
			^ stream nextPut: aCharacter ].

	previous = Character cr
		ifTrue: [ self newLine ].
	aCharacter ~= Character lf
		ifTrue: [ previous := aCharacter ].
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:51'
}
ZnCrPortableWriteStream>>stream: aWriteStream  [
	stream := aWriteStream
]
