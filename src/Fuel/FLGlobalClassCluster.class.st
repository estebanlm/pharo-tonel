"
I am a cluster for classes that should be present when materializing. In other words, it only serializes a reference to the class, using its name.
"
Class {
	#name : #FLGlobalClassCluster,
	#superclass : #FLGlobalCluster,
	#category : #Fuel-Clusters,
	#timestamp : 'MartinDias 5/30/2011 01:28'
}

{
	#category : #serialize/materialize,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLGlobalClassCluster>>materializeInstanceWith: aDecoder [

	^self materializeGlobalClassFrom: aDecoder 
]

{
	#category : #serialize/materialize,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLGlobalClassCluster>>serializeInstance: aClass with: anEncoder [
	
	self serializeGlobalClass: aClass on: anEncoder
]
