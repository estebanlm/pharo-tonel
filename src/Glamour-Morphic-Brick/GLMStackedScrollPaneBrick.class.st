"
A GLMStackedScrollPaneBrick is a more complicated scrollpane, with scrollbars and stacking mechanism of subbricks that have #stack floating parameter

"
Class {
	#name : #GLMStackedScrollPaneBrick,
	#superclass : #GLMScrollPaneBrick,
	#instVars : [
		'allowedBounds'
	],
	#category : #Glamour-Morphic-Brick-Widgets-Scrollpane,
	#timestamp : 'AliakseiSyrel 11/27/2014 23:31'
}

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMStackedScrollPaneBrick class>>example [

	super example
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMStackedScrollPaneBrick>>allowedBounds [

	^ allowedBounds ifNil: [ allowedBounds := self globalBounds ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMStackedScrollPaneBrick>>allowedBounds: aRectangle [

	allowedBounds := aRectangle
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMStackedScrollPaneBrick>>initialize [
	super initialize.
	
	self band useVerticalLinearLayout
]

{
	#category : #scrolling,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMStackedScrollPaneBrick>>invalidate [

	
]

{
	#category : #scrolling,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMStackedScrollPaneBrick>>update [
	super update.
	
	"we need to update band's layout to support stacking"
	"self allowedBounds: self band layoutChildren."
]
