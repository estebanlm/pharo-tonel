"
I represent a handle of GL texture, coming from SDL2 library
"
Class {
	#name : #SDL_Texture,
	#superclass : #SDL2Handle,
	#pools : [
		'SDL2Constants',
		'SDL2Types'
	],
	#category : #OSWindow-SDL2-Bindings,
	#timestamp : 'IgorStasenko 7/30/2014 18:27'
}

{
	#category : #finalization,
	#timestamp : ' 8/31/2017 05:26:40'
}
SDL_Texture class>>destroyTexture: aHandle [
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	^ self nbCall: #( void SDL_DestroyTexture ( ulong aHandle ) )
]

{
	#category : #finalization,
	#timestamp : ' 8/31/2017 05:26:40'
}
SDL_Texture class>>finalizeResourceData: aHandle [

	^ self destroyTexture: aHandle.
]

{
	#category : #initialize,
	#timestamp : ' 8/31/2017 05:26:40'
}
SDL_Texture>>destroy [
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	^ self nbCall: #( void SDL_DestroyTexture ( self ) )
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:40'
}
SDL_Texture>>initialize [
	FFIExternalResourceManager addResource: self data: handle value.
]

{
	#category : #'pixels handling',
	#timestamp : ' 8/31/2017 05:26:40'
}
SDL_Texture>>lockPixels: pixels pitch: pitch [
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	^ self nbCall: #( int SDL_LockTexture ( self , nil , void** pixels , int* pitch ) )
]

{
	#category : #'pixels handling',
	#timestamp : ' 8/31/2017 05:26:40'
}
SDL_Texture>>unlock [
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	^ self nbCall: #( void SDL_UnlockTexture ( self ) )
]

{
	#category : #initialize,
	#timestamp : ' 8/31/2017 05:26:40'
}
SDL_Texture>>updateTexturePixels: pixels pitch: pitch [
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	^ self nbCall: #( int SDL_UpdateTexture ( self , nil , void* pixels , int pitch ) )
]

{
	#category : #initialize,
	#timestamp : ' 8/31/2017 05:26:40'
}
SDL_Texture>>updateTextureRect: rect pixels: pixels pitch: pitch [
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	^ self nbCall: #( int SDL_UpdateTexture ( self , SDL_Rect* rect , void* pixels , int pitch ) )
]
