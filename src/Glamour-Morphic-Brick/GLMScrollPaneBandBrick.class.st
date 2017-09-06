"
A GLMScrollPaneBandBrick is a band that is used with GLMScrollPaneBrick. It supports force updating of Morph bounds that is triggered after small delay to have no influence on performance

Instance Variables
	asyncTask:		<GLMAsyncTask>
	scrollpane:		<GLMScrollPaneBrick>
	shouldLayoutMorphs:		<Boolean>

asyncTask
	- asynchronous task used to delay the update of morph bounds

scrollpane
	- reference to my scrollpane, so that I could update scrollbar

shouldLayoutMorphs
	- true if I need to update morphic bounds, false otherwise

"
Class {
	#name : #GLMScrollPaneBandBrick,
	#superclass : #GLMBandBrick,
	#instVars : [
		'asyncTask',
		'scrollpane',
		'shouldLayoutMorphs'
	],
	#category : #Glamour-Morphic-Brick-Widgets-Scrollpane,
	#timestamp : 'AliakseiSyrel 2/18/2015 14:01'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMScrollPaneBandBrick>>asyncTask [

	^ asyncTask ifNil: [ asyncTask := GLMAsyncTask new ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMScrollPaneBandBrick>>layoutMorphs: aBoolean [
	"if you know, that morphs are used in scrollpane set me to true.
	each time layout changes I relayout all morphs after some delay
	implemented using async task, such that it can be canceled"
	shouldLayoutMorphs := aBoolean 
]

{
	#category : #brick-layout-events,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMScrollPaneBandBrick>>onChildrenLayouted [
	super onChildrenLayouted.
	
	self scrollpane ifNotNil: [ :s | s updateScrollbar ].
	
	self shouldLayoutMorphs ifFalse: [ ^ self ].
	self asyncTask
		perform: [ self updateMorphBounds ]
		delay: 400
		priority: Processor userBackgroundPriority + 1
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMScrollPaneBandBrick>>scrollpane [
	^ scrollpane
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMScrollPaneBandBrick>>scrollpane: anObject [
	scrollpane := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMScrollPaneBandBrick>>shouldLayoutMorphs [

	^ shouldLayoutMorphs ifNil: [ shouldLayoutMorphs := false ]
]
