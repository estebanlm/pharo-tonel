"
unsigned, 24-bit integer
"
Class {
	#name : #FLPositive24SmallIntegerCluster,
	#superclass : #FLSmallIntegerCluster,
	#category : #Fuel-Clusters,
	#timestamp : 'TorstenBergmann 2/3/2014 23:20'
}

{
	#category : #serialize/materialize,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLPositive24SmallIntegerCluster>>materializeInstanceWith: aDecoder [
	
	^ aDecoder nextEncodedUint24 
]

{
	#category : #serialize/materialize,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLPositive24SmallIntegerCluster>>serializeInstance: anInteger with: anEncoder [
	
	anEncoder encodeUint24: anInteger
]
