"
I represent a composed key modifier. I contain a collection of modifiers that should match with a keyboard event.

Look at my superclass for a more detailed explanaition.
"
Class {
	#name : #KMComposedModifier,
	#superclass : #KMModifier,
	#instVars : [
		'modifiers'
	],
	#category : #Keymapping-KeyCombinations,
	#timestamp : '<historical>'
}

{
	#category : #combining,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMComposedModifier>>+ modified [
	^ modified asKeyCombination modifiedBy: self
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMComposedModifier>>= aShortcut [
	(aShortcut isKindOf: self class)
		ifFalse: [^ false].
	^ (aShortcut modifiers includesAll: modifiers) and: [ modifiers includesAll: aShortcut modifiers ]
]

{
	#category : #combining,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMComposedModifier>>alt [
	modifiers add: KMModifier alt
]

{
	#category : #combining,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMComposedModifier>>command [
	modifiers add: KMModifier command
]

{
	#category : #combining,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMComposedModifier>>control [
	modifiers add: KMModifier ctrl
]

{
	#category : #combining,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMComposedModifier>>ctrl [
	self control
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMComposedModifier>>hash [
	^ modifiers hash
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMComposedModifier>>initialize [
	super initialize.
	modifiers := OrderedCollection new.
]

{
	#category : #matching,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMComposedModifier>>matchesEvent: aKeyboardEvent [
	^ modifiers allSatisfy: [:modifier|
		modifier matchesEvent: aKeyboardEvent]
]

{
	#category : #combining,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMComposedModifier>>meta [
	modifiers add: KMModifier meta
]

{
	#category : #combining,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMComposedModifier>>modifiedBy: modifier [
	modifiers add: modifier.
	self updateIdentifier.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMComposedModifier>>modifiers [
	^ modifiers
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMComposedModifier>>printOn: aStream [
	modifiers
		do: [ :modifier| modifier printOn: aStream ]
		separatedBy: [ aStream << ' + ' ].
]

{
	#category : #combining,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMComposedModifier>>shift [
	modifiers add: KMModifier shift
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMComposedModifier>>symbol [
	^ String streamContents: [ :stream | 
		self modifiers do: [ :e | 
			stream << e symbol ] ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMComposedModifier>>updateIdentifier [
	identifier := String streamContents: [ :aStream|
			modifiers do: [ :modifier| 
				aStream << modifier identifier]].
	identifier := identifier asSymbol
]
