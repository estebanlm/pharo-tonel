"
This class represents the base for all events.

Instance variables:
	stamp	<Integer>	The millisecond clock time stamp (based on Time millisecondClock)
	source	<Hand | nil>	If non-nil the hand that generated the event.
"
Class {
	#name : #MorphicEvent,
	#superclass : #Object,
	#instVars : [
		'timeStamp',
		'source',
		'windowIndex'
	],
	#category : #Morphic-Core-Events,
	#timestamp : '<historical>'
}

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 05:26:11'
}
MorphicEvent>>= anEvent [
	anEvent isMorphicEvent ifFalse:[^false].
	^self type = anEvent type
]

{
	#category : #initialize,
	#timestamp : ' 8/31/2017 05:26:11'
}
MorphicEvent>>copyHandlerState: anEvent [
	"Copy the handler state from anEvent. Used for quickly transferring handler information between transformed events."

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:11'
}
MorphicEvent>>cursorPoint [
	"Backward compatibility. Use #position instead"
	^ self position
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:11'
}
MorphicEvent>>hand [
	"Return the source that generated the event"
	^source
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 05:26:11'
}
MorphicEvent>>hash [
	^self type hash
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:11'
}
MorphicEvent>>isDraggingEvent [
	^false
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:11'
}
MorphicEvent>>isDropEvent [
	^false
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:11'
}
MorphicEvent>>isKeyboard [
	^false
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:11'
}
MorphicEvent>>isKeystroke [
	^false
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:11'
}
MorphicEvent>>isMorphicEvent [
	^true
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:11'
}
MorphicEvent>>isMouse [
	^false
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:11'
}
MorphicEvent>>isMouseOver [
	^self type == #mouseOver
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:11'
}
MorphicEvent>>isMove [
	^false
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:11'
}
MorphicEvent>>isWindowEvent [
	^false
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:11'
}
MorphicEvent>>position [
	"Since cursorPoint is defined and refers to position it should be defined
	here as well"
	^ self subclassResponsibility
]

{
	#category : #initialize,
	#timestamp : ' 8/31/2017 05:26:11'
}
MorphicEvent>>resetHandlerFields [
	"Reset anything that is used to cross-communicate between two eventual handlers during event dispatch"
]

{
	#category : #dispatching,
	#timestamp : ' 8/31/2017 05:26:11'
}
MorphicEvent>>sentTo: anObject [
	"Dispatch the receiver into anObject"
	^anObject handleUnknownEvent: self
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:11'
}
MorphicEvent>>setHand: aHand [
	source := aHand
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:11'
}
MorphicEvent>>setTimeStamp: stamp [
	timeStamp := stamp.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:11'
}
MorphicEvent>>timeStamp [
	"Return the millisecond clock value at which the event was generated"
	^timeStamp ifNil:[timeStamp := Time millisecondClockValue]
]

{
	#category : #transforming,
	#timestamp : ' 8/31/2017 05:26:11'
}
MorphicEvent>>transformedBy: aMorphicTransform [
	"Return the receiver transformed by the given transform into a local coordinate system."

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:11'
}
MorphicEvent>>type [
	"Return a symbol indicating the type this event."
	^self subclassResponsibility
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:11'
}
MorphicEvent>>wasHandled [
	"Return true if this event was handled. May be ignored for some types of events."
	^false
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:11'
}
MorphicEvent>>wasHandled: aBool [
	"Determine if this event was handled. May be ignored for some types of events."
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:11'
}
MorphicEvent>>windowIndex [
	^windowIndex
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:11'
}
MorphicEvent>>windowIndex: aValue [
	windowIndex := aValue
]
