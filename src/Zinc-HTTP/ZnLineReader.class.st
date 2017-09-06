"
I am ZnLineReader and I help reading CRLF terminated lines from a stream.
I can work on ascii and binary streams doing conversions as necessary.
I limit lines to a maximum length.
I work with a reusable buffer.

Part of Zinc HTTP Components.
"
Class {
	#name : #ZnLineReader,
	#superclass : #Object,
	#instVars : [
		'stream',
		'buffer',
		'position',
		'limit'
	],
	#category : #Zinc-HTTP-Streaming,
	#timestamp : 'SvenVanCaekenberghe 9/27/2010 17:31'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnLineReader class>>on: stream [
	^ self new
		on: stream;
		yourself
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnLineReader>>growBuffer [
	| newBuffer |
	buffer size >= limit 
		ifTrue: [
			(ZnLineTooLong limit: limit) signal ].
	newBuffer := String new: buffer size * 2.
	newBuffer replaceFrom: 1 to: buffer size with: buffer.
	buffer := newBuffer 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnLineReader>>limit: size [
	limit := size
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnLineReader>>nextLine [
	self reset.
	[ self processNext isNil ] whileFalse.
	^ buffer copyFrom: 1 to: position 
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnLineReader>>on: readStream [
	stream := readStream.
	buffer := String new: 64.
	self 
		limit: ZnConstants maximumLineLength; 
		reset
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnLineReader>>processNext [
	| item |
	stream atEnd ifTrue: [ ^ nil ].
	(item := stream next) ifNil: [ ^ nil ].
	stream isBinary ifTrue: [ item := item asCharacter ].
	item == Character lf
		ifTrue: [
			(position > 0 and: [ (buffer at: position) == Character cr ])
				ifTrue: [
					position := position - 1.
					^ nil ] ].
	self store: item.
	^ item
			
	
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnLineReader>>reset [
	position := 0
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnLineReader>>store: item [
	position >= buffer size ifTrue: [ self growBuffer ].
	position := position + 1.
	buffer at: position put: item		
	
]
