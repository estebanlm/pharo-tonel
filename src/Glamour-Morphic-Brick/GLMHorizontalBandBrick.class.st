"
A GLMHorizontalBandBrick is a simple Brick with width that shrinks to wrap  subbricks.
Usually used within horizontal scroll panes
"
Class {
	#name : #GLMHorizontalBandBrick,
	#superclass : #GLMBrick,
	#category : #Glamour-Morphic-Brick-Widgets-Core,
	#timestamp : 'AliakseiSyrel 3/22/2015 11:35'
}

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMHorizontalBandBrick>>initialize [
	super initialize.
	
	self
		useHorizontalLinearLayout;
		hShrinkWrap
]
