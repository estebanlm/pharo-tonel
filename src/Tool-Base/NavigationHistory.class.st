"
I act as a web browser history
"
Class {
	#name : #NavigationHistory,
	#superclass : #Object,
	#instVars : [
		'storage',
		'index',
		'maxSize',
		'paused'
	],
	#category : #Tool-Base,
	#timestamp : '<historical>'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
NavigationHistory class>>defaultMaxSize [

	^ 15
]

{
	#category : #'collection compatibility',
	#timestamp : ' 8/31/2017 05:26:18'
}
NavigationHistory>>add: anEntry [

	self addEntry: anEntry
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:18'
}
NavigationHistory>>addEntry: anEntry [
	
	self isPaused ifTrue: [ ^ self ].
	
	self basicAdd: anEntry
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:18'
}
NavigationHistory>>back [

	index := ((index - 1) max: 0)
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:18'
}
NavigationHistory>>basicAdd: anEntry [
	
	( storage isEmpty not and: [ storage last = anEntry ] ) ifTrue: [ ^ self ].
	anEntry = self current key ifTrue: [ ^ self ].
	self checkSize.
	index := index +1.
	index > storage size
		ifTrue: [ storage addLast:  (anEntry -> DateAndTime now)]
		ifFalse: [ 
			storage := storage copyFrom: 1 to: index.
			storage at: index put: (anEntry -> DateAndTime now)]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:18'
}
NavigationHistory>>checkSize [
	
	[ storage size >= self maxSize ]
		whileTrue: [ 
			storage removeFirst.
			index := index -1].
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:18'
}
NavigationHistory>>current [

	^ storage at: index ifAbsent: [ nil -> nil ]
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:18'
}
NavigationHistory>>entries [

	^ storage
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:18'
}
NavigationHistory>>hasNext [

	^ index < storage size
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:18'
}
NavigationHistory>>hasPrevious [

	^ index > 1
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:18'
}
NavigationHistory>>initialize [

	storage := OrderedCollection new.
	index := 0.
	paused := false.
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:18'
}
NavigationHistory>>isPaused [
	^ paused
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:18'
}
NavigationHistory>>last [

	^ storage last
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:18'
}
NavigationHistory>>maxSize [

	^ maxSize ifNil: [ maxSize := self class defaultMaxSize ].
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:18'
}
NavigationHistory>>maxSize: anInteger [

	maxSize := anInteger
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:18'
}
NavigationHistory>>next [

	index := ((index + 1) min: storage size).
	^ storage at: index
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:18'
}
NavigationHistory>>pauseDuring: aBlock [
	| previousPausedValue |
	"Don't accept any new entries while executing aBlock"
	previousPausedValue := paused.
	paused := true.
	aBlock ensure: [ paused := previousPausedValue ]
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:18'
}
NavigationHistory>>previous [

	index := index-1 max: 1.
	^ storage at: index
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:18'
}
NavigationHistory>>removeEntry: anEntry [
	| toRemove |
	
	"we know that toRemove will always contains one element"
	toRemove := (storage select: [:e | e key == anEntry ]).
	toRemove ifEmpty: [ ^ self ].
	toRemove := toRemove first.
	storage remove: toRemove.
	storage addLast: toRemove
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:18'
}
NavigationHistory>>removeLastEntry [

	self isPaused ifTrue: [ ^ self ].
	storage ifEmpty: [ ^ self ].
	
	storage remove: storage last.	
	index := index -1
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:18'
}
NavigationHistory>>replaceCurrentWith: anEntry [
	"Change the current history item to the given object"
	storage at: index put: (anEntry -> DateAndTime now)
]
