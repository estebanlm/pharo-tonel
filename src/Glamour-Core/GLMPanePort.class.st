"
A port that belongs to a pane.

Bound ports have a few special characteristics in comparison to their superclass. For one, they don't just assign a value to themselves using #value: but rather generate a transmission that set the value so that the pane can handle the transmission and forward it to other ports if necessary, depending on the policy of the containing browser.
"
Class {
	#name : #GLMPanePort,
	#superclass : #GLMBoundPort,
	#instVars : [
		'pane',
		'value'
	],
	#category : #Glamour-Core,
	#timestamp : '<historical>'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMPanePort>>basicValue: anObject [
	value := anObject. 
	
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMPanePort>>changeValueTo: anObject in: aTransmissionContext [
	| oldValue | 
	oldValue := self value.
	self pane notingPresentationChangeDo: [
		self silentValue: anObject.  
		self pane portEvent: 
					(GLMPortEvent 
						on: self
						previouslyValued: oldValue
						in: aTransmissionContext) ]
]

{
	#category : #copying,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMPanePort>>copyAccordingToPaneMapping: newPanesMapping inNewBrowser: anotherBrowser [
	^ (newPanesMapping at: self pane) port: self name
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMPanePort>>pane  [
	 
	^pane
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMPanePort>>pane: aPane  [
	 
	pane := aPane
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMPanePort>>printOn: aStream  [
	 
	aStream 
		nextPutAll: 'Port (pane='; 
		nextPutAll: self pane name printString; 
		nextPutAll: ' name='; 
		nextPutAll: self name printString; 
		nextPutAll: ' value='; 
		nextPutAll: self value printString; 
		nextPut: $)
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMPanePort>>receive: aTransmission in: aContext [
	self value: aTransmission value in: aContext
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMPanePort>>resetValue [
	| context |
	context := GLMTransmissionContext new.
	context addPort: self.
	self changeValueTo: nil in: context.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMPanePort>>silentValue: anObject [
	value := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMPanePort>>value  [
	 
	^value
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMPanePort>>value: anObject in: aContext [
	(self validate: anObject) ifFalse: [^ self].
	aContext addPort: self.
	self changeValueTo: anObject in: aContext.
]
