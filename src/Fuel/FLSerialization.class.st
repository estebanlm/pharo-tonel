"
I implement the algorithm for serializing an object graph on a stream. FLSerializer known how to build instances of me.
"
Class {
	#name : #FLSerialization,
	#superclass : #Object,
	#instVars : [
		'encoder',
		'root',
		'clusters',
		'analyzer'
	],
	#category : #Fuel-Core,
	#timestamp : 'MarianoMartinezPeck 10/23/2011 14:42'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:12'
}
FLSerialization class>>with: anEncoder root: anObject analyzer: anAnalyzer [
	
	^ self basicNew
		initializeWith: anEncoder
		root: anObject
		analyzer: anAnalyzer;
		yourself
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLSerialization>>analysisStep [

	| anAnalysis |
	anAnalysis := analyzer analysisFor: root.
	clusters := anAnalysis clusterization clusters.
	encoder objectCount: anAnalysis clusterization objectCount

]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLSerialization>>clusterInstancesStepOf: aCluster [

	encoder encodeClusterClass: aCluster class.
	aCluster clusterSerializeStepWith: self.
	aCluster serializeInstancesStepWith: encoder.
	aCluster serializePostInstancesStepWith: encoder.

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLSerialization>>clusters [
	^ clusters
]

{
	#category : #debugging,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLSerialization>>clustersSortedByAmountOfObjects [
	^ self clusters sorted: [ :a :b | a objects size > b objects size ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLSerialization>>encoder [
	^ encoder
]

{
	#category : #hooks,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLSerialization>>fuelAccept: aGeneralMapper [
	^ aGeneralMapper visitSubstitution: self by: nil
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLSerialization>>headerStep [
	
	encoder encodeYourself.
	encoder encodePositiveInteger: clusters size.
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLSerialization>>initializeWith: anEncoder root: anObject analyzer: anAnalyzer [
			
	self initialize.
	encoder := anEncoder.
	root := anObject fuelReplacement.
	analyzer := anAnalyzer.
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLSerialization>>instancesStep [

	clusters do: [ :aCluster | aCluster registerIndexesOn: encoder ].
	clusters do: [ :aCluster | self clusterInstancesStepOf: aCluster ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLSerialization>>objects [
	"Answer a collection with the serialized objects."

	^ encoder objectsIndexes keys
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLSerialization>>referencesStep [

	clusters do: [ :aCluster | aCluster serializeReferencesStepWith: encoder ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLSerialization>>root [
	^ root
]

{
	#category : #serializing,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLSerialization>>run [
	"Serialize the graph starting at the root object."

	self analysisStep.
	self headerStep.
	self instancesStep.
	self referencesStep.
	self trailerStep.
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLSerialization>>trailerStep [

	encoder encodeReferenceTo: root
]
