"
A GLMScrollPaneBrick is a simple scrollpane with customisable scrollbars

Instance Variables
	band:		<Object>
	lastScrollTimeStamp:		<Object>
	scrollPosition:		<Object>
	velocity:		<Object>
	verticalScrollbar:		<Object>

band
	- xxxxx

lastScrollTimeStamp
	- xxxxx

scrollPosition
	- xxxxx

velocity
	- xxxxx

verticalScrollbar
	- xxxxx

"
Class {
	#name : #GLMScrollPaneBrick,
	#superclass : #GLMBrick,
	#instVars : [
		'band',
		'lastScrollTimeStamp',
		'scrollPosition',
		'verticalScrollbar',
		'velocity'
	],
	#category : #Glamour-Morphic-Brick-Widgets-Scrollpane,
	#timestamp : 'AliakseiSyrel 1/30/2015 11:06'
}

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMScrollPaneBrick class>>defaultMaxVelocity [
	^ self defaultScrollVelocity * 4
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMScrollPaneBrick class>>defaultScrollAcceleration [

	^ 4
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMScrollPaneBrick class>>defaultScrollTimeReset [
	^ 350
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMScrollPaneBrick class>>defaultScrollTurboTime [

	^ 30
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMScrollPaneBrick class>>defaultScrollVelocity [
	^ 15
]

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMScrollPaneBrick class>>example[
	|foundation scrollPane|
	
	scrollPane := self new.
	
	foundation := GLMFoundationBrick new.
	foundation brickRoot: scrollPane.
	
	1 to: 20 do: [ :index |
		scrollPane addBrickBack: (GLMBrick new
			color: Color random;
			hSpaceFill;
			height: 50).
	].
	
	foundation extent: 200@200.
	
	foundation openInWindow
]

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMScrollPaneBrick class>>exampleLarge [
	|foundation scrollPane|
	
	scrollPane := self new.
	
	foundation := GLMFoundationBrick new.
	foundation brickRoot: scrollPane.
	
	1 to: 1000 do: [ :index |
		scrollPane addBrickBack: (GLMBrick new
			color: Color random;
			hSpaceFill;
			height: 50).
	].
	
	foundation extent: 400@300.
	
	foundation openInWindow
]

{
	#category : #brick-structure-adding/removing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMScrollPaneBrick>>addAllBricks: aCollection [

	self band addAllBricks: aCollection
]

{
	#category : #brick-structure-adding/removing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMScrollPaneBrick>>addBrick: aBrick before: anotherBrick [

	self band addBrick: aBrick before: anotherBrick
]

{
	#category : #brick-structure-adding/removing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMScrollPaneBrick>>addBrickBack: aBrick [

	self band addBrickBack: aBrick
]

{
	#category : #scrollpane-accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMScrollPaneBrick>>allowedBounds [

	^ self globalBounds
]

{
	#category : #scrollpane-brick-accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMScrollPaneBrick>>band [

	^ band
]

{
	#category : #scrollpane-brick-accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMScrollPaneBrick>>band: aBrick [

	band := aBrick.
	self band scrollpane: self.
	self band hSpaceFill.
	super addBrickBack: self band.
]

{
	#category : #scrollpane-accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMScrollPaneBrick>>bandTopOffset [

	^ self band brickBounds top
]

{
	#category : #scrollpane-calculations,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMScrollPaneBrick>>calculateMaxVelocity [
	"max velocity must depend from the height of the band"
	^ (self band height / 15) max: self class defaultMaxVelocity
]

{
	#category : #scrollpane-calculations,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMScrollPaneBrick>>calculateVelocity: event [
	|delta|
	delta := event timeStamp - lastScrollTimeStamp.
		
	self velocity: (delta > self class defaultScrollTimeReset
		ifTrue: [ self class defaultScrollVelocity ]
		ifFalse: [ self velocityValue: delta ]).
		
	lastScrollTimeStamp := event timeStamp.
	
	^ self velocity ceiling
]

{
	#category : #scrollpane-events-mouse,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMScrollPaneBrick>>handleListenEvent: anEvent [
	"checking if it's keyboard event (mouse wheel is keyboard event on windows o_O (wtf?)"
	anEvent type = #keystroke ifTrue: [
		"checking if mouse is inside me"
		((self boundsInWorld containsPoint: anEvent position)) ifTrue: [
			"actuall scrolling"
			self scrollByKeyboard: anEvent ] ]
]

{
	#category : #scrollpane-events-mouse,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMScrollPaneBrick>>handlesMouseWheel: evt [
	^ true
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMScrollPaneBrick>>initialize [
	super initialize.
	
	lastScrollTimeStamp := 0.

	self useVerticalLinearLayout.
	self band: self newBand.
	self verticalScrollbar: self newVerticalScrollbar.	
	"initializes listener for mouse wheel scroll on windows vm"
	self initializeListeners
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMScrollPaneBrick>>initializeListeners [

	"using the most general event subscribtion for all events spawned by the hand"
	self activeHand addEventListener: self.
]

{
	#category : #scrollpane-testing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMScrollPaneBrick>>isBottomOverscrolled [

	self isLastVisible ifFalse: [ ^ false ].
	self band brickBounds bottom < self height ifTrue: [ ^ true ].
	^ ((self band lastSubbrick brickBounds bottom + self band brickBounds top) < self height)
]

{
	#category : #scrollpane-testing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMScrollPaneBrick>>isFirstVisible [

	self band hasSubbricks ifFalse: [ ^ true ].
	^ self isVisible: self band firstSubbrick
]

{
	#category : #scrollpane-testing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMScrollPaneBrick>>isFullyVisible [

	^ self isFirstVisible & self isLastVisible
]

{
	#category : #scrollpane-testing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMScrollPaneBrick>>isKeyboardScrollEvent: anEvent [

	(anEvent controlKeyPressed | anEvent commandKeyPressed) ifFalse: [^ false ].
	anEvent keyValue = 30 ifTrue: [ ^ true ].
	anEvent keyValue = 31 ifTrue: [ ^ true ].
	^ false
]

{
	#category : #scrollpane-testing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMScrollPaneBrick>>isLastVisible [

	self band hasSubbricks ifFalse: [ ^ true ].
	^ self isVisible: self band lastSubbrick
]

{
	#category : #scrollpane-testing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMScrollPaneBrick>>isPartiallyVisible: aBrick [
	|myBounds testingBounds|
	"need to normalize bounds to take only y coordinate into account"
	
	myBounds := (self allowedBounds withWidth: 1) translateBy: (self allowedBounds origin negated x@0).
	testingBounds :=  (aBrick globalBounds withWidth: 1) translateBy: (aBrick globalBounds origin negated x@0).
	
	^ myBounds intersects: testingBounds
]

{
	#category : #scrollpane-testing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMScrollPaneBrick>>isTopOverscrolled [

	^ self bandTopOffset > 0
]

{
	#category : #scrollpane-testing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMScrollPaneBrick>>isVisible: aBrick [
	|myBounds testingBounds|
	"need to normalize bounds to take only y coordinate into account"
	
	myBounds := (self allowedBounds withWidth: 0) translateBy: (self allowedBounds origin negated x@0).
	testingBounds :=  (aBrick globalBounds withWidth: 0) translateBy: (aBrick globalBounds origin negated x@0).
	
	^ myBounds containsRect: testingBounds
]

{
	#category : #scrollpane-accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMScrollPaneBrick>>layoutMorphs: aBoolean [

	self band layoutMorphs: aBoolean
]

{
	#category : #scrollpane-events-mouse,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMScrollPaneBrick>>mouseWheel: event [
	
	self
		scrollBy: (self calculateVelocity: event)
		direction: (event isUp ifTrue: [ #up ] ifFalse: [ #down ])
]

{
	#category : #scrollpane-transformations,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMScrollPaneBrick>>moveBandBottom [
	
	self band translateY: (self height - self band brickBounds bottom)
]

{
	#category : #scrollpane-transformations,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMScrollPaneBrick>>moveBandTop [

	self band translateY: self bandTopOffset negated
]

{
	#category : #scrollpane-brick-creation,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMScrollPaneBrick>>newBand [

	^ GLMScrollPaneBandBrick new
]

{
	#category : #scrollpane-brick-creation,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMScrollPaneBrick>>newVerticalScrollbar [

	^ GLMScrollbarBrick new
]

{
	#category : #brick-layout-events,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMScrollPaneBrick>>onChildrenLayouted [
	super onChildrenLayouted.
	
	self band translateY: self scrollPositionTop
]

{
	#category : #brick-properties-events,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMScrollPaneBrick>>onThemerChanged [
	super onThemerChanged.
	
	self updateStyle
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMScrollPaneBrick>>outOfWorld: aWorld [
	super outOfWorld: aWorld.
	
	self unsubscribeListeners
]

{
	#category : #private-scrolling,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMScrollPaneBrick>>privateScrollPosition: anInteger [

	scrollPosition := anInteger.
	self announcer announce: GLMBrickScrollPositionChanged new
]

{
	#category : #brick-structure-adding/removing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMScrollPaneBrick>>removeAllBricks [
	
	self band removeAllBricks.
	self scrollToTop
]

{
	#category : #brick-structure-adding/removing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMScrollPaneBrick>>removeBrick: aBrick [
	self band removeBrick: aBrick
]

{
	#category : #scrollpane-scrolling,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMScrollPaneBrick>>scrollBy: anInteger direction: aSymbol [

	self isFullyVisible ifTrue: [ ^ self ].
	
	aSymbol = #up ifTrue: [ self scrollUp: anInteger ].
	aSymbol = #down ifTrue: [ self scrollDown: anInteger ].
	
	self update.
	self changed
]

{
	#category : #scrollpane-scrolling,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMScrollPaneBrick>>scrollByKeyboard: anEvent [
	|direction|
	
	(self isKeyboardScrollEvent: anEvent) ifFalse: [^ self ].
	self velocity: (self calculateVelocity: anEvent).
	
	"keycode 30 is Event direction = #up"
	anEvent keyValue = 30 ifTrue: [ direction := #up ].
	"keycode 31 is Event direction = #down"
	anEvent keyValue = 31 ifTrue: [ direction := #down ].
	self scrollBy: velocity direction: direction
]

{
	#category : #scrollpane-scrolling,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMScrollPaneBrick>>scrollDown: anInteger [
	
	self band translateY: anInteger negated.
	self isBottomOverscrolled ifTrue: [ self moveBandBottom ]
]

{
	#category : #scrollpane-scrolling,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMScrollPaneBrick>>scrollPageDown [

	self
		scrollDown: self height;
		update;
		changed
]

{
	#category : #scrollpane-scrolling,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMScrollPaneBrick>>scrollPageUp [

	self
		scrollUp: self height;
		update;
		changed
]

{
	#category : #scrollpane-accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMScrollPaneBrick>>scrollPositionBottom [

	^ self scrollPositionTop + self innerBounds height
]

{
	#category : #scrollpane-accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMScrollPaneBrick>>scrollPositionTop [

	^ scrollPosition ifNil: [ scrollPosition := 0 ]
]

{
	#category : #scrollpane-scrolling,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMScrollPaneBrick>>scrollTo: aBrick [
	|delta|
	"if already visible no need to scroll"

	(self isVisible: aBrick) ifTrue: [ ^ self ].
	
	delta := ((self allowedBounds top - band globalBounds top) - (aBrick globalBounds top - band globalBounds top)).
	delta < 0 ifTrue: [ delta := delta + self allowedBounds height - aBrick height ].
		
	self band translateY: delta.
	self isBottomOverscrolled ifTrue: [ self moveBandBottom ].
	self isTopOverscrolled ifTrue: [ self moveBandTop ].
	
	self update.
	self changed.
	
	
]

{
	#category : #scrollpane-scrolling,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMScrollPaneBrick>>scrollToBottom [

	self band hasSubbricks ifFalse: [ ^ self ].
	self scrollTo: self band lastSubbrick
]

{
	#category : #scrollpane-scrolling,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMScrollPaneBrick>>scrollToTop [

	self scrollBy: self scrollPositionTop negated direction: #up
]

{
	#category : #scrollpane-scrolling,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMScrollPaneBrick>>scrollUp: anInteger [

	self band translateY: anInteger.
	self isTopOverscrolled ifTrue: [ self moveBandTop ]
]

{
	#category : #brick-properties,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMScrollPaneBrick>>scrollpaneBackgroundColor [

	^ self valueOfProperty: #brickScrollpaneBackgroundColor ifAbsent: [ self themer scrollpaneBackgroundColor ]
]

{
	#category : #brick-properties,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMScrollPaneBrick>>scrollpaneBackgroundColor: aColor [

	self setProperty: #brickScrollpaneBackgroundColor toValue: aColor.
	self updateStyle
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMScrollPaneBrick>>unsubscribeListeners [

	self activeHand removeEventListener: self
]

{
	#category : #scrollpane-updating,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMScrollPaneBrick>>update [

	self scrollDown: 0.
	self scrollUp: 0.
	self privateScrollPosition: self band brickBounds top.
	self band onChildrenLayouted
]

{
	#category : #scrollpane-updating,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMScrollPaneBrick>>updateScrollbar [

	self verticalScrollbar ifNotNil: [ :b | b updatePosition ]
]

{
	#category : #scrollpane-updating,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMScrollPaneBrick>>updateStyle [

	self color: self scrollpaneBackgroundColor
]

{
	#category : #scrollpane-accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMScrollPaneBrick>>velocity [

	^ velocity ifNil: [ velocity := self class defaultScrollVelocity ]
]

{
	#category : #scrollpane-accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMScrollPaneBrick>>velocity: anInteger [

	velocity := anInteger
]

{
	#category : #scrollpane-calculations,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMScrollPaneBrick>>velocityValue: anInteger [
	|time|
	
	time := anInteger <= self class defaultScrollTurboTime
		ifTrue: [ 2 ]
		ifFalse: [ 1 ].
	^ (self velocity + (self class defaultScrollAcceleration * time)) min: self calculateMaxVelocity
]

{
	#category : #scrollpane-brick-accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMScrollPaneBrick>>verticalScrollbar [

	^ verticalScrollbar
]

{
	#category : #scrollpane-brick-accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMScrollPaneBrick>>verticalScrollbar: aBrick [

	verticalScrollbar := aBrick.
	verticalScrollbar scrollPane: self.
	verticalScrollbar height: [ self height ].
	verticalScrollbar layout heightDependency: self.
	super addBrickBack: verticalScrollbar
]
