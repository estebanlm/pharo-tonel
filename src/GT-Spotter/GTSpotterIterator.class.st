"

"
Class {
	#name : #GTSpotterIterator,
	#superclass : #Object,
	#instVars : [
		'context',
		'items'
	],
	#category : #GT-Spotter-Iterators,
	#timestamp : ''
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterIterator class>>gtIterator [
	^ self new
]

{
	#category : #'mimic various enumerating',
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterIterator>>allSatisfy: aBlock [
	self do: [ :each | (aBlock value: each) ifFalse: [ ^ false ] ].
	^ true
]

{
	#category : #'mimic various enumerating',
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterIterator>>anySatisfy: aBlock [
	self do: [ :each | (aBlock value: each) ifTrue: [ ^ true ] ].
	^ false
]

{
	#category : #'mimic collection',
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterIterator>>asArray [
	^ self items asArray
]

{
	#category : #'mimic collection',
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterIterator>>asOrderedCollection [
	^ self items copy " we must not expose the internal representation ! "
]

{
	#category : #'mimic collection',
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterIterator>>asSet [
	^ self items asSet
]

{
	#category : #'mimic various enumerating',
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterIterator>>collect: aBlock [
	^ self collect: aBlock as: self defaultItemsClass
]

{
	#category : #'mimic various enumerating',
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterIterator>>collect: aBlock as: aCollectionClass [
	| collection |
	collection := self newAs: aCollectionClass.
	self do: [ :each | 
		collection add: (aBlock value: each) ].
	^ collection
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterIterator>>context [
	^ context
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterIterator>>context: aContext [
	" we assume that if the context changes, so will the result of the iterator - so we reset the internal collection "
	context := aContext.
	self reset.
]

{
	#category : #public,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterIterator>>cull: aContext [
	self context: aContext
]

{
	#category : #accessing-defaults,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterIterator>>defaultItems [
	^ self defaultItemsClass new 
]

{
	#category : #accessing-defaults,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterIterator>>defaultItemsClass [
	^ OrderedCollection 
]

{
	#category : #'mimic various enumerating',
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterIterator>>detect: aBlock [
	^ self detect: aBlock ifNone: [ NotFound signalFor: aBlock ]
]

{
	#category : #'mimic various enumerating',
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterIterator>>detect: aBlock ifFound: aBlock2 ifNone: aBlock3 [
	self do: [ :each | aBlock value ifTrue: [ ^ aBlock2 value: each ] ].
	^ aBlock3 value
]

{
	#category : #'mimic various enumerating',
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterIterator>>detect: aBlock ifNone: aBlock2 [
	^ self detect: aBlock ifFound: [ :each | each ] ifNone: aBlock2
]

{
	#category : #'mimic enumerating',
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterIterator>>do: aBlock [
	" the iterator must keep an internal collection of items being iterated. This guarantees that the iteration is not done multiple times in case somebody sends multiple subsequent messages like #size, #items or #first:. This will slightly decrease performance while iterating "
	items 
		ifNotNil: [ 
			items do: aBlock ]
		ifNil: [ 
			items := self defaultItems.
			self itemDo: [ :each | 
				items add: each.
				aBlock value: each ] ]
]

{
	#category : #'mimic collection',
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterIterator>>first: anInteger [
	^ self items copyFrom: 1 to: (self size min: (anInteger max: 0))
]

{
	#category : #public,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterIterator>>gtIterator [
	^ self
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterIterator>>hasDynamicItems [
	^ true
]

{
	#category : #'mimic collection',
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterIterator>>isEmpty [
	^ self items isEmpty
]

{
	#category : #'mimic collection',
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterIterator>>isEmptyOrNil [
	^ self items isEmptyOrNil
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterIterator>>itemDo: aBlock [
	self subclassResponsibility
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterIterator>>items [
	^ items ifNil: [ 
		items := self defaultItems.
		self itemDo: [ :each | 
			items add: each ] ]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterIterator>>items: anObject [
	items := anObject
]

{
	#category : #'mimic collection',
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterIterator>>last: anInteger [
	^ self items last: (self size min: (anInteger max: 0))
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterIterator>>newAs: aCollectionClass [
	^ items 
		ifNil: [ aCollectionClass new ] 
		ifNotNil: [ aCollectionClass new: self size ]
]

{
	#category : #'mimic collection',
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterIterator>>notEmpty [
	^ self isEmpty not
]

{
	#category : #'mimic various enumerating',
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterIterator>>reject: aBlock [
	^ self reject: aBlock as: self defaultItemsClass
]

{
	#category : #'mimic various enumerating',
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterIterator>>reject: aBlock as: aCollectionClass [
	| collection |
	collection := self newAs: aCollectionClass.
	self do: [ :each | 
		(aBlock value: each) 
			ifFalse: [ collection add: each ] ].
	^ collection
]

{
	#category : #'mimic various enumerating',
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterIterator>>reject: aBlock thenCollect: aBlock2 as: aCollectionClass [
	| collection |
	collection := self newAs: aCollectionClass.
	self reject: aBlock thenDo: [ :each | 
		collection add: (aBlock2 value: each) ].
	^ collection
]

{
	#category : #'mimic various enumerating',
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterIterator>>reject: aBlock thenDo: aBlock2 [
	self do: [ :each | 
		(aBlock value: each) 
			ifFalse: [ aBlock2 value: each ] ]
]

{
	#category : #public,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterIterator>>reset [
	items := nil.
]

{
	#category : #'mimic various enumerating',
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterIterator>>select: aBlock [
	^ self select: aBlock as: self defaultItemsClass
]

{
	#category : #'mimic various enumerating',
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterIterator>>select: aBlock as: aCollectionClass [
	| collection |
	collection := self newAs: aCollectionClass.
	self do: [ :each | 
		(aBlock value: each) 
			ifTrue: [ collection add: each ] ].
	^ collection
]

{
	#category : #'mimic various enumerating',
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterIterator>>select: aBlock thenCollect: aBlock2 [
	^ self select: aBlock thenCollect: aBlock2 as: self defaultItemsClass
]

{
	#category : #'mimic various enumerating',
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterIterator>>select: aBlock thenCollect: aBlock2 as: aCollectionClass [
	| collection |
	collection := self newAs: aCollectionClass.
	self select: aBlock thenDo: [ :each | 
		collection add: (aBlock2 value: each) ].
	^ collection
]

{
	#category : #'mimic various enumerating',
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterIterator>>select: aBlock thenDo: aBlock2 [
	self do: [ :each | 
		(aBlock value: each) 
			ifTrue: [ aBlock2 value: each ] ]
]

{
	#category : #'mimic collection',
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterIterator>>size [
	^ self items size
]

{
	#category : #public,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterIterator>>value [
	^ self items
]

{
	#category : #public,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterIterator>>value: aContext [
	self context: aContext
]

{
	#category : #'mimic enumerating',
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterIterator>>withIndexDo: aBlock [
	| index |
	index := 0.
	self do: [ :each | aBlock cull: each cull: (index := index + 1) ]
]
