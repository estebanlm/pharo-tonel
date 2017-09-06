"
I represent the Alt key modifier. Look at my superclass for a more detailed explanaition.
"
Class {
	#name : #KMAltModifier,
	#superclass : #KMModifier,
	#category : #Keymapping-KeyCombinations,
	#timestamp : '<historical>'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMAltModifier>>eventCode [
	^32
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMAltModifier>>initialize [
	super initialize.
	identifier := #a.
	name := 'Alt'.
]

{
	#category : #matching,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMAltModifier>>matchesEvent: aKeyboardEvent [
	^ aKeyboardEvent altKeyPressed
]
