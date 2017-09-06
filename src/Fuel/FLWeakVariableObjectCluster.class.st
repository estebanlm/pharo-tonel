"
I am a cluster for objects with weak indexable variables.
"
Class {
	#name : #FLWeakVariableObjectCluster,
	#superclass : #FLVariableObjectCluster,
	#category : #Fuel-Clusters,
	#timestamp : '<historical>'
}

{
	#category : #analyzing,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLWeakVariableObjectCluster>>clusterReferencesDo: aBlock [
	"Ensures that nil could be encoded, later in references step."

	super clusterReferencesDo: aBlock.
	aBlock value: nil
]

{
	#category : #serialize/materialize,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLWeakVariableObjectCluster>>serializeReferencesVariablePartOf: anObject with: anEncoder [
	
	1 to: anObject basicSize do: [ :index |
		anEncoder encodeWeakReferenceTo: (anObject basicAt: index) ]
]

{
	#category : #analyzing,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLWeakVariableObjectCluster>>variablePartReferencesOf: anObject do: aBlock  [
	"Since the variable part of Weak classes are weak references, we should not do nothing here."
]
