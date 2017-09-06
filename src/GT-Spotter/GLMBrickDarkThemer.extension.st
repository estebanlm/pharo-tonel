Extension {
	#name : #GLMBrickDarkThemer
}

{
	#category : #'*GT-Spotter',
	#timestamp : ' 8/31/2017 05:26:36'
}
GLMBrickDarkThemer>>spotterThemer [

	^ self
		registerModule: GTSpotterWidgetDarkThemer new
		to: GTSpotterBrickDarkThemer new
]
