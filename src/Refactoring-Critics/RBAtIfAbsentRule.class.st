"
Replaces at:ifAbsent: by at:ifAbsentPut:. Its leads to shorter and more readable code.


"
Class {
	#name : #RBAtIfAbsentRule,
	#superclass : #RBTransformationRule,
	#category : #Refactoring-Critics-TransformationRules,
	#timestamp : 'StephaneDucasse 11/29/2014 17:37'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBAtIfAbsentRule class>>uniqueIdentifierName [
	"This number should be unique and should change only when the rule completely change semantics"
	
	^'AtIfAbsentRule'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBAtIfAbsentRule>>group [
	^ 'Coding Idiom Violation'
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBAtIfAbsentRule>>initialize [
	super initialize.
	self rewriteRule
		replace: '``@dictionary at: ``@key 
					ifAbsent: [| `@temps | 
							``@.Statements1.
							``@dictionary at: ``@key put: ``@object.
							``@.Statements2.
							``@object]'
		with: '``@dictionary at: ``@key
					ifAbsentPut: [| `@temps |
							``@.Statements1.
							``@.Statements2.
							``@object]';
		replace: '``@dictionary at: ``@key
					ifAbsent: [| `@temps |
							``@.Statements.
							``@dictionary at: ``@key put: ``@object]'
		with: '``@dictionary at: ``@key
					ifAbsentPut: [| `@temps |
							``@.Statements.
							``@object]'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBAtIfAbsentRule>>name [
	^ 'at:ifAbsent: -> at:ifAbsentPut:'
]
