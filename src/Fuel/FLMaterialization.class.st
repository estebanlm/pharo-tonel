"
I implement the algorithm for materializing an object graph on a stream. FLMaterializer known how to build instances of me.
"
Class {
	#name : #FLMaterialization,
	#superclass : #Object,
	#instVars : [
		'clusterCount',
		'clusters',
		'root',
		'decoder',
		'header'
	],
	#category : #Fuel-Core,
	#timestamp : 'MarianoMartinezPeck 10/23/2011 14:42'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:12'
}
FLMaterialization class>>with: aDecoder [

	^self basicNew
		initializeWith: aDecoder;
		yourself

]

{
	#category : #header,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLMaterialization>>additionalObjectAt: aKey [
	^ header additionalObjectAt: aKey
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLMaterialization>>afterMaterializationStep [

	clusters do: [ :aCluster | aCluster afterMaterializationStepWith: decoder ]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLMaterialization>>clusterInstancesStep [

	| aCluster |
	aCluster := decoder nextEncodedClusterClass newMaterializing.
	aCluster clusterMaterializeStepWith: self.
	aCluster materializeInstancesStepWith: decoder.
	self registerAll: aCluster objects.
	aCluster materializePostInstancesStepWith: decoder.
	clusters add: aCluster.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLMaterialization>>decoder [
	^ decoder
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLMaterialization>>header: aHeader [
	header := aHeader
	
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLMaterialization>>headerStep [

	decoder decodeYourself.
	clusterCount := decoder nextEncodedPositiveInteger.
	clusters := OrderedCollection new: clusterCount.
	clusters resetTo: 1. "Hack that avoids OrderedCollection>>makeRoomAtLast"
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLMaterialization>>initializeWith: aDecoder [

	self initialize.
	decoder := aDecoder.

]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLMaterialization>>instancesStep [

	clusterCount timesRepeat: [ self clusterInstancesStep ]

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLMaterialization>>objects [
	"Answer a collection with the materialized objects."

	^ decoder objects 
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLMaterialization>>referencesStep [

	clusters do: [ :aCluster | aCluster materializeReferencesStepWith: decoder ]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLMaterialization>>registerAll: materializedObjects [
	
	decoder registerAll: materializedObjects 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLMaterialization>>root [

	^ root 
]

{
	#category : #materializing,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLMaterialization>>run [

	self headerStep.
	self instancesStep.
	self referencesStep.
	self trailerStep.
	self afterMaterializationStep.
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLMaterialization>>trailerStep [

	root := decoder nextEncodedReference
]
