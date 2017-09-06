"
I provide a mock (or null) driver, which can create a valid OSWindow instances, despite the fact that underlaying OS may not support any notion of windows or even graphical user interface.

I can be used for testing (by picking as a preferrable driver in window attributes),
or as a default driver while running image in headless mode.

Using null driver allows most of the code which relies on existance of at least single main window to work flawlessly, by simply ignoring all requests/commands passed to it.
"
Class {
	#name : #OSNullWindowDriver,
	#superclass : #OSWindowDriver,
	#category : #OSWindow-Core,
	#timestamp : 'IgorStasenko 7/30/2014 16:37'
}

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:40'
}
OSNullWindowDriver class>>isSupported [
	"Yep, i am always supported"
	^ true
]

{
	#category : #'window creation',
	#timestamp : ' 8/31/2017 05:26:40'
}
OSNullWindowDriver>>createWindowWithAttributes: anOSWindowAttributes osWindow: osWindow [
	^ OSNullWindowHandle fromAttributes: anOSWindowAttributes for: osWindow
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSNullWindowDriver>>isNullDriver [
	^ true
]
