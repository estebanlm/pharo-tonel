"
Classes that use traits with explicit requirement methods should either implement the method or inherit it.
"
Class {
	#name : #RBExplicitRequirementMethodsRule,
	#superclass : #RBBlockLintRule,
	#category : #Refactoring-Critics-BlockRules,
	#timestamp : 'MarcusDenker 12/1/2014 13:35'
}

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBExplicitRequirementMethodsRule class>>checksClass [
	^ true
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBExplicitRequirementMethodsRule class>>uniqueIdentifierName [

	^ 'ExplicitRequirementMethodsRule'
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBExplicitRequirementMethodsRule>>basicCheck: aClass  [

	| explicitRequirementMethods |
	explicitRequirementMethods := Set new.
	
	aClass isTrait 
		ifTrue: [ ^ false ].
		
	aClass traitComposition allSelectors do: [ :selector | | method |
				method := aClass>>selector.
				 (method isRequired and: [ method isSubclassResponsibility not ]) 
						ifTrue: [ explicitRequirementMethods add: method ]].
	
	^ explicitRequirementMethods anySatisfy: [ :method |
		aClass withAllSuperclasses 
			noneSatisfy: [ :superclass | superclass canPerform: method selector ] ].
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBExplicitRequirementMethodsRule>>checkClass: aClass  [

	| explicitRequirementMethods |
	explicitRequirementMethods := Set new.
	aClass isTrait 
		ifTrue: [ ^ self ].
		
	aClass traitComposition allSelectors do: [ :selector | | method |
				method := aClass>>selector.
				 (method isRequired and: [ method isSubclassResponsibility not ]) 
						ifTrue: [ explicitRequirementMethods add: method ]].
	
	^ explicitRequirementMethods do: [ :method |
		aClass withAllSuperclasses 
			detect: [ :superclass | superclass canPerform: method selector ] ifNone: [result addClass: aClass selector: method selector]].
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:27'
}
RBExplicitRequirementMethodsRule>>group [
	^ 'Coding Idiom Violation'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBExplicitRequirementMethodsRule>>name [
	^ 'Explicit requirement methods'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBExplicitRequirementMethodsRule>>rationale [
	^ 'Classes that use traits with explicit requirement methods should either implement the method or inherit it.'
]
