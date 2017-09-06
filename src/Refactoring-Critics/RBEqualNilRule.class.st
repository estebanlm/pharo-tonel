"
Replaces = nil and == nil by isNil, ~= nil and ~~ nil by notNil to make the code more readable.  
"
Class {
	#name : #RBEqualNilRule,
	#superclass : #RBTransformationRule,
	#category : #Refactoring-Critics-TransformationRules,
	#timestamp : 'MarcusDenker 8/26/2015 14:42'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBEqualNilRule class>>uniqueIdentifierName [
	"This number should be unique and should change only when the rule completely change semantics"
	
	^'EqualNilRule'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBEqualNilRule>>group [
	^ 'Coding Idiom Violation'
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBEqualNilRule>>initialize [
	super initialize.
	self rewriteRule
		replace: '``@object = nil' with: '``@object isNil';
		replace: '``@object == nil' with: '``@object isNil';
		replace: '``@object ~= nil' with: '``@object notNil';
		replace: '``@object ~~ nil' with: '``@object notNil'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBEqualNilRule>>name [
	^ '= nil -> isNil AND ~= nil -> notNil'
]
