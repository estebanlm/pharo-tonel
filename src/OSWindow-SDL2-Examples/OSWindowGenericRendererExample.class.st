"
Example showing how to use the joystick.
"
Class {
	#name : #OSWindowGenericRendererExample,
	#superclass : #Object,
	#instVars : [
		'renderer',
		'window'
	],
	#category : #OSWindow-SDL2-Examples-Examples,
	#timestamp : 'RonieSalgado 4/9/2016 23:42'
}

{
	#category : #factory,
	#timestamp : ' 8/31/2017 05:26:44'
}
OSWindowGenericRendererExample>>createEventHandler [
	"You should override this method with your own event handler"
	^ OSWindowGenericRendererExampleEventHandler new 
		example: self
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:44'
}
OSWindowGenericRendererExample>>defaultExtent [
	^ 640@480
]

{
	#category : #initialize,
	#timestamp : ' 8/31/2017 05:26:44'
}
OSWindowGenericRendererExample>>destroy [
	"This function must be called when the window is closed"
	"drawingProcess terminate"
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:44'
}
OSWindowGenericRendererExample>>enqueueRender [
	OSWindowRenderThread enqueueOperation: [ 
		renderer ifNotNil: [ self redrawAndPresent ].
	]
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:44'
}
OSWindowGenericRendererExample>>initializeWithRenderer [
		"Here we put all the things that needs the renderer to be initialized."
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:44'
}
OSWindowGenericRendererExample>>maxFPS [
	^ 60
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:44'
}
OSWindowGenericRendererExample>>open [
	| attrs |
	attrs := OSWindowAttributes new.
	attrs
		extent: self defaultExtent;
		resizable: false;
		windowCentered: true.
		
	window := OSWindowAnimated createWithAttributes: attrs.
	
	renderer := window newGenericRenderer.
	self initializeWithRenderer.
	
	window eventHandler: (self createEventHandler).

]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:44'
}
OSWindowGenericRendererExample>>present [
	renderer present
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:44'
}
OSWindowGenericRendererExample>>redraw [
	^ self subclassResponsibility
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:44'
}
OSWindowGenericRendererExample>>redrawAndPresent [
	self redraw.
	self present.
]
