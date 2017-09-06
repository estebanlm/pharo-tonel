"
unsigned, 8-bit integer
"
Class {
	#name : #FLPositive8SmallIntegerCluster,
	#superclass : #FLSmallIntegerCluster,
	#category : #Fuel-Clusters,
	#timestamp : 'TorstenBergmann 2/3/2014 23:20'
}

{
	#category : #serialize/materialize,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLPositive8SmallIntegerCluster>>materializeInstanceWith: aDecoder [

	^ aDecoder nextEncodedUint8
]

{
	#category : #serialize/materialize,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLPositive8SmallIntegerCluster>>serializeInstance: anInteger with: anEncoder [

	anEncoder encodeUint8: anInteger
]
