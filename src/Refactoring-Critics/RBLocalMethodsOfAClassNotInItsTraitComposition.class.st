"
If a class has a method in its trait composition, the method should not be implemented in the class.
"
Class {
	#name : #RBLocalMethodsOfAClassNotInItsTraitComposition,
	#superclass : #RBBlockLintRule,
	#category : #Refactoring-Critics-BlockRules,
	#timestamp : 'StephaneDucasse 11/29/2014 20:54'
}

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBLocalMethodsOfAClassNotInItsTraitComposition class>>checksClass [
	^ true
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBLocalMethodsOfAClassNotInItsTraitComposition class>>uniqueIdentifierName [
	"This number should be unique and should change only when the rule completely change semantics"
	
	^'MethodInClassVsTrait'
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBLocalMethodsOfAClassNotInItsTraitComposition>>basicCheck: aClass  [
	
	"The comparison between methods is made using the ast, this is better than comparing source code only since it does not take into account identations, extra parenthesis, etc"

	^ aClass isTrait not and: [ aClass hasTraitComposition and: [  
		aClass localMethods anySatisfy: [ :method | |traitCompositionMethod |
			traitCompositionMethod := (aClass traitComposition methodDescriptionForSelector: method selector) effectiveMethod.
			traitCompositionMethod notNil and: [
				(traitCompositionMethod ast = method ast) ] ] ] ]
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBLocalMethodsOfAClassNotInItsTraitComposition>>checkClass: aClass  [
	
	"The comparison between methods is made using the ast, this is better than comparing source code only since it does not take into account identations, extra parenthesis, etc"
	
	| selectedClass |
	selectedClass := aClass.
	(selectedClass isTrait not and: [ selectedClass hasTraitComposition ]) ifTrue: [  
		selectedClass localMethods do: [ :method | |traitCompositionMethod |
			traitCompositionMethod := (selectedClass traitComposition methodDescriptionForSelector: method selector) effectiveMethod.
			traitCompositionMethod ifNotNil: [
				
				(traitCompositionMethod ast = method ast) 
					ifTrue: [ result addClass: selectedClass selector: method selector ]]]].
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:27'
}
RBLocalMethodsOfAClassNotInItsTraitComposition>>group [
	^ 'Optimization'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBLocalMethodsOfAClassNotInItsTraitComposition>>name [
	^ 'Repeated methods in the trait composition'
]
