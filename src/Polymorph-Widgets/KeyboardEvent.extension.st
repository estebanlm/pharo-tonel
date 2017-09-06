Extension {
	#name : #KeyboardEvent
}

{
	#category : #'*Polymorph-Widgets',
	#timestamp : ' 8/31/2017 05:26:15'
}
KeyboardEvent>>isWindowNavigation [

	^ TaskListMorph isNavigationEvent: self.
]
