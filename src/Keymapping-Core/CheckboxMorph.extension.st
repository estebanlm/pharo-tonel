Extension { #name : #CheckboxMorph }

{ #category : #'*Keymapping-Core' }
CheckboxMorph >> initializeShortcuts: aKMDispatcher [
	super initializeShortcuts: aKMDispatcher.
	aKMDispatcher attachCategory: #MorphFocusNavigation
]
