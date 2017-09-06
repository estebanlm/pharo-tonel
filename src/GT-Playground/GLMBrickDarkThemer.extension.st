Extension {
	#name : #GLMBrickDarkThemer
}

{
	#category : #'*GT-Playground',
	#timestamp : ' 8/31/2017 05:26:36'
}
GLMBrickDarkThemer>>bindingThemer [

	^ self registerModule: GTPlayBindingDarkThemer new
		to: GLMActionBrickDarkThemer new
]
