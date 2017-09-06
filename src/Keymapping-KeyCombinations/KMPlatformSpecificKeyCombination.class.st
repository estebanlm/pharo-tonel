"
I represent a platform specific key combination, one that should only be launched for a particular platform such as windows, unix or mac.

I'm a sort of decorator of a key combination.
"
Class {
	#name : #KMPlatformSpecificKeyCombination,
	#superclass : #Object,
	#instVars : [
		'shortcut',
		'platform'
	],
	#category : #Keymapping-KeyCombinations,
	#timestamp : '<historical>'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:19'
}
KMPlatformSpecificKeyCombination class>>with: aShortcut onPlatform: aPlatform [
	^self new
			shortcut: aShortcut;
			platform: aPlatform;
			yourself
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMPlatformSpecificKeyCombination>>= aShortcut [
	platform = aShortcut platform
		ifFalse: [ ^ false ].
	^ shortcut = aShortcut shortcut
]

{
	#category : #iterating,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMPlatformSpecificKeyCombination>>combinationsDo: aBlock [
	aBlock value: self
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMPlatformSpecificKeyCombination>>hash [
	^ platform hash bitXor: shortcut hash
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMPlatformSpecificKeyCombination>>matches: aCollection [

	self platform == Smalltalk os platformFamily ifFalse: [ ^ false ].	
	^ self shortcut matches: aCollection
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMPlatformSpecificKeyCombination>>matchesCompletely: aCollection [

	self platform == Smalltalk os platformFamily ifFalse: [ ^ false ].	
	^ self shortcut matchesCompletely: aCollection
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMPlatformSpecificKeyCombination>>platform [
	^platform
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMPlatformSpecificKeyCombination>>platform: aPlatform [
	platform := aPlatform
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMPlatformSpecificKeyCombination>>prettyPrintOn: aStream [

	self platform = #MacOSX
		ifTrue: [ shortcut prettyPrintOn: aStream ]
		ifFalse: [ shortcut printOn: aStream ]
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMPlatformSpecificKeyCombination>>printOn: aStream [
	super printOn: aStream.
	aStream << ' ('.
	shortcut printOn: aStream.
	aStream << ' on '.
	aStream << platform asString.
	aStream << ')'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMPlatformSpecificKeyCombination>>shortcut [
	^shortcut
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMPlatformSpecificKeyCombination>>shortcut: aShortcut [
	shortcut := aShortcut
]

{
	#category : #combining,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMPlatformSpecificKeyCombination>>| aShortcut [
	^KMKeyCombinationChoice withShortcuts: { self . aShortcut }
]
