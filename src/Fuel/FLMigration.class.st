"
I represent migration information about a class.

See 'configuring-migration' protocol in FLMaterializer.
"
Class {
	#name : #FLMigration,
	#superclass : #Object,
	#instVars : [
		'sourceClassName',
		'variables',
		'targetClass'
	],
	#category : #Fuel-Core,
	#timestamp : 'MartinDias 1/6/2012 16:04'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:12'
}
FLMigration class>>fromClassNamed: aSymbol toClass: aClass variables: anArray  [

	^self basicNew
		initializeClassNamed: aSymbol 
		toClass: aClass 
		variables: anArray;
		yourself.
]

{
	#category : #evaluating,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLMigration>>applyTo: aVariablesMapping  [
	
	variables do: [:link |
		aVariablesMapping 
			map: link key 
			to: link value ]
	
]

{
	#category : #initializing,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLMigration>>initializeClassNamed: aSymbol toClass: aClass variables: anArray  [
	
	self initialize.
	sourceClassName := aSymbol.
	targetClass := aClass.
	variables := anArray.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLMigration>>sourceClassName [

	^ sourceClassName
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLMigration>>targetClass [

	^ targetClass
]
