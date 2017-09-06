"

"
Class {
	#name : #GLMPagerScrollButtonBrick,
	#superclass : #GLMInteractableBrick,
	#instVars : [
		'checkedIcon',
		'checkedFocusedIcon',
		'focused',
		'index'
	],
	#category : #Glamour-Morphic-Pager-Brick,
	#timestamp : ''
}

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPagerScrollButtonBrick>>checkedFocusedIcon [
	^ checkedFocusedIcon
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPagerScrollButtonBrick>>checkedFocusedIcon: aForm [
	checkedFocusedIcon := aForm.
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPagerScrollButtonBrick>>checkedIcon [
	^ checkedIcon
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPagerScrollButtonBrick>>checkedIcon: aForm [
	checkedIcon := aForm.
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPagerScrollButtonBrick>>click: anEvent [
	super click: anEvent.
	
	self announcer announce: (GLMPagerButtonClicked new buttonModel: self)
	
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPagerScrollButtonBrick>>deselect [
	super deselect.
	
	self announcer announce: (GLMPagerButtonDeselected new buttonModel: self)
	
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPagerScrollButtonBrick>>index [
	^ index
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPagerScrollButtonBrick>>index: anObject [
	index := anObject
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPagerScrollButtonBrick>>initialize [
	super initialize.

	focused := false.
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPagerScrollButtonBrick>>isFocused [
	^ focused
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPagerScrollButtonBrick>>select [
	super select.
	
	self announcer announce: (GLMPagerButtonSelected new buttonModel: self)
	
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPagerScrollButtonBrick>>setFocused [

	focused ifFalse: [
		self checkedImage: checkedFocusedIcon.
		self check.
		focused := true ]
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPagerScrollButtonBrick>>setNotFocused [

	focused ifTrue: [
		self checkedImage: checkedIcon.
		self uncheck.
		focused := false ]
]
