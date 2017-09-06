"
My instances are used for updating the OSWindow contents by rendering on it.
There is no way to obtain a valid instance of window renderer other than asking a valid instance of OSWindow for window renderer instance.
See newFormRenderer: / newOpenGLRenderer factory methods.
"
Class {
	#name : #OSWindowRenderer,
	#superclass : #Object,
	#instVars : [
		'window',
		'lastExposeTime'
	],
	#category : #OSWindow-Core,
	#timestamp : 'IgorStasenko 7/30/2014 17:01'
}

{
	#category : #deleting,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowRenderer>>destroy [
	"Called when the window associated with the renderer is destroyed"
	window := nil.
]

{
	#category : #'updating screen',
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowRenderer>>exposed [
	self present
]

{
	#category : #'updating screen',
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowRenderer>>exposed: exposeTime [
	(lastExposeTime notNil and: [ exposeTime <= lastExposeTime]) ifTrue: [ ^ self ].
	lastExposeTime := exposeTime.
	self exposed
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowRenderer>>initialize [
	lastExposeTime := 0
]

{
	#category : #'*OSWindow-Core-Extras',
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowRenderer>>onRenderThread: aBlock [
	OSWindowRenderThread enqueueOperation: aBlock
]

{
	#category : #'*OSWindow-Core-Extras',
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowRenderer>>onRenderThreadBlocking: aBlock [
	OSWindowRenderThread enqueueBlockingOperation: aBlock
]

{
	#category : #'updating screen',
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowRenderer>>present [
	"This should present the changes to the next frame."
	self updateAll
]

{
	#category : #'updating screen',
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowRenderer>>resized [
	self updateAll
]

{
	#category : #'updating screen',
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowRenderer>>updateAll [
		"do something to update whole contents of the window"
		
		self subclassResponsibility 
]

{
	#category : #'updating screen',
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowRenderer>>updateRectangle: rectangle [
		"do something to update given portion of the window"
		
		self subclassResponsibility 
]

{
	#category : #'updating screen',
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowRenderer>>updateRectangles: aCollectionOfRectangles [
	aCollectionOfRectangles do: [ :rectangle | self updateRectangle: rectangle ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowRenderer>>window [
	
	^ window
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowRenderer>>window: anObject [
	
	window := anObject
]
