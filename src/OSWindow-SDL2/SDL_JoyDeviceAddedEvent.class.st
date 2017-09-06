"
SDL2 library structure representing a joystick device added event data.
"
Class {
	#name : #SDL_JoyDeviceAddedEvent,
	#superclass : #SDL_JoyDeviceEvent,
	#category : #OSWindow-SDL2-Bindings,
	#timestamp : 'RonieSalgado 4/10/2016 01:48'
}

{
	#category : #'event type',
	#timestamp : ' 8/31/2017 05:26:40'
}
SDL_JoyDeviceAddedEvent class>>eventType [
	^ SDL_JOYDEVICEADDED
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:40'
}
SDL_JoyDeviceAddedEvent>>accept: aVisitor [
	^ aVisitor visitJoyDeviceAddedEvent: self
]

{
	#category : #'accessing structure variables',
	#timestamp : ' 8/31/2017 05:26:40'
}
SDL_JoyDeviceAddedEvent>>timestamp [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_TIMESTAMP
]

{
	#category : #'accessing structure variables',
	#timestamp : ' 8/31/2017 05:26:40'
}
SDL_JoyDeviceAddedEvent>>timestamp: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_TIMESTAMP put: anObject
]

{
	#category : #'accessing structure variables',
	#timestamp : ' 8/31/2017 05:26:40'
}
SDL_JoyDeviceAddedEvent>>type [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_TYPE
]

{
	#category : #'accessing structure variables',
	#timestamp : ' 8/31/2017 05:26:40'
}
SDL_JoyDeviceAddedEvent>>type: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_TYPE put: anObject
]

{
	#category : #'accessing structure variables',
	#timestamp : ' 8/31/2017 05:26:40'
}
SDL_JoyDeviceAddedEvent>>which [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_WHICH
]

{
	#category : #'accessing structure variables',
	#timestamp : ' 8/31/2017 05:26:40'
}
SDL_JoyDeviceAddedEvent>>which: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_WHICH put: anObject
]
