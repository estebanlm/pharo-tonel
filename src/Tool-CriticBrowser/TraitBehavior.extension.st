Extension {
	#name : #TraitBehavior
}

{
	#category : #'*Tool-CriticBrowser',
	#timestamp : ' 8/31/2017 05:26:37'
}
TraitBehavior>>populateCBMenu: aMenu [
	
	super populateCBMenu: aMenu.
	aMenu
		add: 'Users of...'
		target: SystemNavigation new
		selector: #browseAllUsersOfTrait:
		argument: self
]
