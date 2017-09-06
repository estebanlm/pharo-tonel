"
I represent the Ctrl key modifier. Look at my superclass for a more detailed explanaition.
"
Class {
	#name : #KMCtrlModifier,
	#superclass : #KMModifier,
	#category : #Keymapping-KeyCombinations,
	#timestamp : '<historical>'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMCtrlModifier>>eventCode [
	^16
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMCtrlModifier>>initialize [
	super initialize.
	identifier := #c.
	name := 'Ctrl'.
]

{
	#category : #matching,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMCtrlModifier>>matchesEvent: aKeyboardEvent [
	^ aKeyboardEvent controlKeyPressed
]
