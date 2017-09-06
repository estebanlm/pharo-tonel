"
I am a specific builder to configure one shortcut.
"
Class {
	#name : #KMKeymapBuilder,
	#superclass : #Object,
	#instVars : [
		'shortcutName',
		'platform'
	],
	#category : #Keymapping-Pragmas,
	#timestamp : '<historical>'
}

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:19'
}
KMKeymapBuilder class>>for: aShortcutName platform: aPlatform [
	^self new 
		shortcutName: aShortcutName;
		platform: aPlatform;
		yourself
]

{
	#category : #building,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMKeymapBuilder>>category: aCategoryName default: aShortcut do: actionBlock [
	"actionBlock - can take 3 optional arguments: target, morph, and keyboard event"

	KMRepository default
		initializeKeymap: shortcutName
		executingOn: aShortcut
		doing: actionBlock
		inCategory: aCategoryName
		platform: platform
]

{
	#category : #building,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMKeymapBuilder>>category: aCategoryName default: aShortcut do: anAction description: aDescription [
	KMRepository default
		initializeKeymap: shortcutName
		executingOn: aShortcut
		doing: anAction
		inCategory: aCategoryName
		platform: platform
		description: aDescription
]

{
	#category : #building,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMKeymapBuilder>>category: aCategoryName shortcut: aShortcutCombination do: actionBlock [
	"actionBlock - can take 3 optional arguments: target, morph, and keyboard event"
	aShortcutCombination combinationsDo: [ :combination |
		KMRepository default
			initializeKeymap: shortcutName
			executingOn: combination shortcut
			doing: actionBlock
			inCategory: aCategoryName
			platform: combination platform
	]
]

{
	#category : #building,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMKeymapBuilder>>category: aCategoryName shortcut: aShortcutCombination do: actionBlock description: aDescription [
	"actionBlock - can take 3 optional arguments: target, morph, and keyboard event"
	aShortcutCombination combinationsDo: [ :combination |
		KMRepository default
			initializeKeymap: shortcutName
			executingOn: combination shortcut
			doing: actionBlock
			inCategory: aCategoryName
			platform: combination platform
			description: aDescription
	]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMKeymapBuilder>>platform: aPlatform [
	platform := aPlatform
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMKeymapBuilder>>shortcutName: aShortcutName [
	shortcutName := aShortcutName
]
