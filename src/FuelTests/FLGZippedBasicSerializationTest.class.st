"
SUnit tests for basic serialization that is zipped
"
Class {
	#name : #FLGZippedBasicSerializationTest,
	#superclass : #FLBasicSerializationTest,
	#category : #FuelTests,
	#timestamp : 'TorstenBergmann 2/3/2014 23:25'
}

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:30'
}
FLGZippedBasicSerializationTest class>>shouldInheritSelectors  [
	^true
]

{
	#category : #'expected failures',
	#timestamp : ' 8/31/2017 05:26:30'
}
FLGZippedBasicSerializationTest>>expectedFailures [

	^ super expectedFailures, #(testWideString)
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:30'
}
FLGZippedBasicSerializationTest>>setUp [
	super setUp.
	self useGzipInMemoryStream.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
FLGZippedBasicSerializationTest>>testByteArray [

	self assertSerializationEqualityOf: #[1 2 3 4 5 6 7]
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
FLGZippedBasicSerializationTest>>testCompleteBinaryTree [

	| aCollection numberOfLeafs |
	numberOfLeafs := 2 raisedTo: 13.
	aCollection := OrderedCollection new.
	1 to: numberOfLeafs do: [ :i | 
		aCollection add: (
			FLPair new 
				left: (2 * i); 
				right: (2 * i) + 1;
				yourself) ].
	
	[aCollection size > 1] 
		whileTrue: [
			aCollection := aCollection pairsCollect: [ :leftPair :rightPair | 
				FLPair new 
					left: leftPair;
					right: rightPair;
					yourself ] ].

	self assertSerializationEqualityOf: aCollection
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
FLGZippedBasicSerializationTest>>testPairs [

	| pairs |
	pairs := (1 to: 1 << 14) 
		collect: [ :i | 
			FLPair new 
				left: i; 
				right: i+1;
				yourself ].

	self assertSerializationEqualityOf: pairs
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
FLGZippedBasicSerializationTest>>testWideString [

	| anObject |
	anObject := OrderedCollection new.
	600 timesRepeat: [
	       anObject add: (WideString
	               streamContents: [ :stream |
	                       600 timesRepeat: [
	                               stream nextPut: (256 to: 1000) atRandom asCharacter ] ] ) ].
	
	self
		shouldnt: [ self assertSerializationEqualityOf: anObject ]
		raise: Error
]
