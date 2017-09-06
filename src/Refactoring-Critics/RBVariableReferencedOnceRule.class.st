"
Checks for instance variables that might better be defined as temporary variables. If an instance variable is only used in one method and it is always assigned before it is used, then that method could define that variable as a temporary variable of the method instead (assuming that the method is not recursive).
"
Class {
	#name : #RBVariableReferencedOnceRule,
	#superclass : #RBBlockLintRule,
	#category : #Refactoring-Critics-BlockRules,
	#timestamp : 'StephaneDucasse 11/29/2014 19:33'
}

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBVariableReferencedOnceRule class>>checksClass [
	^ true
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBVariableReferencedOnceRule class>>uniqueIdentifierName [
	"This number should be unique and should change only when the rule completely change semantics"
	
	^'VariableReferencedOnceRule'
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBVariableReferencedOnceRule>>basicCheck: aClass  [
	^ aClass instVarNames anySatisfy:
		[ :each | 
		| defClass selector |
		(aClass withAllSubclasses 
			inject: 0
			into: 
				[ :sum :class | 
				| sels |
				sels := class whichSelectorsAccess: each.
				sels size == 1 ifTrue: 
					[ selector := sels asArray first.
					defClass := class ].
				sum + sels size ]) == 1 and: 
			[ | tree |
			tree := defClass parseTreeFor: selector.
			tree notNil and: 
				[ (RBReadBeforeWrittenTester 
					isVariable: each
					writtenBeforeReadIn: tree) ] ] ]
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBVariableReferencedOnceRule>>checkClass: aClass  [
	| allSubclasses |
	allSubclasses := aClass withAllSubclasses.
	aClass instVarNames do: 
		[ :each | 
		| defClass selector |
		(allSubclasses 
			inject: 0
			into: 
				[ :sum :class | 
				| sels |
				sels := class whichSelectorsAccess: each.
				sels size == 1 ifTrue: 
					[ selector := sels asArray first.
					defClass := class ].
				sum + sels size ]) == 1 ifTrue: 
			[ | tree |
			tree := defClass parseTreeFor: selector.
			tree notNil ifTrue: 
				[ (RBReadBeforeWrittenTester 
					isVariable: each
					writtenBeforeReadIn: tree) ifTrue: 
					[ result 
						addClass: defClass
						selector: selector.
					result addSearchString: each ] ] ] ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBVariableReferencedOnceRule>>group [
	^ 'Design Flaws'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBVariableReferencedOnceRule>>name [
	^ 'Variable referenced in only one method and always assigned first'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBVariableReferencedOnceRule>>rationale [
	^ 'Checks for instance variables that might better be defined as temporary variables.'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBVariableReferencedOnceRule>>severity [
	^ #information
]
