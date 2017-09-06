Extension {
	#name : #PluggableButtonMorph
}

{
	#category : #'*Keymapping-Core',
	#timestamp : ' 8/31/2017 05:26:19'
}
PluggableButtonMorph>>initializeShortcuts: aKMDispatcher [
	super initializeShortcuts: aKMDispatcher.
	aKMDispatcher attachCategory: #MorphFocusNavigation.
	aKMDispatcher attachCategory: #PluggableButtonMorph
]
