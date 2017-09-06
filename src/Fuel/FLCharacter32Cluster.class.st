"
I'm a cluster for Unicode characters.
"
Class {
	#name : #FLCharacter32Cluster,
	#superclass : #FLPrimitiveCluster,
	#category : #Fuel-Clusters,
	#timestamp : 'MartinDias 11/27/2014 17:16'
}

{
	#category : #serialize/materialize,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLCharacter32Cluster>>materializeInstanceWith: aDecoder [

	^ Character value: aDecoder nextEncodedUint32
]

{
	#category : #serialize/materialize,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLCharacter32Cluster>>serializeInstance: aCharacter with: anEncoder [

	anEncoder encodeUint32: aCharacter asciiValue
]
