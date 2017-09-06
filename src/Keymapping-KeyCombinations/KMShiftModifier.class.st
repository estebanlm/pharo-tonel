"
I represent the Shift key modifier. Look at my superclass for a more detailed explanaition.
"
Class {
	#name : #KMShiftModifier,
	#superclass : #KMModifier,
	#category : #Keymapping-KeyCombinations,
	#timestamp : '<historical>'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMShiftModifier>>eventCode [
	^8
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMShiftModifier>>initialize [
	super initialize.
	identifier := #s.
	name := 'Shift'.
]

{
	#category : #matching,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMShiftModifier>>matchesEvent: aKeyboardEvent [
	^ aKeyboardEvent shiftPressed
]
