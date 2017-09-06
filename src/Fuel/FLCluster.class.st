"
I represent a cluster of objects grouped by some specific similarity. I know how to serialize and materialize them all together.
"
Class {
	#name : #FLCluster,
	#superclass : #Object,
	#category : #Fuel-Clusters,
	#timestamp : 'MartinDias 8/29/2011 19:20'
}

{
	#category : #analyzing,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLCluster class>>clusterBucketIn: aClusterization [
	"Answer in which clusters bucket place this cluster. This defines the sort order in which the clusters will be ordered. See FLAnalyzer >> clusteredObjects for more information."

	self subclassResponsibility 
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:12'
}
FLCluster class>>new [
	self error: 'Use another instance creation message.'
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:12'
}
FLCluster class>>newAnalyzing [

	^ self basicNew
		initializeAnalyzing;
		yourself.
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:12'
}
FLCluster class>>newMaterializing [

	^ self basicNew
		initializeMaterializing;
		yourself.
]

{
	#category : #serialize/materialize,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLCluster>>afterMaterializationStepWith: aDecoder [

]

{
	#category : #serialize/materialize,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLCluster>>clusterMaterializeStepWith: aMaterialization [
	"Materialize cluster stuff"

]

{
	#category : #analyzing,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLCluster>>clusterReferencesDo: aBlock [
	"Evaluate a block with each object referenced by the cluster"
]

{
	#category : #serialize/materialize,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLCluster>>clusterSerializeStepWith: aSerialization [
	"Serialize cluster stuff"
]

{
	#category : #hooks,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLCluster>>fuelAccept: aGeneralMapper [
	^ aGeneralMapper visitSubstitution: self by: nil
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLCluster>>initializeAnalyzing [

	self initialize.
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLCluster>>initializeMaterializing [

	self initialize.
]

{
	#category : #serialize/materialize,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLCluster>>materializeInstancesStepWith: aDecoder [

]

{
	#category : #serialize/materialize,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLCluster>>materializePostInstancesStepWith: aDecoder [


]

{
	#category : #serialize/materialize,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLCluster>>materializeReferencesStepWith: aDecoder [

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLCluster>>objects [
	"Answer the objects that this cluster groups."

	self subclassResponsibility
]

{
	#category : #serialize/materialize,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLCluster>>registerIndexesOn: anEncoder [
	"Maps objects with indexes in the dictionary."
]

{
	#category : #serialize/materialize,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLCluster>>serializeInstancesStepWith: anEncoder [

]

{
	#category : #serialize/materialize,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLCluster>>serializePostInstancesStepWith: anEncoder [

]

{
	#category : #serialize/materialize,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLCluster>>serializeReferencesStepWith: anEncoder [

]

{
	#category : #analyzing,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLCluster>>traceWith: anAnalysis  [

	self clusterReferencesDo: [ :aChild | anAnalysis privateTrace: aChild ]
]
