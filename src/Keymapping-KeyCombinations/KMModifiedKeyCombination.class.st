"
I represent key combinations combining a single key + a modifier.

The modifier could be a single modifier key (look at my subclasses) or a combination of them. For example, valid modified key combinations could be:

- shift + a
- ctrl + shift + c

To create a modified key combinations use the #command, #alt, #control or #shift messages. Like for example:

$a command
$b shift
$1 control
$z alt
"
Class {
	#name : #KMModifiedKeyCombination,
	#superclass : #KMKeyCombination,
	#instVars : [
		'modifier',
		'character'
	],
	#category : #Keymapping-KeyCombinations,
	#timestamp : '<historical>'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:19'
}
KMModifiedKeyCombination class>>modifier: aModifier character: aCharacter [
	^ (self new)
		modifier: aModifier;
		character: aCharacter;
		yourself
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMModifiedKeyCombination>>= aShortcut [
	super = aShortcut
		ifFalse: [ ^ false ]. 
	 modifier = aShortcut modifier
		ifFalse: [ ^ false ].
	aShortcut character = character
		ifFalse: [ ^ false ].
	^ true
]

{
	#category : #combining,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMModifiedKeyCombination>>alt [
	^ self modifiedBy: KMModifier alt
]

{
	#category : #matching,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMModifiedKeyCombination>>beginsWith: aKMShortcut  [

	^ self = aKMShortcut 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMModifiedKeyCombination>>character [
	^ character
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMModifiedKeyCombination>>character: aCharacter  [
	character := aCharacter.
]

{
	#category : #combining,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMModifiedKeyCombination>>command [
	^ self modifiedBy: KMModifier command
]

{
	#category : #combining,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMModifiedKeyCombination>>control [
	^ self modifiedBy: KMModifier ctrl
]

{
	#category : #combining,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMModifiedKeyCombination>>ctrl [
	^ self control
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMModifiedKeyCombination>>hash [
	^ character hash + modifier hash
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMModifiedKeyCombination>>key [

	^ self character key.
]

{
	#category : #matching,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMModifiedKeyCombination>>matchesEvent: aKeyboardEvent [

	^ (self modifier matchesEvent: aKeyboardEvent) 
		and: [self character matchesEvent: aKeyboardEvent]
]

{
	#category : #combining,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMModifiedKeyCombination>>meta [
	^ self modifiedBy: KMModifier meta
]

{
	#category : #combining,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMModifiedKeyCombination>>modifiedBy: aModifier [
	^self character asKeyCombination modifiedBy: modifier + aModifier.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMModifiedKeyCombination>>modifier [
	^ modifier
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMModifiedKeyCombination>>modifier: aModifier [
	modifier := aModifier
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMModifiedKeyCombination>>printOn: aStream [
	modifier printOn: aStream.
	aStream << ' + '.
	character printOn: aStream.
]

{
	#category : #combining,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMModifiedKeyCombination>>shift [
	^ self modifiedBy: KMModifier shift
]
