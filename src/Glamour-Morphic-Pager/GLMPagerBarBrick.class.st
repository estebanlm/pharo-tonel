"

"
Class {
	#name : #GLMPagerBarBrick,
	#superclass : #GLMBrick,
	#instVars : [
		'buttonsBrick',
		'pagerModel',
		'sliderBrick'
	],
	#category : #Glamour-Morphic-Pager-Brick,
	#timestamp : ''
}

{
	#category : #bar-accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPagerBarBrick>>buttonsBrick [

	^ buttonsBrick
]

{
	#category : #bar-accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPagerBarBrick>>buttonsBrick: aBrick [

	buttonsBrick := aBrick.
	
	self buttonsBrick pagerModel: pagerModel.
	
	self buttonsBrick
		hShrinkWrap;
		vShrinkWrap.
	
	self addBrickBack: self buttonsBrick
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPagerBarBrick>>initialize [
	super initialize.
	
	self
		useVerticalLinearLayout
]

{
	#category : #'bar-instance creation',
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPagerBarBrick>>newButtonsBrick [

	^ GLMPagerButtonsPaneBrick new
]

{
	#category : #'bar-instance creation',
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPagerBarBrick>>newSliderBrick [

	^ GLMPagerScrollSlidingBrick new
]

{
	#category : #bar-event-handling,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPagerBarBrick>>onPagePoped [

	buttonsBrick onPagePoped.
	self recomputeScrollBar.
]

{
	#category : #bar-event-handling,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPagerBarBrick>>onPagePushed: addedAnnouncement [

	self buttonsBrick onPagePushed: addedAnnouncement.
	self recomputeScrollBar
]

{
	#category : #bar-accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPagerBarBrick>>pagerModel [

	^ pagerModel
]

{
	#category : #bar-accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPagerBarBrick>>pagerModel: aModel [
	
	pagerModel := aModel.
	
	self pagerModel announcer when: GLMPagePushed send: #onPagePushed: to: self.
	self pagerModel announcer when: GLMPagePoped send: #onPagePoped to: self.
	
	self sliderBrick: self newSliderBrick.
	self buttonsBrick: self newButtonsBrick.
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPagerBarBrick>>recomputeScrollBar [
	
	self sliderBrick ifNotNil: #setWidthAfterResizing
]

{
	#category : #bar-accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPagerBarBrick>>sliderBrick [

	^ sliderBrick
]

{
	#category : #bar-accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPagerBarBrick>>sliderBrick: aBrick [

	sliderBrick := aBrick.
	
	self sliderBrick
		pagerModel: self pagerModel;
		height: self pagerModel circleButtonSize;
		width: [ self pagerModel circleButtonSize * self pagerModel actualNumberOfVisiblePages ].
		
	self sliderBrick layout
		floating: #left.
		
	self addBrickBack: self sliderBrick
]
