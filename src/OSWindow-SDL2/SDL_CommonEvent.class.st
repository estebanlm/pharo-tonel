"
SDL2 library structure
"
Class {
	#name : #SDL_CommonEvent,
	#superclass : #SDL2MappedEvent,
	#classVars : [
		'OFFSET_TIMESTAMP',
		'OFFSET_TYPE'
	],
	#category : #OSWindow-SDL2-Bindings,
	#timestamp : 'IgorStasenko 7/30/2014 18:43'
}

{
	#category : #'fields description',
	#timestamp : ' 8/31/2017 05:26:40'
}
SDL_CommonEvent class>>fieldsDesc [
	"
	self initializeAccessors
	"
	^ #(
    		Uint32 type;
    		Uint32 timestamp;
 	)
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:40'
}
SDL_CommonEvent>>accept: aVisitor [
	^ aVisitor visitCommonEvent: self
]

{
	#category : #'accessing structure variables',
	#timestamp : ' 8/31/2017 05:26:40'
}
SDL_CommonEvent>>timestamp [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_TIMESTAMP
]

{
	#category : #'accessing structure variables',
	#timestamp : ' 8/31/2017 05:26:40'
}
SDL_CommonEvent>>timestamp: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_TIMESTAMP put: anObject
]

{
	#category : #'accessing structure variables',
	#timestamp : ' 8/31/2017 05:26:40'
}
SDL_CommonEvent>>type [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_TYPE
]

{
	#category : #'accessing structure variables',
	#timestamp : ' 8/31/2017 05:26:40'
}
SDL_CommonEvent>>type: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_TYPE put: anObject
]
