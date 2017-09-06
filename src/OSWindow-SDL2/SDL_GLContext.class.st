"
I represent a handle of GL rendering context, coming from SDL2 library
"
Class {
	#name : #SDL_GLContext,
	#superclass : #SDL2Handle,
	#pools : [
		'SDL2Constants',
		'SDL2Types'
	],
	#category : #OSWindow-SDL2-Bindings,
	#timestamp : 'IgorStasenko 7/30/2014 18:26'
}

{
	#category : #deleting,
	#timestamp : ' 8/31/2017 05:26:40'
}
SDL_GLContext>>delete [
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	^ self nbCall: #( void SDL_GL_DeleteContext ( self ) )
]
