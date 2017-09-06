"
I implement a generic way of serializing and materializing an object, for those that do not need more special way of doing it.
"
Class {
	#name : #FLObjectCluster,
	#superclass : #FLIteratingCluster,
	#instVars : [
		'theClass'
	],
	#category : #Fuel-Clusters,
	#timestamp : 'MartinDias 8/29/2011 19:20'
}

{
	#category : #analyzing,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLObjectCluster class>>clusterBucketIn: aClusterization [

	^aClusterization baselevelBucket 
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:12'
}
FLObjectCluster class>>newAnalyzing: aClass [

	^ self basicNew
		initializeAnalyzing: aClass;
		yourself.
]

{
	#category : #serialize/materialize,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLObjectCluster>>clusterMaterializeStepWith: aMaterialization [

	super clusterMaterializeStepWith: aMaterialization.
	theClass := aMaterialization decoder nextEncodedReference.

]

{
	#category : #analyzing,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLObjectCluster>>clusterReferencesDo: aBlock [

	aBlock value: theClass
]

{
	#category : #serialize/materialize,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLObjectCluster>>clusterSerializeStepWith: aSerialization [

	super clusterSerializeStepWith: aSerialization.
	aSerialization encoder encodeReferenceToClusterObjectClass: theClass
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLObjectCluster>>initializeAnalyzing: aClass [

	self initializeAnalyzing.
	theClass := aClass
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLObjectCluster>>printNameOn: aStream [
	"Append to the argument, aStream, a sequence of characters that  
	identifies the receiver."
	
	super printNameOn: aStream.
	aStream nextPut: $[.
	theClass printOn: aStream.
	aStream nextPut: $].
	
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLObjectCluster>>theClass  [
	^ theClass
]
