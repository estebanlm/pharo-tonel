"

"
Class {
	#name : #GLMMockSimpleTransmission,
	#superclass : #GLMTransmission,
	#instVars : [
		'wasTransmited'
	],
	#category : #Glamour-Tests-Core,
	#timestamp : ''
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMMockSimpleTransmission class>>new [

	^super new initialize
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMMockSimpleTransmission>>initialize [
	super initialize.
	wasTransmited := false
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMMockSimpleTransmission>>transmit [

	wasTransmited := true.
	super transmit.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMMockSimpleTransmission>>transmitIn: aContext [

	wasTransmited := true.
	super transmitIn: aContext
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMMockSimpleTransmission>>wasTransmited [
	^wasTransmited
]
