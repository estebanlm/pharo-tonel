"
I am a central class, which provides a top-level API for creating/controlling an operating-system windows.

To create a new OS window with default attributes, just use

OSWindow new.

For better control of window creation, use 

OSWindow createWithAttributes: ...

message. (See OSWindowAttributes for description).

A newly created OSWindow instance can be used and controlled by application.
To handle events (mouse/keyboard) of newly created window, one must 
bind own event handler to it (#eventHandler:) which must understand #handleEvent: message.

To render on window's surface, first application must obtain an OSWindowRenderer instance.
Currently there's two kinds of renderers available:
- form renderer (to use existing form for updating window's contents)
- opengl renderer (to render using OpenGL).

OSWindow instance and its handle: 
 - all operations with window (like hiding/showing/resizing etc) is possible only if its handle is valid. If window gets destroyed, or image opened in a new session while window was created in previous session, the handle becomes invalid, and any operations will lead to error. 
To test if window is still valid, you can just use #isValid message.
"
Class {
	#name : #OSWindow,
	#superclass : #Object,
	#instVars : [
		'handle',
		'initialAttributes',
		'eventHandler',
		'currentCursor'
	],
	#classVars : [
		'TraceEvents',
		'VMWindow'
	],
	#category : #OSWindow-Core,
	#timestamp : 'IgorStasenko 7/30/2014 16:01'
}

{
	#category : #'clipboard handling',
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindow class>>clipboardText [
	^ self validHandle clipboardText
]

{
	#category : #'clipboard handling',
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindow class>>clipboardText: aString [
	self validHandle clipboardText: aString
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindow class>>createWithAttributes: attributes [
	^ self basicNew initWithAttributes: attributes
]

{
	#category : #finalization,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindow class>>finalizeResourceData: windowHandle [
	windowHandle destroy.
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindow class>>new [
	^ self createWithAttributes: OSWindowAttributes new
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindow class>>newWithNullDriver [
	^ self createWithAttributes: OSWindowAttributes newWithNullDriver
]

{
	#category : #tracing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindow class>>traceEvents: aBoolean [
	TraceEvents := aBoolean
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindow>>borderless [
	^ self validHandle borderless
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindow>>borderless: aBoolean [
	self validHandle borderless: aBoolean
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindow>>bounds [
	^ self validHandle bounds
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindow>>bounds: newBounds [
	self validHandle bounds: newBounds
]

{
	#category : #'mouse capture',
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindow>>captureMouse [
	self validHandle captureMouse
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindow>>checkIsValid [

	(handle isNil or: [ handle isValid not ]) ifTrue: [ self invalidHandle ].
]

{
	#category : #'clipboard handling',
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindow>>clipboardText [
	^ self validHandle clipboardText
]

{
	#category : #'clipboard handling',
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindow>>clipboardText: aString [
	^ self validHandle clipboardText: aString
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindow>>createWindow [
	handle ifNotNil: [ self error: 'The window is already created.' ].
	
	handle := initialAttributes createWindowHandleFor: self.
	handle isValid 
		ifTrue: [ FFIExternalResourceManager addResource: self data: handle ]
]

{
	#category : #'dispatching events',
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindow>>deliverEvent: anEvent [
	"TODO..."
	
	TraceEvents == true ifTrue: [ Transcript show: anEvent; cr ].
	eventHandler ifNotNil: [ 
		eventHandler handleEvent: anEvent ].
	anEvent performDefaultAction 

]

{
	#category : #'dispatching events',
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindow>>deliverGlobalEvent: aGlobalEvent [
	"TODO..."
	
	TraceEvents == true ifTrue: [ Transcript show: aGlobalEvent; cr ].
	eventHandler ifNotNil: [ 
		eventHandler handleEvent: aGlobalEvent ].

]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindow>>destroy [
	self validHandle destroy.
	handle := nil.
	eventHandler := nil.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindow>>eventHandler [
	
	^ eventHandler
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindow>>eventHandler: anObject [
	
	eventHandler := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindow>>extent [
	^ self validHandle extent
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindow>>extent: newExtent [
	self validHandle extent: newExtent
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindow>>fullscreen: aBoolean [
	self validHandle fullscreen: aBoolean
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindow>>getFlags [
	^ self validHandle getFlags
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindow>>handle [
	^ handle
]

{
	#category : #visibility,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindow>>hide [
	self checkIsValid .
	handle hide
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindow>>icon: aForm [
	self validHandle icon: aForm
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindow>>initWithAttributes: attributes [
	initialAttributes := attributes.
	self createWindow.
	self initialize
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindow>>invalidHandle [
	self error: 'Invalid window handle'
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindow>>isValid [
	 ^ handle notNil and: [ handle isValid ]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindow>>isVisible [
	^ self isValid and: [handle isVisible]
]

{
	#category : #'window management',
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindow>>maximize [

	self validHandle maximize.
]

{
	#category : #'window management',
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindow>>minimize [

	self validHandle minimize.
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindow>>newAthensRenderer [
	^ handle newAthensRenderer
]

{
	#category : #factory,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindow>>newFormRenderer: form [
	^ handle newFormRenderer: form
]

{
	#category : #factory,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindow>>newGenericRenderer [
	^ handle newGenericRenderer
]

{
	#category : #factory,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindow>>newOpenGLRenderer [
	^ handle newOpenGLRenderer
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindow>>platformSpecificHandle [
	^ self validHandle platformSpecificHandle
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindow>>position [
	^ self validHandle position
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindow>>position: newPosition [
	self validHandle position: newPosition
]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindow>>processPendingEvents [
	handle processPendingEvents
]

{
	#category : #'mouse capture',
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindow>>releaseMouse [
	self validHandle releaseMouse
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindow>>renderer [
	^ handle renderer
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindow>>renderer: aRenderer [
	handle renderer: aRenderer
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindow>>resizable [
	^ self validHandle resizable
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindow>>resizable: aBoolean [
	self validHandle resizable: aBoolean
]

{
	#category : #'window management',
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindow>>restore [

	self validHandle restore.
]

{
	#category : #'window management',
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindow>>setDraggableArea: aRectangle [

	^self validHandle setDraggableArea: aRectangle.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindow>>setMouseCursor: cursorWithMask [
	currentCursor == cursorWithMask ifTrue: [ ^ self ].
	currentCursor := cursorWithMask.
	self validHandle setMouseCursor: cursorWithMask
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindow>>setMouseCursor: cursor mask: mask [
	currentCursor == cursor ifTrue: [ ^ self ].
	currentCursor := cursor.

	self validHandle setMouseCursor: cursor mask: mask
]

{
	#category : #visibility,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindow>>show [
	self checkIsValid .
	handle show
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindow>>title [
	^ self validHandle title
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindow>>title: aString [
	self validHandle title: aString
]

{
	#category : #'window management',
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindow>>toggleBorderOff [

	self validHandle toggleBorderOff.
]

{
	#category : #'window management',
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindow>>toggleBorderOn [

	self validHandle toggleBorderOn.
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindow>>validHandle [
	self checkIsValid.
	^ handle
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindow>>windowId [
	^ self validHandle windowId
]
