"
I handle a Session for a specific class, providing the API the class should implement.
Handlers will be triggered by the SessionManager.
"
Class {
	#name : #ClassSessionHandler,
	#superclass : #AbstractSessionHandler,
	#instVars : [
		'registeredClassName'
	],
	#category : #System-SessionManager,
	#timestamp : 'ChristopheDemarey 10/2/2015 11:06'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:58'
}
ClassSessionHandler class>>forClassNamed: aClassName [
	^ self new
		registeredClassName: aClassName;
		yourself
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:58'
}
ClassSessionHandler>>handledId [
	^ registeredClassName
]

{
	#category : #handlers,
	#timestamp : ' 8/31/2017 07:16:58'
}
ClassSessionHandler>>registeredClass [
	^ Smalltalk globals at: registeredClassName asSymbol
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:58'
}
ClassSessionHandler>>registeredClassName: aClassName  [
	registeredClassName := aClassName
]

{
	#category : #handlers,
	#timestamp : ' 8/31/2017 07:16:58'
}
ClassSessionHandler>>shutdown: isImageQuitting [
	self registeredClass shutDown: isImageQuitting
]

{
	#category : #handlers,
	#timestamp : ' 8/31/2017 07:16:58'
}
ClassSessionHandler>>startup: isImageStarting [
	self registeredClass startUp: isImageStarting
]
