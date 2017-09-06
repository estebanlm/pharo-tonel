"

"
Class {
	#name : #GLMBoundPort,
	#superclass : #GLMPort,
	#category : #Glamour-Core,
	#timestamp : ''
}

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMBoundPort>>= anObject  [
	"Compare this port with another for equality. 
 
	This is used to compare ParentPorts with PanePorts where the earlier is a proxy for the latter." 
	 
	^((anObject isKindOf: GLMBoundPort) and: [self pane = anObject pane]) 
		and: [self name = anObject name]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMBoundPort>>hasPane  [
	 
	^self pane notNil
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMBoundPort>>hash  [
	"Ports which are equal should return hash. 
 
	Since equality is used only for matching port proxies (ParentPort) with 
	their actual port, the hash function is overridden only in ParentPort." 
	 
	^super hash
]

{
	#category : #validation,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMBoundPort>>notingPresentationChangeDo: aBlock [
	self pane notingPresentationChangeDo: aBlock
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMBoundPort>>pane  [
	 
	self subclassResponsibility
]

{
	#category : #validation,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMBoundPort>>validate: anObject  [
	self pane presentations isEmpty ifTrue: [^true].
	^self pane presentations allSatisfy: [ :each | each validate: anObject on: self]
]
