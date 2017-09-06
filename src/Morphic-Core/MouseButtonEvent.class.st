"
A button event from a mouse
"
Class {
	#name : #MouseButtonEvent,
	#superclass : #MouseEvent,
	#instVars : [
		'whichButton'
	],
	#category : #Morphic-Core-Events,
	#timestamp : 'TorstenBergmann 2/20/2014 18:29'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:11'
}
MouseButtonEvent>>blueButtonChanged [
	"Answer true if the blue mouse button has changed. This is the third mouse button or cmd+click on the Mac."

	^ whichButton anyMask: self class blueButton
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:11'
}
MouseButtonEvent>>redButtonChanged [
	"Answer true if the red mouse button has changed. This is the first mouse button."

	^ whichButton anyMask: self class redButton
]

{
	#category : #dispatching,
	#timestamp : ' 8/31/2017 05:26:11'
}
MouseButtonEvent>>sentTo: anObject [
	"Dispatch the receiver into anObject"
	type == #mouseDown ifTrue:[^anObject handleMouseDown: self].
	type == #mouseUp ifTrue:[^anObject handleMouseUp: self].
	^super sentTo: anObject
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:11'
}
MouseButtonEvent>>setType: evtType position: evtPos which: button buttons: evtButtons hand: evtHand stamp: stamp [
	type := evtType.
	position := evtPos.
	buttons := evtButtons.
	source := evtHand.
	wasHandled := false.
	whichButton := button.
	timeStamp := stamp.
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:11'
}
MouseButtonEvent>>storeOn: aStream [
	super storeOn: aStream.
	aStream space.
	whichButton storeOn: aStream.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:11'
}
MouseButtonEvent>>whichButton [
	^whichButton
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:11'
}
MouseButtonEvent>>yellowButtonChanged [
	"Answer true if the yellow mouse button has changed. This is the second mouse button or option+click on the Mac."

	^ whichButton anyMask: self class yellowButton
]
