"
A SpecPresenter is a object used to describe a user interface
"
Class {
	#name : #SpecLayout,
	#superclass : #Object,
	#instVars : [
		'type',
		'commands',
		'selector',
		'result',
		'shouldCheckSplitters',
		'currentOffset',
		'currentProportional',
		'numberOfProportionals',
		'lastFractionIndex',
		'autoFractionComputation',
		'size'
	],
	#category : #Spec-Layout,
	#timestamp : '<historical>'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecLayout class>>composed [

	^self new
		type: #ContainerModel;
		yourself
]

{
	#category : #constants,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecLayout class>>windowBorderWidth [

	^ 0
]

{
	#category : #commands,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecLayout>>add: aSpec  [
	
	self add: aSpec origin: 0@0 corner: 1@1
]

{
	#category : #commands-advanced,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecLayout>>add: aBlock bottom: aNumber [
	
	self add: aBlock top: nil bottom: aNumber left: nil right: nil
]

{
	#category : #commands-advanced,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecLayout>>add: aBlock left: aNumber [
	
	self add: aBlock top: nil bottom: nil left: aNumber right: nil
]

{
	#category : #commands-advanced,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecLayout>>add: aBlock left: left right: right [
	
	self add: aBlock top: nil bottom: nil left: left right: right
]

{
	#category : #commands,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecLayout>>add: aSpec origin: originPoint corner: cornerPoint  [

	self add: aSpec origin: originPoint corner: cornerPoint offsetOrigin: 0@0 offsetCorner: 0@0
]

{
	#category : #commands,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecLayout>>add: aSpec origin: originPoint corner: cornerPoint offsetOrigin: ooPoint offsetCorner: ocPoint [
	
	commands add: (SpecLayoutAdd 
							subwidget: aSpec
							layoutFrame: 
								((originPoint corner: cornerPoint) asLayoutFrame 
									topLeftOffset: ooPoint;
									bottomRightOffset: ocPoint ))
]

{
	#category : #commands-advanced,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecLayout>>add: aBlock right: aNumber [
	
	self add: aBlock top: nil bottom: nil left: nil right: aNumber
]

{
	#category : #commands-advanced,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecLayout>>add: aBlock top: aNumber [

	self add: aBlock top: aNumber bottom: nil left: nil right: nil
]

{
	#category : #commands-advanced,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecLayout>>add: aBlock top: top bottom: bottom [
	
	self add: aBlock top: top bottom: bottom left: nil right: nil
]

{
	#category : #commands-advanced,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecLayout>>add: aBlock top: top bottom: bottom left: left right: right [
	| layout |
	
	layout := self computeLayoutFromTop: top bottom: bottom left: left right: right.
		
	self 
		add: aBlock
		origin: layout first
		corner: layout second
		offsetOrigin: layout third
		offsetCorner: layout fourth
]

{
	#category : #commands,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecLayout>>add: modelGetter withSpec: aSymbol  [
	
	self add: modelGetter withSpec: aSymbol origin: 0@0 corner: 1@1
]

{
	#category : #commands-advanced,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecLayout>>add: aBlock withSpec: aSpec bottom: aNumber [
	
	self add: aBlock withSpec: aSpec top: nil bottom: aNumber left: nil right: nil
]

{
	#category : #commands-advanced,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecLayout>>add: aBlock withSpec: aSpec left: aNumber [
	
	self add: aBlock withSpec: aSpec top: nil bottom: nil left: aNumber right: nil
]

{
	#category : #commands-advanced,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecLayout>>add: aBlock withSpec: aSpec left: left right: right [
	
	self add: aBlock withSpec: aSpec top: nil bottom: nil left: left right: right
]

{
	#category : #commands,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecLayout>>add: modelGetter withSpec: aSymbol origin: originPoint corner: cornerPoint  [

	self add: modelGetter withSpec: aSymbol origin: originPoint corner: cornerPoint offsetOrigin: 0@0 offsetCorner: 0@0
]

{
	#category : #commands,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecLayout>>add: modelGetter withSpec: aSymbol origin: originPoint corner: cornerPoint offsetOrigin: ooPoint offsetCorner: ocPoint [

	commands add: (SpecLayoutAddWithSpec 
							subwidget: modelGetter 
							spec: aSymbol 
							layoutFrame: ((originPoint corner: cornerPoint) asLayoutFrame 
												topLeftOffset: ooPoint;
												bottomRightOffset: ocPoint))
]

{
	#category : #commands-advanced,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecLayout>>add: aBlock withSpec: aSpec right: aNumber [
	
	self add: aBlock withSpec: aSpec top: nil bottom: nil left: nil right: aNumber
]

{
	#category : #commands-advanced,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecLayout>>add: aBlock withSpec: aSpec top: aNumber [
	
	self add: aBlock withSpec: aSpec top: aNumber bottom: nil left: nil right: nil
]

