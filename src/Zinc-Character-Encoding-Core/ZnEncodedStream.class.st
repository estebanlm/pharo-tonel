"
I am ZnEncodedStream, an abstract support class for read and write streams on an encoded binary stream.

Part of Zinc HTTP Components
"
Class {
	#name : #ZnEncodedStream,
	#superclass : #Object,
	#instVars : [
		'stream',
		'encoder'
	],
	#category : #Zinc-Character-Encoding-Core,
	#timestamp : 'SvenVanCaekenberghe 1/26/2016 10:17'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:51'
}
ZnEncodedStream class>>defaultEncoder [
	^ ZnUTF8Encoder new
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:51'
}
ZnEncodedStream class>>on: wrappedStream [
	^ self new
		on: wrappedStream;
		yourself
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:51'
}
ZnEncodedStream class>>on: wrappedStream encoding: encoding [
	^ self new
		on: wrappedStream;
		encoding: encoding;
		yourself
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 07:16:51'
}
ZnEncodedStream>>close [
	stream close
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:51'
}
ZnEncodedStream>>encoder [
	^ encoder ifNil: [ encoder := self class defaultEncoder ]
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 07:16:51'
}
ZnEncodedStream>>encoder: characterEncoder [
	encoder := characterEncoder
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 07:16:51'
}
ZnEncodedStream>>encoding: encoding [
	encoder := encoding asZnCharacterEncoder
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 07:16:51'
}
ZnEncodedStream>>on: wrappedStream [
	stream := wrappedStream
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:51'
}
ZnEncodedStream>>wrappedStream [
	^ stream
]
