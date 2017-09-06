"
SDL2 library structure representing a dropped file into the window.
"
Class {
	#name : #SDL_DropEvent,
	#superclass : #SDL2MappedEvent,
	#classVars : [
		'OFFSET_FILE',
		'OFFSET_TIMESTAMP',
		'OFFSET_TYPE'
	],
	#category : #OSWindow-SDL2-Bindings,
	#timestamp : 'MerwanOuddane 8/24/2015 16:50'
}

{
	#category : #'event type',
	#timestamp : ' 8/31/2017 05:26:40'
}
SDL_DropEvent class>>eventType [
	^ SDL_DROPFILE
]

{
	#category : #'fields description',
	#timestamp : ' 8/31/2017 05:26:40'
}
SDL_DropEvent class>>fieldsDesc [
	"
	self initializeAccessors
	"
	^ #(
    Uint32 type;
    Uint32 timestamp;
    char* file;
 	)
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:40'
}
SDL_DropEvent>>accept: aVisitor [
	^ aVisitor visitDropEvent: self
]

{
	#category : #'accessing structure variables',
	#timestamp : ' 8/31/2017 05:26:40'
}
SDL_DropEvent>>file [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_FILE) type: ExternalType char asPointerType
]

{
	#category : #'accessing structure variables',
	#timestamp : ' 8/31/2017 05:26:40'
}
SDL_DropEvent>>file: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_FILE put: anObject getHandle.
]

{
	#category : #'accessing structure variables',
	#timestamp : ' 8/31/2017 05:26:40'
}
SDL_DropEvent>>timestamp [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_TIMESTAMP
]

{
	#category : #'accessing structure variables',
	#timestamp : ' 8/31/2017 05:26:40'
}
SDL_DropEvent>>timestamp: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_TIMESTAMP put: anObject
]

{
	#category : #'accessing structure variables',
	#timestamp : ' 8/31/2017 05:26:40'
}
SDL_DropEvent>>type [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_TYPE
]

{
	#category : #'accessing structure variables',
	#timestamp : ' 8/31/2017 05:26:40'
}
SDL_DropEvent>>type: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_TYPE put: anObject
]
