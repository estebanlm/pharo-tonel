"
I am abstract class, representing an OSWindow handle.
Each instance of OSWindow holds a handle, through which it communicates with underlaying operating system.

The implementation of OSWindowHandle (and subclasses) is highly driver-specific and therefore considered private.
"
Class {
	#name : #OSWindowHandle,
	#superclass : #Object,
	#instVars : [
		'osWindow',
		'renderer'
	],
	#category : #OSWindow-Core,
	#timestamp : 'IgorStasenko 7/30/2014 16:40'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowHandle>>borderless [
	^ false
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowHandle>>borderless: aBoolean [
	
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowHandle>>bounds [
	^ self position extent: self extent
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowHandle>>bounds: newBounds [
	self subclassResponsibility 
]

{
	#category : #'mouse capture',
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowHandle>>captureMouse [

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowHandle>>clipboardText [
	self subclassResponsibility 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowHandle>>clipboardText: aString [
	self subclassResponsibility 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowHandle>>extent [
	^ self bounds extent
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowHandle>>extent: newExtent [
	self subclassResponsibility 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowHandle>>fullscreen: aBoolean [

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowHandle>>hide [
	self subclassResponsibility 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowHandle>>icon: aForm [

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowHandle>>isValid [
	self subclassResponsibility 
]

{
	#category : #factory,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowHandle>>newAthensRenderer [
	self subclassResponsibility
]

{
	#category : #factory,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowHandle>>newFormRenderer: aForm [
	self subclassResponsibility
]

{
	#category : #factory,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowHandle>>newGenericRenderer [
	self subclassResponsibility
]

{
	#category : #factory,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowHandle>>newOpenGLRenderer [
	self subclassResponsibility
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowHandle>>osWindow [
	
	^ osWindow
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowHandle>>osWindow: anObject [
	
	osWindow := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowHandle>>platformSpecificHandle [
	self subclassResponsibility
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowHandle>>position [
	^ self subclassResponsibility
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowHandle>>position: newPosition [
	self subclassResponsibility 
]

{
	#category : #'mouse capture',
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowHandle>>releaseMouse [

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowHandle>>renderer [
	
	^ renderer
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowHandle>>renderer: anObject [
	
	renderer := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowHandle>>resizable [
	^ true
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowHandle>>resizable: aBoolean [
	
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowHandle>>setMouseCursor: cursorWithMask [

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowHandle>>setMouseCursor: cursor mask: mask [

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowHandle>>show [
	self subclassResponsibility 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowHandle>>title [
	self subclassResponsibility 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowHandle>>title: aTitle [
	self subclassResponsibility 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowHandle>>windowId [
	^ nil
]
