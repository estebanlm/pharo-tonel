Extension {
	#name : #GLMActionBrickDarkThemer
}

{
	#category : #'*GT-Playground',
	#timestamp : ' 8/31/2017 05:26:36'
}
GLMActionBrickDarkThemer>>bindingThemer [

	^ self registerModule: GTPlayBindingDarkThemer new
]
