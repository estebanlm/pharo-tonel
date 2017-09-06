"
I am a buffer of keyboard events. I am checked against key combinations to see if there is a match.

I am cleared when the current morph loses focus or when a full match announcement is given.
"
Class {
	#name : #KMBuffer,
	#superclass : #Object,
	#instVars : [
		'buffer',
		'currentEvent'
	],
	#classInstVars : [
		'uniqueInstance'
	],
	#category : #Keymapping-Core,
	#timestamp : '<historical>'
}

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:19'
}
KMBuffer class>>resetUniqueInstance [
	uniqueInstance := nil
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:19'
}
KMBuffer class>>uniqueInstance [
	^uniqueInstance ifNil: [ uniqueInstance := self new ].
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:19'
}
KMBuffer class>>uniqueInstance: aBuffer [
	uniqueInstance := aBuffer.
]

{
	#category : #adding,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMBuffer>>addEvent: anEvent [

	buffer add: anEvent.
	currentEvent := anEvent.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMBuffer>>buffer [
	^buffer
]

{
	#category : #clearing,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMBuffer>>clearBuffer [

	currentEvent := nil.
	buffer removeAll.
]

{
	#category : #matching,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMBuffer>>completeMatch [

	currentEvent ifNotNil:[ currentEvent wasHandled: true ].
	self clearBuffer.
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMBuffer>>initialize [
	buffer := OrderedCollection new.
]

{
	#category : #matching,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMBuffer>>partialMatch [

	KMLog logPartialMatch: currentEvent.
	currentEvent ifNotNil:[ currentEvent wasHandled: true ].
]
