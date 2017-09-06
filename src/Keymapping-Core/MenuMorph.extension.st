Extension {
	#name : #MenuMorph
}

{
	#category : #'*Keymapping-Core',
	#timestamp : ' 8/31/2017 05:26:19'
}
MenuMorph>>initializeShortcuts: aKMDispatcher [
	super initializeShortcuts: aKMDispatcher.
	aKMDispatcher attachCategory: #MorphFocusNavigation
]
