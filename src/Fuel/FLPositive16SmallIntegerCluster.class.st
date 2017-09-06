"
unsigned, 16-bit integer cluster
"
Class {
	#name : #FLPositive16SmallIntegerCluster,
	#superclass : #FLSmallIntegerCluster,
	#category : #Fuel-Clusters,
	#timestamp : 'TorstenBergmann 2/3/2014 23:20'
}

{
	#category : #serialize/materialize,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLPositive16SmallIntegerCluster>>materializeInstanceWith: aDecoder [
	
	^ aDecoder nextEncodedUint16 
]

{
	#category : #serialize/materialize,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLPositive16SmallIntegerCluster>>serializeInstance: anInteger with: anEncoder [
	
	anEncoder encodeUint16: anInteger
]
