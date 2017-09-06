"
I represent the Meta or Command key modifier. Look at my superclass for a more detailed explanaition.
"
Class {
	#name : #KMMetaModifier,
	#superclass : #KMModifier,
	#category : #Keymapping-KeyCombinations,
	#timestamp : '<historical>'
}

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMMetaModifier>>= aShortcut [

	^ aShortcut = OSPlatform current defaultModifier
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMMetaModifier>>eventCode [

	^ OSPlatform current defaultModifier eventCode
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMMetaModifier>>hash [
	"We should change the implementation of shortcuts to not use = for matching"
	| tmp |
	tmp :=  identifier hash.
	^ tmp
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMMetaModifier>>identifier [

	^ OSPlatform current defaultModifier identifier
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMMetaModifier>>initialize [
	super initialize.
	identifier := #m.
	name := 'Meta'.
]

{
	#category : #matching,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMMetaModifier>>matches: aKeyboardEvent [
	^ aKeyboardEvent asKeyCombination modifier = OSPlatform current defaultModifier
]

{
	#category : #matching,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMMetaModifier>>matchesEvent: aKeyboardEvent [
	^ aKeyboardEvent asKeyCombination modifier = OSPlatform current defaultModifier
]
