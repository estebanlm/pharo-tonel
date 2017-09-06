"

"
Class {
	#name : #GLMTestPort,
	#superclass : #GLMPanePort,
	#instVars : [
		'seenTransmissions'
	],
	#category : #Glamour-Tests-Core,
	#timestamp : ''
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMTestPort>>receive: aTransmission  [
	 
	self seenTransmissions addLast: aTransmission. 
	^super receive: aTransmission
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMTestPort>>receive: aTransmission in: aContext [
	self seenTransmissions addLast: aTransmission. 
	^super receive: aTransmission in: aContext
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMTestPort>>seenTransmissions  [
	 
	^seenTransmissions ifNil: [seenTransmissions := OrderedCollection new]
]
