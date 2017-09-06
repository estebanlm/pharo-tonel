"
I am a template class whose algorithm for serialize a collection of objects consists on delegate the serialization of each individual object to the subclass.
"
Class {
	#name : #FLIteratingCluster,
	#superclass : #FLCluster,
	#instVars : [
		'objects',
		'references'
	],
	#category : #Fuel-Clusters,
	#timestamp : '<historical>'
}

{
	#category : #analyzing,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLIteratingCluster>>add: anObject traceWith: aAnalysis [
	"Add an object to the cluster and trace references."

	objects addIfNotPresent: anObject ifPresentDo: [ ^ self ].

	self 
		referencesOf: anObject 
		do: [ :aChild || actual |
			actual := aChild fuelReplacement.
			self addReferenceFrom: anObject to: actual.
			aAnalysis trace: actual ]
]

{
	#category : #analyzing,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLIteratingCluster>>addReferenceFrom: anObject to: anotherObject [
	| list |
	list := self references
		at: anObject
		ifAbsentPut: [ OrderedCollection new ].

	list add: anotherObject
]

{
	#category : #analyzing,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLIteratingCluster>>addReferencesFrom: anObject to: aCollection [
	aCollection do: [ :ref |
		self addReferenceFrom: anObject to: ref ]
]

{
	#category : #serialize/materialize,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLIteratingCluster>>clusterMaterializeStepWith: aMaterialization [

	super clusterMaterializeStepWith: aMaterialization.
	objects := Array new: aMaterialization decoder nextEncodedPositiveInteger
]

{
	#category : #serialize/materialize,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLIteratingCluster>>clusterSerializeStepWith: aSerialization [

	super clusterSerializeStepWith: aSerialization.
	aSerialization encoder encodePositiveInteger: objects size.
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLIteratingCluster>>initializeAnalyzing [

	super initializeAnalyzing.
	objects := self newAnalyzingCollection.
]

{
	#category : #serialize/materialize,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLIteratingCluster>>materializeInstanceWith: aDecoder [
	"Hook method that each subclass should customize for its special way of materializing"

	^ self subclassResponsibility
]

{
	#category : #serialize/materialize,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLIteratingCluster>>materializeInstancesStepWith: aDecoder [

	1 to: objects size do: [ :index |
		objects 
			at: index 
			put: (self materializeInstanceWith: aDecoder) ].
]

{
	#category : #analyzing,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLIteratingCluster>>newAnalyzingCollection [
	"Answer a collection for the objects that correspond to this cluster."

	^ FLLargeIdentitySet new
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLIteratingCluster>>objects [

	^objects
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLIteratingCluster>>printNameOn: aStream [

	super printOn: aStream
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLIteratingCluster>>printOn: aStream [

	self printNameOn: aStream.
	aStream nextPutAll: '->'.
	objects printElementsOn: aStream
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLIteratingCluster>>references [
	^ references ifNil: [  references := FLLargeIdentityDictionary new ]
]

{
	#category : #analyzing,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLIteratingCluster>>referencesOf: anObject do: aBlock [
	"Evaluate a block with each object referenced by anObject"
]

{
	#category : #serialize/materialize,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLIteratingCluster>>registerIndexesOn: anEncoder [
	| indexes |
	indexes := anEncoder objectsIndexes.
	self objects do: [ :instance |
		indexes
			at: instance
			put: indexes size + 1 ]
]

{
	#category : #serialize/materialize,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLIteratingCluster>>serializeInstance: anObject with: anEncoder [
	"Hook method that each subclass should customize for its special way of serializing"
]

{
	#category : #serialize/materialize,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLIteratingCluster>>serializeInstancesStepWith: anEncoder [

	objects do: [ :instance | self serializeInstance: instance with: anEncoder ]
]
