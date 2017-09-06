Extension {
	#name : #GLMBrickThemer
}

{
	#category : #'*GT-Spotter',
	#timestamp : ' 8/31/2017 05:26:36'
}
GLMBrickThemer>>spotterThemer [

	^ self
		registerModule: GTSpotterWidgetThemer new
		to: GTSpotterBrickThemer new
]
