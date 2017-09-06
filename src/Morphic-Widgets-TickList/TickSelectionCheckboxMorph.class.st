"
A TickSelectionCheckboxMorph is a checkbox which propagate a bit more the events
"
Class {
	#name : #TickSelectionCheckboxMorph,
	#superclass : #CheckboxMorph,
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
TickSelectionCheckboxMorph>>index: anIndex [

	index := anIndex
]

{
	#category : #morph,
	#timestamp : ' 8/31/2017 05:26:17'
}
TickSelectionCheckboxMorph>>newButtonMorph [
	"Answer a new button morph"

	| instance |
	instance := TickSelectionCheckboxButtonMorph new
		target: self;
		actionSelector: #toggleSelected;
		vResizing: #shrinkWrap;
		hResizing: #shrinkWrap.
		
	instance index: index.
	^ instance
]

{
	#category : #event,
	#timestamp : ' 8/31/2017 05:26:17'
}
TickSelectionCheckboxMorph>>pressed: anIndex [

	self owner owner pressed: anIndex
]
