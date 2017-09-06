"
I am ZnCharacterWriteStream.
I wrap another binary WriteStream and use a ZnCharacerEncoder to allow Characters to be written.

Part of Zinc HTTP Components.
"
Class {
	#name : #ZnCharacterWriteStream,
	#superclass : #ZnEncodedWriteStream,
	#category : #Zinc-Character-Encoding-Core,
	#timestamp : '<historical>'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:51'
}
ZnCharacterWriteStream>>cr [
	self nextPut: Character cr
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:51'
}
ZnCharacterWriteStream>>crlf [
	self cr; lf
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:51'
}
ZnCharacterWriteStream>>lf [
	self nextPut: Character lf
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:51'
}
ZnCharacterWriteStream>>next: count putAll: collection startingAt: offset [
	"Write count characters from collection starting at offset."
	
	self encoder 
		next: count 
		putAll: collection 
		startingAt: offset 
		toStream: stream 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:51'
}
ZnCharacterWriteStream>>nextPut: object [
	self encoder 
		nextPut: object 
		toStream: stream.
	^ object
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:51'
}
ZnCharacterWriteStream>>print: object [
	object printOn: self
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:51'
}
ZnCharacterWriteStream>>space [
	self nextPut: Character space
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:51'
}
ZnCharacterWriteStream>>tab [
	self nextPut: Character tab
]
