"
The classes from this hierarchy define strategies for what should happen after the value have been set to the destination port.
"
Class {
	#name : #GLMTransmissionStrategy,
	#superclass : #Object,
	#instVars : [
		'transmission'
	],
	#category : #Glamour-Core,
	#timestamp : 'tg 2/20/2010 14:45'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMTransmissionStrategy class>>of: aTransmission [
	^ self new transmission: aTransmission; yourself
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMTransmissionStrategy>>addPresentation: aPresentation [
	"do nothing by default"
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMTransmissionStrategy>>addPresentations: aCollection [
	"do nothing by default"
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMTransmissionStrategy>>presentations [
	^ OrderedCollection new
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMTransmissionStrategy>>transmission [
	^ transmission
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMTransmissionStrategy>>transmission: anObject [
	transmission := anObject
]

{
	#category : #transmitting,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMTransmissionStrategy>>transmitIn: aContext [
	"override this method to add the desired semantics"
	self subclassResponsibility
]
