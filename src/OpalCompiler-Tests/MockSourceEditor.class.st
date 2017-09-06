"
A mock object mocking a source editor
"
Class {
	#name : #MockSourceEditor,
	#superclass : #Object,
	#instVars : [
		'text',
		'selectionStart',
		'selectionEnd'
	],
	#category : #OpalCompiler-Tests-FromOld,
	#timestamp : 'TorstenBergmann 1/31/2014 11:25'
}

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:31'
}
MockSourceEditor>>contents: aText [

	text := aText
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:31'
}
MockSourceEditor>>cut [

	text := (text first: selectionStart-1), (text copyFrom: selectionEnd+1 to: text size).
		
	selectionStart := selectionStart - 1.	
	selectionEnd := selectionStart
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:31'
}
MockSourceEditor>>editor [

	^ self
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:31'
}
MockSourceEditor>>initialize [

	super initialize.
	selectionStart := selectionEnd := 0.
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:31'
}
MockSourceEditor>>insertAndSelect: aString at: anInteger [

	text := (text first: anInteger-1), 
		(' ' , aString), 
		(text copyFrom: anInteger to: text size).
		
	selectionStart := anInteger.
	selectionEnd := anInteger + aString size 
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:31'
}
MockSourceEditor>>notify: aString at: anInteger in: aStream [

	| pos |
	pos := self selectionInterval notEmpty
		ifTrue: [selectionStart + anInteger - 1 ]
		ifFalse: [anInteger].
	self insertAndSelect: aString at: (pos max: 1)
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:31'
}
MockSourceEditor>>selectFrom: start to: end [

	selectionStart := start.
	selectionEnd := end.

]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:31'
}
MockSourceEditor>>selection [

	^ self text copyFrom: selectionStart to: selectionEnd
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:31'
}
MockSourceEditor>>selectionAsStream [

	^ ReadStream
		on: (self text copyFrom: selectionStart to: selectionEnd)
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:31'
}
MockSourceEditor>>selectionInterval [

	^ Interval from: selectionStart to: selectionEnd.
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:31'
}
MockSourceEditor>>startIndex [

	^ selectionStart
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:31'
}
MockSourceEditor>>text [

	^ text
]
