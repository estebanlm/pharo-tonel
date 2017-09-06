"
I am ZnEndianSensitiveUTFEncoder.
I am a ZnCharacterEncoder.
I add support for UTF encodings that are sensitive to endianness.
The default is big endian.
"
Class {
	#name : #ZnEndianSensitiveUTFEncoder,
	#superclass : #ZnUTFEncoder,
	#instVars : [
		'endianness'
	],
	#category : #Zinc-Character-Encoding-Core,
	#timestamp : 'SvenVanCaekenberghe 1/7/2016 13:14'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:51'
}
ZnEndianSensitiveUTFEncoder class>>handlesEncoding: string [
	"Return true when my instances handle the encoding described by string"
	
	^ false
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:51'
}
ZnEndianSensitiveUTFEncoder class>>newForEncoding: string [
	"Return a new character encoder object for an encoding described by string.
	Try to infer endianness from string, defaulting to big endian."
	
	| encoder |
	encoder := self new.
	(string asLowercase endsWith: 'be') ifTrue: [ encoder beBigEndian ].
	(string asLowercase endsWith: 'le') ifTrue: [ encoder beLittleEndian ].
	^ encoder
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 07:16:51'
}
ZnEndianSensitiveUTFEncoder>>= anObject [
	^ super = anObject and: [ self endianness == anObject endianness ]
]

{
	#category : #initialize,
	#timestamp : ' 8/31/2017 07:16:51'
}
ZnEndianSensitiveUTFEncoder>>beBigEndian [
	endianness := #big
]

{
	#category : #initialize,
	#timestamp : ' 8/31/2017 07:16:51'
}
ZnEndianSensitiveUTFEncoder>>beLittleEndian [
	endianness := #little
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:51'
}
ZnEndianSensitiveUTFEncoder>>byteOrderMark [
	^ 16rFEFF
]

{
	#category : #convenience,
	#timestamp : ' 8/31/2017 07:16:51'
}
ZnEndianSensitiveUTFEncoder>>encodeStringWithByteOrderMark: string [
	"Encode string and return the resulting byte array.
	Always add a Unicode byte order mark (BOM) in front."
	
	^ ByteArray streamContents: [ :stream |
		self nextPutByteOrderMarkToStream: stream.
		self next: string size putAll: string startingAt: 1 toStream: stream ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:51'
}
ZnEndianSensitiveUTFEncoder>>endianness [
	^ endianness
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 07:16:51'
}
ZnEndianSensitiveUTFEncoder>>hash [
	^ super hash bitXor: self endianness hash
]

{
	#category : #initialize,
	#timestamp : ' 8/31/2017 07:16:51'
}
ZnEndianSensitiveUTFEncoder>>initialize [
	endianness := #big
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:51'
}
ZnEndianSensitiveUTFEncoder>>isBigEndian [
	^ endianness = #big
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:51'
}
ZnEndianSensitiveUTFEncoder>>isLittleEndian [
	^ endianness = #little
]

{
	#category : #convenience,
	#timestamp : ' 8/31/2017 07:16:51'
}
ZnEndianSensitiveUTFEncoder>>nextPutByteOrderMarkToStream: stream [
	self write16BitWord: self byteOrderMark toStream: stream 
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:51'
}
ZnEndianSensitiveUTFEncoder>>printOn: stream [
	super printOn: stream.
	stream nextPut: $(.
	stream nextPutAll: endianness; nextPutAll: ' endian'.
	stream nextPut: $)
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:51'
}
ZnEndianSensitiveUTFEncoder>>swapEndianness [
	self isLittleEndian
		ifTrue: [ self beBigEndian ]
		ifFalse: [ self beLittleEndian ]
]
