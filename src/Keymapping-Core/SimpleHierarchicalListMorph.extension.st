Extension { #name : #SimpleHierarchicalListMorph }

{ #category : #'*Keymapping-Core' }
SimpleHierarchicalListMorph >> initializeShortcuts: aKMDispatcher [

	super initializeShortcuts: aKMDispatcher.
	aKMDispatcher attachCategory: #SimpleHierarchicalList.
	aKMDispatcher attachCategory: #MorphFocusNavigation
]
