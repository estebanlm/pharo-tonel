"
A version info
"
Class {
	#name : #MBVersionInfo,
	#superclass : #MBAbstractVersionInfo,
	#category : #Versionner-Core-Model,
	#timestamp : 'TorstenBergmann 2/20/2014 14:12'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBVersionInfo class>>helpLabel [

	^'Version'
]

{
	#category : #commands,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBVersionInfo>>cmdReleaseDevelopmentVersion [
	<command>
	^ VSReleaseDevelopmentVersionCommand
]

{
	#category : #commands,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBVersionInfo>>cmdSetDescription [
	<command>
	^ VSSetDescriptionCommand
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBVersionInfo>>printOn: aStream [
	super printOn: aStream.
	self isDevelopment 
		ifTrue: [ 
			aStream nextPutAll: ' #development'.
			^self ].
	self isStable
		ifTrue: [ aStream nextPutAll: ' #stable' ].
]
