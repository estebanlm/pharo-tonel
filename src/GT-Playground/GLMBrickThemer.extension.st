Extension {
	#name : #GLMBrickThemer
}

{
	#category : #'*GT-Playground',
	#timestamp : ' 8/31/2017 05:26:36'
}
GLMBrickThemer>>bindingThemer [

	^ self registerModule: GTPlayBindingThemer new
		to: GLMActionBrickThemer new
]
