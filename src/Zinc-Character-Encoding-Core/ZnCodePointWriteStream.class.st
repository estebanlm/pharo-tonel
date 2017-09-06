"
I am ZnCodePointWriteStream.
I wrap another binary WriteStream and use a ZnCharacerEncoder to allow Integer code points to be written.

Part of Zinc HTTP Components.
"
Class {
	#name : #ZnCodePointWriteStream,
	#superclass : #ZnEncodedWriteStream,
	#category : #Zinc-Character-Encoding-Core,
	#timestamp : 'SvenVanCaekenberghe 1/26/2016 11:08'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:51'
}
ZnCodePointWriteStream>>nextPut: object [
	self encoder 
		nextPutCodePoint: object 
		toStream: stream.
	^ object
]
