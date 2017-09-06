"
Superclass for mouse events
"
Class {
	#name : #MouseEvent,
	#superclass : #UserInputEvent,
	#category : #Morphic-Core-Events,
	#timestamp : 'TorstenBergmann 2/20/2014 18:29'
}

{
	#category : #constants,
	#timestamp : ' 8/31/2017 05:26:11'
}
MouseEvent class>>anyButton [
	^ 7
]

{
	#category : #constants,
	#timestamp : ' 8/31/2017 05:26:11'
}
MouseEvent class>>blueButton [
	^ 1
]

{
	#category : #constants,
	#timestamp : ' 8/31/2017 05:26:11'
}
MouseEvent class>>redButton [
	^ 4
]

{
	#category : #constants,
	#timestamp : ' 8/31/2017 05:26:11'
}
MouseEvent class>>yellowButton [
	^ 2
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 05:26:11'
}
MouseEvent>>= aMorphicEvent [
	super = aMorphicEvent ifFalse:[^false].
	position = aMorphicEvent position ifFalse: [^ false].
	buttons = aMorphicEvent buttons ifFalse: [^ false].
	^ true

]

{
	#category : #'button state',
	#timestamp : ' 8/31/2017 05:26:11'
}
MouseEvent>>anyButtonPressed [
	"Answer true if any mouse button is being pressed."

	^ buttons anyMask: self class anyButton
]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 05:26:11'
}
MouseEvent>>asMouseEnter [
	^self shallowCopy setType: #mouseEnter
]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 05:26:11'
}
MouseEvent>>asMouseLeave [
	^self shallowCopy setType: #mouseLeave
]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 05:26:11'
}
MouseEvent>>asMouseMove [
	"Convert the receiver into a mouse move"
	^MouseMoveEvent basicNew setType: #mouseMove startPoint: position endPoint: position trail: {position. position} buttons: buttons hand: source stamp: self timeStamp
]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 05:26:11'
}
MouseEvent>>asMouseOver [
	"Convert the receiver into a mouse over event"

	^ MouseEvent basicNew
		setType: #mouseOver
			position: position
			buttons: buttons
			hand: source;
		setTimeStamp: self timeStamp
]

{
	#category : #'button state',
	#timestamp : ' 8/31/2017 05:26:11'
}
MouseEvent>>blueButtonPressed [
	"Answer true if the blue mouse button is being pressed. This is the third mouse button or cmd+click on the Mac."

	^ buttons anyMask: self class blueButton
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:11'
}
MouseEvent>>cursorPoint [
	"Answer the location of the cursor's hotspot when this event occured."

	^ position
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 05:26:11'
}
MouseEvent>>hash [
	^ position hash + buttons hash
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:11'
}
MouseEvent>>isDraggingEvent [
	source ifNil:[^false].
	source hasSubmorphs ifTrue:[^true].
	self anyButtonPressed ifTrue:[^true].
	^false
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:11'
}
MouseEvent>>isMouse [
	^true
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:11'
}
MouseEvent>>isMouseDown [
	^self type == #mouseDown
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:11'
}
MouseEvent>>isMouseEnter [
	^self type == #mouseEnter
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:11'
}
MouseEvent>>isMouseLeave [
	^self type == #mouseLeave
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:11'
}
MouseEvent>>isMouseMove [
	^self type == #mouseMove
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:11'
}
MouseEvent>>isMouseUp [
	^self type == #mouseUp
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:11'
}
MouseEvent>>isMouseWheel [
	"Answer whether the receiver is a mouse wheel event."
	
	^false
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:11'
}
MouseEvent>>printOn: aStream [

	aStream nextPut: $[.
	aStream nextPutAll: self cursorPoint printString; space.
	aStream nextPutAll: type; space.
	aStream nextPutAll: self modifierString.
	aStream nextPutAll: self buttonString.
	aStream nextPutAll: timeStamp printString; space.
	aStream	 nextPutAll: self windowIndex printString.
	aStream nextPut: $].
]

{
	#category : #'button state',
	#timestamp : ' 8/31/2017 05:26:11'
}
MouseEvent>>redButtonPressed [
	"Answer true if the red mouse button is being pressed. This is the first mouse button."

	^ buttons anyMask: self class redButton
]

{
	#category : #dispatching,
	#timestamp : ' 8/31/2017 05:26:11'
}
MouseEvent>>sentTo: anObject [
	"Dispatch the receiver into anObject"
	type == #mouseOver ifTrue:[^anObject handleMouseOver: self].
	type == #mouseEnter ifTrue:[^anObject handleMouseEnter: self].
	type == #mouseLeave ifTrue:[^anObject handleMouseLeave: self].
	^super sentTo: anObject.
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:11'
}
MouseEvent>>setType: aSymbol [
	"For quick conversion between event types"
	type := aSymbol.
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:11'
}
MouseEvent>>setType: evtType position: evtPos buttons: evtButtons hand: evtHand [
	type := evtType.
	position := evtPos.
	buttons := evtButtons.
	source := evtHand.
	wasHandled := false.
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:11'
}
MouseEvent>>storeOn: aStream [

	aStream nextPutAll: type.
	aStream space.
	self timeStamp storeOn: aStream.
	aStream space.
	position x storeOn: aStream.
	aStream space.
	position y storeOn: aStream.
	aStream space.
	buttons storeOn: aStream.
]

{
	#category : #'button state',
	#timestamp : ' 8/31/2017 05:26:11'
}
MouseEvent>>targetPoint [
	"Answer the location of the cursor's hotspot, adjusted by the offset
	of the last mouseDown relative to the recipient morph."

	^ position - source targetOffset
]

{
	#category : #'button state',
	#timestamp : ' 8/31/2017 05:26:11'
}
MouseEvent>>yellowButtonPressed [
	"Answer true if the yellow mouse button is being pressed. This is the second mouse button or option+click on the Mac."

	^ buttons anyMask: self class yellowButton
]
