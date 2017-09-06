"
I represent a collection of platform specific handles that can be passed to external graphics rendering APIs such as OpenGL, Vulkan, Direct 3D and Metal.

Instance Variables
	display:		The display handle.
	platform:		The a symbol with the name of the platform.
	surface:		The window drawing surface handle.
	window:		The window handle.

"
Class {
	#name : #OSWindowPlatformSpecificHandle,
	#superclass : #Object,
	#instVars : [
		'platform',
		'display',
		'window',
		'surface'
	],
	#category : #OSWindow-Core,
	#timestamp : 'RonieSalgado 5/27/2016 13:47'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowPlatformSpecificHandle>>display [
	^ display
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowPlatformSpecificHandle>>display: anObject [
	display := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowPlatformSpecificHandle>>platform [
	^ platform
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowPlatformSpecificHandle>>platform: anObject [
	platform := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowPlatformSpecificHandle>>surface [
	^ surface
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowPlatformSpecificHandle>>surface: anObject [
	surface := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowPlatformSpecificHandle>>window [
	^ window
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowPlatformSpecificHandle>>window: anObject [
	window := anObject
]
