"
I am a cluster for those Metaclasses and ClassTrait who are not stored in detail.
"
Class {
	#name : #FLGlobalClassSideCluster,
	#superclass : #FLGlobalCluster,
	#category : #Fuel-Clusters,
	#timestamp : 'MartinDias 8/1/2011 02:57'
}

{
	#category : #serialize/materialize,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLGlobalClassSideCluster>>materializeInstanceWith: aDecoder [

	^(self materializeGlobalClassFrom: aDecoder) classSide
]

{
	#category : #serialize/materialize,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLGlobalClassSideCluster>>serializeInstance: aClassOrTraitClassSide with: anEncoder [

	self serializeGlobalClass: aClassOrTraitClassSide instanceSide on: anEncoder

]
