"
self open.

self openWithScrollbar.

self openWithBorderOfWidth: 1.
self openWithBorderOfWidth: 5.

self openWithScrollbarAndBorderOfWidth: 0.
self openWithScrollbarAndBorderOfWidth: 1.
self openWithScrollbarAndBorderOfWidth: 5.

self openAutoAccept.
"
Class {
	#name : #RubTextFieldExample,
	#superclass : #Object,
	#instVars : [
		'string',
		'announcer'
	],
	#category : #Rubric-Editing-Widgets-Examples,
	#timestamp : '<historical>'
}

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubTextFieldExample class>>open [
	| st |
	st := self new newScrolledText.
	self spyAnnouncer ifTrue: [st textArea announcer open].
 	st openInWorld

]

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubTextFieldExample class>>openAutoAccept [
	| st model |
	model := self new.
	st := model newScrolledTextAutoAccept.
	model inspect.
	self spyAnnouncer ifTrue: [st textArea announcer open].
 	st openInWorld

]

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubTextFieldExample class>>openWithBorderOfWidth: anInteger [
	| st |
	st := self new newScrolledTextWithBorderOfWidth: anInteger.
	self spyAnnouncer ifTrue: [st textArea announcer open].
 	st openInWorld

]

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubTextFieldExample class>>openWithScrollbar [
	| st |
	st := self new newScrolledTextWithScrollbar.
	self spyAnnouncer ifTrue: [st textArea announcer open].
 	st openInWorld

]

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubTextFieldExample class>>openWithScrollbarAndBorderOfWidth: anInteger [
	| st |
	st := self new newScrolledTextWithScrollbarAndBorderOfWidth: anInteger.
	self spyAnnouncer ifTrue: [st textArea announcer open].
 	st openInWorld

]

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubTextFieldExample class>>spyAnnouncer [
	"Set it to true if you want to observe text area announcements"
	^ false
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubTextFieldExample>>acceptString: aString [
	self string: aString.
	^ true
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubTextFieldExample>>announcer [
	^ announcer ifNil: [ announcer := Announcer new ]
]

{
	#category : #'user interface',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubTextFieldExample>>getText [
	^ self string asText
]

{
	#category : #menu,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubTextFieldExample>>menu [
	^ nil
]

{
	#category : #'user interface',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubTextFieldExample>>newScrolledText [
	| st |
	st := (RubTextFieldMorph on: self)
		withAdornment;
		withGhostText: 'Input field bla bla bla bla bla bla';
		yourself.
	st width: 300.
	st textArea forbidMenu.
	^ st
]

{
	#category : #'user interface',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubTextFieldExample>>newScrolledTextAutoAccept [
	| st |
	st := (RubTextFieldMorph
		on: self)
		withAdornment;
		withGhostText: 'Input field bla bla bla bla bla bla';
		autoAccept: true;
		yourself.
	st width: 300.
	^st
]

{
	#category : #'user interface',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubTextFieldExample>>newScrolledTextWithBorderOfWidth: anInteger [
	^ self newScrolledText borderWidth: anInteger.
]

{
	#category : #'user interface',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubTextFieldExample>>newScrolledTextWithScrollbar [
	^ self newScrolledText hScrollbarShowAlways
]

{
	#category : #'user interface',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubTextFieldExample>>newScrolledTextWithScrollbarAndBorderOfWidth: anInteger [
	^ self newScrolledText hScrollbarShowAlways; borderWidth: anInteger
]

{
	#category : #'user interface',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubTextFieldExample>>setText: aText from: aView  [
	^ self acceptString: aText string
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubTextFieldExample>>string [
	^ string ifNil: [ string := '' ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubTextFieldExample>>string: aString [
	string := aString
]
