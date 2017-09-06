"
This class is a simple data structure to be used for identifying a port by name.
"
Class {
	#name : #GLMPortIdentifier,
	#superclass : #Object,
	#instVars : [
		'paneName',
		'portName'
	],
	#category : #Glamour-Helpers,
	#timestamp : '<historical>'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMPortIdentifier class>>defaultOriginOf: aPaneName [
	^ self new 
		paneName: aPaneName;
		portName: self defaultOriginPortName
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMPortIdentifier class>>defaultOriginPortName [
	^ #selection
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMPortIdentifier class>>defaultTargetOf: aPaneName [
	^ self new 
		paneName: aPaneName;
		portName: self defaultTargetPortName
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMPortIdentifier class>>defaultTargetPortName [
	^ #entity
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMPortIdentifier class>>pane: aPaneName port: aPortName [
	^ self new 
		paneName: aPaneName;
		portName: aPortName
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMPortIdentifier>>asGlamourOriginIdentifier [
	self portName isNil ifTrue: [self portName: self class defaultOriginPortName].
	^ self 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMPortIdentifier>>asGlamourTargetIdentifier [
	self portName isNil ifTrue: [self portName: self class defaultTargetPortName].
	^ self 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMPortIdentifier>>paneName [
	^ paneName
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMPortIdentifier>>paneName: anObject [
	paneName := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMPortIdentifier>>portName [
	^ portName
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMPortIdentifier>>portName: anObject [
	portName := anObject
]
