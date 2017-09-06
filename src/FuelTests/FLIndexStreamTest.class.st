"
SUnit tests for index streams
"
Class {
	#name : #FLIndexStreamTest,
	#superclass : #TestCase,
	#category : #FuelTests-Streams,
	#timestamp : 'TorstenBergmann 2/3/2014 23:22'
}

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:30'
}
FLIndexStreamTest>>indexStreamOn: aStream digits: aNumberOfDigits [
	^ FLIndexStream 
		on: aStream
		digits: aNumberOfDigits
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
FLIndexStreamTest>>testCreation [
	self indexStreamOn: #() writeStream digits: 2
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
FLIndexStreamTest>>testNextIndex [

	| indexes indexStream targetStream |
	indexes := #(0 1 128 255).
	targetStream := #() writeStream.

	indexStream := self 
		indexStreamOn: targetStream
		digits: 1.
	indexes do: [:x | indexStream nextIndexPut: x ].

	indexStream := self 
		indexStreamOn: targetStream contents readStream
		digits: 1.

	indexes do: [:x | self assert: indexStream nextIndex = x ].
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
FLIndexStreamTest>>testNextIndexPut [

	| indexStream targetStream |
	targetStream := #() writeStream.
	indexStream := self 
		indexStreamOn: targetStream
		digits: 1.
	
	indexStream nextIndexPut: 0.
	indexStream nextIndexPut: 1.
]
