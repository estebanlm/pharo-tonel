"
SDL2 library structure representing a controller device event data.
"
Class {
	#name : #SDL_ControllerDeviceEvent,
	#superclass : #SDL2MappedEvent,
	#classVars : [
		'OFFSET_TIMESTAMP',
		'OFFSET_TYPE',
		'OFFSET_WHICH'
	],
	#category : #OSWindow-SDL2-Bindings,
	#timestamp : 'RonieSalgado 4/10/2016 01:50'
}

{
	#category : #'field definition',
	#timestamp : ' 8/31/2017 05:26:40'
}
SDL_ControllerDeviceEvent class>>fieldsDesc [
	"
	self rebuildFieldAccessors
	"
	^ #(
    Uint32 type;
    Uint32 timestamp;
    Sint32 which;
 	)
]

{
	#category : #'accessing structure variables',
	#timestamp : ' 8/31/2017 05:26:40'
}
SDL_ControllerDeviceEvent>>timestamp [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_TIMESTAMP
]

{
	#category : #'accessing structure variables',
	#timestamp : ' 8/31/2017 05:26:40'
}
SDL_ControllerDeviceEvent>>timestamp: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_TIMESTAMP put: anObject
]

{
	#category : #'accessing structure variables',
	#timestamp : ' 8/31/2017 05:26:40'
}
SDL_ControllerDeviceEvent>>type [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_TYPE
]

{
	#category : #'accessing structure variables',
	#timestamp : ' 8/31/2017 05:26:40'
}
SDL_ControllerDeviceEvent>>type: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_TYPE put: anObject
]

{
	#category : #'accessing structure variables',
	#timestamp : ' 8/31/2017 05:26:40'
}
SDL_ControllerDeviceEvent>>which [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_WHICH
]

{
	#category : #'accessing structure variables',
	#timestamp : ' 8/31/2017 05:26:40'
}
SDL_ControllerDeviceEvent>>which: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_WHICH put: anObject
]
