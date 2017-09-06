"
A TickSelectionListMorph is used to render the tick list

storeValue
	- xxxxx

"
Class {
	#name : #TickSelectionListMorph,
	#superclass : #MorphTreeMorph,
	#instVars : [
		'storeValue'
	],
	#category : #Morphic-Widgets-TickList,
	#timestamp : '<historical>'
}

{
	#category : #event,
	#timestamp : ' 8/31/2017 05:26:17'
}
TickSelectionListMorph>>basicKeyPressed: aCharacter [

	aCharacter == Character space
		ifTrue: [ ^ self model toogleSelectionValue ].
	
	^ super basicKeyPressed: aCharacter
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:17'
}
TickSelectionListMorph>>indentingItemClass [
	
	^ TickSelectionListNodeMorph
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:17'
}
TickSelectionListMorph>>mouseUp: event  [

	self storeValue: nil.
	super mouseUp: event 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:17'
}
TickSelectionListMorph>>storeValue [

	^ storeValue
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:17'
}
TickSelectionListMorph>>storeValue: anObject [
	
	storeValue := anObject
]
