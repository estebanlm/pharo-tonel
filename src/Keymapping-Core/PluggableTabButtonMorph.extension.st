Extension { #name : #PluggableTabButtonMorph }

{ #category : #'*Keymapping-Core' }
PluggableTabButtonMorph >> initializeShortcuts: aKMDispatcher [

	super initializeShortcuts: aKMDispatcher.
	aKMDispatcher attachCategory: #MorphFocusNavigation
]
