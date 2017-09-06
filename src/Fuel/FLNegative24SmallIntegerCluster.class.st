"
A cluster of unsigned int 24bit
"
Class {
	#name : #FLNegative24SmallIntegerCluster,
	#superclass : #FLSmallIntegerCluster,
	#category : #Fuel-Clusters,
	#timestamp : 'TorstenBergmann 2/3/2014 23:19'
}

{
	#category : #serialize/materialize,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLNegative24SmallIntegerCluster>>materializeInstanceWith: aDecoder [
	
	^ aDecoder nextEncodedUint24 negated 
]

{
	#category : #serialize/materialize,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLNegative24SmallIntegerCluster>>serializeInstance: anInteger with: anEncoder [
	
	anEncoder encodeUint24: anInteger abs
]
