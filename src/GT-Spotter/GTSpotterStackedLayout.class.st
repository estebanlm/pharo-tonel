"

"
Class {
	#name : #GTSpotterStackedLayout,
	#superclass : #GLMVerticalLinearLayout,
	#instVars : [
		'allowedBounds'
	],
	#category : #GT-Spotter-UI,
	#timestamp : ''
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterStackedLayout>>allowedBounds [
	^ allowedBounds
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterStackedLayout>>allowedBounds: anObject [
	allowedBounds := anObject
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterStackedLayout>>cutAllowedBoundsBottom: aBrick [

	self allowedBounds: (self shrinkBottom: self allowedBounds with: aBrick )
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterStackedLayout>>cutAllowedBoundsTop: aBrick [

	self allowedBounds: (self shrinkTop: self allowedBounds with: aBrick )
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterStackedLayout>>decreaseZindex: aBrick [

	aBrick layoutProperties zIndex: 1.
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterStackedLayout>>deltaBottom: aBrick [

	^ aBrick globalOuterBounds corner y -  self allowedBounds corner y
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterStackedLayout>>deltaTop: aBrick [

	^ self allowedBounds origin y - aBrick globalOuterBounds origin y
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterStackedLayout>>gatherStacked: aBrick [
	|list|
	
	list := DoubleLinkedList new.
	aBrick subbricks do: [ :each | each layoutProperties floating = #stack ifTrue: [ list add: each ] ].
	^ list
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterStackedLayout>>increaseZindex: aBrick [

	aBrick layoutProperties zIndex: 2.
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterStackedLayout>>isAbove: aBrick [

	^ aBrick globalOuterBounds origin <= self allowedBounds origin
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterStackedLayout>>isAbove: aBrick in: aRectangle [

	^ aBrick globalOuterBounds origin <= aRectangle origin
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterStackedLayout>>isFullyVisible: aBrick [
	
	^ self allowedBounds containsRect: aBrick globalOuterBounds
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterStackedLayout>>isFullyVisible: aBrick in: aRectangle [
	
	^ aRectangle containsRect: aBrick globalOuterBounds
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterStackedLayout>>isPartiallyVisibleAbove: aBrick [

	^ (self isFullyVisible: aBrick) not & (self isAbove: aBrick)
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterStackedLayout>>isVisible: aBrick [
	
	^ self allowedBounds containsRect: aBrick globalOuterBounds
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterStackedLayout>>isVisible: aBrick in: aRectangle [
	
	^ aRectangle intersects: aBrick globalOuterBounds
]

{
	#category : #layout,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterStackedLayout>>layout: aBrick in: newBounds [
	
	^ super layout: aBrick in: newBounds.
	"^ self layoutStacked: aBrick in: newBounds"
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterStackedLayout>>layoutAllowedBottom: aBrick [

	self
		translate: aBrick by: (self deltaBottom: aBrick) negated;
		increaseZindex: aBrick;
		cutAllowedBoundsBottom: aBrick
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterStackedLayout>>layoutAllowedTop: aBrick [

	self
		translate: aBrick by: (self deltaTop: aBrick);
		increaseZindex: aBrick;
		cutAllowedBoundsTop: aBrick
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterStackedLayout>>layoutProportional: aCollection in: aBrick position: aSymbol [
	| fullWidth eachWidth index |
	aCollection isEmpty ifTrue: [ ^ self ].
	
	fullWidth := aBrick innerBounds width.
	index := 0.
	aCollection inject: aBrick paddingLeft into: [ :leftOffset :each |
		|layoutBounds|
		
		self sendEvent: (GLMBrickLayoutStacked new index: (index + 1); position: aSymbol; yourself) to: each.
		
		eachWidth := ((fullWidth - leftOffset) / (aCollection size - index)) ceiling.
		
		layoutBounds := each wrappedBounds.
		index = 0
			ifTrue: [ layoutBounds width: (((each layout maxWidth brickValue: each) max: eachWidth) min: (fullWidth - leftOffset)) ]
			ifFalse: [				
				(index = (aCollection size - 1))
					ifFalse: [ layoutBounds width: (eachWidth min: (each layout maxWidth brickValue: each)) ]
					ifTrue: [ layoutBounds width: eachWidth ] ].
		
		layoutBounds translateBy: (leftOffset@0).
		each brickBounds: layoutBounds.
		index := index + 1.
		leftOffset + layoutBounds outerBounds width ]
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterStackedLayout>>layoutStacked: aBrick in: newBounds [
	| origStackedBricks stackedBricks forward stackedTopBricks stackedBottomBricks stackedTopHeight stackedBottomHeight|
	self flag: 'refactor me'.
	self allowedBounds: newBounds.
	stackedBricks := self gatherStacked: aBrick.
	origStackedBricks := DoubleLinkedList new.
	origStackedBricks addAll: stackedBricks.
	forward := true.
	
	stackedTopHeight := 0.
	stackedBottomHeight := 0.
	stackedTopBricks := OrderedCollection new.
	stackedBottomBricks := OrderedCollection new.
	
	"going from top to bottom"
	[ stackedBricks isEmpty not & forward] whileTrue: [ |brick|
		brick := stackedBricks removeFirst value.
		(self isVisible: brick) ifFalse: [
			(self isAbove: brick) ifTrue: [ |delta|
				delta := (self deltaTop: brick) - stackedTopHeight.
				brick translateX: delta negated.
				self increaseZindex: brick.
				stackedTopBricks isEmpty ifTrue: [
					stackedTopHeight := stackedTopHeight + brick globalOuterBounds height.
					self cutAllowedBoundsTop: brick ].
				stackedTopBricks add: brick.
			] ifFalse: [ forward := false. stackedBricks addFirst: brick ]
		] ifTrue: [
			(self isPartiallyVisibleAbove: brick)
				ifTrue: [ self layoutAllowedTop: brick ]
				ifFalse: [ forward := false. self decreaseZindex: brick.	stackedBricks addFirst: brick ] ] ].

	"going from bottom to top"
	[ stackedBricks isEmpty not ] whileTrue: [ |brick|
		brick := stackedBricks removeLast value.
		(self isVisible: brick) ifFalse: [ |delta|
			delta := (self deltaBottom: brick) - stackedBottomHeight.
			brick translateX: delta negated.
			self increaseZindex: brick.
			stackedBottomBricks isEmpty ifTrue: [
				stackedBottomHeight := stackedBottomHeight + brick globalOuterBounds height.
				self cutAllowedBoundsBottom: brick ].
			stackedBottomBricks add: brick.
		] ifTrue: [
			(self isFullyVisible: brick )
				ifFalse: [ self layoutAllowedBottom: brick ]
				ifTrue: [ self decreaseZindex: brick ] ] ].

	self layoutProportional: stackedTopBricks reverse in: aBrick position: #top.
	self layoutProportional: stackedBottomBricks reverse in: aBrick position: #bottom.
	
	"origStackedBricks do: [ :each | each doLayout ]."
	
	^ allowedBounds
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterStackedLayout>>shrinkBottom: aRectangle with: aBrick [

	^ aRectangle bottom: (aRectangle bottom - aBrick globalOuterBounds height)
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterStackedLayout>>shrinkTop: aRectangle with: aBrick [

	^ aRectangle top: (aRectangle top + aBrick globalOuterBounds height)
]
