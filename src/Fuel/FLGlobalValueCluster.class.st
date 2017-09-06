"
I am a cluster for known objects that belong to Smalltalk global dictionary.

For example, Transcript could be serialized and materialized by me.
"
Class {
	#name : #FLGlobalValueCluster,
	#superclass : #FLGlobalCluster,
	#category : #Fuel-Clusters,
	#timestamp : 'MartinDias 5/30/2011 01:28'
}

{
	#category : #serialize/materialize,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLGlobalValueCluster>>materializeInstanceWith: aDecoder [

	^(self materializeGlobalAssociationFrom: aDecoder) value
]

{
	#category : #serialize/materialize,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLGlobalValueCluster>>serializeInstance: anObject with: anEncoder [
	
	self serializeGlobalAssociationKeyed: (anEncoder globalEnvironment keyAtValue: anObject) on: anEncoder
]
