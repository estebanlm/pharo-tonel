"

"
Class {
	#name : #MergeJoinSection,
	#superclass : #JoinSection,
	#instVars : [
		'selectedBorderColor',
		'selected',
		'selectionState',
		'stateIcons',
		'allowClick'
	],
	#category : #Tool-Diff,
	#timestamp : ''
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:25'
}
MergeJoinSection>>allowClick [
	"Answer the value of allowClick"

	^ allowClick
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:25'
}
MergeJoinSection>>allowClick: anObject [
	"Set the value of allowClick"

	allowClick := anObject
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:25'
}
MergeJoinSection>>appendToCompositeText: aText [
	"If appropriate append the relevant src or dst text to the given text."
	
	self selectionState == #src ifTrue: [^aText append: self src text].
	self selectionState == #dst ifTrue: [^aText append: self dst text].
	self selectionState == #both ifTrue: [
		^aText
			append: self src text;
			append: self dst text]
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:25'
}
MergeJoinSection>>borderColorToUse [
	"Answer the border color to use based on the selection state."
	
	^self selected
		ifTrue: [self selectedBorderColor]
		ifFalse: [super borderColorToUse]
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:25'
}
MergeJoinSection>>clicked [
	"The receiver or a highlight was clicked."

	self wantsClick ifFalse: [^false].
	self selectNextState.
	^true
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:25'
}
MergeJoinSection>>containsPoint: aPoint [
	"Answer whether the receiver contains the given point."

	^(super containsPoint: aPoint) or: [
		self stateIcon notNil and: [self stateIconBounds containsPoint: aPoint]]
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:25'
}
MergeJoinSection>>defaultStateIcons [
	"Answer the default state icons."

	^ {(self iconNamed: #smallBackIcon) . (self iconNamed: #smallForwardIcon) .
	(self iconNamed: #smallOkIcon) . (self iconNamed: #smallCancelIcon)}
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:25'
}
MergeJoinSection>>drawOn: aCanvas [
	"Draw the join on the given canvas."
	
	super drawOn: aCanvas.
	self stateIcon ifNotNil: [:i |
		aCanvas
			translucentImage: i
			at: self stateIconBounds topLeft]
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:25'
}
MergeJoinSection>>initialize [
	"Initialize the receiver."

	self
		allowClick: true;
		selected: false;
		selectionState: #dst;
		stateIcons: self defaultStateIcons;
		selectedBorderColor: Color black.
	super initialize
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:25'
}
MergeJoinSection>>selectNextState [
	"Set the selection state to the next one with wraparound."

	self selectionState: (
		self selectionStates at: (
			(self selectionStates indexOf: self selectionState) \\
				self selectionStates size + 1))
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:25'
}
MergeJoinSection>>selected [
	"Answer the value of selected"

	^ selected
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:25'
}
MergeJoinSection>>selected: aBoolean [
	"Set the value of selected"

	selected := aBoolean.
	self
		updateHighlights;
		changed: #selected
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:25'
}
MergeJoinSection>>selectedBorderColor [
	"Answer the value of selectedBorderColor"

	^ selectedBorderColor
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:25'
}
MergeJoinSection>>selectedBorderColor: anObject [
	"Set the value of selectedBorderColor"

	selectedBorderColor := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:25'
}
MergeJoinSection>>selectionState [
	"Answer the value of selectionState"

	^ selectionState
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:25'
}
MergeJoinSection>>selectionState: anObject [
	"Set the value of selectionState"

	selectionState := anObject
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:25'
}
MergeJoinSection>>selectionStates [
	"Answer the valid selection states in order."

	^#(src dst both neither)
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:25'
}
MergeJoinSection>>stateIcon [
	"Answer the state icon to use."

	self wantsClick ifFalse: [^nil].
	^self stateIcons at: (self selectionStates indexOf: self selectionState)
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:25'
}
MergeJoinSection>>stateIconBounds [
	"Answer the bounds of the state icon."
	
	|i|
	i := self stateIcon ifNil: [^nil].
	^self shape bounds center - (i extent // 2)
		extent: i extent
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:25'
}
MergeJoinSection>>stateIcons [
	"Answer the value of stateIcons"

	^ stateIcons
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:25'
}
MergeJoinSection>>stateIcons: anObject [
	"Set the value of stateIcons"

	stateIcons := anObject
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:25'
}
MergeJoinSection>>wantsClick [
	"Allow if explictly enabled and super."

	^self allowClick and: [super wantsClick]
]
