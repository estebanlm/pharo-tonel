"
I am a write stream that write chunks of Strings. That is, pieces of text separated by

!!

symbols
"
Class {
	#name : #ChunkWriteStream,
	#superclass : #DecoratorStream,
	#category : #CodeExport,
	#timestamp : 'GuillermoPolito 6/12/2015 10:04'
}

{
	#category : #writing,
	#timestamp : ' 8/31/2017 07:16:13'
}
ChunkWriteStream>>bang [
	
	decoratedStream nextPut: self terminatorMark
]

{
	#category : #'reflective operations',
	#timestamp : ' 8/31/2017 07:16:13'
}
ChunkWriteStream>>doesNotUnderstand: aMessage [
	"Forward message to decoree"

	^ aMessage sendTo: decoratedStream
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:13'
}
ChunkWriteStream>>nextChunkPut: aString [

	^ self nextPut: aString
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:13'
}
ChunkWriteStream>>nextPut: aString [
    "Append the argument, aString, to the receiver, doubling embedded terminators."
 
    | i remainder terminator | 
    terminator := $!.
    remainder := aString asString.
    [(i := remainder indexOf: terminator) = 0] whileFalse:
        [decoratedStream nextPutAll: (remainder copyFrom: 1 to: i).
        decoratedStream nextPut: terminator.  "double imbedded terminators"
        remainder := remainder copyFrom: i+1 to: remainder size].
    decoratedStream nextPutAll: remainder. 
    aString asString includesUnifiedCharacter ifTrue: [
        decoratedStream nextPut: terminator.
        decoratedStream nextPutAll: ']lang['.
        aString asString writeLeadingCharRunsOn: decoratedStream.
    ].
    decoratedStream nextPut: terminator.
    decoratedStream flush.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:13'
}
ChunkWriteStream>>terminatorMark [
	^$!
]
