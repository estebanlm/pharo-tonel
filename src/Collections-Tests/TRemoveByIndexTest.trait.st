"
A trait for test purposes
"
Trait {
	#name : #TRemoveByIndexTest,
	#traits : '{}',
	#classTraits : '{}',
	#category : #Collections-Tests-Abstract,
	#timestamp : 'TorstenBergmann 2/20/2014 15:35'
}

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
TRemoveByIndexTest>>collectionWith5Elements [
" return a collection of size 5 including 5 elements"
self explicitRequirement
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
TRemoveByIndexTest>>empty [
" return an empty collection"
self explicitRequirement
]

{
	#category : #'tests - fixture',
	#timestamp : ' 8/31/2017 05:26:28'
}
TRemoveByIndexTest>>test0FixtureRemoveByIndexTest [
	self collectionWith5Elements.
	self assert: self collectionWith5Elements size = 5
]

{
	#category : #'tests - removing by index',
	#timestamp : ' 8/31/2017 05:26:28'
}
TRemoveByIndexTest>>testRemoveAt [

| collection element result oldSize |
collection := self collectionWith5Elements .
element := collection at: 3.
oldSize := collection size.

result := collection removeAt: 3.
self assert: result = element .
self assert: collection size = (oldSize - 1).
]

{
	#category : #'tests - removing by index',
	#timestamp : ' 8/31/2017 05:26:28'
}
TRemoveByIndexTest>>testRemoveAtNotPresent [

| |
self should: [self empty removeAt: 2] raise: Error.
]

{
	#category : #'tests - removing by index',
	#timestamp : ' 8/31/2017 05:26:28'
}
TRemoveByIndexTest>>testRemoveFirst [

| collection element result oldSize |
collection := self collectionWith5Elements .
element := collection first.
oldSize := collection size.

result := collection removeFirst.
self assert: result = element .
self assert: collection size = (oldSize - 1).
]

{
	#category : #'tests - removing by index',
	#timestamp : ' 8/31/2017 05:26:28'
}
TRemoveByIndexTest>>testRemoveFirstNElements [

| collection elements result oldSize |
collection := self collectionWith5Elements .
elements := {collection first. collection at:2}.
oldSize := collection size.

result := collection removeFirst: 2.
self assert: result = elements .
self assert: collection size = (oldSize - 2).
]

{
	#category : #'tests - removing by index',
	#timestamp : ' 8/31/2017 05:26:28'
}
TRemoveByIndexTest>>testRemoveFirstNElementsNotPresent [

self should: [self empty removeFirst: 2] raise: Error.
]

{
	#category : #'tests - removing by index',
	#timestamp : ' 8/31/2017 05:26:28'
}
TRemoveByIndexTest>>testRemoveFirstNotPresent [

self should: [self empty removeFirst] raise: Error.
]

{
	#category : #'tests - removing by index',
	#timestamp : ' 8/31/2017 05:26:28'
}
TRemoveByIndexTest>>testRemoveLast [

| collection element result oldSize |
collection := self collectionWith5Elements .
element := collection last.
oldSize := collection size.

result := collection removeLast.
self assert: result = element .
self assert: collection size = (oldSize - 1).
]

{
	#category : #'tests - removing by index',
	#timestamp : ' 8/31/2017 05:26:28'
}
TRemoveByIndexTest>>testRemoveLastNElements [

| collection  result oldSize elements |
collection := self collectionWith5Elements .
elements := {  (collection at: (4)). collection last. }.
oldSize := collection size.


result := (collection removeLast: 2).
self assert: result = elements.
self assert: collection size = (oldSize - 2).
]

{
	#category : #'tests - removing by index',
	#timestamp : ' 8/31/2017 05:26:28'
}
TRemoveByIndexTest>>testRemoveLastNElementsNElements [

self should: [self empty removeLast: 2] raise: Error.
]

{
	#category : #'tests - removing by index',
	#timestamp : ' 8/31/2017 05:26:28'
}
TRemoveByIndexTest>>testRemoveLastNotPresent [

self should: [self empty removeLast] raise: Error.
]
