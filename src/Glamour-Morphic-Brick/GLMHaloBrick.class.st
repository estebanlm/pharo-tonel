"

"
Class {
	#name : #GLMHaloBrick,
	#superclass : #HaloMorph,
	#category : #Glamour-Morphic-Brick-Widgets-UI,
	#timestamp : ''
}

{
	#category : #handles,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMHaloBrick>>addDupHandle: haloSpec [

]

{
	#category : #handles,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMHaloBrick>>addGrabHandle: haloSpec [

]

{
	#category : #updating,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMHaloBrick>>changed [

	^ fullBounds 
		ifNil: [ self invalidRect: self privateFullBounds]
		ifNotNil: [ self invalidRect: fullBounds ]
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMHaloBrick>>initialize [
	super initialize.
	
	self fillStyle: (Color lightBlue alpha: 0.2)
]

{
	#category : #settings,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMHaloBrick>>showBoundsInHalo [

	^ true
]
