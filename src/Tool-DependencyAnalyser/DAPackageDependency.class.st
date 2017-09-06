"
A PDPackageDependency is a dependency between two packages.

	source:		the source PDPackage 
	target:	      the target PDPackage

"
Class {
	#name : #DAPackageDependency,
	#superclass : #Object,
	#instVars : [
		'source',
		'target'
	],
	#category : #Tool-DependencyAnalyser-Core,
	#timestamp : 'BaptisteQuide 7/11/2014 14:39'
}

{
	#category : #instance-creation,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageDependency class>>from: aSourcePackage to: aDestinationPackage [
	^ self new initializeFrom: aSourcePackage to: aDestinationPackage
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageDependency>>displayString [
	^ String streamContents: [ :stream | self printReasonOn: stream ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageDependency>>hash [
	^ source hash bitXor: target hash
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageDependency>>initializeFrom: aSourcePackage to: aTargetPackage [
	source := aSourcePackage.
	target := aTargetPackage
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageDependency>>isExtensionDependency [
	^ false
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageDependency>>isExternal [
	^ self isInternal not
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageDependency>>isInheritanceDependency [
	^ false 
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageDependency>>isInternal [
	^ self source = self target
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageDependency>>isMessageSendDependency [
	^ false 
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageDependency>>isReferenceDependency [
	^ false
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageDependency>>isTraitDependency [
	^ false
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageDependency>>numberOfDependencies [
	^ 1
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageDependency>>packageName [
	^ target packageName
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageDependency>>printOn: aStream [
	self printReasonOn: aStream
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageDependency>>printReasonOn: aStream [
	aStream 
		nextPutAll: source packageName;
		nextPutAll: ' -> ';
		nextPutAll: target packageName
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageDependency>>printShortReasonOn: aStream [
	self printReasonOn: aStream
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageDependency>>reason [
	^ String streamContents: [ :stream | self printReasonOn: stream ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageDependency>>source [
	^ source
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageDependency>>target [
	^ target
]
