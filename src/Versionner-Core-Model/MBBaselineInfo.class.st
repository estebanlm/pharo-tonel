"
A MBBaselineInfo holds information on a baselinf of a configuration.


"
Class {
	#name : #MBBaselineInfo,
	#superclass : #MBAbstractVersionInfo,
	#category : #Versionner-Core-Model,
	#timestamp : '<historical>'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBBaselineInfo class>>helpLabel [

	^'Baseline'
]

{
	#category : #commands,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBBaselineInfo>>cmdCopyBaseline [
	<command>
	^ MBCopyBaselineCommand
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBBaselineInfo>>printOn: aStream [
	super printOn: aStream.
	self isBleedingEdge 
		ifTrue: [ aStream nextPutAll: ' #bleedingEdge' ].
]
