"
I am a cluster for MethodContexts.
"
Class {
	#name : #FLContextCluster,
	#superclass : #FLVariableObjectCluster,
	#category : #Fuel-Clusters,
	#timestamp : 'MartinDias 5/30/2011 01:18'
}

{
	#category : #serialize/materialize,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLContextCluster>>materializeInstanceWith: aDecoder [

	^ theClass newFromFrameSize: aDecoder nextEncodedByte

]

{
	#category : #serialize/materialize,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLContextCluster>>serializeInstance: aMethodContext with: anEncoder [

	anEncoder encodeByte: aMethodContext method frameSize.

]