{
	#category : #commands-advanced,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecLayout>>add: aBlock withSpec: aSpec top: top bottom: bottom [
	
	self add: aBlock withSpec: aSpec top: top bottom: bottom left: nil right: nil
]

{
	#category : #commands-advanced,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecLayout>>add: aBlock withSpec: aSpec top: top bottom: bottom left: left right: right [
	| layout |
	
	layout := self computeLayoutFromTop: top bottom: bottom left: left right: right.
		
	self 
		add: aBlock
		withSpec: aSpec 
		origin: layout first
		corner: layout second
		offsetOrigin: layout third
		offsetCorner: layout fourth
]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecLayout>>addHSplitter [

	self commands add: (SpecSplitterHorizontal commands: self commands)
]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecLayout>>addVSplitter [

	self commands add: (SpecSplitterVertical commands: self commands)
]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecLayout>>asArray [
	^ (OrderedCollection new
		add: self type;
		addAll: self privateAsArray;
		yourself) asArray
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecLayout>>commands [
	^ commands
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecLayout>>commands: anObject [
	commands := anObject
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecLayout>>computeLayoutFromTop: top bottom: bottom left: left right: right [
	| originY offsetCornerX cornerX offsetOriginY offsetCornerY cornerY originX offsetOriginX |
	
	originX := left isFloat
		ifTrue: [ left ]
		ifFalse: [ 0 ].
	originY := top isFloat
		ifTrue: [ top ]
		ifFalse: [ 0 ].
	cornerX := right isFloat
		ifTrue: [ 1 - right ]
		ifFalse: [ 1 ].
	cornerY := bottom isFloat
		ifTrue: [ 1 - bottom ]
		ifFalse: [ 1 ].
	offsetOriginX := left isInteger
		ifTrue: [ left ]
		ifFalse: [ 0 ].
	offsetOriginY := top isInteger
		ifTrue: [ top ]
		ifFalse: [ 0 ].
	offsetCornerX := right isInteger
		ifTrue: [ right negated ]
		ifFalse: [ 0 ].
	offsetCornerY := bottom isInteger
		ifTrue: [ bottom negated ]
		ifFalse: [ 0 ].
		
	^ { originX@originY. cornerX@cornerY. offsetOriginX@offsetOriginY. offsetCornerX@offsetCornerY }
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecLayout>>computeNotSplitterWidget: widget [
	
	self
		setOffsetsFor: widget
		top: widget topOffset
		left: widget leftOffset
		bottom: widget bottomOffset
		right: widget rightOffset
		borderWidth: self class windowBorderWidth.
	
	widget generateArguments.
	widget asSpecElements do: [ :el | result add: el ]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecLayout>>computeNotSplitterWidgets [

	(self commands reject: [ :e | e isSplitter ]) 
		do: [ :e | self computeNotSplitterWidget: e ]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecLayout>>computeSplitters [

	(self commands select: [ :e | e isSplitter ])
		do: [ :e | 
			shouldCheckSplitters := true.
			e generateArguments.
			e asSpecElements do: [ :el | result add: el ] ].
	shouldCheckSplitters
		ifTrue: [ result add: #checkSplitters ]
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecLayout>>initialize  [
	super initialize.
	
	type := #ContainerModel.
	self commands: OrderedCollection new.
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecLayout>>isSpecLayout [

	^ true
]

{
	#category : #commands,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecLayout>>newColumn: aBlock  [
	
	self newColumn: aBlock origin: 0@0 corner: 1@1
]

{
	#category : #commands-advanced,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecLayout>>newColumn: aBlock left: aNumber [
	
	self newColumn: aBlock left: aNumber right: nil
]

{
	#category : #commands-advanced,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecLayout>>newColumn: aBlock left: left right: right [
	| layout |
	
	layout := self computeLayoutFromTop: nil bottom: nil left: left right: right.

	self 
		newColumn: aBlock
		origin: layout first
		corner: layout second
		offsetOrigin: layout third
		offsetCorner: layout fourth
]

{
	#category : #commands,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecLayout>>newColumn: aBlock origin: originPoint corner: cornerPoint  [

	self newColumn: aBlock origin: originPoint corner: cornerPoint offsetOrigin: 0@0 offsetCorner: 0@0
]

{
	#category : #commands,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecLayout>>newColumn: aBlock origin: originPoint corner: cornerPoint offsetOrigin: ooPoint offsetCorner: ocPoint [
	| block |
	
	block := aBlock.
	block isBlock ifFalse: [ block := [:c | c add: aBlock ] ].
	
	commands add: (SpecLayoutAddColumn
							block: block
							layoutFrame: ((originPoint corner: cornerPoint) asLayoutFrame
										topLeftOffset: ooPoint;
										bottomRightOffset: ocPoint)).
]

{
	#category : #commands-advanced,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecLayout>>newColumn: aBlock right: aNumber [
	
	self newColumn: aBlock left: nil right: aNumber
]

{
	#category : #commands,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecLayout>>newColumn: aBlock  width: aNumber [
	
	self newColumn: aBlock  origin: 0@0 corner: 0@1 offsetOrigin: 0@0 offsetCorner: aNumber @0
]

{
	#category : #commands,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecLayout>>newRow: aBlock  [
	
	self newRow: aBlock origin: 0@0 corner: 1@1
]

{
	#category : #commands-advanced,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecLayout>>newRow: aBlock bottom: aNumber [
	
	self newRow: aBlock top: nil bottom: aNumber
]

{
	#category : #commands,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecLayout>>newRow: aBlock height: aNumber [
	
	self newRow: aBlock origin: 0@0 corner: 1@0 offsetOrigin: 0@0 offsetCorner: 0@aNumber 
]

{
	#category : #commands,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecLayout>>newRow: aBlock origin: originPoint corner: cornerPoint  [

	self newRow: aBlock origin: originPoint corner: cornerPoint offsetOrigin: 0@0 offsetCorner: 0@0
]

{
	#category : #commands,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecLayout>>newRow: aBlock origin: originPoint corner: cornerPoint offsetOrigin: ooPoint offsetCorner: ocPoint [
	| block |
	
	block := aBlock.
	block isBlock ifFalse: [ block := [:r | r add: aBlock ] ].
	
	commands add: (SpecLayoutAddRow
							block: block
							layoutFrame: ((originPoint corner: cornerPoint) asLayoutFrame 
										topLeftOffset: ooPoint;
										bottomRightOffset: ocPoint)).
]

{
	#category : #commands-advanced,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecLayout>>newRow: aBlock top: aNumber [
	
	self newRow: aBlock top: aNumber bottom: nil
]

{
	#category : #commands-advanced,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecLayout>>newRow: aBlock top: top bottom: bottom [
	| layout |
	
	layout := self computeLayoutFromTop: top bottom: bottom left: nil right: nil.
		
	self 
		newRow: aBlock
		origin: layout first
		corner: layout second
		offsetOrigin: layout third
		offsetCorner: layout fourth
]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecLayout>>privateAsArray [

	self resetArrayComputation.
	
	self computeNotSplitterWidgets.
	self computeSplitters.
	
	^ result asArray
]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecLayout>>resetArrayComputation [
	result := OrderedCollection new.
	shouldCheckSplitters := false
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecLayout>>selector [
	^ selector
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecLayout>>selector: anObject [
	selector := anObject
]

{
	#category : #commands,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecLayout>>send: aSelector [
	
	self send: aSelector withArguments: #()
]

{
	#category : #commands,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecLayout>>send: aSelector withArguments: arguments [


	self commands add: (SpecLayoutSend
							selector: aSelector
							arguments: arguments).
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecLayout>>setBottomOffset: bottom for: widget borderWidth: windowBorderWidth [

	widget bottomFraction = 1
		ifTrue: [ 
			bottom isZero
				ifTrue: [ widget bottomOffset: windowBorderWidth negated ]
				ifFalse: [ widget bottomOffset: bottom - ProportionalSplitterMorph splitterWidth ] ]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecLayout>>setLeftOffset: left for: widget borderWidth: windowBorderWidth [

	widget leftFraction = 0
		ifTrue: [ 
			left isZero
				ifTrue: [ widget leftOffset: windowBorderWidth ]
				ifFalse: [ widget leftOffset: left + ProportionalSplitterMorph splitterWidth ] ]
		ifFalse: [ 
			widget leftFraction = 1
				ifFalse: [ widget leftOffset: left + ProportionalSplitterMorph splitterWidth ] ]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecLayout>>setOffsetsFor: widget top: top left: left bottom: bottom right: right borderWidth: windowBorderWidth [

	self setRightOffset: right for: windowBorderWidth borderWidth: widget.
	self setLeftOffset: left for: widget borderWidth: windowBorderWidth.
	self setBottomOffset: bottom for: widget borderWidth: windowBorderWidth.
	self setTopOffset: top for: widget borderWidth: windowBorderWidth
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecLayout>>setRightOffset: right for: windowBorderWidth borderWidth: widget [

	widget rightFraction = 1
		ifTrue: [ 
			right isZero
				ifTrue: [ widget rightOffset: windowBorderWidth negated ]
				ifFalse: [ widget rightOffset: right - ProportionalSplitterMorph splitterWidth ] ]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecLayout>>setTopOffset: top for: widget borderWidth: windowBorderWidth [

	widget topFraction = 0
		ifTrue: [
			top isZero
				ifTrue: [ widget topOffset: windowBorderWidth ]
				ifFalse: [ widget topOffset: top + ProportionalSplitterMorph splitterWidth ] ]
		ifFalse: [ 
			widget topFraction = 1
				ifFalse: [ widget topOffset: top + ProportionalSplitterMorph splitterWidth ] ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecLayout>>type [
	^ type
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecLayout>>type: anObject [
	type := anObject
]
