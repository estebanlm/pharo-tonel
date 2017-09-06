"
An abstract base class for all text rendering commands.

A text rendered takes a stream (or list) of my (sub)instances and in that way it renders the text
"
Class {
	#name : #AthensTextDisplayCommand,
	#superclass : #Object,
	#instVars : [
		'next'
	],
	#category : #Athens-Text,
	#timestamp : 'IgorStasenko 2/6/2012 16:20'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensTextDisplayCommand>>addLast: aCommand [
	self tail next: aCommand
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensTextDisplayCommand>>do: aBlock [
	| nn |
	nn := self.
	
	[ nn isNil ] whileFalse: [ 
		aBlock value: nn.
		nn := nn next. ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensTextDisplayCommand>>insert: aCommands [

	| nn |
	nn := next.
	next := aCommands.
	next tail next: nn
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensTextDisplayCommand>>next [

	^ next
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensTextDisplayCommand>>next: anObject [
	
	next := anObject
]

{
	#category : #copying,
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensTextDisplayCommand>>postCopy [
	"unlink the copy by default"
	next := nil
]

{
	#category : #rendering,
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensTextDisplayCommand>>renderOn: renderer [
	self shouldBeImplemented 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensTextDisplayCommand>>tail [
	| nn |
	nn := self.
	[ nn next notNil ] whileTrue: [ nn := nn next ].
	^ nn
]
