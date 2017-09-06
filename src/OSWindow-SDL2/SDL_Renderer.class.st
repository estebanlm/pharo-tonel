"
I represent a handle of SDL rendering context, coming from SDL2 library
"
Class {
	#name : #SDL_Renderer,
	#superclass : #SDL2Handle,
	#pools : [
		'SDL2Constants',
		'SDL2Types'
	],
	#category : #OSWindow-SDL2-Bindings,
	#timestamp : 'RonieSalgado 10/12/2014 17:38'
}

{
	#category : #finalization,
	#timestamp : ' 8/31/2017 05:26:40'
}
SDL_Renderer class>>destroyRenderer: aHandle [
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	^ self nbCall: #( void SDL_DestroyRenderer ( ulong aHandle ) )
]

{
	#category : #finalization,
	#timestamp : ' 8/31/2017 05:26:40'
}
SDL_Renderer class>>finalizeResourceData: aHandle [

	^ self destroyRenderer: aHandle.
]

{
	#category : #rendering,
	#timestamp : ' 8/31/2017 05:26:40'
}
SDL_Renderer>>clear [
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	^ self nbCall: #( int SDL_RenderClear ( self ) )
]

{
	#category : #rendering,
	#timestamp : ' 8/31/2017 05:26:40'
}
SDL_Renderer>>copy: texture [
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	^ self nbCall: #( int SDL_RenderCopy ( self , SDL_Texture texture , nil, nil ) )
]

{
	#category : #rendering,
	#timestamp : ' 8/31/2017 05:26:40'
}
SDL_Renderer>>copy: texture srcRect: srcRect dstRect: dstRect [
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	^ self nbCall: #( int SDL_RenderCopy ( self , SDL_Texture texture , SDL_Rect* srcRect , SDL_Rect* dstRect ) )
]

{
	#category : #rendering,
	#timestamp : ' 8/31/2017 05:26:40'
}
SDL_Renderer>>createTextureFormat: format access: access width: width height: height [
	
	^(self primCreateTextureFormat: format access: access width: width height: height) initialize.
]

{
	#category : #destroy,
	#timestamp : ' 8/31/2017 05:26:40'
}
SDL_Renderer>>destroy [
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	^ self nbCall: #( void SDL_DestroyRenderer ( self ) )
]

{
	#category : #rendering,
	#timestamp : ' 8/31/2017 05:26:40'
}
SDL_Renderer>>drawColorR: r g: g b: b a: a [
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	^ self nbCall: #( int SDL_SetRenderDrawColor ( self , Uint8 r , Uint8 g , Uint8 b , Uint8 a ) )
]

{
	#category : #rendering,
	#timestamp : ' 8/31/2017 05:26:40'
}
SDL_Renderer>>drawLineX1: x1 y1: y1 x2: x2 y2: y2 [
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	^ self nbCall: #( int SDL_RenderDrawLine ( self , int x1 , int y1 , int x2 , int y2 ) )
]

{
	#category : #rendering,
	#timestamp : ' 8/31/2017 05:26:40'
}
SDL_Renderer>>drawPointX: x y: y [
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	^ self nbCall: #( int SDL_RenderDrawPoint ( self , int x , int y ) )
]

{
	#category : #rendering,
	#timestamp : ' 8/31/2017 05:26:40'
}
SDL_Renderer>>drawRect: rect [
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	^ self nbCall: #( int SDL_RenderDrawRect ( self , SDL_Rect* rect ) )
]

{
	#category : #rendering,
	#timestamp : ' 8/31/2017 05:26:40'
}
SDL_Renderer>>fillRect: rect [
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	^ self nbCall: #( int SDL_RenderFillRect ( self , SDL_Rect* rect ) )
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
SDL_Renderer>>info [
	| info |
	
	info := SDL_RendererInfo externalNew autoRelease.
	self primGetRendererInfo: info.
	^ info
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:40'
}
SDL_Renderer>>initialize [
	FFIExternalResourceManager addResource: self data: handle value.
]

{
	#category : #rendering,
	#timestamp : ' 8/31/2017 05:26:40'
}
SDL_Renderer>>noClipRect [
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	^ self nbCall: #( int SDL_RenderSetClipRect ( self , nil ) )
]

{
	#category : #rendering,
	#timestamp : ' 8/31/2017 05:26:40'
}
SDL_Renderer>>noRenderTarget [
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	^ self nbCall: #( int SDL_SetRenderTarget ( self , nil ) )
]

{
	#category : #rendering,
	#timestamp : ' 8/31/2017 05:26:40'
}
SDL_Renderer>>present [
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	^ self nbCall: #( void SDL_RenderPresent ( self ) )
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:40'
}
SDL_Renderer>>primCreateTextureFormat: format access: access width: width height: height [
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	^ self nbCall: #( SDL_Texture SDL_CreateTexture ( self , Uint32 format , int access , int width , int height ) )
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:40'
}
SDL_Renderer>>primGetRendererInfo: info [
	^ self ffiCall: #( int SDL_GetRendererInfo (self, SDL_RendererInfo* info) )
]
