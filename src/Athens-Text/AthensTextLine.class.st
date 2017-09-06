"
I representing a single line of text
"
Class {
	#name : #AthensTextLine,
	#superclass : #Object,
	#instVars : [
		'text',
		'startIndex',
		'endIndex',
		'height',
		'maxAscent',
		'maxDescent',
		'width',
		'top',
		'commands',
		'tail'
	],
	#category : #Athens-Text,
	#timestamp : 'IgorStasenko 2/6/2012 16:20'
}

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensTextLine>>addCommand: aCommand [

	commands 
		ifNil: [ tail := commands := aCommand. ]
		ifNotNil: [ tail next: aCommand ].
	tail := tail tail.

]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensTextLine>>addWidth: aNumber [
	width := width + aNumber.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensTextLine>>bottom [
	^ top + self heightAndDescent
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensTextLine>>commands [

	^ commands
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensTextLine>>commands: anObject [

	commands := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensTextLine>>endIndex [

	^ endIndex
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensTextLine>>endIndex: anObject [

	endIndex := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensTextLine>>height [
	^ height
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensTextLine>>height: anObject [

	height := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensTextLine>>heightAndDescent [

	^ height + maxDescent
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensTextLine>>initialize [
	commands := tail := nil.
	width := height := maxAscent := maxDescent := 0.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensTextLine>>maxAscent [
	^ maxAscent
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensTextLine>>maxAscent: mascent [
	maxAscent := mascent max: maxAscent
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensTextLine>>maxDescent [
	^ maxDescent
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensTextLine>>maxDescent: mascent [

	maxDescent := mascent max: maxDescent
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensTextLine>>maxHeight: aHeight [
	height := height max: aHeight
]

{
	#category : #rendering,
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensTextLine>>renderOn: aTextRenderer [
	
	commands ifNil: [ ^ self ]. 
	commands do: [ :cmd |
		cmd renderOn: aTextRenderer
	].

]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensTextLine>>renderOn: anAthensTextRenderer x: aSmallInteger y: aSmallInteger3  [
	self shouldBeImplemented.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensTextLine>>startIndex [

	^ startIndex
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensTextLine>>startIndex: index [
	startIndex := index
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensTextLine>>text [

	^ text
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensTextLine>>text: aText  [
	text := aText
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensTextLine>>top [
	^ top
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensTextLine>>top: aTop [
	top := aTop
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensTextLine>>width [
	^ width
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensTextLine>>width: anObject [

	width := anObject
]
