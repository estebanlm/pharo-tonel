Extension {
	#name : #Collection
}

{
	#category : #'*Keymapping-KeyCombinations',
	#timestamp : ' 8/31/2017 05:26:19'
}
Collection>>asKeyCombination [
	| shortcut |
	self size = 1 ifTrue: [ ^self first asKeyCombination ].

	shortcut := KMKeyCombinationSequence new.
	self do: [ :each | shortcut addShortcut: each asKeyCombination ].
	^shortcut.
]

{
	#category : #'*Keymapping-KeyCombinations',
	#timestamp : ' 8/31/2017 05:26:19'
}
Collection>>asShortcut [
	^ self asKeyCombination
]
