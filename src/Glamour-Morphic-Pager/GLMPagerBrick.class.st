"

"
Class {
	#name : #GLMPagerBrick,
	#superclass : #GLMBrick,
	#instVars : [
		'firstCombination',
		'pagerBar',
		'scrollBrick',
		'pagerModel',
		'showScrollBarWhenNeeded'
	],
	#category : #Glamour-Morphic-Pager-Brick,
	#timestamp : ''
}

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPagerBrick class>>exampleBasic [
	|pager adapter|
	adapter := GLMPagerModel new.
	pager :=	GLMPagerBrick new.
	pager pagerModel: adapter.
	pager pushPane: (GLMLabelBrick new color: Color lightRed; text: 'Hello'; textPosition: #center).
	"pager pushPane: (GLMBrick new color: Color green).
	pager pushPane: (GLMBrick new color: Color yellow).
	pager pushPane: (GLMBrick new color: Color blue).
	pager pushPane: (GLMBrick new color: Color pink)."
	
	pager height: 600.
	pager width: 1024.
	pager asBrickedMorph openInWindow.
	
	pager inspect.
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPagerBrick>>initialColorInSystemWindow: aSystemWindow [
	"Answer the colour the receiver should be when added to a SystemWindow."
	^ Color transparent
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPagerBrick>>initialize [
	super initialize.
	
	self useVerticalLinearLayout
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPagerBrick>>initializeShortcuts [

	self
		bindKeyCombination: Character arrowLeft alt command
		toAction: [ self pagerModel selectToLeft ].
	
	self
		bindKeyCombination: Character arrowRight alt command
		toAction: [ self pagerModel selectToRight ].
	
	self
		bindKeyCombination: Character arrowLeft alt shift command
		toAction: [ self pressedScrollerSizeCombination: #left ].

	self
		bindKeyCombination: Character arrowRight alt shift command
		toAction: [ self pressedScrollerSizeCombination: #right ].
]

{
	#category : #'pager-instance creation',
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPagerBrick>>newPagerBar [

	^ GLMPagerBarBrick new
]

{
	#category : #'pager-instance creation',
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPagerBrick>>newScrollBrick [

	^ GLMPagerScrollBrick new
]

{
	#category : #pager-event-handling,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPagerBrick>>onPagePoped [

	self showOrHideScrollBar
]

{
	#category : #pager-event-handling,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPagerBrick>>onPagePushed [

	self showOrHideScrollBar
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPagerBrick>>outOfWorld: aWorld [

	GLMPagerPanePreviewMorph remove.
	^ super outOfWorld: aWorld.
]

{
	#category : #pager-accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPagerBrick>>pagerBar [

	^ pagerBar
]

{
	#category : #pager-accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPagerBrick>>pagerBar: aBrick [

	pagerBar := aBrick.
	
	self pagerBar
		vShrinkWrap;
		hShrinkWrap.
	self pagerBar layout hAlign: #center.
	
	self pagerBar pagerModel: pagerModel.
	
	self addBrickBack: self pagerBar
]

{
	#category : #pager-accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPagerBrick>>pagerModel [
	^ pagerModel
]

{
	#category : #pager-accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPagerBrick>>pagerModel: aModel [

	pagerModel := aModel.
	
	self pagerModel announcer when: GLMPagePushed send: #onPagePushed to: self.
	self pagerModel announcer when: GLMPagePoped send: #onPagePoped to: self.
	
	self initializeShortcuts.
	
	self scrollBrick: self newScrollBrick.
	self pagerBar: self newPagerBar
]

{
	#category : #pager-api,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPagerBrick>>popAndReplacePane: aMorph [
	"replaces last pane with new pane"
	self pagerModel popAndReplacePane: aMorph
]

{
	#category : #pager-api,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPagerBrick>>popPane [
	"pops the last pane with smooth animation"
	self pagerModel popPane: true.
]

{
	#category : #pager-actions,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPagerBrick>>pressedScrollerSizeCombination: aSymbol [

	firstCombination ifNil: [ firstCombination := aSymbol. ^ self].
	
	self scrollerSizeShortcutAction: firstCombination second: aSymbol.
	firstCombination := nil.
]

{
	#category : #pager-api,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPagerBrick>>pushPane: aMorph [
	"pushes a pane to the end with smooth scroll animation"
	| isSmooth |
	
	isSmooth := self pagerModel size >= self pagerModel numberOfVisiblePages.
	self pagerModel pushPane: aMorph smooth: isSmooth
]

{
	#category : #pager-accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPagerBrick>>scrollBrick [

	^ scrollBrick
]

{
	#category : #pager-accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPagerBrick>>scrollBrick: aBrick [

	scrollBrick := aBrick.
	self scrollBrick pagerModel: pagerModel.
	
	self scrollBrick
		vSpaceFill;
		hSpaceFill.
	
	self addBrickBack: self scrollBrick
]

{
	#category : #pager-actions,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPagerBrick>>scrollerSizeShortcutAction: first second: second [
	
	(first = #left) & (second = #left) ifTrue: [ pagerModel enlargeToLeft ].
	(first = #left) & (second = #right) ifTrue: [ pagerModel diminishToRight ].
	(first = #right) & (second = #left) ifTrue: [ pagerModel diminishToLeft ].
	(first = #right) & (second = #right) ifTrue: [ pagerModel enlargeToRight ]
]

{
	#category : #pager-actions,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPagerBrick>>showOrHideScrollBar [
	
	((self pagerModel size > self pagerModel minimumPageNumberForScrollbar) & (self showScrollBarWhenNeeded))
		ifTrue: [ (self hasSubbrick: self pagerBar)
			ifFalse: [ self addBrickBack: self pagerBar ] ]
		ifFalse: [ self removeBrick: self pagerBar ].
]

{
	#category : #pager-accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPagerBrick>>showScrollBarWhenNeeded [
	"retuns true if scrollbar should be visible if number of pages > 1,
	otherwise false"
	^ showScrollBarWhenNeeded ifNil: [ showScrollBarWhenNeeded := true ]
]

{
	#category : #pager-accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPagerBrick>>showScrollBarWhenNeeded: aBoolean [

	showScrollBarWhenNeeded := aBoolean
]
