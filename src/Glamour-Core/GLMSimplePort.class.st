"
GLMSimplePort simply offers a hardcoded value. It is typically used in tests, but it can be useful in special cases when we need to simulate a Port.

Instance Variables:
	value	<ProtoObject | PseudoContext>
"
Class {
	#name : #GLMSimplePort,
	#superclass : #GLMPort,
	#instVars : [
		'value'
	],
	#category : #Glamour-Core,
	#timestamp : 'TudorGirba 2/4/2011 20:29'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMSimplePort>>receive: aTransmission in: aContext [
	self value: aTransmission value in: aContext
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMSimplePort>>silentValue: anObject [
	value := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMSimplePort>>value  [
	 
	^value
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMSimplePort>>value: anObject in: aContext [
	aContext addPort: self.
	self silentValue: anObject  
]
