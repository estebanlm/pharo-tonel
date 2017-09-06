"
I am the event handler linked to the SDL2AthensExample
"
Class {
	#name : #OSWindowAthensExampleEventHandler,
	#superclass : #OSWindowEventVisitor,
	#instVars : [
		'athensExample'
	],
	#category : #OSWindow-SDL2-Examples-Examples,
	#timestamp : 'MerwanOuddane 8/21/2015 14:02'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:44'
}
OSWindowAthensExampleEventHandler>>athensExample [
	^ athensExample
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:44'
}
OSWindowAthensExampleEventHandler>>athensExample: anObject [
	athensExample := anObject
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 05:26:44'
}
OSWindowAthensExampleEventHandler>>visitWindowCloseEvent: anEvent [
	athensExample destroy
]
