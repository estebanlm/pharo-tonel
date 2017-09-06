"
GLMPort represents the abstract port. Any port has a name. Subclasses can provide further semantics to a port.
"
Class {
	#name : #GLMPort,
	#superclass : #GLMLoggedObject,
	#instVars : [
		'name'
	],
	#category : #Glamour-Core,
	#timestamp : 'tg 12/19/2009 00:15'
}

{
	#category : #copying,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMPort>>copyAccordingToPaneMapping: newPanesMapping inNewBrowser: anotherBrowser [
	^ self subclassResponsibility
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMPort>>hasPane [
	^ false
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMPort>>isEntityPort [
	^ self name = #entity
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMPort>>isSelectionPort [
	^ self name = #selection
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMPort>>name  [
	 
	^name
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMPort>>name: aSymbol  [
	 
	name := aSymbol
]

{
	#category : #validation,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMPort>>notingPresentationChangeDo: aBlock [
	aBlock value
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMPort>>printOn: aStream  [
	super printOn: aStream.
	aStream 
		nextPut: Character space;
		nextPutAll: self identityHash printString;
		nextPutAll: ' (name='; 
		nextPutAll: self name printString; 
		nextPutAll: ' value='; 
		nextPutAll: self value printString; 
		nextPut: $)
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMPort>>receive: aTransmission  [
	self receive: aTransmission in: GLMTransmissionContext new
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMPort>>receive: aTransmission in: aContext  [
	self subclassResponsibility
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMPort>>silentValue: anObject [
	"This is meant to be used internally"
	self subclassResponsibility
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMPort>>transientValue: anObject  [
	| previousValue |
	previousValue := self value. 
	self value: anObject.
	self silentValue: previousValue
]

{
	#category : #validation,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMPort>>validate: anObject  [

	^true
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMPort>>value  [
	 
	self subclassResponsibility
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMPort>>value: anObject  [
	self value: anObject in: GLMTransmissionContext new
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMPort>>value: anObject in: aContext [
	self subclassResponsibility
]
