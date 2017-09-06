"
SDL2 library structure
"
Class {
	#name : #SDL_KeyUpEvent,
	#superclass : #SDL_KeyboardEvent,
	#category : #OSWindow-SDL2-Bindings,
	#timestamp : 'IgorStasenko 7/30/2014 18:44'
}

{
	#category : #'event type',
	#timestamp : ' 8/31/2017 05:26:40'
}
SDL_KeyUpEvent class>>eventType [
	^ SDL_KEYUP
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:40'
}
SDL_KeyUpEvent>>accept: aVisitor [
	^ aVisitor visitKeyUpEvent: self
]

{
	#category : #'accessing structure variables',
	#timestamp : ' 8/31/2017 05:26:40'
}
SDL_KeyUpEvent>>keysym [
	"This method was automatically generated"
	^SDL_Keysym fromHandle: (handle referenceStructAt: OFFSET_KEYSYM length: 16)
]

{
	#category : #'accessing structure variables',
	#timestamp : ' 8/31/2017 05:26:40'
}
SDL_KeyUpEvent>>keysym: anObject [
	"This method was automatically generated"
	handle structAt: OFFSET_KEYSYM put: anObject getHandle length: 16.
]

{
	#category : #'accessing structure variables',
	#timestamp : ' 8/31/2017 05:26:40'
}
SDL_KeyUpEvent>>padding2 [
	"This method was automatically generated"
	^handle unsignedByteAt: OFFSET_PADDING2
]

{
	#category : #'accessing structure variables',
	#timestamp : ' 8/31/2017 05:26:40'
}
SDL_KeyUpEvent>>padding2: anObject [
	"This method was automatically generated"
	handle unsignedByteAt: OFFSET_PADDING2 put: anObject
]

{
	#category : #'accessing structure variables',
	#timestamp : ' 8/31/2017 05:26:40'
}
SDL_KeyUpEvent>>padding3 [
	"This method was automatically generated"
	^handle unsignedByteAt: OFFSET_PADDING3
]

{
	#category : #'accessing structure variables',
	#timestamp : ' 8/31/2017 05:26:40'
}
SDL_KeyUpEvent>>padding3: anObject [
	"This method was automatically generated"
	handle unsignedByteAt: OFFSET_PADDING3 put: anObject
]

{
	#category : #'accessing structure variables',
	#timestamp : ' 8/31/2017 05:26:40'
}
SDL_KeyUpEvent>>repeat [
	"This method was automatically generated"
	^handle unsignedByteAt: OFFSET_REPEAT
]

{
	#category : #'accessing structure variables',
	#timestamp : ' 8/31/2017 05:26:40'
}
SDL_KeyUpEvent>>repeat: anObject [
	"This method was automatically generated"
	handle unsignedByteAt: OFFSET_REPEAT put: anObject
]

{
	#category : #'accessing structure variables',
	#timestamp : ' 8/31/2017 05:26:40'
}
SDL_KeyUpEvent>>state [
	"This method was automatically generated"
	^handle unsignedByteAt: OFFSET_STATE
]

{
	#category : #'accessing structure variables',
	#timestamp : ' 8/31/2017 05:26:40'
}
SDL_KeyUpEvent>>state: anObject [
	"This method was automatically generated"
	handle unsignedByteAt: OFFSET_STATE put: anObject
]

{
	#category : #'accessing structure variables',
	#timestamp : ' 8/31/2017 05:26:40'
}
SDL_KeyUpEvent>>timestamp [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_TIMESTAMP
]

{
	#category : #'accessing structure variables',
	#timestamp : ' 8/31/2017 05:26:40'
}
SDL_KeyUpEvent>>timestamp: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_TIMESTAMP put: anObject
]

{
	#category : #'accessing structure variables',
	#timestamp : ' 8/31/2017 05:26:40'
}
SDL_KeyUpEvent>>type [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_TYPE
]

{
	#category : #'accessing structure variables',
	#timestamp : ' 8/31/2017 05:26:40'
}
SDL_KeyUpEvent>>type: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_TYPE put: anObject
]

{
	#category : #'accessing structure variables',
	#timestamp : ' 8/31/2017 05:26:40'
}
SDL_KeyUpEvent>>windowID [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_WINDOWID
]

{
	#category : #'accessing structure variables',
	#timestamp : ' 8/31/2017 05:26:40'
}
SDL_KeyUpEvent>>windowID: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_WINDOWID put: anObject
]
