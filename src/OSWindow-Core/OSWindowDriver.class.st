"
I am a basic (abstract) class, which represents an OS window driver.
The driver connects an OSWindow instances with underlaying operating system window(s) through managing OSWindowHandle(s). Driver provides an implemenation of all OSWindow functionality, starting from its creation, setting/retrieving its attributes, and finishing with event handling and/or rendering window's contents on screen.

The driver connects OSWindow(s) with operating system windows by providing the handle (see OSWindowHandle). The way how various OSWindow features and API are implemented is up to the concrete driver and thus considered private.

The driver(s) responsible for initial window creation , proper setup and and managing external resources. 
Again, most of driver's functionality is considered private and application-level code should not rely on any of its features. 

Driver selection mechanism:

 - on session change, i scan all of my subclasses to pick a most suitable driver which will be used on current platform (see #current on my class side)
"
Class {
	#name : #OSWindowDriver,
	#superclass : #Object,
	#classVars : [
		'Current',
		'Session'
	],
	#category : #OSWindow-Core,
	#timestamp : 'IgorStasenko 7/30/2014 16:33'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowDriver class>>current [
	^ Session == Smalltalk session ifTrue: [ Current ifNil: [Current := self pickDriver ]]
		ifFalse: [ 
			Session := Smalltalk session.
			Current := self pickDriver
	]
	
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowDriver class>>isSuitable [
	"Answer true if receiver is most suitable for using in current session/platform"
	^ false
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowDriver class>>isSupported [
	"Answer true if receiver is most suitable for using in current session/platform"
	^ false
]

{
	#category : #'driver selection',
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowDriver class>>pickDriver [
	self subclassesDo: [ :s | s isSuitable ifTrue: [ ^ s new ] ].
	^ OSNullWindowDriver new
]

{
	#category : #'window creation',
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowDriver>>createWindowWithAttributes: anOSWindowAttributes osWindow: osWindow [
	self subclassResponsibility
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowDriver>>isNullDriver [
	^ false
]
