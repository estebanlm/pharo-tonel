"
A trait for test purposes
"
Trait {
	#name : #TCopyPartOfSequenceableForMultipliness,
	#traits : '{}',
	#classTraits : '{}',
	#category : #Collections-Tests-Abstract,
	#timestamp : 'TorstenBergmann 2/20/2014 15:33'
}

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
TCopyPartOfSequenceableForMultipliness>>collectionWithSameAtEndAndBegining [
" return a collection with elements at end and begining equals .
(others elements of the collection are not equal to those elements)"
	self explicitRequirement
]

{
	#category : #'tests - fixture',
	#timestamp : ' 8/31/2017 05:26:28'
}
TCopyPartOfSequenceableForMultipliness>>test0FixtureCopyPartOfForMultipliness [
	self collectionWithSameAtEndAndBegining.
	self assert: self collectionWithSameAtEndAndBegining first = self collectionWithSameAtEndAndBegining last.
	self assert: self collectionWithSameAtEndAndBegining size > 1.
	1 to: self collectionWithSameAtEndAndBegining size do: [ :i | 
		i > 1 & (i < self collectionWithSameAtEndAndBegining size)
			ifTrue: [ self deny: (self collectionWithSameAtEndAndBegining at: i) = self collectionWithSameAtEndAndBegining first ] ]
]

{
	#category : #'tests - copying part of sequenceable for multipliness',
	#timestamp : ' 8/31/2017 05:26:28'
}
TCopyPartOfSequenceableForMultipliness>>testCopyAfterLastWithDuplicate [
	| result element  collection |
	collection := self collectionWithSameAtEndAndBegining .
	element := collection  first.
	
	" collectionWithSameAtEndAndBegining first and last elements are equals.
	'copyAfter:' should copy after the last occurence of element :"
	result := collection   copyAfterLast: (element ).
	
	"verifying content: "
	self assert: result isEmpty.


]

{
	#category : #'tests - copying part of sequenceable for multipliness',
	#timestamp : ' 8/31/2017 05:26:28'
}
TCopyPartOfSequenceableForMultipliness>>testCopyAfterWithDuplicate [
	| result element  collection |
	collection := self collectionWithSameAtEndAndBegining .
	element := collection  last.
	
	" collectionWithSameAtEndAndBegining first and last elements are equals.
	'copyAfter:' should copy after the first occurence :"
	result := collection   copyAfter: (element ).
	
	"verifying content: "
	1 to: result size do: 
		[:i |
		self assert: (collection  at:(i + 1 )) = (result at: (i))
		].

	"verify size: "
	self assert: result size = (collection size - 1).
]

{
	#category : #'tests - copying part of sequenceable for multipliness',
	#timestamp : ' 8/31/2017 05:26:28'
}
TCopyPartOfSequenceableForMultipliness>>testCopyUpToLastWithDuplicate [
	| result element  collection |
	collection := self collectionWithSameAtEndAndBegining .
	element := collection  first.
	
	" collectionWithSameAtEndAndBegining first and last elements are equals.
	'copyUpToLast:' should copy until the last occurence :"
	result := collection   copyUpToLast: (element ).
	
	"verifying content: "
	1 to: result size do:
		[:i |
		self assert: (result at: i ) = ( collection at: i )  
		].
	
	self assert: result size = (collection size - 1).


]

{
	#category : #'tests - copying part of sequenceable for multipliness',
	#timestamp : ' 8/31/2017 05:26:28'
}
TCopyPartOfSequenceableForMultipliness>>testCopyUpToWithDuplicate [
	| result element  collection |
	collection := self collectionWithSameAtEndAndBegining .
	element := collection  last.
	
	" collectionWithSameAtEndAndBegining first and last elements are equals.
	'copyUpTo:' should copy until the first occurence :"
	result := collection   copyUpTo: (element ).
	
	"verifying content: "
	self assert: result isEmpty.


]
