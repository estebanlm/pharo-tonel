"
SDL2 library structure representing a controller device remapped event data.
"
Class {
	#name : #SDL_ControllerDeviceRemappedEvent,
	#superclass : #SDL_ControllerDeviceEvent,
	#category : #OSWindow-SDL2-Bindings,
	#timestamp : 'RonieSalgado 4/10/2016 01:51'
}

{
	#category : #'event type',
	#timestamp : ' 8/31/2017 05:26:40'
}
SDL_ControllerDeviceRemappedEvent class>>eventType [
	^ SDL_CONTROLLERDEVICEREMAPPED
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:40'
}
SDL_ControllerDeviceRemappedEvent>>accept: aVisitor [
	^ aVisitor visitControllerDeviceRemappedEvent: self
]

{
	#category : #'accessing structure variables',
	#timestamp : ' 8/31/2017 05:26:40'
}
SDL_ControllerDeviceRemappedEvent>>timestamp [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_TIMESTAMP
]

{
	#category : #'accessing structure variables',
	#timestamp : ' 8/31/2017 05:26:40'
}
SDL_ControllerDeviceRemappedEvent>>timestamp: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_TIMESTAMP put: anObject
]

{
	#category : #'accessing structure variables',
	#timestamp : ' 8/31/2017 05:26:40'
}
SDL_ControllerDeviceRemappedEvent>>type [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_TYPE
]

{
	#category : #'accessing structure variables',
	#timestamp : ' 8/31/2017 05:26:40'
}
SDL_ControllerDeviceRemappedEvent>>type: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_TYPE put: anObject
]

{
	#category : #'accessing structure variables',
	#timestamp : ' 8/31/2017 05:26:40'
}
SDL_ControllerDeviceRemappedEvent>>which [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_WHICH
]

{
	#category : #'accessing structure variables',
	#timestamp : ' 8/31/2017 05:26:40'
}
SDL_ControllerDeviceRemappedEvent>>which: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_WHICH put: anObject
]
