"
I represent  handle of a mouse cursor.
"
Class {
	#name : #SDL_Cursor,
	#superclass : #SDL2Handle,
	#pools : [
		'SDL2Constants',
		'SDL2Types'
	],
	#category : #OSWindow-SDL2-Bindings,
	#timestamp : 'RonieSalgado 12/29/2014 18:23'
}

{
	#category : #'freeing resources',
	#timestamp : ' 8/31/2017 05:26:40'
}
SDL_Cursor>>freeCursor [
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	^ self nbCall: #( void SDL_FreeCursor ( self ) )
]

{
	#category : #'using the cursor',
	#timestamp : ' 8/31/2017 05:26:40'
}
SDL_Cursor>>setCursor [
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	^ self nbCall: #( void SDL_SetCursor ( self ) )
]
