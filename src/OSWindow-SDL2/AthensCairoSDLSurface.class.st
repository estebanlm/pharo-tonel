"
I'm a cairo surface who renders directly to a SDL2 surface.
"
Class {
	#name : #AthensCairoSDLSurface,
	#superclass : #AthensCairoSurface,
	#category : #OSWindow-SDL2-Bindings,
	#timestamp : '<historical>'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:40'
}
AthensCairoSDLSurface class>>fromSDLSurface: surface  [
	^ ( self 
		primImageFromData: surface pixels 
		width: surface w 
		height: surface h
		pitch: surface pitch) initialize
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:40'
}
AthensCairoSDLSurface class>>newFromPixels: pixels width: width height: height pitch: pitch [
	^ (self
		primImageFromData: pixels
		width: width
		height: height
		pitch: pitch) initialize
]
