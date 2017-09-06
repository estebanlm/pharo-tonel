"
I am ZnCodePointReadStream.
I wrap another binary ReadStream and use a ZnCharacerEncoder to allow Integer code points to be read.

I am not positionable, but I do allow a one code point peek using a one code point internal buffer.

Part of Zinc HTTP Components.

"
Class {
	#name : #ZnCodePointReadStream,
	#superclass : #ZnEncodedReadStream,
	#category : #Zinc-Character-Encoding-Core,
	#timestamp : 'SvenVanCaekenberghe 1/26/2016 11:09'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:51'
}
ZnCodePointReadStream>>collectionSpecies [
	^ Array
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:51'
}
ZnCodePointReadStream>>nextElement [
	^ self encoder nextCodePointFromStream: stream
]
