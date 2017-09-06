"
I am a refactoring change for the class side of a class addition.
"
Class {
	#name : #RBAddMetaclassChange,
	#superclass : #RBRefactoryDefinitionChange,
	#instVars : [
		'classInstanceVariableNames'
	],
	#category : #Refactoring-Changes,
	#timestamp : 'NicolaiHess 9/9/2016 20:35'
}

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBAddMetaclassChange class>>definitionPatterns [
	^ #('`className class instanceVariableNames: `#instanceVariableNames'
		'`className class uses: `@traitComposition instanceVariableNames: `#instanceVariableNames')
]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBAddMetaclassChange>>asUndoOperation [
	^ self class definition: self changeClass class definition
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBAddMetaclassChange>>classInstanceVariableNames [
	^ classInstanceVariableNames
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBAddMetaclassChange>>definitionClass [
	^ self changeClass
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBAddMetaclassChange>>fillOutDefinition: aDictionary [
	className := (aDictionary at: '`className') asSymbol.
	classInstanceVariableNames := self namesIn: (aDictionary
		at: '`#instanceVariableNames'
		ifAbsent: [ String new ])
]
