"
my role is to record the movements of a finger and associate a color to this movement
"
Class {
	#name : #SDL2TouchStateMachine,
	#superclass : #Object,
	#instVars : [
		'first',
		'finish',
		'move',
		'color'
	],
	#category : #OSWindow-SDL2-Examples-Touch,
	#timestamp : 'MerwanOuddane 8/24/2015 17:49'
}

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:44'
}
SDL2TouchStateMachine class>>for:	anPosition [
	^self new 
		first: anPosition;
		yourself
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:44'
}
SDL2TouchStateMachine>>add: aPoint [
	move add: aPoint.
	
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:44'
}
SDL2TouchStateMachine>>color [
	^color
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:44'
}
SDL2TouchStateMachine>>finish [
	^ finish
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:44'
}
SDL2TouchStateMachine>>finish: anObject [
	finish := anObject.
	move add: anObject.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:44'
}
SDL2TouchStateMachine>>first [
	^ first
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:44'
}
SDL2TouchStateMachine>>first: anObject [
	first := anObject
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:44'
}
SDL2TouchStateMachine>>initialize [
	move := OrderedCollection new.
	color := Color random.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:44'
}
SDL2TouchStateMachine>>move [
	^ move
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:44'
}
SDL2TouchStateMachine>>move: anObject [
	move := anObject
]
