"
I represent a single key press, the simplest key combination.

I match with a keyboard event when that event key is the same as me and the key event is not modified.

To create a single key combination use the #asShortcut message. Like for example:

$a asShortcut
"
Class {
	#name : #KMSingleKeyCombination,
	#superclass : #KMKeyCombination,
	#instVars : [
		'key'
	],
	#classInstVars : [
		'specialKeys'
	],
	#category : #Keymapping-KeyCombinations,
	#timestamp : '<historical>'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:19'
}
KMSingleKeyCombination class>>from: aCharacterOrInteger [
	| aCharacter |
	aCharacter := aCharacterOrInteger asCharacter.
	
	KMUntypeableSingleKeyCombination 
		ifSpecialKey: aCharacter do: [ :keyCombination | ^ keyCombination ]. 
	KMNamedCharKeyCombination
		ifSpecialKey: aCharacter do: [ :keyCombination | ^ keyCombination ]. 
		
	^ self new
		key: aCharacter;
		yourself
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMSingleKeyCombination class>>specialKeys [
	^specialKeys
		ifNil: [ specialKeys :=
				{1->'home'.
				3->'enter'.
				4->'end'.
				8->'backspace'.
				9-> 'tab'.
				11->'page up'.
				12->'page down'.
				27->'escape'.
				28->'left arrow'.
				29->'right arrow'.
				30->'up arrow'.
				31->'down arrow'.
				127->'delete'
				} asDictionary.]
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMSingleKeyCombination>>= aShortcut [
	^ super = aShortcut and: [ aShortcut key sameAs: key ]
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMSingleKeyCombination>>hash [
	^ key hash
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMSingleKeyCombination>>key [
	^ key
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMSingleKeyCombination>>key: aKeyString [
	key := aKeyString.
]

{
	#category : #matching,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMSingleKeyCombination>>matchesEvent: aKeyboardEvent [
	^ self key asLowercase = aKeyboardEvent modifiedCharacter asLowercase
]

{
	#category : #combining,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMSingleKeyCombination>>modifiedBy: aModifier [
	^ KMModifiedKeyCombination modifier: aModifier character: self
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMSingleKeyCombination>>modifier [

	^ KMNoModifier new.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMSingleKeyCombination>>name [
	^ self key asString
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMSingleKeyCombination>>prettyPrintOn: aStream [

	self printOn: aStream
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMSingleKeyCombination>>printOn: aStream [
	aStream nextPutAll: self name
]
