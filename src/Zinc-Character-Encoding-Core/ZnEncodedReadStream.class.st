"
I am ZnEncodedReadStream, an abstract support class for read streams on a binary encoded wrapped stream.

Part of Zinc HTTP Components
"
Class {
	#name : #ZnEncodedReadStream,
	#superclass : #ZnEncodedStream,
	#instVars : [
		'peeked'
	],
	#category : #Zinc-Character-Encoding-Core,
	#timestamp : 'SvenVanCaekenberghe 1/26/2016 10:20'
}

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:51'
}
ZnEncodedReadStream>>atEnd [
	^ peeked isNil and: [ stream atEnd ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:51'
}
ZnEncodedReadStream>>contents [
	"This is technically not correct, but it is better than nothing"
	
	^ self upToEnd
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:51'
}
ZnEncodedReadStream>>isBinary [
	^ false
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:51'
}
ZnEncodedReadStream>>next [
	^ peeked
		ifNil: [ 
			stream atEnd ifFalse: [ self nextElement ] ]
		ifNotNil: [ | character |
			character := peeked.
			peeked := nil.
			character ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:51'
}
ZnEncodedReadStream>>next: requestedCount  [
	"Read requestedCount elements into new collection and return it,
	 it could be that less elements were available"

	^ self 
		next: requestedCount 
		into: (self collectionSpecies new: requestedCount)
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:51'
}
ZnEncodedReadStream>>next: requestedCount into: collection [
	"Read requestedCount elements into collection,
	returning a copy if less elements are available"
	
	^ self
		next: requestedCount
		into: collection
		startingAt: 1
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:51'
}
ZnEncodedReadStream>>next: requestedCount into: collection startingAt: offset [
	"Read requestedCount elements into collection starting at offset,
	returning a copy if less elements are available"
	
	| readCount |
	readCount := self 
		readInto: collection 
		startingAt: offset 
		count: requestedCount.
	^ requestedCount = readCount
		ifTrue: [ collection ]
		ifFalse: [ collection copyFrom: 1 to: offset + readCount - 1 ]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:51'
}
ZnEncodedReadStream>>nextElement [
	self subclassResponsibility 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:51'
}
ZnEncodedReadStream>>peek [
	^ peeked
		ifNil: [
			stream atEnd ifFalse: [ peeked := self nextElement ] ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:51'
}
ZnEncodedReadStream>>peekFor: object [
	^ self peek = object
		ifTrue: [ 
			self next.
			true ]
		ifFalse: [ false ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:51'
}
ZnEncodedReadStream>>readInto: collection startingAt: offset count: requestedCount [
	"Read requestedCount elements into collection starting at offset,
	returning the number of elements read, there could be less elements available.
	This is an inefficient abstract implementation, reading one by one."
	
	0 to: requestedCount - 1 do: [ :count | | object |
		(object := self next) ifNil: [ ^ count ].  
		collection at: offset + count put: object ].
	^ requestedCount
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:51'
}
ZnEncodedReadStream>>skip: count [
	count timesRepeat: [ self next ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:51'
}
ZnEncodedReadStream>>upTo: anObject 	 [
	^ self collectionSpecies 
		streamContents: [ :out | | element |
			[ self atEnd or: [ (element := self next) = anObject ] ] whileFalse: [ 
				out nextPut: element ] ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:51'
}
ZnEncodedReadStream>>upToEnd [
	^ self collectionSpecies
		streamContents: [ :collectionStream | 
			[ self atEnd ] whileFalse: [ collectionStream nextPut: self next ] ]
]
