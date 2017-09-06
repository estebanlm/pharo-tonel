"
A GLMPortEvent is passed to the parent pane every time a Port changes.

Instance Variables
	oldValue:		<Object>
	port:		Port
	transmission:		Transmission
	transmissionContext:	TransmissionContext
"
Class {
	#name : #GLMPortEvent,
	#superclass : #GLMLoggedObject,
	#instVars : [
		'port',
		'oldValue',
		'transmissionContext'
	],
	#category : #Glamour-Core,
	#timestamp : 'tg 12/19/2009 00:12'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMPortEvent class>>on: aPort previouslyValued: anObject  [
	^ self new 
		initializeOn: aPort
		previouslyValued: anObject
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMPortEvent class>>on: aPort previouslyValued: anObject in: aTransmissionContext  [
	^self new initializeOn: aPort previouslyValued: anObject in: aTransmissionContext 
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMPortEvent>>hasChanged [
	"Answer whether the port value changed due to the event."

	^ self value ~~ self oldValue
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMPortEvent>>initializeOn: aPort previouslyValued: anObject  [
	self initializeOn: aPort previouslyValued: anObject in: OrderedCollection new
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMPortEvent>>initializeOn: aPort previouslyValued: anObject in: aTransmissionContext  [
	port := aPort.
	oldValue := anObject.
	transmissionContext := aTransmissionContext
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMPortEvent>>isEntityPort [
	^ self port isEntityPort
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMPortEvent>>isSelectionPort [
	^ self port isSelectionPort
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMPortEvent>>oldValue  [
	 
	^oldValue
]

{
	#category : #accessing-convenience,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMPortEvent>>pane  [
	 
	^self port pane
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMPortEvent>>port  [
	 
	^port
]

{
	#category : #accessing-convenience,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMPortEvent>>portName  [
	 
	^self port name
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMPortEvent>>printOn: aStream [
	super printOn: aStream.
	aStream 
		nextPutAll: '(port='.
	self port printOn: aStream.
	aStream nextPutAll: ' oldValue='; nextPutAll: self oldValue printString; nextPut: $)
		
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMPortEvent>>transmissionContext [
	^ transmissionContext
]

{
	#category : #accessing-convenience,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMPortEvent>>value  [
	 
	^self port value
]
