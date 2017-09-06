"
SDL2 library structure representing a game controller button down event data.
"
Class {
	#name : #SDL_ControllerButtonDownEvent,
	#superclass : #SDL_ControllerButtonEvent,
	#category : #OSWindow-SDL2-Bindings,
	#timestamp : 'RonieSalgado 4/10/2016 00:57'
}

{
	#category : #'event type',
	#timestamp : ' 8/31/2017 05:26:40'
}
SDL_ControllerButtonDownEvent class>>eventType [
	^ SDL_CONTROLLERBUTTONDOWN
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:40'
}
SDL_ControllerButtonDownEvent>>accept: aVisitor [
	^ aVisitor visitControllerButtonDownEvent: self
]

{
	#category : #'accessing structure variables',
	#timestamp : ' 8/31/2017 05:26:40'
}
SDL_ControllerButtonDownEvent>>button [
	"This method was automatically generated"
	^handle unsignedByteAt: OFFSET_BUTTON
]

{
	#category : #'accessing structure variables',
	#timestamp : ' 8/31/2017 05:26:40'
}
SDL_ControllerButtonDownEvent>>button: anObject [
	"This method was automatically generated"
	handle unsignedByteAt: OFFSET_BUTTON put: anObject
]

{
	#category : #'accessing structure variables',
	#timestamp : ' 8/31/2017 05:26:40'
}
SDL_ControllerButtonDownEvent>>padding1 [
	"This method was automatically generated"
	^handle unsignedByteAt: OFFSET_PADDING1
]

{
	#category : #'accessing structure variables',
	#timestamp : ' 8/31/2017 05:26:40'
}
SDL_ControllerButtonDownEvent>>padding1: anObject [
	"This method was automatically generated"
	handle unsignedByteAt: OFFSET_PADDING1 put: anObject
]

{
	#category : #'accessing structure variables',
	#timestamp : ' 8/31/2017 05:26:40'
}
SDL_ControllerButtonDownEvent>>padding2 [
	"This method was automatically generated"
	^handle unsignedByteAt: OFFSET_PADDING2
]

{
	#category : #'accessing structure variables',
	#timestamp : ' 8/31/2017 05:26:40'
}
SDL_ControllerButtonDownEvent>>padding2: anObject [
	"This method was automatically generated"
	handle unsignedByteAt: OFFSET_PADDING2 put: anObject
]

{
	#category : #'accessing structure variables',
	#timestamp : ' 8/31/2017 05:26:40'
}
SDL_ControllerButtonDownEvent>>state [
	"This method was automatically generated"
	^handle unsignedByteAt: OFFSET_STATE
]

{
	#category : #'accessing structure variables',
	#timestamp : ' 8/31/2017 05:26:40'
}
SDL_ControllerButtonDownEvent>>state: anObject [
	"This method was automatically generated"
	handle unsignedByteAt: OFFSET_STATE put: anObject
]

{
	#category : #'accessing structure variables',
	#timestamp : ' 8/31/2017 05:26:40'
}
SDL_ControllerButtonDownEvent>>timestamp [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_TIMESTAMP
]

{
	#category : #'accessing structure variables',
	#timestamp : ' 8/31/2017 05:26:40'
}
SDL_ControllerButtonDownEvent>>timestamp: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_TIMESTAMP put: anObject
]

{
	#category : #'accessing structure variables',
	#timestamp : ' 8/31/2017 05:26:40'
}
SDL_ControllerButtonDownEvent>>type [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_TYPE
]

{
	#category : #'accessing structure variables',
	#timestamp : ' 8/31/2017 05:26:40'
}
SDL_ControllerButtonDownEvent>>type: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_TYPE put: anObject
]

{
	#category : #'accessing structure variables',
	#timestamp : ' 8/31/2017 05:26:40'
}
SDL_ControllerButtonDownEvent>>which [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_WHICH
]

{
	#category : #'accessing structure variables',
	#timestamp : ' 8/31/2017 05:26:40'
}
SDL_ControllerButtonDownEvent>>which: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_WHICH put: anObject
]
