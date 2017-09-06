Extension {
	#name : #ExternalData
}

{
	#category : #'*UnifiedFFI',
	#timestamp : ' 8/31/2017 05:26:10'
}
ExternalData>>+ offset  [
	"Pointer aritmetic, it allows to move the pointer as in C.
	 But obviously, it only applies to actual external addresses."
	self getHandle isExternalAddress 
		ifFalse: [ self error: 'You cannot apply pointer aritmetic to a non external address' ].
	^ self species
		fromHandle: (self getHandle + offset)
		type: type
]

{
	#category : #'*UnifiedFFI',
	#timestamp : ' 8/31/2017 05:26:10'
}
ExternalData>>asInteger [
	^ self getHandle asInteger
]

{
	#category : #'*UnifiedFFI',
	#timestamp : ' 8/31/2017 05:26:10'
}
ExternalData>>copyFrom: start to: stop [
	^ self getHandle copyFrom: start to: stop
]

{
	#category : #'*UnifiedFFI',
	#timestamp : ' 8/31/2017 05:26:10'
}
ExternalData>>printOn: stream  [
	stream << $( << type asString << $). 
	self getHandle printOn: stream.
]

{
	#category : #'*UnifiedFFI',
	#timestamp : ' 8/31/2017 05:26:10'
}
ExternalData>>readString [
	self isNull ifTrue: [ ^ nil ].
	^ self fromCString
]

{
	#category : #'*UnifiedFFI',
	#timestamp : ' 8/31/2017 05:26:10'
}
ExternalData>>readStringUTF8 [
	"Assume that the receiver represents a C string containing UTF8 characters and convert 
	 it to a Smalltalk string."
	| stream index char |
	
	self isNull ifTrue: [ ^ nil ].
	
	type isPointerType ifFalse: [self error: 'External object is not a pointer type.'].
	stream := WriteStream on: ByteArray new.
	index := 1.
	[(char := handle unsignedByteAt: index) = 0 ] whileFalse: [
		stream nextPut: char.
		index := index + 1].
	^ ZnCharacterEncoder utf8 decodeBytes: stream contents
]

{
	#category : #'*UnifiedFFI',
	#timestamp : ' 8/31/2017 05:26:10'
}
ExternalData>>value [
	^ self asInteger
]
