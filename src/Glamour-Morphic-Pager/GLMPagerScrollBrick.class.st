"

"
Class {
	#name : #GLMPagerScrollBrick,
	#superclass : #GLMBrick,
	#instVars : [
		'band',
		'currentFocus',
		'pagerModel',
		'maxPanes',
		'focus',
		'currentScrollDelta',
		'animation'
	],
	#category : #Glamour-Morphic-Pager-Brick,
	#timestamp : ''
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPagerScrollBrick>>animation [

	^ animation
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPagerScrollBrick>>band [

	^ band
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPagerScrollBrick>>band: aBrick [

	band := aBrick.
	band
		useHorizontalLinearLayout;
		layoutMorphs: true;
		width: [ self band subbricksCount * self width / ((self maxPanes min: self band subbricksCount) max: 1) ];
		vSpaceFill.
	"band actually depends from myself,
	because each pane is proportional to my size"
	band layout widthDependency: self.
	
	self addBrickBack: band.
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPagerScrollBrick>>configurePane: aBrick [
	|brick|
	brick := aBrick asBrick.
	brick
		layoutProperties: GLMBrickLayoutProperties new;
		"width of tab is proportional to number of visible panes and my width"
		width: [ self band width / self band subbricksCount ];
		vSpaceFill;
		marginLeft: self paneMargin;
		marginRight: self paneMargin.
		
	brick layout widthDependency: self band.
	^ brick
]

{
	#category : #scrolling,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPagerScrollBrick>>convertScrollValue: aFloat [
	self pagerModel actualNumberOfVisiblePages = 0 ifTrue: [ ^ 0 ].
	^ (self width - ((self width / self pagerModel actualNumberOfVisiblePages + self paneMargin) * self band subbricksCount)) * aFloat
]

{
	#category : #event-handling,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPagerScrollBrick>>focusChanged: anEvent [
	| pageIndex newFocus |
	
	newFocus := anEvent morph.
	
	currentFocus = newFocus ifFalse: [
		currentFocus := newFocus.
		pageIndex := self pageOf: newFocus.
		(pageIndex > 0) ifTrue: [
			pagerModel focusedMorphChanged: newFocus at: pageIndex ] ]
]

{
	#category : #scrolling,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPagerScrollBrick>>glmAnimateValue: aValue duration: anInteger [

	self glmAnimateValue: aValue duration: anInteger callback: nil.
]

{
	#category : #scrolling,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPagerScrollBrick>>glmAnimateValue: aValue duration: anInteger callback: aBlock [
	
	self animation ifNotNil: #terminate.
	animation := GLMAnimation new
		linear;
		duration: 200;
		from: self scrollValue;
		to: (self convertScrollValue: aValue);
		ensure: [ :b | b updatePaneBounds. aBlock brickValue: b ];
		animation: [ :b :v | b scrollValue: v ];
		animate: self
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPagerScrollBrick>>initialize [
	super initialize.
	
	focus := Dictionary new.
	currentScrollDelta := 0.
	maxPanes := 2.
	self band: self newBand.
	Morph announcer weak 
		when: MorphGotFocus send: #focusChanged: to: self.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPagerScrollBrick>>lastPane [

	self subbricksCount = 0 ifTrue: [ ^ nil ].
	^ self panes last.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPagerScrollBrick>>maxPanes [
	^ maxPanes
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPagerScrollBrick>>maxPanes: anInteger [
	maxPanes := anInteger
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPagerScrollBrick>>newBand [

	^ GLMScrollPaneBandBrick new
]

{
	#category : #brick-layout-events,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPagerScrollBrick>>onChildrenLayouted [
	super onChildrenLayouted.
	self band translateXTo: (self convertScrollValue: (self pagerModel convertIndexToValue: self pagerModel firstVisiblePageIndex))
]

{
	#category : #event-handling,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPagerScrollBrick>>onPagePoped: popedAnnouncement [
	self popPane: popedAnnouncement smooth.
]

{
	#category : #event-handling,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPagerScrollBrick>>onPagePopedAndReplaced: ann [

	self popAndReplace: ann brick
]

{
	#category : #event-handling,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPagerScrollBrick>>onPagePreviewUpdate: updateAnnouncement [

	GLMPagerPanePreviewMorph uniqueInstance updateFor: (self paneAt: updateAnnouncement pageIndex).
]

{
	#category : #event-handling,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPagerScrollBrick>>onPagePushed: pushedAnnouncement [

	"added new page to the end of pane"
	self pushPane: pushedAnnouncement morph
	
	
	
	

]

{
	#category : #event-handling,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPagerScrollBrick>>onPagesNumberChanged [

	self maxPanes: pagerModel numberOfVisiblePages.
	self doLayoutForce.
	self scrollToPane: pagerModel firstVisiblePageIndex smooth: false
	
]

{
	#category : #event-handling,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPagerScrollBrick>>onPositionChanged: announcement [


	self scrollToPane: pagerModel firstVisiblePageIndex smooth: announcement smooth callback: announcement callback
]

{
	#category : #event-handling,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPagerScrollBrick>>onSelectedPageChanged [
	
	self panes do: [ :each | each borderColor: Color transparent ].
	
	self theme pagerWidgetThemer selectedPaneStyleFor: (self panes at: pagerModel selectedPageIndex)
]

{
	#category : #event-handling,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPagerScrollBrick>>onSynchronizeScroll: announcement [

	"directly scrolls to value"
	self scrollTo: announcement value smooth: false
]

{
	#category : #initialize,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPagerScrollBrick>>outOfWorld: aWorld [

	Morph announcer unsubscribe: self.
	^ super outOfWorld: aWorld.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPagerScrollBrick>>pageOf: aSubMorph [
	"returns 0 if morph is not in pager"
	|parent page|	
	
	aSubMorph ifNil: [ ^ 0 ].
	
	parent := aSubMorph.
	
	[parent isNotNil & ((parent == self band) not) ] whileTrue: [
		page := parent.
		parent := parent owner.
	].
	
	^ parent isNil ifTrue: [ 0 ] ifFalse: [ self panes indexOf: page. ].
	
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPagerScrollBrick>>pagerModel [

	^ pagerModel
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPagerScrollBrick>>pagerModel: aModel [
	
	pagerModel := aModel.
	maxPanes := aModel numberOfVisiblePages.
	
	pagerModel announcer 
		when: GLMPagePushed send: #onPagePushed: to: self.
	
	pagerModel announcer 
		when: GLMPagePoped send: #onPagePoped: to: self.
	
	pagerModel announcer 
		when: GLMPagePopedAndReplaced send: #onPagePopedAndReplaced: to: self.
						
	pagerModel announcer 
		when: GLMPagerSynchronizeScrollAnnouncement send: #onSynchronizeScroll: to: self.
		
	pagerModel announcer  
		when: GLMPagerScrollPositionChanged send: #onPositionChanged: to: self.
		
	pagerModel announcer  
		when: GLMNumberOfVisiblePagesChanged send: #onPagesNumberChanged to: self.
		
	pagerModel announcer  
		when: GLMSelectedPageChanged send: #onSelectedPageChanged to: self.
		
	pagerModel announcer  
		when: GLMPagerPreviewUpdate send: #onPagePreviewUpdate: to: self.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPagerScrollBrick>>paneAt: anIndex [
	^ self panes at: anIndex.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPagerScrollBrick>>paneMargin [
	"please leave it 0, becasue otherwise it doesn't work"
	self flag: 'fix support of margin'.
	^ 0
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPagerScrollBrick>>panes [

	^ self band submorphs
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPagerScrollBrick>>popAndReplace: aBrick [
	|brick|

	brick := self configurePane: aBrick.
	brick wrappedBounds: self band lastSubbrick wrappedBounds.
	brick updateMorphBounds.
	
	self band doNotLayoutDuring: [ :b | b
		removeBrick: b lastSubbrick;
		addBrickBack: brick ].
	self changed
	
	
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPagerScrollBrick>>popPane [
	
	self band doNotLayoutDuring: [ :b | b removeBrick: b lastSubbrick ].
	self doLayoutForce
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPagerScrollBrick>>popPane: isSmooth [

	(isSmooth not or: [self lastPane isNil]) ifTrue: [ ^ self popPane ].
	
	self band doNotLayoutDuring: [ :b | b removeBrick: b lastSubbrick ].
	self
		scrollTo: (pagerModel convertIndexToValue: pagerModel firstVisiblePageIndex with: self band subbricksCount)
		smooth: isSmooth
		callback: [ self doLayoutForce ]
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPagerScrollBrick>>pushPane: aMorph [

	self band addBrickBack: (self configurePane: aMorph)
]

{
	#category : #scrolling,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPagerScrollBrick>>scrollTo: aValue smooth: isSmooth [

 	self scrollTo: aValue smooth: isSmooth callback: nil
]

{
	#category : #scrolling,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPagerScrollBrick>>scrollTo: aValue smooth: isSmooth callback: aBlock [

 	isSmooth ifTrue: [ self glmAnimateValue: aValue duration: 300 callback: aBlock ]
				ifFalse: [ self scrollValue: (self convertScrollValue: aValue). self updatePaneBounds. aBlock value ].
]

{
	#category : #scrolling,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPagerScrollBrick>>scrollToPane: anIndex smooth: isSmooth [

	self scrollToPane: anIndex smooth: isSmooth callback: nil
]

{
	#category : #scrolling,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPagerScrollBrick>>scrollToPane: anIndex smooth: isSmooth callback: aBlock [

	self scrollTo: (pagerModel convertIndexToValue: anIndex) smooth: isSmooth callback: aBlock.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPagerScrollBrick>>scrollValue [

	^ currentScrollDelta
]

{
	#category : #scrolling,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPagerScrollBrick>>scrollValue: value [
	
	currentScrollDelta := value.
	
	self band doNotLayoutDuring: [ :b | b translateXTo: self scrollValue ].
	self changed
]

{
	#category : #scrolling,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPagerScrollBrick>>updatePaneBounds [

	self band updateMorphBounds
]
