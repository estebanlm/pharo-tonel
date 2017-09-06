"
A TickSelectionCheckboxButtonMorph is the button hidden into the TickSelectionCheckboxMorph
"
Class {
	#name : #TickSelectionCheckboxButtonMorph,
	#superclass : #CheckboxButtonMorph,
	#instVars : [
		'index'
	],
	#category : #Morphic-Widgets-TickList,
	#timestamp : '<historical>'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:17'
}
TickSelectionCheckboxButtonMorph>>index: anIndex [

	index := anIndex
]

{
	#category : #event,
	#timestamp : ' 8/31/2017 05:26:17'
}
TickSelectionCheckboxButtonMorph>>mouseUp: evt [
	"Handle the transitions."
	| result |
	result := super mouseUp: evt.
	self pressed: index.
	^ result 
]

{
	#category : #event,
	#timestamp : ' 8/31/2017 05:26:17'
}
TickSelectionCheckboxButtonMorph>>pressed: anIndex [

	self owner pressed: anIndex
]
