Extension {
	#name : #GLMActionBrickThemer
}

{
	#category : #'*GT-Playground',
	#timestamp : ' 8/31/2017 05:26:36'
}
GLMActionBrickThemer>>bindingThemer [

	^ self registerModule: GTPlayBindingThemer new
]
