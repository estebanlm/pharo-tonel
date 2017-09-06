"
I'm an event related to the host window, only dispatched to the World. 
"
Class {
	#name : #WindowEvent,
	#superclass : #MorphicEvent,
	#instVars : [
		'action',
		'rectangle'
	],
	#category : #Morphic-Core-Events,
	#timestamp : 'StephaneDucasse 11/29/2011 22:29'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:11'
}
WindowEvent>>action [
	^action
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:11'
}
WindowEvent>>action: aValue [
	action := aValue.
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:11'
}
WindowEvent>>isWindowEvent [
	^true
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:11'
}
WindowEvent>>printOn: aStream [

	aStream nextPut: $[.
	aStream nextPutAll: self type; space.
	aStream nextPut: $(; print: self rectangle; nextPut: $).
	aStream nextPut: $].
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:11'
}
WindowEvent>>rectangle [
	^rectangle
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:11'
}
WindowEvent>>rectangle: aValue [
	rectangle := aValue.
]

{
	#category : #dispatching,
	#timestamp : ' 8/31/2017 05:26:11'
}
WindowEvent>>sentTo:anObject [
	"Dispatch the receiver into anObject"
	^anObject handleWindowEvent: self.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:11'
}
WindowEvent>>type [
	"This should match the definitions in sq.h"
	^#(
		windowMetricChange
		windowClose
		windowIconise
		windowActivated
		windowPaint
	) at: action ifAbsent: [#windowEventUnknown]
]
