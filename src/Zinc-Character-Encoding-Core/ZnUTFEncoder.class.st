"
I am ZnUTFEncoder. I am a ZnCharacterEncoder. My subclasses deal with the full range of Unicode character code points.
"
Class {
	#name : #ZnUTFEncoder,
	#superclass : #ZnCharacterEncoder,
	#category : #Zinc-Character-Encoding-Core,
	#timestamp : 'SvenVanCaekenberghe 1/7/2016 14:44'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:51'
}
ZnUTFEncoder class>>handlesEncoding: string [
	"Return true when my instances handle the encoding described by string"
	
	^ false
]

{
	#category : #convenience,
	#timestamp : ' 8/31/2017 07:16:51'
}
ZnUTFEncoder>>decodeBytes: bytes [
	"Overridden to prevent the automagic switch from ByteString to WideString 
	and the slow #becomeForward: in there. See also #decodeBytesIntoWideString:"
	
	| byteStream |
	byteStream := bytes readStream.
	^ String streamContents: [ :stream |
		[ byteStream atEnd ] whileFalse: [ | char |
			char := self nextFromStream: byteStream.
			(char isOctetCharacter not and: [ stream originalContents isWideString not ])
				ifTrue: [ | wideString position |
					position := stream position.
					wideString := WideString from: stream originalContents.
					stream on: wideString; setFrom: position + 1 to: position ].
			stream nextPut: char ] ] 
]

{
	#category : #convenience,
	#timestamp : ' 8/31/2017 07:16:51'
}
ZnUTFEncoder>>decodeBytesIntoWideString: bytes [
	"Variant of #decodeBytes: that is faster when you know upfront 
	that a WideString is probably needed"

	| byteStream |
	byteStream := bytes readStream.
	^ WideString streamContents: [ :stream |
		[ byteStream atEnd ] whileFalse: [
			stream nextPut: (self nextFromStream: byteStream) ] ] 
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:51'
}
ZnUTFEncoder>>isSurrogateCodePoint: codePoint [
	"Surrogate Code Points should not be encoded or decoded because they are not Unicode scalar values"
	
	^ codePoint between: 16rD800 and: 16rDFFF
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:51'
}
ZnUTFEncoder>>maximumUTFCode [
	^ 16r10FFFF
]
