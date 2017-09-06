"
SDL2 library structure
"
Class {
	#name : #SDL_QuitEvent,
	#superclass : #SDL_CommonEvent,
	#category : #OSWindow-SDL2-Bindings,
	#timestamp : 'IgorStasenko 7/30/2014 18:43'
}

{
	#category : #'event type',
	#timestamp : ' 8/31/2017 05:26:40'
}
SDL_QuitEvent class>>eventType [
	^ SDL_QUIT
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:40'
}
SDL_QuitEvent>>accept: aVisitor [
	^ aVisitor visitQuitEvent: self
]

{
	#category : #'accessing structure variables',
	#timestamp : ' 8/31/2017 05:26:40'
}
SDL_QuitEvent>>timestamp [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_TIMESTAMP
]

{
	#category : #'accessing structure variables',
	#timestamp : ' 8/31/2017 05:26:40'
}
SDL_QuitEvent>>timestamp: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_TIMESTAMP put: anObject
]

{
	#category : #'accessing structure variables',
	#timestamp : ' 8/31/2017 05:26:40'
}
SDL_QuitEvent>>type [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_TYPE
]

{
	#category : #'accessing structure variables',
	#timestamp : ' 8/31/2017 05:26:40'
}
SDL_QuitEvent>>type: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_TYPE put: anObject
]
