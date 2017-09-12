Extension { #name : #PluggableListMorph }

{ #category : #'*Keymapping-Core' }
PluggableListMorph >> initializeShortcuts: aKMDispatcher [
	super initializeShortcuts: aKMDispatcher.
	aKMDispatcher attachCategory: #MorphFocusNavigation
]
