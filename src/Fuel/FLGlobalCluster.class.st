"
I am a cluster for objects that are reachables from Smalltalk global dictionary.
"
Class {
	#name : #FLGlobalCluster,
	#superclass : #FLPrimitiveCluster,
	#category : #Fuel-Clusters,
	#timestamp : 'MartinDias 9/16/2011 14:49'
}

{
	#category : #analyzing,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLGlobalCluster class>>clusterBucketIn: aClusterization [

	^aClusterization globalsBucket 
]

{
	#category : #serialize/materialize,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLGlobalCluster>>materializeGlobalAssociationFrom: aDecoder [

	| globalName |
	globalName := aDecoder nextEncodedString asSymbol.
	^ aDecoder globalEnvironment
		associationAt: globalName
		ifAbsent: [ FLGlobalNotFound signalWithName: globalName ]

]

{
	#category : #serialize/materialize,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLGlobalCluster>>materializeGlobalClassFrom: aDecoder [

	| className |
	className := aDecoder nextEncodedString asSymbol.
	^ aDecoder classNamed: className
]

{
	#category : #serialize/materialize,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLGlobalCluster>>serializeGlobalAssociationKeyed: aSymbol on: anEncoder [
	
	anEncoder encodeString: aSymbol
]

{
	#category : #serialize/materialize,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLGlobalCluster>>serializeGlobalClass: aClass on: anEncoder [
	
	aClass isObsolete ifTrue: [ FLObsolete signalWithName: aClass name ].
	anEncoder encodeString: aClass name 
]
