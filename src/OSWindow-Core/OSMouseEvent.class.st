"
i am the root of various mouse events.

Note, that my subclasses care to represent only the most basic events, not the synthethic ones, like click or double-click, which are result of interpreting the sequence of raw events.
"
Class {
	#name : #OSMouseEvent,
	#superclass : #OSEvent,
	#instVars : [
		'position',
		'delta',
		'modifiers'
	],
	#category : #OSWindow-Core-Events,
	#timestamp : 'IgorStasenko 7/30/2014 17:39'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSMouseEvent>>buttons [
	^ modifiers buttons
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSMouseEvent>>delta [
	
	^ delta
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSMouseEvent>>delta: anObject [
	
	delta := anObject
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSMouseEvent>>initialize [
	super initialize.
	modifiers := OSStateModifiers new
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSMouseEvent>>modifiers [
	^ modifiers 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSMouseEvent>>position [
	
	^ position
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSMouseEvent>>position: anObject [
	
	position := anObject
]
