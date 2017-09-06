"
Checks for references to variables in the Undeclared dictionary. If you remove a referenced variable from a class, you will create an undeclared variable reference for those methods that accessed the variable.
"
Class {
	#name : #RBUndeclaredReferenceRule,
	#superclass : #RBBlockLintRule,
	#category : #Refactoring-Critics-BlockRules,
	#timestamp : 'StephaneDucasse 11/29/2014 20:17'
}

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBUndeclaredReferenceRule class>>isVisible [

	self flag: 'The functionality was moved to GRUndeclaredVariableRule, but as this rule is used by Monkey, and Monkey is not using Renraku model yet, the rule is hidden'.
	^ false
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:27'
}
RBUndeclaredReferenceRule class>>new [
	
	^ GRUndeclaredVariableRule asRBRule
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBUndeclaredReferenceRule class>>uniqueIdentifierName [
	"This number should be unique and should change only when the rule completely change semantics"
	
	^'UndeclaredReferenceRule'
]
