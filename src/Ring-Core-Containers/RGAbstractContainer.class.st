"
This is the abstract class for container-based elements.
Elements are separated in groups by kind (e.g classes, methods, pools, etc.)
Subclasses have to define the kind of collection for a particular group of entities.
For a container the use of a dictionary or another collection (e.g. SortedCollection) to store group of elements is independent.


"
Class {
	#name : #RGAbstractContainer,
	#superclass : #RGDefinition,
	#instVars : [
		'elements'
	],
	#category : #Ring-Core-Containers,
	#timestamp : 'VeronicaUquillas 5/12/2011 10:59'
}

{
	#category : #adding/removing,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGAbstractContainer>>addElement: anObject [

	anObject addInContainer: self
]

{
	#category : #adding/removing,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGAbstractContainer>>addElement: anObject in: aCollection [

	aCollection isDictionary
		ifTrue: [ aCollection at: anObject fullName put: anObject ]
		ifFalse:[ aCollection add: anObject ]
]

{
	#category : #'lookup elements',
	#timestamp : ' 8/31/2017 07:17:01'
}
RGAbstractContainer>>elementNamed: elementName [
	| aSymbol found |
	
	aSymbol:= elementName asSymbol.
	elements do:[ :collection| 		
		(found:= self elementNamed: aSymbol in: collection) notNil ifTrue:[ ^found ] ].
	^nil
]

{
	#category : #'lookup elements',
	#timestamp : ' 8/31/2017 07:17:01'
}
RGAbstractContainer>>elementNamed: elementName in: aCollection [
	| aSymbol |
	
	aSymbol:= elementName asSymbol.
	^aCollection isDictionary
		ifTrue: [ aCollection at: aSymbol ifAbsent: [ nil ] ]
		ifFalse:[ aCollection detect:[ :each| each fullName = aSymbol ] ifNone:[ nil ] ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGAbstractContainer>>elements [
	"Retrieves the elements"
	
	^elements
]

{
	#category : #'managing elements groups',
	#timestamp : ' 8/31/2017 07:17:01'
}
RGAbstractContainer>>elementsCategorized: aSymbol [
	"Retrieves a group of elements.
	If does not exist set an Set"
	
	^elements at: aSymbol ifAbsentPut:[ Set ]
]

{
	#category : #'managing elements groups',
	#timestamp : ' 8/31/2017 07:17:01'
}
RGAbstractContainer>>elementsCategorized: aSymbol with: aCollection [
	"Allows to define other groups of elements with a particular kind of collection"
	
	elements at: aSymbol put: aCollection
]

{
	#category : #'iterating elements',
	#timestamp : ' 8/31/2017 07:17:01'
}
RGAbstractContainer>>elementsDo: aBlock [
	elements valuesDo: [ :collection | collection do: [ :each | aBlock value: each ] ]
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGAbstractContainer>>flushElements [

	elements:= IdentityDictionary new
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGAbstractContainer>>includesElement: anRGDefinition [

	^anRGDefinition isIncludedInContainer: self
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGAbstractContainer>>includesElementNamed: elementName [

	^ elements anySatisfy: [ :collection | self includesElementNamed: elementName asSymbol in: collection ]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGAbstractContainer>>includesElementNamed: elementName in: aCollection [

	^aCollection isDictionary
		ifTrue: [ aCollection includesKey:  elementName asSymbol ]
		ifFalse:[ aCollection anySatisfy: [ :each| each name = elementName asSymbol ] ]
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGAbstractContainer>>initialize [

	super initialize.
	elements:= IdentityDictionary new.
]

{
	#category : #adding/removing,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGAbstractContainer>>removeElement: anObject [

	anObject removeFromContainer: self
]

{
	#category : #adding/removing,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGAbstractContainer>>removeElement: anObject from: aCollection [

	aCollection isDictionary
		ifTrue: [ aCollection removeKey: anObject fullName ifAbsent:[ ] ]
		ifFalse:[ aCollection remove: anObject ifAbsent:[ ] ]
]

{
	#category : #'managing elements groups',
	#timestamp : ' 8/31/2017 07:17:01'
}
RGAbstractContainer>>removeElementsCategorized: aSymbol [
	"Deletes a group of elements"
	
	elements removeKey: aSymbol ifAbsent:[ ]
]
