"
I am the generic cluster for storing and loading variable byte objects.
"
Class {
	#name : #FLByteObjectCluster,
	#superclass : #FLBitsObjectCluster,
	#category : #Fuel-Clusters,
	#timestamp : 'MartinDias 8/1/2011 02:59'
}

{
	#category : #serialize/materialize,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLByteObjectCluster>>materializeInstanceWith: aDecoder [

	| instance size |
	size := aDecoder nextEncodedPositiveInteger.
	instance := theClass basicNew: size.
	aDecoder nextEncodedBytesInto: instance.
	^ instance

]

{
	#category : #serialize/materialize,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLByteObjectCluster>>serializeInstance: anObject with: anEncoder [

	anEncoder encodePositiveInteger: anObject basicSize.
	anEncoder encodeBytes: anObject.
]
