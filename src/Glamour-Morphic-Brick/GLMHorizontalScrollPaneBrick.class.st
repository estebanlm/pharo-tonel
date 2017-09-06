"
A GLMHorizontalScrollPaneBrick is a very simple scrollpane with support of light scrollbar.
Acceleration mechanism is used for scrolling, as longer user scrolls faster it becomes.

"
Class {
	#name : #GLMHorizontalScrollPaneBrick,
	#superclass : #GLMScrollPaneBrick,
	#category : #Glamour-Morphic-Brick-Widgets-Scrollpane,
	#timestamp : 'AliakseiSyrel 1/7/2015 23:38'
}

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMHorizontalScrollPaneBrick>>calculateMaxVelocity [

	"max velocity must depend from the height of the band"
	^ (self band width / 15) max: self class defaultMaxVelocity
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMHorizontalScrollPaneBrick>>newBand [
	^ GLMHorizontalBandBrick new
]

{
	#category : #scrolling,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMHorizontalScrollPaneBrick>>scrollDown: anInteger [
	
	band brickBounds corner x <= self width ifTrue: [ ^ self ].
	band brickBounds: (band brickBounds translateBy: (anInteger@ 0) negated).
	band brickBounds corner x < self width ifTrue: [ band brickBounds: (band brickBounds translateBy: ((self width - band brickBounds corner x)@0)) ]
]

{
	#category : #scrolling,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMHorizontalScrollPaneBrick>>scrollTo: aBrick [

	self shouldBeImplemented
]

{
	#category : #scrolling,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMHorizontalScrollPaneBrick>>scrollUp: anInteger [

	"preventing from scrolling if already at the top"
	band brickBounds origin x >= 0 ifTrue: [ ^ self ].
	"actuall scrolling"
	band brickBounds: (band brickBounds translateBy: (anInteger@ 0)).
	"returning scrollpane back if went away"
	band brickBounds origin x > 0 ifTrue: [ band brickBounds: (band brickBounds translateBy: (band brickBounds origin x@ 0 ) negated) ]
]
