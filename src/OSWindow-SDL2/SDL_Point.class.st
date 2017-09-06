"
SDL2 library structure
"
Class {
	#name : #SDL_Point,
	#superclass : #SDL2Structure,
	#classVars : [
		'OFFSET_X',
		'OFFSET_Y'
	],
	#category : #OSWindow-SDL2-Bindings,
	#timestamp : 'IgorStasenko 7/30/2014 18:44'
}

{
	#category : #'fields description',
	#timestamp : ' 8/31/2017 05:26:40'
}
SDL_Point class>>fieldsDesc [
	"
	self initializeAccessors
	"
	^#(
		int x;
		int y;
 	)
]

{
	#category : #'accessing structure variables',
	#timestamp : ' 8/31/2017 05:26:40'
}
SDL_Point>>x [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_X
]

{
	#category : #'accessing structure variables',
	#timestamp : ' 8/31/2017 05:26:40'
}
SDL_Point>>x: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_X put: anObject
]

{
	#category : #'accessing structure variables',
	#timestamp : ' 8/31/2017 05:26:40'
}
SDL_Point>>y [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_Y
]

{
	#category : #'accessing structure variables',
	#timestamp : ' 8/31/2017 05:26:40'
}
SDL_Point>>y: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_Y put: anObject
]
