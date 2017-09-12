Extension { #name : #DropListMorph }

{ #category : #'*Keymapping-Core' }
DropListMorph >> initializeShortcuts: aKMDispatcher [
	super initializeShortcuts: aKMDispatcher.
	aKMDispatcher attachCategory: #MorphFocusNavigation
]
