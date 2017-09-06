Extension {
	#name : #GLMBrickDarkThemer
}

{
	#category : #'*Glamour-Morphic-Brick',
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickDarkThemer>>tabLabelThemer [

	^ self
		registerModule: GLMBrickTabLabelDarkThemer new
]
