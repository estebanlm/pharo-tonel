"
SDL2 library structure representing a joystick button event data.
"
Class {
	#name : #SDL_JoyButtonEvent,
	#superclass : #SDL2MappedEvent,
	#classVars : [
		'OFFSET_BUTTON',
		'OFFSET_PADDING1',
		'OFFSET_PADDING2',
		'OFFSET_STATE',
		'OFFSET_TIMESTAMP',
		'OFFSET_TYPE',
		'OFFSET_WHICH'
	],
	#category : #OSWindow-SDL2-Bindings,
	#timestamp : 'RonieSalgado 10/12/2014 17:41'
}

{
	#category : #'fields description',
	#timestamp : ' 8/31/2017 05:26:40'
}
SDL_JoyButtonEvent class>>fieldsDesc [
	"
	self initializeAccessors
	"
	^ #(
    Uint32 type;
    Uint32 timestamp;
    Sint32 which;
    Uint8 button;
    Uint8 state;
    Uint8 padding1;
    Uint8 padding2;
 	)
]

{
	#category : #'accessing structure variables',
	#timestamp : ' 8/31/2017 05:26:40'
}
SDL_JoyButtonEvent>>button [
	"This method was automatically generated"
	^handle unsignedByteAt: OFFSET_BUTTON
]

{
	#category : #'accessing structure variables',
	#timestamp : ' 8/31/2017 05:26:40'
}
SDL_JoyButtonEvent>>button: anObject [
	"This method was automatically generated"
	handle unsignedByteAt: OFFSET_BUTTON put: anObject
]

{
	#category : #'accessing structure variables',
	#timestamp : ' 8/31/2017 05:26:40'
}
SDL_JoyButtonEvent>>padding1 [
	"This method was automatically generated"
	^handle unsignedByteAt: OFFSET_PADDING1
]

{
	#category : #'accessing structure variables',
	#timestamp : ' 8/31/2017 05:26:40'
}
SDL_JoyButtonEvent>>padding1: anObject [
	"This method was automatically generated"
	handle unsignedByteAt: OFFSET_PADDING1 put: anObject
]

{
	#category : #'accessing structure variables',
	#timestamp : ' 8/31/2017 05:26:40'
}
SDL_JoyButtonEvent>>padding2 [
	"This method was automatically generated"
	^handle unsignedByteAt: OFFSET_PADDING2
]

{
	#category : #'accessing structure variables',
	#timestamp : ' 8/31/2017 05:26:40'
}
SDL_JoyButtonEvent>>padding2: anObject [
	"This method was automatically generated"
	handle unsignedByteAt: OFFSET_PADDING2 put: anObject
]

{
	#category : #'accessing structure variables',
	#timestamp : ' 8/31/2017 05:26:40'
}
SDL_JoyButtonEvent>>state [
	"This method was automatically generated"
	^handle unsignedByteAt: OFFSET_STATE
]

{
	#category : #'accessing structure variables',
	#timestamp : ' 8/31/2017 05:26:40'
}
SDL_JoyButtonEvent>>state: anObject [
	"This method was automatically generated"
	handle unsignedByteAt: OFFSET_STATE put: anObject
]

{
	#category : #'accessing structure variables',
	#timestamp : ' 8/31/2017 05:26:40'
}
SDL_JoyButtonEvent>>timestamp [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_TIMESTAMP
]

{
	#category : #'accessing structure variables',
	#timestamp : ' 8/31/2017 05:26:40'
}
SDL_JoyButtonEvent>>timestamp: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_TIMESTAMP put: anObject
]

{
	#category : #'accessing structure variables',
	#timestamp : ' 8/31/2017 05:26:40'
}
SDL_JoyButtonEvent>>type [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_TYPE
]

{
	#category : #'accessing structure variables',
	#timestamp : ' 8/31/2017 05:26:40'
}
SDL_JoyButtonEvent>>type: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_TYPE put: anObject
]

{
	#category : #'accessing structure variables',
	#timestamp : ' 8/31/2017 05:26:40'
}
SDL_JoyButtonEvent>>which [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_WHICH
]

{
	#category : #'accessing structure variables',
	#timestamp : ' 8/31/2017 05:26:40'
}
SDL_JoyButtonEvent>>which: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_WHICH put: anObject
]
