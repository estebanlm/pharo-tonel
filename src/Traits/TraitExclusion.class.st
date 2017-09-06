"
See comment of my superclass TraitTransformation.
"
Class {
	#name : #TraitExclusion,
	#superclass : #TraitTransformation,
	#instVars : [
		'exclusions'
	],
	#category : #Traits-Composition,
	#timestamp : '<historical>'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitExclusion class>>with: aTraitComposition exclusions: anArrayOfSelectors [
	^self new
		subject: aTraitComposition;
		exclusions: anArrayOfSelectors;
		yourself

]

{
	#category : #composition,
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitExclusion>>- anArrayOfSelectors [
	^TraitExclusion
		with: subject
		exclusions: (anArrayOfSelectors, exclusions asArray)
]

{
	#category : #composition,
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitExclusion>>addExclusionOf: aSymbol [
	self exclusions: (self exclusions copyWith: aSymbol)
]

{
	#category : #enquiries,
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitExclusion>>allSelectors [
	| selectors |
	selectors := self subject allSelectors.
	self exclusions do: [:each |
		selectors remove: each ifAbsent: []].
	^selectors
]

{
	#category : #enquiries,
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitExclusion>>collectMethodsFor: aSelector into: methodDescription [
	(self exclusions includes: aSelector) ifFalse: [
		self subject
			collectMethodsFor: aSelector
			into: methodDescription]
]

{
	#category : #copying,
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitExclusion>>copyTraitExpression [
	^super copyTraitExpression 
		exclusions: self exclusions deepCopy;
		yourself
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitExclusion>>exclusions [
	^exclusions
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitExclusion>>exclusions: aCollection [
	exclusions := aCollection
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitExclusion>>isEmpty [
	^self exclusions isEmpty
]

{
	#category : #copying,
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitExclusion>>postCopy [
	super postCopy.
	exclusions := exclusions copy
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitExclusion>>printOn: aStream [
	super printOn: aStream. 
	aStream
		space;
		nextPut: $-;
		space;
		nextPut: ${.
	self exclusions do: [:each | aStream print: each]
		separatedBy: [aStream nextPutAll: '. '].
	aStream nextPut: $}
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 07:16:25'
}
TraitExclusion>>syntacticallyEquals: aTraitTransformation [
	"Test syntactic equivalence of this trait transformation with another. 
	The order of the exclusions is taken into account. For example, A - { #x. #y } ~= A - { #y. #x }."

	self == aTraitTransformation ifTrue: [ ^ true ].
	self species = aTraitTransformation species ifFalse: [ ^ false ].
	^ self exclusions = aTraitTransformation exclusions
]
