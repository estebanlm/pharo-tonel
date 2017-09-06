"

"
Class {
	#name : #RubTextSegmentMorph,
	#superclass : #RubSegmentMorph,
	#instVars : [
		'textArea',
		'firstIndex',
		'lastIndex',
		'icon',
		'iconBlock',
		'label',
		'changeable'
	],
	#category : #Rubric-Editing-Core,
	#timestamp : ''
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubTextSegmentMorph class>>from: aFirstCharIndex to: aLastCharIndex [
	^ self new from: aFirstCharIndex to: aLastCharIndex
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubTextSegmentMorph class>>inTextArea: aTextArea from: aFirstCharIndex to: aLastCharIndex [
	^ self new inTextArea: aTextArea from: aFirstCharIndex to: aLastCharIndex
]

{
	#category : #ui,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubTextSegmentMorph>>addItemToMenu: aMenu [

|item|
	item := RubSegmentIconMenuItemMorph new
		contents: self label;
		target: self iconBlock;
		selector: #cull:;
		arguments: {self};
		icon: self icon;
		segment: self.
		
		^ aMenu addMenuItem: item
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubTextSegmentMorph>>beChangeable [
	self changeable: true
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubTextSegmentMorph>>beExtendable [
	self changeable: false
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubTextSegmentMorph>>beSmoothCurve [
	super beSmoothCurve.
	self textArea ifNotNil: [ self computeVertices ].

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubTextSegmentMorph>>changeable [
	^ changeable ifNil: [ changeable := true ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubTextSegmentMorph>>changeable: aBoolean [
	changeable := aBoolean
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubTextSegmentMorph>>characterBlockForIndex: anIndex [
	^ self textArea paragraph characterBlockForIndex: anIndex
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubTextSegmentMorph>>computeSmoothVertices [
	| firstCB lastCB firstLineIndex lastLineIndex firstLine lastLine verts |
	firstLineIndex := self lineIndexOfCharacterIndex: firstIndex.
	lastLineIndex := self lineIndexOfCharacterIndex: lastIndex.
	firstLine := self lines at: firstLineIndex.
	lastLine := self lines at: lastLineIndex.
	verts := OrderedCollection new.
	firstLine = lastLine
		ifTrue: [ 
			firstCB := self textArea paragraph firstNonBlankCharacterBlockInLine: firstLine.
			verts add: firstCB bottomLeft.
			verts add: firstCB topLeft.
			firstIndex ~= lastIndex
				ifTrue: [ 
					lastCB := self textArea paragraph lastNonBlankCharacterBlockInLine: firstLine.
					verts add: lastCB topLeft.
					verts add: lastCB bottomLeft.
					verts add: firstCB bottomLeft ] ]
		ifFalse: [ 
			| currLine currIdx cb |
			currIdx := firstLineIndex.
			currLine := firstLine.
			[ 
			cb := self textArea paragraph lastNonBlankCharacterBlockInLine: currLine.
			verts add: cb topRight.
			verts add: cb bottomRight.
			currIdx := currIdx + 1.
			currLine := self lines at: currIdx ] doWhileTrue: [ currLine ~~ lastLine ].
			cb := self textArea paragraph lastNonBlankCharacterBlockInLine: currLine.
			verts add: cb topRight.
			verts add: cb bottomRight.
			[ 
			cb := self textArea paragraph firstNonBlankCharacterBlockInLine: currLine.
			verts add: cb bottomLeft - (1 @ 0).
			verts add: cb topLeft - (1 @ 0).
			currIdx := currIdx - 1.
			currLine := self lines at: currIdx ] doWhileTrue: [ currLine ~~ firstLine ].
			cb := self textArea paragraph firstNonBlankCharacterBlockInLine: currLine.
			verts add: cb bottomLeft - (1 @ 0).
			verts add: cb topLeft - (1 @ 0) ].
	self setVertices: verts
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubTextSegmentMorph>>computeStraightVertices [
	| firstCB lastCB firstLineIndex lastLineIndex firstLine lastLine verts secondLine thirdLine |
	firstCB := self characterBlockForIndex: firstIndex.
	lastCB := self characterBlockForIndex: lastIndex.
	firstLineIndex := self lineIndexOfCharacterIndex: firstIndex.
	lastLineIndex := self lineIndexOfCharacterIndex: lastIndex.
	firstLine := self lines at: firstLineIndex.
	lastLine := self lines at: lastLineIndex.
	verts := OrderedCollection new.
	firstLine = lastLine
		ifTrue: [ 
			verts add: firstCB bottomLeft.
			verts add: firstCB topLeft.
			firstIndex ~= lastIndex
				ifTrue: [ 
					verts add: lastCB topLeft.
					verts add: lastCB bottomLeft.
					verts add: firstCB bottomLeft ] ]
		ifFalse: [ 
			secondLine := self lines at: firstLineIndex + 1.
			thirdLine := self lines at: lastLineIndex - 1.
			verts add: firstCB bottomLeft - (1 @ 0).
			verts add: firstCB topLeft - (1 @ 0).
			verts add: (self textArea right - self margins right) @ firstLine top.
			verts add: (self textArea right - self margins right) @ thirdLine bottom.
			verts add: lastCB topLeft.
			verts add: lastCB bottomLeft.
			verts add: lastLine bottomLeft - (1 @ 0).
			verts add: secondLine topLeft - (1 @ 0).
			verts add: firstCB bottomLeft - (1 @ 0) ].
	self setVertices: verts
]

{
	#category : #drawing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubTextSegmentMorph>>computeVertices [
	self isCurve
		ifTrue: [ self computeSmoothVertices ]
		ifFalse: [ self computeStraightVertices ]
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubTextSegmentMorph>>defaultColor [
	^ Color red
]

{
	#category : #submorphs-add/remove,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubTextSegmentMorph>>delete [
	textArea ifNotNil: [ :ta | ta removeSegment: self ].
	textArea := nil.
	super delete
]

{
	#category : #drawing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubTextSegmentMorph>>displayIconAt: aPosition on: aCanvas [
	self icon ifNil: [ ^self ].
	aCanvas translucentImage: self icon at: aPosition
]

{
	#category : #drawing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubTextSegmentMorph>>displayIconAt: aPosition onAthensCanvas: aCanvas [
	self icon ifNil: [ ^self ].
	aCanvas pathTransform
		restoreAfter: [ 
			aCanvas paintOptions composeOver.
			aCanvas setPaint: self icon.
			aCanvas pathTransform translateBy: aPosition.
			aCanvas drawShape: self icon boundingBox]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubTextSegmentMorph>>firstIndex [
	^ firstIndex 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubTextSegmentMorph>>firstIndex: anInteger [
	firstIndex := anInteger.
	self computeVertices 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubTextSegmentMorph>>firstLineIndex [
	^  self lineIndexOfCharacterIndex: firstIndex
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubTextSegmentMorph>>from: aFirstCharIndex to: aLastCharIndex [
	lastIndex := aFirstCharIndex max: aLastCharIndex.
	firstIndex := aFirstCharIndex min: aLastCharIndex
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubTextSegmentMorph>>getText  [
	^ self textArea text copyFrom: self firstIndex to: self lastIndex - 1
]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubTextSegmentMorph>>handlesMouseOver: evt [
	^ true
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubTextSegmentMorph>>icon [
	^ icon 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubTextSegmentMorph>>icon: aForm [
	icon := aForm
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubTextSegmentMorph>>iconBlock [
	^ iconBlock ifNil: [ iconBlock := [ :seg :evt | ] ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubTextSegmentMorph>>iconBlock: aBlock [
	iconBlock := aBlock
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubTextSegmentMorph>>inTextArea: aTextArea  [
	textArea := aTextArea.
	self computeVertices
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubTextSegmentMorph>>inTextArea: aTextArea from: aFirstCharIndex to: aLastCharIndex [
	self from: aFirstCharIndex to: aLastCharIndex.
	self inTextArea:  aTextArea

]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubTextSegmentMorph>>initialize [
	super initialize.
	self borderWidth: 0.
	self beStraightSegments.
	self clipSubmorphs: false

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubTextSegmentMorph>>interval [
	^ self firstIndex to: self lastIndex
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubTextSegmentMorph>>label [
	^ label value ifNil: [ label := '']
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubTextSegmentMorph>>label: aStringOrBlock [
	label := aStringOrBlock
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubTextSegmentMorph>>lastIndex [
	^ lastIndex 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubTextSegmentMorph>>lastIndex: anInteger [
	lastIndex := anInteger.
	self computeVertices 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubTextSegmentMorph>>lastLineIndex [
	^ self lineIndexOfCharacterIndex: lastIndex
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubTextSegmentMorph>>lineIndexOfCharacterIndex: anIndex [
	^ self textArea paragraph lineIndexOfCharacterIndex: anIndex
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubTextSegmentMorph>>lines [
	^ self textArea paragraph lines
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubTextSegmentMorph>>margins [
	^ self textArea margins
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubTextSegmentMorph>>mouseDownOnIcon: anEvent [
	^ self iconBlock value: anEvent
]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubTextSegmentMorph>>mouseEnter: anEvent [
	self showMouseHasEntered.
	super mouseEnter: anEvent
]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubTextSegmentMorph>>mouseLeave: anEvent [
	self showMouseHasLeaved.
	super mouseLeave: anEvent
]

{
	#category : #submorphs-accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubTextSegmentMorph>>noteNewOwner: aMorph [
	super noteNewOwner: aMorph.
	self registerTextArea
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubTextSegmentMorph>>privateMoveBy: aPoint [
	super privateMoveBy: aPoint.
	self computeVertices
]

{
	#category : #ui,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubTextSegmentMorph>>readOnlyView [
	^ RubScrolledTextMorph new
		setTextWith: self getText;
		wrapped: self textArea wrapped;
		width: 200;
		yourself
]

{
	#category : #ui,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubTextSegmentMorph>>readWriteView [
	^ self readOnlyView on: self
]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubTextSegmentMorph>>registerTextArea  [
	textArea announcer  
	when: RubExtentChanged send: #whenExtentChanged: to: self;
	when: RubTextChanged send: #whenTextChanged: to: self
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubTextSegmentMorph>>replaceTextWith: aText [
	self textArea replaceFrom: self firstIndex  to: self lastIndex with: aText asText
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubTextSegmentMorph>>setText: aText from: aView [
	self replaceTextWith: aText.
	self announcer announce: RubTextUpdatedInModel.
	^ true
]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubTextSegmentMorph>>showMouseHasEntered [
	self borderWidth: 1.

]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubTextSegmentMorph>>showMouseHasLeaved [
	self borderWidth: 0.

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubTextSegmentMorph>>textArea [
	^ textArea
]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubTextSegmentMorph>>textChangedFrom: begin to: end delta: delta [
	| changeInterval |
	self flag: 'Dirty code, that does not work well, to be reviewed'.
	((self interval rangeIncludes: begin) or: [ self interval rangeIncludes: end ])
		ifTrue: [ 
			self changeable
				ifTrue: [ ^ self delete ] ].
	changeInterval := begin to: end.
	((self interval rangeIncludes: end) and: [delta > 0])
		ifTrue: [ 
			self lastIndex: (self lastIndex + delta).
			^ self computeVertices ].
	((changeInterval rangeIncludes: begin) and: [ (changeInterval rangeIncludes: end) not ])
		ifTrue: [ 
			self firstIndex: self firstIndex - (self firstIndex - end).
			^ self computeVertices ].
	((changeInterval rangeIncludes: self firstIndex) and: [ changeInterval rangeIncludes: self lastIndex ])
		ifTrue: [ ^ self delete ].
	self textArea text size < self firstIndex
		ifTrue: [ ^ self delete ].
	self textArea text size < self lastIndex
		ifTrue: [ 
			self changeable
				ifTrue: [ ^ self delete ]
				ifFalse: [ 
					self lastIndex: self textArea text size.
					^ self computeVertices ] ].
	end < self firstIndex
		ifTrue: [ 
			firstIndex := self firstIndex + delta.
			lastIndex := self lastIndex + delta.
			^ self computeVertices ]
]

{
	#category : #structure,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubTextSegmentMorph>>topRendererOrSelf [
	^owner
		ifNotNil: [ owner topRendererOrSelf ]
]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubTextSegmentMorph>>whenExtentChanged: anAnnouncement  [
	self computeVertices.

]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubTextSegmentMorph>>whenTextChanged: anAnnouncement  [
	| beg end delta |
	textArea ifNil: [ ^self ].
	beg := anAnnouncement start.
	end := anAnnouncement stop.
	delta := anAnnouncement text size - (end - beg + 1).
	self textChangedFrom: beg to: end delta: delta.
	textArea ifNil: [ ^self ].
	self computeVertices.
	self changed

]
