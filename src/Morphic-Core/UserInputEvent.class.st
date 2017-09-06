"
A general user input event like for keyboard or mouse
"
Class {
	#name : #UserInputEvent,
	#superclass : #MorphicEvent,
	#instVars : [
		'type',
		'buttons',
		'position',
		'handler',
		'wasHandled'
	],
	#pools : [
		'EventSensorConstants'
	],
	#category : #Morphic-Core-Events,
	#timestamp : 'TorstenBergmann 2/20/2014 18:30'
}

{
	#category : #'modifier state',
	#timestamp : ' 8/31/2017 05:26:11'
}
UserInputEvent>>altKeyPressed [
	"Answer true if the alt/option key on the keyboard was being held down when this event occurred."

	"00100000 is the bit that marks that option/alt has been pressed"
	^self optionKeyPressed
]

{
	#category : #'modifier state',
	#timestamp : ' 8/31/2017 05:26:11'
}
UserInputEvent>>anyModifierKeyPressed [
	"ignore, however, the shift keys 'cause that's not REALLY a command key "

	^ self buttons anyMask: 2r01110000	"cmd | opt | ctrl"
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:11'
}
UserInputEvent>>buttonString [
	"Return a string identifying the currently pressed buttons"
	| string |
	string := ''.
	self redButtonPressed ifTrue:[string := string,'red '].
	self yellowButtonPressed ifTrue:[string := string,'yellow '].
	self blueButtonPressed ifTrue:[string := string,'blue '].
	^string
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:11'
}
UserInputEvent>>buttons [
	"Return the a word encoding the mouse and modifier buttons for this event."

	^ buttons
]

{
	#category : #'modifier state',
	#timestamp : ' 8/31/2017 05:26:11'
}
UserInputEvent>>commandKeyPressed [
	"Answer true if the command key on the keyboard was being held down when this event occurred."

	"The mask for command bit pressed"
	^ buttons anyMask: 2r01000000
]

{
	#category : #'modifier state',
	#timestamp : ' 8/31/2017 05:26:11'
}
UserInputEvent>>controlKeyPressed [
	"Answer true if the control key on the keyboard was being held down when this event occurred."

	"The mask for control bit pressed"
	^ buttons anyMask: 2r00010000
]

{
	#category : #initialize,
	#timestamp : ' 8/31/2017 05:26:11'
}
UserInputEvent>>copyHandlerState: anEvent [
	"Copy the handler state from anEvent. Used for quickly transferring handler information between transformed events."
	handler := anEvent handler.
	wasHandled := anEvent wasHandled.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:11'
}
UserInputEvent>>handler [
	^handler
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:11'
}
UserInputEvent>>handler: anObject [
	handler := anObject
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:11'
}
UserInputEvent>>modifierString [
	"Return a string identifying the currently pressed modifiers"
	| string |
	string := ''.
	self commandKeyPressed ifTrue:[string := string,'CMD '].
	self shiftPressed ifTrue:[string := string,'SHIFT '].
	self controlKeyPressed ifTrue:[string := string,'CTRL '].
	^string
]

{
	#category : #'modifier state',
	#timestamp : ' 8/31/2017 05:26:11'
}
UserInputEvent>>optionKeyPressed [
	"Answer true if the alt/option key on the keyboard was being held down when this event occurred."

	"00100000 is the bit that marks that option/alt has been pressed"
	^ buttons anyMask: 2r00100000
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:11'
}
UserInputEvent>>position [
	^position
]

{
	#category : #initialize,
	#timestamp : ' 8/31/2017 05:26:11'
}
UserInputEvent>>resetHandlerFields [
	"Reset anything that is used to cross-communicate between two eventual handlers during event dispatch"
	handler := nil.
	wasHandled := false.
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:11'
}
UserInputEvent>>setPosition: aPoint [
	position := aPoint
]

{
	#category : #'modifier state',
	#timestamp : ' 8/31/2017 05:26:11'
}
UserInputEvent>>shiftPressed [
	"Answer true if the shift key on the keyboard was being held down when this event occurred."

	^ buttons anyMask: 8

]

{
	#category : #transforming,
	#timestamp : ' 8/31/2017 05:26:11'
}
UserInputEvent>>transformBy: aMorphicTransform [
	"Transform the receiver into a local coordinate system."
	position :=  aMorphicTransform globalPointToLocal: position.
]

{
	#category : #transforming,
	#timestamp : ' 8/31/2017 05:26:11'
}
UserInputEvent>>transformedBy: aMorphicTransform [
	"Return the receiver transformed by the given transform into a local coordinate system."
	^self shallowCopy transformBy: aMorphicTransform
]

{
	#category : #transforming,
	#timestamp : ' 8/31/2017 05:26:11'
}
UserInputEvent>>translateBy: delta [
	"add delta to cursorPoint, and return the new event"
	position := position + delta.
]

{
	#category : #transforming,
	#timestamp : ' 8/31/2017 05:26:11'
}
UserInputEvent>>translatedBy: delta [
	"add delta to cursorPoint, and return the new event"
	^self shallowCopy translateBy: delta
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:11'
}
UserInputEvent>>type [
	"Return a symbol indicating the type this event."

	^ type
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:11'
}
UserInputEvent>>wasHandled [
	^wasHandled
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:11'
}
UserInputEvent>>wasHandled: aBool [
	wasHandled := aBool.
]
