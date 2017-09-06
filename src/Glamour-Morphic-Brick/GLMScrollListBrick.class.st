"

"
Class {
	#name : #GLMScrollListBrick,
	#superclass : #GLMScrollPaneBrick,
	#instVars : [
		'adaptor',
		'visibleIndex',
		'isUpdating'
	],
	#category : #Glamour-Morphic-Brick-Widgets-Scrollpane,
	#timestamp : ''
}

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMScrollListBrick class>>example [
	|adaptor|
	adaptor := nil.
	adaptor := GLMBrickListModel new
		sizeLogic: [ 20 ];
		morphAtLogic: [ :index :morph |
			(morph ifNil: [ GLMLabelBrick new ])
				color: Color random muchLighter;
				text: index asString, ' of ', adaptor count asString;
				textPosition: #center;
				height: 40;
				hSpaceFill;
				yourself ].

	^ GLMFoundationBrick new
		brickRoot: (self new model: adaptor);
		extent: 300@400;
		openInWindow
]

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMScrollListBrick class>>exampleCollection [

	^ GLMFoundationBrick new
		brickRoot: (self new model: (GLMBrickListModel new on: Smalltalk allClasses));
		extent: 300@400;
		openInWindow
]

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMScrollListBrick class>>exampleDifferentHeights [
	|adaptor|
	adaptor := nil.
	adaptor := GLMBrickListModel new
		sizeLogic: [ 50 ];
		morphAtLogic: [ :index :morph |
			(morph ifNil: [ GLMLabelBrick new ])
				color: Color random muchLighter;
				text: index asString, ' of ', adaptor count asString;
				textPosition: #center;
				enable;
				height: [ :b | (((index % 10)*10 + 30) +  (1000 * (2 / b width))) asInteger ];
				hSpaceFill;
				yourself ].

	^ GLMFoundationBrick new
		brickRoot: (self new model: adaptor);
		extent: 800@400;
		openInWindow
]

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMScrollListBrick class>>exampleEmptyCollection [
	|adaptor|
	adaptor := nil.
	adaptor := GLMBrickListModel new
		sizeLogic: [ 0 ];
		morphAtLogic: [ :index :morph | 
			(morph ifNil: [ GLMLabelBrick new ])
				color: Color random muchLighter;
				text: index asString, ' of ', adaptor count asString;
				height: 30;
				textPosition: #center;
				hSpaceFill;
				yourself ].

	^ GLMFoundationBrick new
			brickRoot: (self new model: adaptor);
			extent: 300@400;
			openInWindow
]

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMScrollListBrick class>>exampleInfinity [
	|adaptor|
	adaptor := nil.
	adaptor := GLMBrickListModel new
		sizeLogic: [ Float infinity ];
		morphAtLogic: [ :index :morph | 
			(morph ifNil: [ GLMLabelBrick new ])
				color: Color random muchLighter;
				text: index asString, ' of ', adaptor count asString;
				height: 30;
				textPosition: #center;
				hSpaceFill;
				yourself ].

	^ GLMFoundationBrick new
		brickRoot: (self new model: adaptor);
		extent: 300@400;
		openInWindow
]

{
	#category : #adding/removing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMScrollListBrick>>addBrickBackNoLayout: aBrick [

	self band doNotLayoutDuring: [ self band addBrickBack: aBrick ].
	^ aBrick
]

{
	#category : #adding/removing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMScrollListBrick>>addBrickBackNoLayout: aBrick before: anotherBrick [

	self band doNotLayoutDuring: [ self band addBrick: aBrick before: anotherBrick ].
	^ aBrick
]

{
	#category : #adding/removing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMScrollListBrick>>addItemMorph: aMorph after: anotherMorph [

	self addBrickBackNoLayout: aMorph.
	self setBoundsOf: aMorph after: anotherMorph.
	(self isPartiallyVisible: aMorph) ifFalse: [ self removeBrickNoLayout: aMorph. ^ nil ].
	^ aMorph
]

{
	#category : #adding/removing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMScrollListBrick>>addItemMorph: aMorph before: anotherMorph [

	self addBrickBackNoLayout: aMorph before: anotherMorph.
	self setBoundsOf: aMorph before: anotherMorph.
	(self isPartiallyVisible: aMorph) ifFalse: [ self removeBrickNoLayout: aMorph.  ^ nil ].
	
	aMorph brickBounds top < 0
		ifTrue: [ self moveAllSubbricksBy: aMorph brickBounds top negated ]
		ifFalse: [ (self getIndex: aMorph) = 1 ifTrue: [
				self moveAllSubbricksBy: aMorph brickBounds top negated ] ].
	
	^ aMorph
]

{
	#category : #scrolling,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMScrollListBrick>>calculateMaxVelocity [
	"max velocity must depend from the height of the band"
	^ (self height * 0.9) asInteger
]

