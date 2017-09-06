"
A FLSimpleCollectionCluster is a special optional cluster that rather than using the default (variable object) serialization, uses #do: to iterate objects and #add: during materialization. So far we use it for Set, IdentitySet and OrderedCollection.
"
Class {
	#name : #FLSimpleCollectionCluster,
	#superclass : #FLAbstractCollectionCluster,
	#category : #Fuel-Clusters-Optionals,
	#timestamp : '<historical>'
}

{
	#category : #serialize/materialize,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLSimpleCollectionCluster>>materializeReferencesOf: anObject with: aDecoder [
	aDecoder nextEncodedPositiveInteger "anObject size"
		 timesRepeat: 
			[ anObject add: aDecoder nextEncodedReference ]
]

{
	#category : #analyzing,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLSimpleCollectionCluster>>referencesOf: anObject do: aBlock [
	aBlock value: anObject size.
	anObject
		do: [ :each | aBlock value: each ]

]

{
	#category : #serialize/materialize,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLSimpleCollectionCluster>>serializeReferencesOf: anObject with: anEncoder [
	| refs |
	refs := self references at: anObject ifAbsent: [ ^ self ].
	anEncoder encodePositiveInteger: refs first.
	refs allButFirst do: [ :each |
		anEncoder encodeReferenceTo: each ]
	
]
