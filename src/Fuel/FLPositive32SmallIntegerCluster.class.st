"
unsigned, 32-bit integer
"
Class {
	#name : #FLPositive32SmallIntegerCluster,
	#superclass : #FLSmallIntegerCluster,
	#category : #Fuel-Clusters,
	#timestamp : 'TorstenBergmann 2/3/2014 23:20'
}

{
	#category : #serialize/materialize,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLPositive32SmallIntegerCluster>>materializeInstanceWith: aDecoder [

	^ aDecoder nextEncodedUint32
]

{
	#category : #serialize/materialize,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLPositive32SmallIntegerCluster>>serializeInstance: anInteger with: anEncoder [

	anEncoder encodeUint32: anInteger
]
