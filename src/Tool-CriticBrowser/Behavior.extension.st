Extension {
	#name : #Behavior
}

{
	#category : #'*Tool-CriticBrowser',
	#timestamp : ' 8/31/2017 05:26:37'
}
Behavior>>populateCBMenu: aMenu [
	
	super populateCBMenu: aMenu.
	aMenu
		add: 'References to...'
		target: SystemNavigation new
		selector: #browseAllCallsOnClass:
		argument: self
]
