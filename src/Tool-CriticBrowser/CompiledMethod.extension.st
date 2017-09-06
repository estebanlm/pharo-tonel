Extension {
	#name : #CompiledMethod
}

{
	#category : #'*Tool-CriticBrowser',
	#timestamp : ' 8/31/2017 05:26:37'
}
CompiledMethod>>populateCBMenu: aMenu [
	
	super populateCBMenu: aMenu.
	aMenu
		add: 'Implementors of...'
		target: SystemNavigation new
		selector: #browseAllImplementorsOf:
		argument: self selector;
		
		add: 'Senders of...'
		target: SystemNavigation new
		selector: #browseAllSendersOf:
		argument: self selector
]
