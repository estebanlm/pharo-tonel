"
Superclass to show how to use OSWindow properly with athens
"
Class {
	#name : #SDL2AthensExample,
	#superclass : #Object,
	#instVars : [
		'renderer',
		'drawingProcess',
		'window'
	],
	#category : #OSWindow-SDL2-Examples-Examples,
	#timestamp : 'MerwanOuddane 8/15/2015 10:56'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:44'
}
SDL2AthensExample>>createDrawingProcess [
	^ [ 
	[ 
	(Delay forMilliseconds: 1000 / self maxFPS) wait.
	self redrawAndUpdateSurface ] repeat ] fork
]

{
	#category : #factory,
	#timestamp : ' 8/31/2017 05:26:44'
}
SDL2AthensExample>>createEventHandler [
	"You should override this method with your own event handler"
	^ OSWindowAthensExampleEventHandler new 
		athensExample: self
]

{
	#category : #'morphic ui',
	#timestamp : ' 8/31/2017 05:26:44'
}
SDL2AthensExample>>defaultExtent [
	^ 500@500
]

{
	#category : #'morphic ui',
	#timestamp : ' 8/31/2017 05:26:44'
}
SDL2AthensExample>>destroy [
	"This function must be called when the window is closed"
	drawingProcess terminate
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:44'
}
SDL2AthensExample>>initializeFromSurface. [
	"Here we put all the things that needs the surface to be initialized."
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:44'
}
SDL2AthensExample>>maxFPS [
	^ 60
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:44'
}
SDL2AthensExample>>open [
	| attrs |
	attrs := OSWindowAttributes new.
	attrs 
		extent: self defaultExtent;
		resizable: false;
		position: 100@100.
		
	window := OSWindow createWithAttributes: attrs.
	
	renderer := window newAthensRenderer.

	self initializeFromSurface.

	window eventHandler: (self createEventHandler).
	
	drawingProcess := self createDrawingProcess
]

{
	#category : #drawing,
	#timestamp : ' 8/31/2017 05:26:44'
}
SDL2AthensExample>>redraw [
	^self subclassResponsibility
]

{
	#category : #updating,
	#timestamp : ' 8/31/2017 05:26:44'
}
SDL2AthensExample>>redrawAndUpdateSurface [
	self redraw.
	self updateSurface
]

{
	#category : #updating,
	#timestamp : ' 8/31/2017 05:26:44'
}
SDL2AthensExample>>updateSurface [
	renderer
		updateAll;
		present
]
