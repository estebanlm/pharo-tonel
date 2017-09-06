"
My instances hold a number of various attributes, used during initial window creation and its initialization:

- initial bounds
- title
- icon
- screen id
- fullscreen or not
- etc...

Please note, that depending on driver used, some attributes can be ignored by driver and will have no any effect.  

The preferableDriver attribute is special, that it allows user to bypass the default driver selection mechanism and tell directly, which driver shall be used for creating a window.
"
Class {
	#name : #OSWindowAttributes,
	#superclass : #Object,
	#instVars : [
		'position',
		'extent',
		'title',
		'fullscreen',
		'screenId',
		'preferableDriver',
		'icon',
		'glAttributes',
		'windowCentered',
		'borderless',
		'resizable',
		'maximized',
		'minimized',
		'visible'
	],
	#classVars : [
		'DefaultBorderless',
		'DefaultExtent',
		'DefaultFullscreen',
		'DefaultMaximized',
		'DefaultMinimized',
		'DefaultPosition',
		'DefaultResizable',
		'DefaultTitle',
		'DefaultVisible',
		'DefaultWindowCentered'
	],
	#category : #OSWindow-Core,
	#timestamp : 'IgorStasenko 7/30/2014 16:18'
}

{
	#category : #defaults,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowAttributes class>>defaultBorderless [
	^ DefaultBorderless
]

{
	#category : #defaults,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowAttributes class>>defaultExtent [
	^ DefaultExtent
]

{
	#category : #defaults,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowAttributes class>>defaultFullscreen [
	^ DefaultFullscreen
]

{
	#category : #defaults,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowAttributes class>>defaultMaximized [
	^ DefaultMaximized
]

{
	#category : #defaults,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowAttributes class>>defaultMinimized [
	^ DefaultMinimized
]

{
	#category : #defaults,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowAttributes class>>defaultPosition [
	^ DefaultPosition
]

{
	#category : #defaults,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowAttributes class>>defaultResizable [
	^ DefaultResizable
]

{
	#category : #defaults,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowAttributes class>>defaultTitle [
	^ DefaultTitle
]

{
	#category : #defaults,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowAttributes class>>defaultVisible [
	^ DefaultVisible
]

{
	#category : #defaults,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowAttributes class>>defaultWindowCentered [
	^ DefaultWindowCentered
]

{
	#category : #'class initialization',
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowAttributes class>>initialize [
	"
	self initialize
	"
	DefaultPosition := 0@0.
	DefaultExtent :=150@150.
	DefaultFullscreen  := false.
	DefaultWindowCentered := false.
	DefaultTitle := 'New Window'.
	DefaultVisible := true.

	DefaultBorderless := false.
	DefaultResizable := true.
	DefaultMaximized := false.
	DefaultMinimized := false.
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowAttributes class>>newWithNullDriver [
	^ self new preferableDriver: OSNullWindowDriver new; yourself
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowAttributes>>applyTo: window [
	window title: self title;
		icon: self icon.
	
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowAttributes>>borderless [
	^ borderless
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowAttributes>>borderless: anObject [
	borderless := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowAttributes>>bounds [
	^ position extent: extent
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowAttributes>>bounds: aRectangle [
	position := aRectangle origin.
	extent := aRectangle extent.
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowAttributes>>createWindowHandleFor: osWindow [
	^ (preferableDriver
		ifNil: [ preferableDriver := OSWindowDriver current ])
		createWindowWithAttributes: self
		osWindow: osWindow
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowAttributes>>extent [
	^ extent
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowAttributes>>extent: newExtent [
	extent := newExtent
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowAttributes>>fullscreen [
	
	^ fullscreen
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowAttributes>>fullscreen: anObject [
	
	fullscreen := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowAttributes>>glAttributes [
	
	^ glAttributes
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowAttributes>>glAttributes: anObject [
	
	glAttributes := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowAttributes>>height [
	^ extent y
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowAttributes>>icon [
	
	^ icon
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowAttributes>>icon: anObject [
	
	icon := anObject
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowAttributes>>initialize [
	visible := self class defaultVisible.
	position := self class defaultPosition.
	extent := self class defaultExtent.
	fullscreen := self class defaultFullscreen.
	title := self class defaultTitle.
	windowCentered := self class defaultWindowCentered.
	
	borderless := self class defaultBorderless.
	resizable := self class defaultResizable.
	minimized := self class defaultMinimized.
	maximized := self class defaultMaximized.
	
	glAttributes := nil.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowAttributes>>maximized [
	^ maximized
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowAttributes>>maximized: aBoolean [
	maximized := aBoolean
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowAttributes>>minimized [
	^ minimized
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowAttributes>>minimized: aBoolean [
	minimized := aBoolean
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowAttributes>>position [
	^ position
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowAttributes>>position: aPoint [
	position := aPoint
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowAttributes>>preferableDriver [
	
	^ preferableDriver
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowAttributes>>preferableDriver: anObject [
	
	preferableDriver := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowAttributes>>resizable [
	^ resizable
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowAttributes>>resizable: aBoolean [
	resizable := aBoolean
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowAttributes>>screenId [
	^ screenId
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowAttributes>>screenId: newScreenId [
	screenId := newScreenId
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowAttributes>>title [
	
	^ title
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowAttributes>>title: anObject [
	
	title := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowAttributes>>visible [
	^ visible
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowAttributes>>visible: aBoolean [
	visible := aBoolean
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowAttributes>>width [
	^ extent x
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowAttributes>>windowCentered [
	^ windowCentered
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowAttributes>>windowCentered: aBoolean [
	windowCentered := aBoolean
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowAttributes>>x [
	^ position x
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowAttributes>>y [
	^ position y
]
