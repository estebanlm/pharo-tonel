"
I'm a form that keeps a surface with the only purpose of prevent GC when is still being used to copy data.

I'm used at AthensCairoSurface>>#asForm
"
Class {
	#name : #AthensCairoSurfaceForm,
	#superclass : #Form,
	#instVars : [
		'surface'
	],
	#category : #Athens-Cairo,
	#timestamp : '<historical>'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoSurfaceForm>>surface [
	^ surface
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoSurfaceForm>>surface: anObject [
	surface := anObject
]
