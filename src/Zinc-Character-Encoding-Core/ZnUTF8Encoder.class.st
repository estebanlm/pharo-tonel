"
I am ZnUTF8Encoder, a concrete subclass of ZnCharacterEncoder.
I implement the variable length UTF-8 encoding and decoding of Unicode according to RFC 3629.

Wikipedia reference http://en.wikipedia.org/wiki/UTF-8

Part of Zinc HTTP Components.
"
Class {
	#name : #ZnUTF8Encoder,
	#superclass : #ZnUTFEncoder,
	#classVars : [
		'ByteASCIISet',
		'ByteUTF8Encoding'
	],
	#category : #Zinc-Character-Encoding-Core
}

{ #category : #accessing }
ZnUTF8Encoder class >> handlesEncoding: string [
	"Return true when my instances handle the encoding described by string"
	
	^ (self canonicalEncodingIdentifier: string) = 'utf8'
]

{ #category : #'class initialization' }
ZnUTF8Encoder class >> initialize [
	| encoder stream |
	ByteASCIISet := ByteArray new: 256.
	ByteUTF8Encoding := Array new: 256.
	encoder := self new.
	stream := ByteArray new writeStream.
	0 to: 255 do: [ :each |
		| bytes |
		stream reset.
		encoder nextPut: (Character value: each) toStream: stream.
		bytes := stream contents.
		(bytes size = 1 and: [ bytes first = each ])
			ifTrue: [
				ByteASCIISet at: each + 1 put: 0 ]
			ifFalse: [  
				ByteASCIISet at: each + 1 put: 1.
				ByteUTF8Encoding at: each + 1 put: bytes ] ] 
]

{ #category : #accessing }
ZnUTF8Encoder class >> knownEncodingIdentifiers [
	^ #( utf8 )
]

{ #category : #'instance creation' }
ZnUTF8Encoder class >> newForEncoding: string [
	"No further parametrization needed"
	
	^ self new
]

{ #category : #converting }
ZnUTF8Encoder >> backOnStream: stream [
	[ (stream back bitAnd: 2r11000000) == 2r10000000 ] whileTrue
]

{ #category : #converting }
ZnUTF8Encoder >> encodedByteCountForCodePoint: codePoint [
	codePoint < 128 ifTrue: [ ^ 1 ].
	codePoint < 2048 ifTrue: [ ^ 2 ].
	codePoint < 65535 ifTrue: [ ^ 3 ].
	codePoint <= self maximumUTFCode ifTrue: [ ^ 4 ].
	self errorOutsideRange
]

{ #category : #converting }
ZnUTF8Encoder >> encodingLengthFor: byte [
	byte < 128 ifTrue: [ ^ 1 ].
	(byte bitAnd: 2r11100000) == 2r11000000 ifTrue: [ ^ 2 ].
	(byte bitAnd: 2r11110000) == 2r11100000 ifTrue: [ ^ 3 ].
	(byte bitAnd: 2r11111000) == 2r11110000 ifTrue: [ ^ 4 ].
	self errorIllegalLeadingByte
]

{ #category : #'error handling' }
ZnUTF8Encoder >> error: message [
	ZnInvalidUTF8 signal: message
]

{ #category : #'error handling' }
ZnUTF8Encoder >> errorIllegalContinuationByte [
	self error: 'Illegal continuation byte for utf-8 encoding'
]

{ #category : #'error handling' }
ZnUTF8Encoder >> errorIllegalLeadingByte [
	self error: 'Illegal leading byte for utf-8 encoding'
]

{ #category : #'error handling' }
ZnUTF8Encoder >> errorIncomplete [
	self error: 'Incomplete utf-8 encoding'
]

{ #category : #'error handling' }
ZnUTF8Encoder >> errorOverlong [
	self error: 'Overlong encoding (non-shortest form)'
]

{ #category : #private }
ZnUTF8Encoder >> findFirstNonASCIIIn: string startingAt: offset [
	"This calls a fast primitive. Note that string can be a ByteString or ByteArray"
	
	offset > string size ifTrue: [ ^ 0 ].
	^ ByteString 
		findFirstInString: string 
		inSet: ByteASCIISet 
		startingAt: offset
]

{ #category : #accessing }
ZnUTF8Encoder >> identifier [
	^ #utf8
]

{ #category : #convenience }
ZnUTF8Encoder >> next: count putAll: string startingAt: offset toStream: stream [
	"Write count characters from string starting at offset to stream."
	
	string isByteString
		ifTrue: [ self next: count putAllByteString: string startingAt: offset toStream: stream ]
		ifFalse: [ super next: count putAll: string startingAt: offset toStream: stream ]
]

{ #category : #private }
ZnUTF8Encoder >> next: count putAllASCII: string startingAt: offset toStream: stream [
	"Write count bytes from string starting at offset to stream,
	assuming all characters are in the ASCII set and need no translation"
	
	"For now, we don't use the option of mixing ByteString and ByteArray as similar"
	
	| bytes |
	bytes := ByteArray new: count.
	bytes replaceFrom: 1 to: count with: string startingAt: offset.
	stream nextPutAll: bytes
]

{ #category : #private }
ZnUTF8Encoder >> next: count putAllByteString: string startingAt: offset toStream: stream [
	"A faster version when string is a ByteString"
	
	| lastIndex nextIndex |
	lastIndex := offset.
	nextIndex := self findFirstNonASCIIIn: string startingAt: lastIndex.
	(nextIndex = 0 or: [ offset + count <= nextIndex ]) 
		ifTrue: [ 
			^ self next: count putAllASCII: string startingAt: offset toStream: stream ].
	[	nextIndex > lastIndex 
			ifTrue: [
				self next: nextIndex - lastIndex putAllASCII: string startingAt: lastIndex toStream: stream ].
		stream nextPutAll: (ByteUTF8Encoding at: (string byteAt: nextIndex) + 1).
		lastIndex := nextIndex + 1.
		nextIndex := self findFirstNonASCIIIn: string startingAt: lastIndex.
		nextIndex = 0 or: [ offset + count <= nextIndex ] ] whileFalse.
	offset + count <= lastIndex 
		ifFalse: [ 
			self next: offset + count - lastIndex putAllASCII: string startingAt: lastIndex toStream: stream ]
	
]

{ #category : #converting }
ZnUTF8Encoder >> nextCodePointFromStream: stream [
	| code byte next |
	(byte := stream next) < 128
		ifTrue: [ ^ byte ].
	(byte bitAnd: 2r11100000) == 2r11000000
		ifTrue: [ 
			code := byte bitAnd: 2r00011111.
			((next := stream next ifNil: [ self errorIncomplete ]) bitAnd: 2r11000000) == 2r10000000
				ifTrue: [ code := (code bitShift: 6) + (next bitAnd: 2r00111111) ]
				ifFalse: [ ^ self errorIllegalContinuationByte ].
			code < 128 ifTrue: [ self errorOverlong ].
			^ code ].
	(byte bitAnd: 2r11110000) == 2r11100000
		ifTrue: [ 
			code := byte bitAnd: 2r00001111.
			2 timesRepeat: [ 
				((next := stream next ifNil: [ self errorIncomplete ]) bitAnd: 2r11000000) == 2r10000000
					ifTrue: [ code := (code bitShift: 6) + (next bitAnd: 2r00111111) ]
					ifFalse: [ ^ self errorIllegalContinuationByte ] ].
			code < 2048 ifTrue: [ self errorOverlong ].
			(self isSurrogateCodePoint: code) ifTrue: [ self errorOutsideRange ].
			code = 65279 "Unicode Byte Order Mark" ifTrue: [ 
				stream atEnd ifTrue: [ self errorIncomplete ].
				^ self nextCodePointFromStream: stream ].
			^ code ].
	(byte bitAnd: 2r11111000) == 2r11110000
		ifTrue: [ 
			code := byte bitAnd: 2r00000111.
			3 timesRepeat: [ 
				((next := stream next ifNil: [ self errorIncomplete ]) bitAnd: 2r11000000) == 2r10000000
					ifTrue: [ code := (code bitShift: 6) + (next bitAnd: 2r00111111) ]
					ifFalse: [ ^ self errorIllegalContinuationByte ] ].
			code < 65535 ifTrue: [ self errorOverlong ].
			^ code ].
	self errorIllegalLeadingByte
]

{ #category : #converting }
ZnUTF8Encoder >> nextPutCodePoint: codePoint toStream: stream [
	codePoint < 128 ifTrue: [ 
		^ stream nextPut: codePoint ].
	codePoint < 2048 ifTrue: [ 
		^ stream 
			nextPut: (2r11000000 + (codePoint bitShift: -6)); 
			nextPut: (2r10000000 + (codePoint bitAnd: 2r111111)) ].
	(self isSurrogateCodePoint: codePoint) ifTrue: [ self errorOutsideRange ].
	codePoint < 65536 ifTrue: [ 
		^ stream 
			nextPut: (2r11100000 + (codePoint bitShift: -12));
			nextPut: (2r10000000 + ((codePoint bitShift: -6) bitAnd: 2r111111)); 
			nextPut: (2r10000000 + (codePoint bitAnd: 2r111111)) ].
	codePoint <= self maximumUTFCode ifTrue: [ 
		^ stream 
			nextPut: (2r11110000 + (codePoint bitShift: -18));
			nextPut: (2r10000000 + ((codePoint bitShift: -12) bitAnd: 2r111111));
			nextPut: (2r10000000 + ((codePoint bitShift: -6) bitAnd: 2r111111)); 
			nextPut: (2r10000000 + (codePoint bitAnd: 2r111111)) ].
	self errorOutsideRange

]

{ #category : #private }
ZnUTF8Encoder >> optimizedReadInto: string startingAt: offset count: requestedCount fromStream: stream [
	"Read requestedCount characters into string starting at offset,
	returning the number read, there could be less available when stream is atEnd.
	Optimized based on the assumption that most decoded characters will be ASCII.
	I signal a ZnByteStringBecameWideString notification if necessary."
	
	| stringBuffer byteBuffer bytesRead read last next count readStream bytesLeft char |
	stringBuffer := string.
	read := 0.
	"Start by reading the minimum amount of bytes for decoding requestedCount characters"
	byteBuffer := ByteArray new: requestedCount.
	bytesRead := stream readInto: byteBuffer startingAt: 1 count: requestedCount.
	readStream := byteBuffer readStream.
	last := 1.
	next := self findFirstNonASCIIIn: byteBuffer startingAt: last.
	(next = 0 or: [ bytesRead < next ]) 
		ifTrue: [
			"The whole input is ASCII"
			self replace: stringBuffer from: offset to: offset + bytesRead - 1 with: byteBuffer startingAt: 1. 
			^ bytesRead ].
	[	next > last 
			ifTrue: [
				"Copy the ASCII run from last to next"
				count := next - last.
				self replace: stringBuffer from: offset + read to: offset + read + count - 1 with: byteBuffer startingAt: last.
				read := read + count ].
		"Read one UTF-8 encoded non ASCII character"
		readStream position: next - 1.
		count := self encodingLengthFor: readStream peek.
		bytesLeft := bytesRead - next + 1.
		count <= bytesLeft
			ifTrue: [ 
				char := self nextFromStream: readStream ]
			ifFalse: [ | tmpBuffer extraRead |
				tmpBuffer := ByteArray new: count.
				readStream readInto: tmpBuffer startingAt: 1 count: bytesLeft.
				extraRead := stream readInto: tmpBuffer startingAt: bytesLeft + 1 count: count - bytesLeft.
				extraRead = (count - bytesLeft) ifFalse: [ self errorIncomplete ].
				char := self nextFromStream: tmpBuffer readStream ].
		(char isOctetCharacter not and: [ stringBuffer isWideString not ])
			ifTrue: [ stringBuffer := ZnByteStringBecameWideString convert: stringBuffer ].
		stringBuffer at: offset + read put: char.
		last := next + count.
		read := read + 1.
		"Iterate"
		next := self findFirstNonASCIIIn: byteBuffer startingAt: last.
		next = 0 or: [ bytesRead < next ] ] whileFalse.
	bytesRead < last 
		ifFalse: [
			"There is a last ASCII run left" 
			count := bytesRead - last + 1.
			self replace: stringBuffer from: offset + read to: offset + read + count - 1 with: byteBuffer startingAt: last.
			read := read + count ].
	"Try consuming enough input to reach requestedCount since we probably read too little"
	count := requestedCount - read.
	^ read + (self originalReadInto: stringBuffer startingAt: offset + read count: count fromStream: stream)
]

{ #category : #private }
ZnUTF8Encoder >> originalReadInto: string startingAt: offset count: requestedCount fromStream: stream [
	"Read requestedCount characters into string starting at offset,
	returning the number read, there could be less available when stream is atEnd.
	I signal a ZnByteStringBecameWideString notification if necessary"

	| stringBuffer |
	stringBuffer := string.
	0 to: requestedCount - 1 do: [ :count |
		| char |
		stream atEnd ifTrue: [ ^ count ].
		char := self nextFromStream: stream.
		(char isOctetCharacter not and: [ stringBuffer isWideString not ])
			ifTrue: [ stringBuffer := ZnByteStringBecameWideString convert: stringBuffer ].
		stringBuffer at: offset + count put: char ].
	^ requestedCount
]

{ #category : #convenience }
ZnUTF8Encoder >> readInto: string startingAt: offset count: requestedCount fromStream: stream [
	"Read requestedCount characters into string starting at offset,
	returning the number read, there could be less available when stream is atEnd.
	The clean code is in my superclass"

	^ self optimizedReadInto: string startingAt: offset count: requestedCount fromStream: stream
]

{ #category : #private }
ZnUTF8Encoder >> replace: string from: start to: stop with: replacement startingAt: repStart [
	string isByteString
		ifTrue: [ 
			string replaceFrom: start to: stop with: replacement startingAt: repStart ]
		ifFalse: [ 
			| index repOff |
			repOff := repStart - start.
			index := start - 1.
			[ (index := index + 1) <= stop ] 
				whileTrue: [ 
					string at: index put: (replacement at: repOff + index) asCharacter ] ]
]
