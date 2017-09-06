"
A trait for test purposes
"
Trait {
	#name : #TOccurrencesForMultiplinessTest,
	#traits : 'TOccurrencesTest',
	#classTraits : 'TOccurrencesTest classTrait',
	#category : #Collections-Tests-Abstract,
	#timestamp : 'TorstenBergmann 2/20/2014 15:34'
}

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
TOccurrencesForMultiplinessTest>>collectionWithEqualElements [
" return a collecition including atLeast two elements equal"

^ self explicitRequirement.
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
TOccurrencesForMultiplinessTest>>collectionWithoutEqualElements [
	self explicitRequirement
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
TOccurrencesForMultiplinessTest>>elementNotInForOccurrences [
" return an element notIncluded in #collectionWithoutEqualElements"
	self explicitRequirement
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
TOccurrencesForMultiplinessTest>>elementTwiceInForOccurrences [
" return an element included exactly two time in # collectionWithEqualElements"
^ self explicitRequirement
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
TOccurrencesForMultiplinessTest>>empty [
	self explicitRequirement
]

{
	#category : #'tests - fixture',
	#timestamp : ' 8/31/2017 05:26:28'
}
TOccurrencesForMultiplinessTest>>test0FixtureOccurrencesForMultiplinessTest [
	| cpt anElement collection |
	self collectionWithEqualElements.
	self collectionWithEqualElements.
	self elementTwiceInForOccurrences.
	anElement := self elementTwiceInForOccurrences.
	collection := self collectionWithEqualElements.
	cpt := 0.	" testing with identity check ( == ) so that identy collections can use this trait : "
	self collectionWithEqualElements
		do: [ :each | 
			each == self elementTwiceInForOccurrences
				ifTrue: [ cpt := cpt + 1 ] ].
	self assert: cpt = 2
]

{
	#category : #'tests - fixture',
	#timestamp : ' 8/31/2017 05:26:28'
}
TOccurrencesForMultiplinessTest>>test0FixtureOccurrencesTest [
	| tmp |
	self empty.
	self assert: self empty isEmpty.
	self collectionWithoutEqualElements.
	self deny: self collectionWithoutEqualElements isEmpty.
	tmp := OrderedCollection new.
	self collectionWithoutEqualElements
		do: [ :each | 
			self deny: (tmp includes: each).
			tmp add: each ].
	self elementNotInForOccurrences.
	self deny: (self collectionWithoutEqualElements includes: self elementNotInForOccurrences)
]

{
	#category : #'tests - occurrencesOf',
	#timestamp : ' 8/31/2017 05:26:28'
}
TOccurrencesForMultiplinessTest>>testOccurrencesOf [
	| collection |
	collection := self collectionWithoutEqualElements .
	
	collection do: [ :each | self assert: (collection occurrencesOf: each) = 1 ].
]

{
	#category : #'tests - occurrencesOf',
	#timestamp : ' 8/31/2017 05:26:28'
}
TOccurrencesForMultiplinessTest>>testOccurrencesOfEmpty [
	| result |
	result := self empty occurrencesOf: (self collectionWithoutEqualElements anyOne).
	self assert: result = 0
]

{
	#category : #'tests - occurrencesOf for multipliness',
	#timestamp : ' 8/31/2017 05:26:28'
}
TOccurrencesForMultiplinessTest>>testOccurrencesOfForMultipliness [

| collection elem |
collection := self collectionWithEqualElements .
elem := self elementTwiceInForOccurrences .

self assert: (collection occurrencesOf: elem ) = 2.  
]

{
	#category : #'tests - occurrencesOf',
	#timestamp : ' 8/31/2017 05:26:28'
}
TOccurrencesForMultiplinessTest>>testOccurrencesOfNotIn [
	| result |
	result := self collectionWithoutEqualElements occurrencesOf: self elementNotInForOccurrences.
	self assert: result = 0
]
