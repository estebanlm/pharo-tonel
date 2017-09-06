"
A trait for test purposes
"
Trait {
	#name : #TCopySequenceableWithReplacementForSorted,
	#traits : '{}',
	#classTraits : '{}',
	#category : #Collections-Tests-Abstract,
	#timestamp : 'TorstenBergmann 2/20/2014 15:33'
}

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
TCopySequenceableWithReplacementForSorted>>collectionOfSize5 [
" return a collection of size 5"
self explicitRequirement
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
TCopySequenceableWithReplacementForSorted>>empty [
self explicitRequirement.
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
TCopySequenceableWithReplacementForSorted>>replacementCollection [
" return a collection including elements of type 'collectionOfSize5' elements'type"
self explicitRequirement
]

{
	#category : #'tests - fixture',
	#timestamp : ' 8/31/2017 05:26:28'
}
TCopySequenceableWithReplacementForSorted>>test0FixtureCopyWithReplacementForSorted [
	self collectionOfSize5.
	self assert: self collectionOfSize5 size = 5.
	self replacementCollection.
	self deny: self replacementCollection isEmpty.
	self empty.
	self assert: self empty isEmpty
]

{
	#category : #'tests - copying with replacement for sorted',
	#timestamp : ' 8/31/2017 05:26:28'
}
TCopySequenceableWithReplacementForSorted>>testCopyFromToWithForSorted [
| collection result |
collection := self collectionOfSize5 .

" testing that elements to be replaced are removed from the copy :"
result := collection copyReplaceFrom: 1 to: collection size with: self empty .
self assert: result isEmpty.

" testing that replacement elements  are all put into the copy :"
result := collection copyReplaceFrom: 1 to: collection size with: self replacementCollection .
 self replacementCollection do:
	[:each | 
	self assert: (result occurrencesOf: each) = ( self replacementCollection occurrencesOf: each )].

self assert: result size = self replacementCollection size.


]

{
	#category : #'tests - copying with replacement for sorted',
	#timestamp : ' 8/31/2017 05:26:28'
}
TCopySequenceableWithReplacementForSorted>>testCopyReplaceAllWithForSorted [

| collection result |
collection := self collectionOfSize5 .

" testing that elements to be replaced are removed from the copy :"
result := collection copyReplaceAll: collection with: self empty .
self assert: result isEmpty.

" testing that replacement elements  are all put into the copy :"
result := collection copyReplaceAll: collection with: self replacementCollection .
 self replacementCollection do:
	[:each | 
	self assert: (result occurrencesOf: each) = ( self replacementCollection occurrencesOf: each )].

self assert: result size = self replacementCollection size.


]
