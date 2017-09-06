"
I am a refactoring change for a class trait  addition, the meta side of a trait definition.
"
Class {
	#name : #RBAddClassTraitChange,
	#superclass : #RBRefactoryDefinitionChange,
	#category : #Refactoring-Changes,
	#timestamp : 'NicolaiHess 9/9/2016 20:35'
}

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBAddClassTraitChange class>>definitionPatterns [
	^ #('`traitName classTrait uses: `@traitComposition')
]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBAddClassTraitChange>>asUndoOperation [
	^ self class definition: self changeClass classTrait definition
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBAddClassTraitChange>>definitionClass [
	^ self changeClass
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBAddClassTraitChange>>fillOutDefinition: aDictionary [
	className := (aDictionary at: '`traitName') asSymbol
]
