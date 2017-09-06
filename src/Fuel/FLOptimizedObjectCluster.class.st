"
I have shared behavior of some optional clusters.
"
Class {
	#name : #FLOptimizedObjectCluster,
	#superclass : #FLIteratingCluster,
	#category : #Fuel-Clusters-Optionals,
	#timestamp : '<historical>'
}

{
	#category : #analyzing,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLOptimizedObjectCluster class>>clusterBucketIn: aClusterization [

	^aClusterization baselevelBucket 
]

{
	#category : #serialize/materialize,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLOptimizedObjectCluster>>materializeReferencesOf: anObject with: aDecoder [
	"Hook method"

	self subclassResponsibility
]

{
	#category : #serialize/materialize,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLOptimizedObjectCluster>>materializeReferencesStepWith: aDecoder [

	objects do: [ :anObject | self materializeReferencesOf: anObject with: aDecoder ]
]

{
	#category : #serialize/materialize,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLOptimizedObjectCluster>>serializeInstancesStepWith: anEncoder [
	"Do nothing. I know my objects have nothing to serialize in this step."

]

{
	#category : #serialize/materialize,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLOptimizedObjectCluster>>serializeReferencesOf: anObject with: anEncoder [
	(self references at: anObject ifAbsent: [ ^ self ]) do: [ :value |
		anEncoder encodeReferenceTo: value ]
]

{
	#category : #serialize/materialize,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLOptimizedObjectCluster>>serializeReferencesStepWith: anEncoder [

	objects do: [ :anObject | self serializeReferencesOf: anObject with: anEncoder ]
]
