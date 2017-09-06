"
SDL2 library structure
"
Class {
	#name : #SDL_Palette,
	#superclass : #SDL2Structure,
	#classVars : [
		'OFFSET_COLORS',
		'OFFSET_NCOLORS',
		'OFFSET_REFCOUNT',
		'OFFSET_VERSION'
	],
	#category : #OSWindow-SDL2-Bindings,
	#timestamp : 'IgorStasenko 7/30/2014 18:44'
}

{
	#category : #'fields description',
	#timestamp : ' 8/31/2017 05:26:40'
}
SDL_Palette class>>fieldsDesc [
	"
	self initializeAccessors
	"
	^#(
    int ncolors;
    SDL_Color* colors;
    Uint32 version;
    int refcount;
 	)
]

{
	#category : #'accessing structure variables',
	#timestamp : ' 8/31/2017 05:26:40'
}
SDL_Palette>>colors [
	"This method was automatically generated"
	^SDL_Color fromHandle: (handle pointerAt: OFFSET_COLORS)
]

{
	#category : #'accessing structure variables',
	#timestamp : ' 8/31/2017 05:26:40'
}
SDL_Palette>>colors: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_COLORS put: anObject getHandle.
]

{
	#category : #'accessing structure variables',
	#timestamp : ' 8/31/2017 05:26:40'
}
SDL_Palette>>ncolors [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_NCOLORS
]

{
	#category : #'accessing structure variables',
	#timestamp : ' 8/31/2017 05:26:40'
}
SDL_Palette>>ncolors: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_NCOLORS put: anObject
]

{
	#category : #'accessing structure variables',
	#timestamp : ' 8/31/2017 05:26:40'
}
SDL_Palette>>refcount [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_REFCOUNT
]

{
	#category : #'accessing structure variables',
	#timestamp : ' 8/31/2017 05:26:40'
}
SDL_Palette>>refcount: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_REFCOUNT put: anObject
]

{
	#category : #'accessing structure variables',
	#timestamp : ' 8/31/2017 05:26:40'
}
SDL_Palette>>version [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_VERSION
]

{
	#category : #'accessing structure variables',
	#timestamp : ' 8/31/2017 05:26:40'
}
SDL_Palette>>version: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_VERSION put: anObject
]
