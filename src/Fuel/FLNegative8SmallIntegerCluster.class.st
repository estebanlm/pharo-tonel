"
A cluster of unsigned int 8bit
"
Class {
	#name : #FLNegative8SmallIntegerCluster,
	#superclass : #FLSmallIntegerCluster,
	#category : #Fuel-Clusters,
	#timestamp : 'TorstenBergmann 2/3/2014 23:19'
}

{
	#category : #serialize/materialize,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLNegative8SmallIntegerCluster>>materializeInstanceWith: aDecoder [

	^ aDecoder nextEncodedUint8 negated
]

{
	#category : #serialize/materialize,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLNegative8SmallIntegerCluster>>serializeInstance: anInteger with: anEncoder [

	anEncoder encodeUint8: anInteger abs
]
