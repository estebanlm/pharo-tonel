"
A SpecColumnLayout is the layout used to specify a new column
"
Class {
	#name : #SpecColumnLayout,
	#superclass : #SpecLayout,
	#instVars : [
		'height'
	],
	#category : #Spec-Layout,
	#timestamp : '<historical>'
}

{
	#category : #commands,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecColumnLayout>>add: aSpec height: aNumber [
	
	self add: aSpec origin: 0@0 corner: 1@1 offsetOrigin: 0@0 offsetCorner: 0@aNumber 
]

{
	#category : #commands,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecColumnLayout>>addSplitter [

	self commands add: (SpecSplitterHorizontal commands: self commands)
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecColumnLayout>>autoFractionComputation [
	| delta |
	delta := numberOfProportionals isZero
		ifTrue: [ 0 ]
		ifFalse: [ 1 / numberOfProportionals ].
	self commands
		doWithIndex: [ :e :idx | 
			e layoutFrame hasNoOffsets
				ifTrue: [ self setWidgetLayoutWithNoOffset: e at: idx delta: delta ]
				ifFalse: [ self setWidgetLayoutWithOffset: e at: idx ] ]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecColumnLayout>>countNumberOfProportionals [

	self commands	do: [ :e | 
		e layoutFrame hasNoOffsets
			ifTrue: [ 
				(e layoutFrame topFraction == 0 and: [ e layoutFrame bottomFraction == 1 ])
					ifFalse: [ autoFractionComputation := false ].
				numberOfProportionals := numberOfProportionals + 1 ] ]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecColumnLayout>>manualFractionComputation [
	
	self commands	doWithIndex: [ :e :idx | 
		e layoutFrame hasNoOffsets
			ifTrue: [  | delta |
				delta := e layoutFrame bottomFraction - e layoutFrame topFraction.
				self setWidgetLayoutWithNoOffset: e at: idx delta: delta ]
			ifFalse: [ self setWidgetLayoutWithOffset: e at: idx ] ]
]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecColumnLayout>>privateAsArray [

	self resetArrayComputation.
	self countNumberOfProportionals.

	autoFractionComputation
		ifTrue: [ self autoFractionComputation ]
		ifFalse: [ self manualFractionComputation ].

	self shiftLastWidgets.

	result addAll: super privateAsArray.
	^ result asArray
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecColumnLayout>>resetArrayComputation [

	super resetArrayComputation.
	
	size := self commands size.
	numberOfProportionals := 0.
	lastFractionIndex := 0.
	autoFractionComputation := true.
	currentOffset := 0.
	currentProportional := 0
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecColumnLayout>>setWidgetLayoutWithNoOffset: widget at: index delta: delta [

	widget layoutFrame:
		((0 @ currentProportional corner: 1 @ (currentProportional + delta)) asLayoutFrame 
			topOffset: currentOffset;
			yourself).
				
	currentOffset := 0.
	currentProportional := currentProportional + delta.
	
	lastFractionIndex := index
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecColumnLayout>>setWidgetLayoutWithOffset: widget at: index [

	height := widget bottomOffset - widget topOffset.
	
	index = size
		ifTrue: [ 
			widget layoutFrame:
				((0 @ 1 corner: 1 @ 1) asLayoutFrame
					topLeftOffset: widget leftOffset @ height negated;
					bottomRightOffset: widget rightOffset @ 0) ]
		ifFalse: [ 
			widget layoutFrame:
				((0 @ currentProportional corner: 1 @ currentProportional) asLayoutFrame
					topLeftOffset: widget leftOffset @ currentOffset;
					bottomRightOffset: widget rightOffset @ (currentOffset + height)).
			currentOffset := currentOffset + height ]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecColumnLayout>>shiftLastWidgets [
	| index ante |	
	
	(lastFractionIndex > 0 and: [ lastFractionIndex < size ]) ifFalse: [ ^ self ].
	
	index := size - 1.
	[ index > lastFractionIndex ] whileTrue: [ | myHeight |
			ante := self commands at: index.
			index := index - 1.
			myHeight := ante bottomOffset - ante topOffset.
			ante
				topOffset: (height + myHeight) negated;
				bottomOffset: height negated.
			height := height + myHeight ].
		
	self assert: index = lastFractionIndex.
	
	ante := self commands at: index.
	ante bottomOffset: height negated
]
