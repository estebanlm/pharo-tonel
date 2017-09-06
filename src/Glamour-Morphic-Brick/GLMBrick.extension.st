Extension {
	#name : #GLMBrick
}

{
	#category : #'*Glamour-Morphic-Brick',
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrick>>brickApi [

	^ brickApi ifNil: [ brickApi := GLMBrickWrapper on: self ]
]
