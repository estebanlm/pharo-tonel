"
A structure that contains WindowsRT specific information about a window. 
"
Class {
	#name : #SDL_SysWMinfo_WindowsRTInfo,
	#superclass : #SDL2Structure,
	#classVars : [
		'OFFSET_WINDOW'
	],
	#category : #OSWindow-SDL2-Bindings,
	#timestamp : 'RonieSalgado 5/27/2016 13:18'
}

{
	#category : #'field definition',
	#timestamp : ' 8/31/2017 05:26:40'
}
SDL_SysWMinfo_WindowsRTInfo class>>fieldsDesc [
	"
	self rebuildFieldAccessors
	"
	^#(
		void* window;
 	)
]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 05:26:40'
}
SDL_SysWMinfo_WindowsRTInfo>>asPlatformSpecificHandle [
	^ OSWindowPlatformSpecificHandle new
		platform: #winrt;
		window: self window;
		yourself
]

{
	#category : #'accessing structure variables',
	#timestamp : ' 8/31/2017 05:26:40'
}
SDL_SysWMinfo_WindowsRTInfo>>window [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_WINDOW) type: ExternalType void asPointerType
]

{
	#category : #'accessing structure variables',
	#timestamp : ' 8/31/2017 05:26:40'
}
SDL_SysWMinfo_WindowsRTInfo>>window: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_WINDOW put: anObject getHandle.
]
