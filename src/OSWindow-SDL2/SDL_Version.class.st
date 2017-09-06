"
A structure that contains information about the version of SDL in use. 
"
Class {
	#name : #SDL_Version,
	#superclass : #SDL2Structure,
	#classVars : [
		'OFFSET_MAJOR',
		'OFFSET_MINOR',
		'OFFSET_PATCH'
	],
	#category : #OSWindow-SDL2-Bindings,
	#timestamp : 'MerwanOuddane 8/25/2015 15:48'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
SDL_Version class>>bindingVersion [
	^ self new major: 2; minor: 0; patch: 4; yourself
]

{
	#category : #'field definition',
	#timestamp : ' 8/31/2017 05:26:40'
}
SDL_Version class>>fieldsDesc [
	"
	self initializeAccessors
	"
	^#(
		Uint8 major;
		Uint8 minor;
		Uint8 patch;
 	)
]

{
	#category : #'accessing structure variables',
	#timestamp : ' 8/31/2017 05:26:40'
}
SDL_Version>>major [
	"This method was automatically generated"
	^handle unsignedByteAt: OFFSET_MAJOR
]

{
	#category : #'accessing structure variables',
	#timestamp : ' 8/31/2017 05:26:40'
}
SDL_Version>>major: anObject [
	"This method was automatically generated"
	handle unsignedByteAt: OFFSET_MAJOR put: anObject
]

{
	#category : #'accessing structure variables',
	#timestamp : ' 8/31/2017 05:26:40'
}
SDL_Version>>minor [
	"This method was automatically generated"
	^handle unsignedByteAt: OFFSET_MINOR
]

{
	#category : #'accessing structure variables',
	#timestamp : ' 8/31/2017 05:26:40'
}
SDL_Version>>minor: anObject [
	"This method was automatically generated"
	handle unsignedByteAt: OFFSET_MINOR put: anObject
]

{
	#category : #'accessing structure variables',
	#timestamp : ' 8/31/2017 05:26:40'
}
SDL_Version>>patch [
	"This method was automatically generated"
	^handle unsignedByteAt: OFFSET_PATCH
]

{
	#category : #'accessing structure variables',
	#timestamp : ' 8/31/2017 05:26:40'
}
SDL_Version>>patch: anObject [
	"This method was automatically generated"
	handle unsignedByteAt: OFFSET_PATCH put: anObject
]
