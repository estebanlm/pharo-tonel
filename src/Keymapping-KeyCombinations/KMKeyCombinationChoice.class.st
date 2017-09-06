"
I representing a choice between key combinations.

A keyboard event will match with me when any of my key combinations matches with it.
"
Class {
	#name : #KMKeyCombinationChoice,
	#superclass : #KMKeyCombination,
	#instVars : [
		'shortcuts'
	],
	#category : #Keymapping-KeyCombinations,
	#timestamp : '<historical>'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:19'
}
KMKeyCombinationChoice class>>withShortcuts: someShortcuts [
	^self new
			shortcuts: someShortcuts;
			yourself
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMKeyCombinationChoice>>= another [

	^ shortcuts anySatisfy: [ :each | another = each ]
]

{
	#category : #iterating,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMKeyCombinationChoice>>collect: aBlock [
	^shortcuts collect: aBlock
]

{
	#category : #iterating,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMKeyCombinationChoice>>combinationsDo: aBlock [
	^shortcuts do: aBlock
]

{
	#category : #matching,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMKeyCombinationChoice>>includes: aShortcut [
	^shortcuts includes: aShortcut
]

{
	#category : #matching,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMKeyCombinationChoice>>matches: anEventBuffer [
	
	^ shortcuts anySatisfy: [ :each | each matches: anEventBuffer ]
]

{
	#category : #matching,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMKeyCombinationChoice>>matchesCompletely: anEventBuffer [
	
	^ shortcuts anySatisfy: [ :each | each matchesCompletely: anEventBuffer ]
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMKeyCombinationChoice>>prettyPrintOn: aStream [

	(shortcuts select:[ :e | e platform = Smalltalk os platformFamily or: [ e platform = #all ] ])
		do: [ :e | e prettyPrintOn: aStream ]
		separatedBy: [ aStream << ' | ' ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMKeyCombinationChoice>>shortcuts: someShortcuts [
	shortcuts := someShortcuts
]

{
	#category : #combining,
	#timestamp : ' 8/31/2017 05:26:19'
}
KMKeyCombinationChoice>>| aShortcut [
	^KMKeyCombinationChoice withShortcuts: (shortcuts copyWith: aShortcut)
]
