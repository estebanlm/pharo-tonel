"
A text command to render a character span containing the range of characters for with same attributes
"
Class {
	#name : #AthensCharacterSpan,
	#superclass : #AthensTextDisplayCommand,
	#instVars : [
		'start',
		'stop'
	],
	#category : #Athens-Text,
	#timestamp : 'IgorStasenko 2/6/2012 16:17'
}

{
	#category : #rendering,
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensCharacterSpan>>renderOn: renderer [
	renderer renderCharactersFrom: start to: stop
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensCharacterSpan>>splitAt: position [
	| newSpan |
	"split receiver on two character spans "
	" position points to first character which should be included in newly created span "
	
	position == start ifTrue: [ ^ self ].
	(position < start or: [ position > stop ]) ifTrue: [ self error: 'invalid position' ].

	newSpan := self class new
		start: position;
		stop: stop.

	stop := position - 1.
	self insert: newSpan.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensCharacterSpan>>start [

	^ start
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensCharacterSpan>>start: anObject [

	start := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensCharacterSpan>>stop [

	^ stop
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensCharacterSpan>>stop: anObject [

	stop := anObject
]
