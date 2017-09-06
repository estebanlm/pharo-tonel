"
I am a generic cluster for objects without indexable variables.
"
Class {
	#name : #FLFixedObjectCluster,
	#superclass : #FLPointerObjectCluster,
	#category : #Fuel-Clusters,
	#timestamp : 'MartinDias 5/30/2011 01:25'
}

{
	#category : #serialize/materialize,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLFixedObjectCluster>>materializeInstanceWith: aDecoder [

	^theClass fuelNew
]

{
	#category : #serialize/materialize,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLFixedObjectCluster>>serializeInstancesStepWith: anEncoder [
	"Do nothing. I know my objects have nothing to serialize in this step."

]
