"
I do not match with any keyboard event.

I respond to the Null object pattern, since I represent the inexistance of a key combination.
"
Class {
	#name : #KMNoShortcut,
	#superclass : #KMKeyCombination,
	#category : #Keymapping-KeyCombinations,
	#timestamp : '<historical>'
}

{
	#category : #combining,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMNoShortcut>>+ aKMModifier [
	^ aKMModifier
]

{
	#category : #combining,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMNoShortcut>>, aShortcut [
	^ aShortcut
]

{
	#category : #matching,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMNoShortcut>>matches: anEventBuffer [
	^ false
]

{
	#category : #matching,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMNoShortcut>>matchesCompletely: anEventBuffer [
	^ false
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMNoShortcut>>printOn: aStream [

]
