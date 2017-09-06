Extension {
	#name : #SimpleHierarchicalListMorph
}

{
	#category : #'*Keymapping-Core',
	#timestamp : ' 8/31/2017 05:26:19'
}
SimpleHierarchicalListMorph>>initializeShortcuts: aKMDispatcher [

	super initializeShortcuts: aKMDispatcher.
	aKMDispatcher attachCategory: #SimpleHierarchicalList.
	aKMDispatcher attachCategory: #MorphFocusNavigation
]
