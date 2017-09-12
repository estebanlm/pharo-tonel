Extension { #name : #TabSelectorMorph }

{ #category : #'*Keymapping-Core' }
TabSelectorMorph >> initializeShortcuts: aKMDispatcher [
	super initializeShortcuts: aKMDispatcher.
	aKMDispatcher attachCategory: #MorphFocusNavigation.
	aKMDispatcher attachCategory: #TabMorphsNavigation.
]
