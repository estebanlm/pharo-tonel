"

"
Class {
	#name : #GLMActionBrickThemer,
	#superclass : #GLMBrickThemer,
	#category : #Glamour-Morphic-Brick-Theme,
	#timestamp : ''
}

{
	#category : #modules,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMActionBrickThemer>>popupThemer [

	^ self registerModule: GLMActionBrickPopupThemer new
]

{
	#category : #brick-scrollpane,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMActionBrickThemer>>scrollbarWidth [

	^ 2
]

{
	#category : #brick-scrollpane,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMActionBrickThemer>>scrollpaneBackgroundColor [

	^ Color transparent
]
