"
A FLAbstractCollectionCluster is the common behavior for all cluster collections. 
"
Class {
	#name : #FLAbstractCollectionCluster,
	#superclass : #FLObjectCluster,
	#category : #Fuel-Clusters-Optionals,
	#timestamp : '<historical>'
}

{
	#category : #analyzing,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLAbstractCollectionCluster class>>clusterBucketIn: aClusterization [

	"During the materialization references step, we may send, for example, #hash to the newly materialized objects. #hash can be implemented delegating to OTHER objects which may not have been materialized yet (I mean, its references may not have been set yet). So in this case, we need to let these clusters at the end."
	^aClusterization postBaselevelBucket
]

{
	#category : #serialize/materialize,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLAbstractCollectionCluster>>afterMaterializationStepWith: aDecoder   [

	objects do: [ :anObject | anObject fuelAfterMaterialization ]
]

{
	#category : #serialize/materialize,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLAbstractCollectionCluster>>materializeInstanceWith: aDecoder [

	^theClass new: aDecoder nextEncodedPositiveInteger
]

{
	#category : #serialize/materialize,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLAbstractCollectionCluster>>materializeReferencesOf: anObject with: aDecoder [
	"Hook method"

	self subclassResponsibility
]

{
	#category : #serialize/materialize,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLAbstractCollectionCluster>>materializeReferencesStepWith: aDecoder [

	objects do: [ :anObject | self materializeReferencesOf: anObject with: aDecoder ]
]

{
	#category : #serialize/materialize,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLAbstractCollectionCluster>>serializeInstance: anObject with: anEncoder [
	anEncoder encodePositiveInteger: anObject size
]

{
	#category : #serialize/materialize,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLAbstractCollectionCluster>>serializeReferencesOf: anObject with: anEncoder [
	^ self subclassResponsibility 
]

{
	#category : #serialize/materialize,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLAbstractCollectionCluster>>serializeReferencesStepWith: anEncoder [

	objects do: [ :anObject | self serializeReferencesOf: anObject with: anEncoder ]
]
