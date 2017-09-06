"
I am ZnNullEncoder, a concrete subclass of ZnCharacterEncoder.
I perform no encoding or decoding at all for all characters with a code value below 256.

Note that in principle I could handle Latin1 (ISO-8859-1) or ASCII, although that is not completely correct. To get maximum efficiency, it remains an option.
	
Part of Zinc HTTP Components.
"
Class {
	#name : #ZnNullEncoder,
	#superclass : #ZnCharacterEncoder,
	#category : #Zinc-Character-Encoding-Core,
	#timestamp : 'SvenVanCaekenberghe 6/9/2015 17:08'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:51'
}
ZnNullEncoder class>>handlesEncoding: string [
	"Return true when my instances handle the encoding described by string.
	Note that in principle I could handle latin1 (iso-8859-1) and ASCII, 
	although that is not completely correct. 
	To get maximum efficiency, it remains an option."
	
	^ (self canonicalEncodingIdentifier: string) = 'null'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:51'
}
ZnNullEncoder class>>knownEncodingIdentifiers [
	^ #( null )
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:51'
}
ZnNullEncoder class>>newForEncoding: string [
	"No further parametrization needed"
	
	^ self new
]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 07:16:51'
}
ZnNullEncoder>>backOnStream: stream [
	stream back
]

{
	#category : #convenience,
	#timestamp : ' 8/31/2017 07:16:51'
}
ZnNullEncoder>>decodeBytes: bytes [
	"Overwritten for performance reasons"

	^ bytes asString
]

{
	#category : #convenience,
	#timestamp : ' 8/31/2017 07:16:51'
}
ZnNullEncoder>>encodeString: string [
	"Overwritten for performance reasons"

	^ string asByteArray
]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 07:16:51'
}
ZnNullEncoder>>encodedByteCountFor: character [
	"Overwritten for performance reasons"

	^ 1
]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 07:16:51'
}
ZnNullEncoder>>encodedByteCountForCodePoint: codePoint [
	^ 1
]

{
	#category : #convenience,
	#timestamp : ' 8/31/2017 07:16:51'
}
ZnNullEncoder>>encodedByteCountForCodePoints: codePoints [
	"Overwritten for performance reasons"

	^ codePoints size
]

{
	#category : #convenience,
	#timestamp : ' 8/31/2017 07:16:51'
}
ZnNullEncoder>>encodedByteCountForString: string [
	"Overwritten for performance reasons"

	^ string size
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:51'
}
ZnNullEncoder>>identifier [
	^ #ascii
]

{
	#category : #convenience,
	#timestamp : ' 8/31/2017 07:16:51'
}
ZnNullEncoder>>next: count putAll: string startingAt: offset toStream: stream [
	"Write count bytes from string starting at offset to stream."
	"Overwritten for performance reasons"
	
	| bytes |
	bytes := ByteArray new: count.
	bytes replaceFrom: 1 to: count with: string startingAt: offset.
	stream nextPutAll: bytes
]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 07:16:51'
}
ZnNullEncoder>>nextCodePointFromStream: stream [
	^ stream next
]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 07:16:51'
}
ZnNullEncoder>>nextPutCodePoint: codePoint toStream: stream [
	codePoint < 256
		ifTrue: [ stream nextPut: codePoint ]
		ifFalse: [ self errorOutsideRange ]
]

{
	#category : #convenience,
	#timestamp : ' 8/31/2017 07:16:51'
}
ZnNullEncoder>>readInto: string startingAt: offset count: requestedCount fromStream: stream [
	"Read requestedCount characters into string starting at offset,
	returning the number read, there could be less available when stream is atEnd"
	"Overwritten for performance reasons"

	| byteBuffer readCount |
	byteBuffer := ByteArray new: requestedCount.
	readCount := stream readInto: byteBuffer startingAt: 1 count: requestedCount.
	string replaceFrom: offset to: offset + readCount - 1 with: byteBuffer startingAt: 1.
	^ readCount
]
