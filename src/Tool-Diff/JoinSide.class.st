"

"
Class {
	#name : #JoinSide,
	#superclass : #Object,
	#instVars : [
		'range',
		'offset',
		'lineRange',
		'highlights',
		'color',
		'text'
	],
	#category : #Tool-Diff,
	#timestamp : ''
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:25'
}
JoinSide>>color [
	"Answer the value of color"

	^ color
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:25'
}
JoinSide>>color: anObject [
	"Set the value of color"

	color := anObject
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:25'
}
JoinSide>>highlight [
	"Answer the primary highlight."

	^(self highlights ifEmpty: [^nil]) first
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:25'
}
JoinSide>>highlights [
	"Answer the value of highlights"

	^ highlights
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:25'
}
JoinSide>>highlights: anObject [
	"Set the value of highlights"

	highlights := anObject
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:25'
}
JoinSide>>initialize [
	"Initialize the receiver."

	super initialize.
	self
		highlights: #();
		offset: 0@0;
		range: (1 to: 1);
		lineRange: (1 to: 0);
		color: Color yellow;
		text: ''
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:25'
}
JoinSide>>lineRange [
	"Answer the value of lineRange"

	^ lineRange
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:25'
}
JoinSide>>lineRange: anObject [
	"Set the value of lineRange"

	lineRange := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:25'
}
JoinSide>>offset [
	"Answer the value of offset"

	^ offset
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:25'
}
JoinSide>>offset: anObject [
	"Set the value of offset"

	offset := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:25'
}
JoinSide>>range [
	"Answer the value of range"

	^ range
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:25'
}
JoinSide>>range: anObject [
	"Set the value of range"

	range := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:25'
}
JoinSide>>text [
	"Answer the value of text"

	^ text
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:25'
}
JoinSide>>text: anObject [
	"Set the value of text"

	text := anObject
]
