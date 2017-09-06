"
I'm a data structure used to store an history.

My behavior is
	- I store Associations (anElement -> anInteger), where anElement is the element to store and anInteger the number of times it has been added. (as a Dictionary)
	- I only store once each element (as a Set).
	- I have a max size. If I add an element and have reached the max size, I remove the less seen element.
	- I store element in the chronological order (as an OrderedCollection)
"
Class {
	#name : #HistoryCollection,
	#superclass : #Object,
	#instVars : [
		'storage',
		'maxSize'
	],
	#category : #Tool-Base,
	#timestamp : 'BenjaminVanRyseghem 3/17/2011 13:41'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:18'
}
HistoryCollection class>>maxSize: anInteger [

	^ self new maxSize: anInteger
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:18'
}
HistoryCollection>>add: anElement [

	| count |
	count := 0.
	(self includes: anElement)
		ifTrue: [ | association |
			association := self remove: anElement.
			count := association value ].
	self size = self maxSize
		ifTrue: [	self removeLast ].

	^ storage addFirst: (anElement -> (count+1))
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:18'
}
HistoryCollection>>at: anElement [

	^ storage detect: [:each | each key = anElement]
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:18'
}
HistoryCollection>>elements [
	
	^ storage collect: [:each | each key ]
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:18'
}
HistoryCollection>>identityIncludes: anElement [

	^ storage anySatisfy: [:association | association key == anElement ]
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:18'
}
HistoryCollection>>includes: anElement [

	^ storage anySatisfy: [:association | association key = anElement ]
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:18'
}
HistoryCollection>>initialize [

	super initialize.
	maxSize := 5.
	storage := OrderedCollection new: maxSize.
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:18'
}
HistoryCollection>>lessSeen [

	| min |
	min := storage first.
	2 to: storage size do: [:index || each |
		each := storage at: index.
		(each value < min value)
			ifTrue: [ min := each]].
	^ min key
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
HistoryCollection>>maxSize [

	^ maxSize
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
HistoryCollection>>maxSize: anInteger [

	maxSize := anInteger
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:18'
}
HistoryCollection>>mostSeen [

	| max |
	max := storage first.
	2 to: storage size do: [:index || each |
		each := storage at: index.
		(each value > max value)
			ifTrue: [ max := each]].
	^ max key
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:18'
}
HistoryCollection>>mostViewedElements [
	
	^ (storage sorted: [:a :b | a value >= b value]) collect: [:each | each key ]
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:18'
}
HistoryCollection>>oldest [

	^ storage last key
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:18'
}
HistoryCollection>>remove: anElement [

	| association |
	association := self at: anElement.
	^ storage remove: association.
	
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:18'
}
HistoryCollection>>removeLast [
	" I remove the less seen one, in case of equality, I remove the latest one "


	| min reversedStorage |
	reversedStorage := storage reverse.
	min := reversedStorage first.
	2 to: storage size do: [:index || each |
		each := reversedStorage at: index.
		(each value < min value)
			ifTrue: [ min := each ]].
	storage remove: min
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:18'
}
HistoryCollection>>size [

	^ storage size
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:18'
}
HistoryCollection>>youngest [

	^ storage first key
]
