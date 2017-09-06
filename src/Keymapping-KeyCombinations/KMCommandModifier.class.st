"
I represent the default modifier key for the current platform, late bound to Meta or Ctrl key modifier depending on the platform.
"
Class {
	#name : #KMCommandModifier,
	#superclass : #KMModifier,
	#category : #Keymapping-KeyCombinations,
	#timestamp : '<historical>'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMCommandModifier>>eventCode [
	^ 64
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMCommandModifier>>initialize [
	super initialize.
	identifier := #k.
	name := 'Cmd'
]

{
	#category : #matching,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMCommandModifier>>matchesEvent: aKeyboardEvent [
	^  aKeyboardEvent commandKeyPressed
]
