"
This class stores a searchString which will be searched for in the entities source code on demand to find an interval of substring
"
Class {
	#name : #ReSearchStringSourceAnchor,
	#superclass : #ReSourceAnchor,
	#instVars : [
		'searchString'
	],
	#category : #Renraku-SourceAnchors,
	#timestamp : 'YuriyTymchuk 7/10/2016 13:00'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:37'
}
ReSearchStringSourceAnchor class>>entity: anEntity string: aString  [
	
	^ self basicNew 
		initializeEnitity: anEntity
		searchString: aString;
		yourself
]

{
	#category : #gt-inspector-extension,
	#timestamp : ' 8/31/2017 05:26:37'
}
ReSearchStringSourceAnchor>>gtInspectorAnchorIn: composite [
	<gtInspectorPresentationOrder: 0>

	(super gtInspectorAnchorIn: composite)
		initialize: [ :p | p selectionInterval: self interval ]
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:37'
}
ReSearchStringSourceAnchor>>initializeEnitity: anEntiy searchString: aString  [
	
	self initializeEnitity: anEntiy.
	searchString := aString 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
ReSearchStringSourceAnchor>>interval [
	| start tweekedSubstring |
	
	tweekedSubstring := self searchString isSymbol
		ifTrue: [ self searchString keywords first ]
		ifFalse: [ self searchString ].
	
	start := (sourceEntity definition indexOfSubCollection: tweekedSubstring startingAt: 1).
	
	^ start to: start + tweekedSubstring size - 1
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:37'
}
ReSearchStringSourceAnchor>>providesInterval [

	^ searchString notNil
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
ReSearchStringSourceAnchor>>searchString [
	^ searchString
]
