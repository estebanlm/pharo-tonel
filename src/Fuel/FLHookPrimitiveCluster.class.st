"
I am a cluster for simple objects who define serialization and materialization via hooks on their classes.
"
Class {
	#name : #FLHookPrimitiveCluster,
	#superclass : #FLPrimitiveCluster,
	#instVars : [
		'theClass'
	],
	#category : #Fuel-Clusters,
	#timestamp : '<historical>'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:12'
}
FLHookPrimitiveCluster class>>newAnalyzing: aClass [

	^ self basicNew
		initializeAnalyzing: aClass;
		yourself.
]

{
	#category : #serialize/materialize,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLHookPrimitiveCluster>>clusterMaterializeStepWith: aMaterialization [

	super clusterMaterializeStepWith: aMaterialization.
	theClass := aMaterialization decoder nextEncodedReference.

]

{
	#category : #analyzing,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLHookPrimitiveCluster>>clusterReferencesDo: aBlock [

	aBlock value: theClass
]

{
	#category : #serialize/materialize,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLHookPrimitiveCluster>>clusterSerializeStepWith: aSerialization [

	super clusterSerializeStepWith: aSerialization.
	aSerialization encoder encodeReferenceToClusterObjectClass: theClass.	
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLHookPrimitiveCluster>>initializeAnalyzing: aClass [

	self initializeAnalyzing.
	theClass := aClass
]

{
	#category : #serialize/materialize,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLHookPrimitiveCluster>>materializeInstanceWith: aDecoder [
	
	^theClass materializeFrom: aDecoder
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLHookPrimitiveCluster>>printNameOn: aStream [
	"Append to the argument, aStream, a sequence of characters that  
	identifies the receiver."
	
	super printNameOn: aStream.
	aStream nextPut: $[.
	theClass printOn: aStream.
	aStream nextPut: $].
]

{
	#category : #serialize/materialize,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLHookPrimitiveCluster>>serializeInstance: anObject with: anEncoder [

	anObject serializeOn: anEncoder
]