{
	#category : #layouting,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMScrollListBrick>>doNotUpdateDuring: aBlock  [

	self isUpdating ifTrue: [ ^ self ].
	isUpdating := true.
	aBlock cull: self.
	isUpdating := false.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMScrollListBrick>>gatherInvisibleItems [
			
	^ self band subbricks select: [ :each | (self isPartiallyVisible: each) not ]
]

{
	#category : #'lazy scrolling',
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMScrollListBrick>>getAndRemoveInvisibleMorph: aCollection [
	|brick|
	brick := self retrieveLast: aCollection.
	^ brick ifNotNil: [ self removeBrickNoLayout: brick. brick morph ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMScrollListBrick>>getIndex: aBrick  [

	^ aBrick valueOfProperty: #brickScrollListIndex ifAbsent: [ ]
]

{
	#category : #'lazy scrolling',
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMScrollListBrick>>getMorphAt: anInteger recycled: aMorph [
	|newMorph|
	
	newMorph := (self model morphAt: anInteger convert: aMorph) asBrick.
	newMorph hSpaceFill.
	self setIndex: anInteger in: newMorph.
	^ newMorph
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMScrollListBrick>>hasItems [
	^ self model notNil and: [ self model count > 0 ]
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMScrollListBrick>>initialize [
	super initialize.
	
	self band useVerticalLinearLayout
]

{
	#category : #scrolling,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMScrollListBrick>>invalidate [

	self scrollTo: self visibleIndex
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMScrollListBrick>>isFirstAdded [

	^ (self getIndex: self band firstSubbrick) = 1
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMScrollListBrick>>isFullyVisible [
	self band hasSubbricks ifFalse: [ ^ true ].
	^ self isLastAdded & self isFirstAdded & super isFullyVisible
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMScrollListBrick>>isLastAdded [

	^ (self getIndex: self band lastSubbrick) = self model count
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMScrollListBrick>>isUpdating [

	^ isUpdating ifNil: [ isUpdating := false ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMScrollListBrick>>model [

	^ adaptor
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMScrollListBrick>>model: anAdaptor [

	adaptor := anAdaptor.
	self band hasSubbricks ifFalse: [ self updateVisible ].
	
	"self layoutPolicy layout: self in: self brickBounds.
	self flag: 'Fix bug in Layouts'."
	self update.
]

{
	#category : #layouting,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMScrollListBrick>>moveAllSubbricksBy: anInteger [

	self band subbricks do: [ :each | each translateY: anInteger ].
	self band translateY: anInteger negated
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMScrollListBrick>>newBand [
	^ super newBand height: [ :bandBrick |
		bandBrick subbricks isEmpty
			ifTrue: [ 0 ]
			ifFalse: [ bandBrick lastSubbrick brickBounds bottom ] ].
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMScrollListBrick>>newVerticalScrollbar [

	^ GLMApproximateScrollbarBrick new
]

{
	#category : #brick-layout-events,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMScrollListBrick>>onChildrenLayouted [
	
	self doNotUpdateDuring: [ self update ]
]

{
	#category : #brick-layout-events,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMScrollListBrick>>onLayouted [
	
	self doNotUpdateDuring: [ self update ]
]

{
	#category : #scrolling,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMScrollListBrick>>preventOverscrolling [

	self band hasSubbricks ifFalse: [ ^ self ].

	self isFirstAdded & self isFirstVisible ifTrue: [
			(self bandTopOffset > 0) ifTrue: [
				self moveAllSubbricksBy: self topOffset negated.
				self moveBandTop.
				self update ].
			^ self ].
	self isTopOverscrolled
		ifTrue: [ self moveBandTop.  ^ self update ].
	self isBottomOverscrolled & (self isFullyVisible not)
		ifTrue: [ self moveBandBottom. "self moveAllSubbricksBy: (self band height - self band lastSubbrick brickBounds bottom)." ^ self update ]
]

{
	#category : #adding/removing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMScrollListBrick>>removeBrickNoLayout: aBrick [

	self band doNotLayoutDuring: [ self band removeBrick: aBrick ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMScrollListBrick>>retrieveLast: aCollection [

	^ aCollection isEmpty
		ifTrue: [ nil ]
		ifFalse: [ aCollection removeLast ]
]

{
	#category : #scrolling,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMScrollListBrick>>scrollBy: anInteger [

	self privateScrollPosition: anInteger.
	self band translateY: anInteger.
]

{
	#category : #scrolling,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMScrollListBrick>>scrollDown: anInteger [
	
	self scrollBy: (
		self isLastAdded
			ifTrue: [ anInteger min: (self band brickBounds bottom - self height) ]
			ifFalse: [ anInteger ]) negated
]

{
	#category : #scrolling,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMScrollListBrick>>scrollPageDown [
	
	self
		scrollDown: self calculateMaxVelocity;
		update;
		changed
]

{
	#category : #scrolling,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMScrollListBrick>>scrollPageUp [
	
	self
		scrollUp: self calculateMaxVelocity;
		update;
		changed
]

{
	#category : #scrolling,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMScrollListBrick>>scrollTo: anInteger [
	|brick index|
	self band doNotLayoutDuring: [ self band removeAllBricks ].
	self moveBandTop.
	visibleIndex := nil.
	
	self model count > 0 ifTrue: [
		index := (anInteger max: 1) min: self model count.
		brick := self getMorphAt: index recycled: nil.
		brick 	withWidth: self band width.
		brick 	doLayout.
	
		brick brickBounds: ((0@(0 max: ((self height - brick height) / 2))) extent: brick extent).
		self addBrickBackNoLayout: brick ].
	
	self update.
	self changed
	
	
	
	
]

{
	#category : #scrolling,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMScrollListBrick>>scrollToBottom [

	self scrollTo: self model count
]

{
	#category : #scrolling,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMScrollListBrick>>scrollToTop [

	self scrollTo: 1
]

{
	#category : #scrolling,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMScrollListBrick>>scrollUp: anInteger [
	
	self scrollBy: (
		self isFirstAdded
			ifTrue: [ anInteger min: (self topOffset - self bandTopOffset) ]
			ifFalse: [ anInteger ])
]

{
	#category : #layouting,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMScrollListBrick>>setBoundsOf: aMorph after: afterMorph [
	
	aMorph
		withWidth: self band width;
		brickBounds: (afterMorph brickBounds bottomLeft extent: aMorph extent)
]

{
	#category : #layouting,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMScrollListBrick>>setBoundsOf: aMorph before: beforeMorph [
	|origin corner|
	
	aMorph withWidth: self band width.
	
	corner := beforeMorph brickBounds topRight.
	origin  := beforeMorph brickBounds topLeft - (0@aMorph height).
	
	aMorph brickBounds: (origin corner: corner)
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMScrollListBrick>>setIndex: anInteger in: aBrick  [

	aBrick setProperty: #brickScrollListIndex toValue: anInteger
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMScrollListBrick>>topOffset [

	^ self band firstSubbrick brickBounds top
]

{
	#category : #scrolling,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMScrollListBrick>>update [
	self hasItems ifFalse: [ ^ self ].
	isUpdating := true.
	self updateVisible.
	self doNotLayoutDuring:  [ |delta|
		delta := self bandTopOffset + self topOffset.
		self band doLayoutForce.
		self band translateY: delta.  ].
	self preventOverscrolling.
	self verticalScrollbar updatePosition.
	isUpdating := false.
]

{
	#category : #'lazy scrolling',
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMScrollListBrick>>updateVisible [
	|invisible|
	
	self hasItems ifFalse: [ ^ self ].
	
	invisible := self gatherInvisibleItems.
	invisible = self band subbricks & invisible isEmpty not ifTrue: [ ^ self ].
	
	self updateVisibleTop: invisible.
	self updateVisibleBottom: invisible.
	
	invisible do: [ :each | self removeBrickNoLayout: each ].
	
	visibleIndex := self getIndex: self band firstSubbrick 
]

{
	#category : #'lazy scrolling',
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMScrollListBrick>>updateVisibleBottom: invisibleBricks [
	|after|
	
	after := self band lastSubbrick.
	[ after isNotNil and: [ (self isPartiallyVisible: after) and: [ (self getIndex: after) < self model count ] ] ] whileTrue: [
		after := self
			addItemMorph: (
				self
					getMorphAt: (self getIndex: after) + 1
					recycled: (self getAndRemoveInvisibleMorph: invisibleBricks))
			after: after ].
]

{
	#category : #'lazy scrolling',
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMScrollListBrick>>updateVisibleTop: invisibleBricks [
	|before|
	
	before := self band hasSubbricks not
		ifFalse: [ self band firstSubbrick ]
		ifTrue: [ self addBrickBackNoLayout: (self getMorphAt: self visibleIndex recycled: (self getAndRemoveInvisibleMorph: invisibleBricks)) ].
		
	[ before isNotNil and: [ (self isPartiallyVisible: before) and: [ (self getIndex: before) > 1 ] ] ] whileTrue: [
		before := self
			addItemMorph: (
				self
					getMorphAt: (self getIndex: before) - 1
					recycled: (self getAndRemoveInvisibleMorph: invisibleBricks))
			before: before  ]
	
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMScrollListBrick>>visibleIndex [

	^ visibleIndex ifNil: [ visibleIndex := 1 ]
]
