Extension { #name : #MorphTreeMorph }

{ #category : #'*Keymapping-Core' }
MorphTreeMorph >> initializeShortcuts: aKMDispatcher [

	super initializeShortcuts: aKMDispatcher.
	aKMDispatcher attachCategory: #MorphFocusNavigation
]
