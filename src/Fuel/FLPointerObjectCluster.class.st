"
I have the common behavior for storing and loading pointer objects.
"
Class {
	#name : #FLPointerObjectCluster,
	#superclass : #FLObjectCluster,
	#instVars : [
		'variablesMapping'
	],
	#category : #Fuel-Clusters,
	#timestamp : 'MartinDias 8/1/2011 03:00'
}

{
	#category : #serialize/materialize,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLPointerObjectCluster>>afterMaterializationStepWith: aDecoder   [

	objects do: [ :anObject | anObject fuelAfterMaterialization ]
]

{
	#category : #serialize/materialize,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLPointerObjectCluster>>clusterMaterializeStepWith: aMaterialization [

	super clusterMaterializeStepWith: aMaterialization.
	variablesMapping := aMaterialization decoder variablesMappingFor: theClass.
]

{
	#category : #serialize/materialize,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLPointerObjectCluster>>clusterSerializeStepWith: aSerialization [

	super clusterSerializeStepWith: aSerialization.
	variablesMapping serializeOn: aSerialization encoder.
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLPointerObjectCluster>>initializeAnalyzing: aClass [

	super initializeAnalyzing: aClass.
	variablesMapping := FLVariablesMapping 
		newAnalyzing: theClass
		references: self references
]

{
	#category : #serialize/materialize,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLPointerObjectCluster>>materializeReferencesOf: anObject with: aDecoder [

	variablesMapping materializeReferencesOf: anObject with: aDecoder
]

{
	#category : #serialize/materialize,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLPointerObjectCluster>>materializeReferencesStepWith: aDecoder [

	objects do: [ :anObject | self materializeReferencesOf: anObject with: aDecoder ]
]

{
	#category : #analyzing,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLPointerObjectCluster>>referencesOf: anObject do: aBlock [

	variablesMapping referencesOf: anObject do: aBlock
]

{
	#category : #serialize/materialize,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLPointerObjectCluster>>serializeReferencesOf: anObject with: anEncoder [
	
	variablesMapping serializeReferencesOf: anObject with: anEncoder

]

{
	#category : #serialize/materialize,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLPointerObjectCluster>>serializeReferencesStepWith: anEncoder [

	objects do: [ :anObject | self serializeReferencesOf: anObject with: anEncoder ]
]
