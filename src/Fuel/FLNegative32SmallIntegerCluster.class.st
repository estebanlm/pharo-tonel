"
A cluster of unsigned int 32bit
"
Class {
	#name : #FLNegative32SmallIntegerCluster,
	#superclass : #FLSmallIntegerCluster,
	#category : #Fuel-Clusters,
	#timestamp : 'TorstenBergmann 2/3/2014 23:19'
}

{
	#category : #serialize/materialize,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLNegative32SmallIntegerCluster>>materializeInstanceWith: aDecoder [
	
	^ aDecoder nextEncodedUint32 negated 
]

{
	#category : #serialize/materialize,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLNegative32SmallIntegerCluster>>serializeInstance: anInteger with: anEncoder [
	
	anEncoder encodeUint32: anInteger abs
]
