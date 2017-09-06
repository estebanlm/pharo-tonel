"

"
Class {
	#name : #RubTextSegmentIconBox,
	#superclass : #Morph,
	#instVars : [
		'icon',
		'previouslyIn'
	],
	#category : #Rubric-Editing-Widgets,
	#timestamp : ''
}

{
	#category : #querying,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubTextSegmentIconBox class>>key [
	^ #textSegmentIcons
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubTextSegmentIconBox>>backgroundColor [
	^ Color orange veryMuchLighter
]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubTextSegmentIconBox>>handlesMouseMove: evt [
	^ true
]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubTextSegmentIconBox>>mouseEnter: anEvent [
	self color: (Color lightGray alpha: 0.04).

]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubTextSegmentIconBox>>mouseEnter: anEvent in: aSegment [
	previouslyIn = aSegment
		ifTrue: [ ^ self ].
	previouslyIn := aSegment.
	aSegment showMouseHasEntered 
]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubTextSegmentIconBox>>mouseLeave: anEvent [
	self color: self defaultBackgroundColor.
	previouslyIn
		ifNotNil: [ 
			previouslyIn showMouseHasLeaved.
			previouslyIn := nil ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubTextSegmentIconBox>>textColor [
	^ self textArea lineNumbersTextColor 

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubTextSegmentIconBox>>verticalSeparatorBounds [
	| bnds  |
	bnds := self bounds.
	^ self side = #left
		ifTrue: [ (bnds topRight -  (self verticalSeparatorWidth @ 0)) corner: bnds bottomRight ]
		ifFalse: [ (bnds topLeft corner: bnds bottomLeft + (self verticalSeparatorWidth @ 0)) ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubTextSegmentIconBox>>verticalSeparatorColor [
	^ (self textArea backgroundColor contrastingColor ) alpha: 0.3
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubTextSegmentIconBox>>verticalSeparatorWidth [
	^ 1
]
