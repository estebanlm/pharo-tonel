"
I am used to materialize instance variables in an object, tolerating ""class shape changing"".

Cases tolerated are:
- instance variable added
- instance variable order change
- instance variable removed

"
Class {
	#name : #FLVariablesMapping,
	#superclass : #Object,
	#instVars : [
		'mapping',
		'theClass',
		'notIgnoredVariables',
		'references'
	],
	#category : #Fuel-Clusters,
	#timestamp : 'MartinDias 8/1/2011 03:01'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:12'
}
FLVariablesMapping class>>materializing: aClass from: aDecoder [
	
	^ self basicNew
		initializeWithClass: aClass;
		initializeMaterializingFrom: aDecoder;
		yourself.
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:12'
}
FLVariablesMapping class>>newAnalyzing: anAnalysis references: aCollection [

	^ self basicNew
		initializeWithClass: anAnalysis references: aCollection;
		initializeAnalyzing;
		yourself
]

{
	#category : #serialize/materialize,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLVariablesMapping>>initializeAnalyzing [

	notIgnoredVariables := self instanceVariableNamesToSerialize.
	
	mapping := notIgnoredVariables 
		collect: [ :name | theClass instVarIndexFor: name ].
]

{
	#category : #serialize/materialize,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLVariablesMapping>>initializeMaterializingFrom: aDecoder [

	notIgnoredVariables := (1 to: aDecoder nextEncodedByte) collect: [ :index | aDecoder nextEncodedString ].

	mapping := notIgnoredVariables  
		collect: [ :name | theClass instVarIndexFor: name ifAbsent: [ nil ] ].


]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLVariablesMapping>>initializeWithClass: aClass [
	self initialize.
	theClass := aClass
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLVariablesMapping>>initializeWithClass: aClass references: aCollection [
	self initialize.
	theClass := aClass.
	references := aCollection
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLVariablesMapping>>instanceVariableNamesToSerialize [

	| ignoredInstanceVariableNames instanceVariableNamesToSerialize |
	ignoredInstanceVariableNames := theClass fuelIgnoredInstanceVariableNames.
	instanceVariableNamesToSerialize := OrderedCollection new.

	theClass instanceVariableNamesDo: [:name | 
		(ignoredInstanceVariableNames includes: name) 
			ifFalse: [ instanceVariableNamesToSerialize add: name ]].

	^ instanceVariableNamesToSerialize
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLVariablesMapping>>map: sourceName to: destinationName [

	| indexOfVariableToMap |
	indexOfVariableToMap := notIgnoredVariables indexOf: sourceName.
	indexOfVariableToMap > 0
		ifTrue: [ mapping 
			at: indexOfVariableToMap 
			put: (theClass
				instVarIndexFor: destinationName
				ifAbsent: [self error: 'Bad variable destination.'])].

]

{
	#category : #serialize/materialize,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLVariablesMapping>>materializeReferencesOf: anObject with: aDecoder  [

	mapping do: [ :index | 
			| reference |
			reference := aDecoder nextEncodedReference.
			index ifNotNil: [
				anObject 
					instVarAt: index
					put: reference ]].
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLVariablesMapping>>references [
	^ references
]

{
	#category : #analyzing,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLVariablesMapping>>referencesOf: anObject do: aBlock [

	mapping do: [ :index | aBlock value: (anObject instVarAt: index) ].
]

{
	#category : #serialize/materialize,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLVariablesMapping>>serializeOn: anEncoder [

	anEncoder encodeByte: notIgnoredVariables size.	
	notIgnoredVariables do: [ :name | anEncoder encodeString: name ].
]

{
	#category : #serialize/materialize,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLVariablesMapping>>serializeReferencesOf: anObject with: anEncoder  [

	(self references at: anObject ifAbsent: [ ^ self ]) do: [ :value |
		anEncoder encodeReferenceTo: value ].
]
