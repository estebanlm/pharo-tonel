"
Used by BundleTransmission to annotate its originating ports whether they are active or passive.

When a BundleTransmission consideres a port as active, the browser will trigger it when the corresponding port changes.
"
Class {
	#name : #GLMOriginPortReference,
	#superclass : #GLMPortReference,
	#instVars : [
		'active',
		'transformation'
	],
	#category : #Glamour-Core,
	#timestamp : '<historical>'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMOriginPortReference>>beActive  [
	 
	active := true
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMOriginPortReference>>bePassive  [
	 
	active := false
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMOriginPortReference>>isActive  [
	 
	^active ifNil: [active := true]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMOriginPortReference>>isPassive  [
	 
	^self isActive not
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMOriginPortReference>>transformation [
	^ transformation
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMOriginPortReference>>transformation: anObject [
	transformation := anObject
]

{
	#category : #accessing-convenience,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMOriginPortReference>>value [
	^ self transformation isNil ifTrue: [self port value] ifFalse: [self transformation value: self port value]
]
