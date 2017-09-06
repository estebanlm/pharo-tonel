"
I am ZnEncodedWriteStream, an abstract support class for write streams on a binary encoded wrapped stream.

Part of Zinc HTTP Components
"
Class {
	#name : #ZnEncodedWriteStream,
	#superclass : #ZnEncodedStream,
	#category : #Zinc-Character-Encoding-Core,
	#timestamp : 'SvenVanCaekenberghe 1/26/2016 10:21'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:51'
}
ZnEncodedWriteStream>><< collection [
	^ self nextPutAll: collection
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:51'
}
ZnEncodedWriteStream>>flush [
	stream flush
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:51'
}
ZnEncodedWriteStream>>isBinary [
	^ false
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:51'
}
ZnEncodedWriteStream>>next: count putAll: collection	 [
	self 
		next: count 
		putAll: collection 
		startingAt: 1
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:51'
}
ZnEncodedWriteStream>>next: count putAll: collection startingAt: offset [
	"Write count items from collection starting at offset.
	This is an inefficient abstract implementation writing one by one."
	
	0 to: count - 1 do: [ :each | 
		self nextPut: (collection at: offset + each) ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:51'
}
ZnEncodedWriteStream>>nextPut: anObject [
	self subclassResponsibility
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:51'
}
ZnEncodedWriteStream>>nextPutAll: collection [
	self 
		next: collection size 
		putAll: collection 
		startingAt: 1
]
