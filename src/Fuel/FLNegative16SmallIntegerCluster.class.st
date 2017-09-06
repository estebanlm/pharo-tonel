"
A cluster of unsigned int 16bit
"
Class {
	#name : #FLNegative16SmallIntegerCluster,
	#superclass : #FLSmallIntegerCluster,
	#category : #Fuel-Clusters,
	#timestamp : 'TorstenBergmann 2/3/2014 23:19'
}

{
	#category : #serialize/materialize,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLNegative16SmallIntegerCluster>>materializeInstanceWith: aDecoder [
	
	^ aDecoder nextEncodedUint16 negated 
]

{
	#category : #serialize/materialize,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLNegative16SmallIntegerCluster>>serializeInstance: anInteger with: anEncoder [
	
	anEncoder encodeUint16: anInteger abs
]
