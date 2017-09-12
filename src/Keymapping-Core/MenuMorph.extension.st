Extension { #name : #MenuMorph }

{ #category : #'*Keymapping-Core' }
MenuMorph >> initializeShortcuts: aKMDispatcher [
	super initializeShortcuts: aKMDispatcher.
	aKMDispatcher attachCategory: #MorphFocusNavigation
]
