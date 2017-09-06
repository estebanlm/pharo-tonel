"
Replaces detect:ifNone: and contains: when used with the semantics of anySatisfy: by anySatisfy:.

For example, 

[[[ 
collection detect: [:each | .... ] ifNone: [nil]) notNil	
]]]
is transformed into 

[[[ 
collection anySatisfy: [ :each | .... ])
]]]
"
Class {
	#name : #RBDetectIfNoneRule,
	#superclass : #RBTransformationRule,
	#category : #Refactoring-Critics-TransformationRules,
	#timestamp : 'YuriyTymchuk 5/23/2016 14:38'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBDetectIfNoneRule class>>uniqueIdentifierName [
	"This number should be unique and should change only when the rule completely change semantics"
	
	^'DetectIfNoneRule'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBDetectIfNoneRule>>group [
	^ 'Coding Idiom Violation'
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBDetectIfNoneRule>>initialize [
	super initialize.
	self rewriteRule
		replace: '``@collection contains: [:`each | | `@temps | ``@.Statements]'
		with: '``@collection anySatisfy: [:`each | | `@temps | ``@.Statements]';
		
		replace: '(``@collection detect: [:`each | | `@temps | ``@.Statements] ifNone: [nil]) isNil'
		with: '(``@collection anySatisfy: [:`each | | `@temps | ``@.Statements]) not';
		
		replace: '(``@collection detect: [:`each | | `@temps | ``@.Statements] ifNone: [nil]) = nil'
		with: '(``@collection anySatisfy: [:`each | | `@temps | ``@.Statements]) not';
		
		replace: '(``@collection detect: [:`each | | `@temps | ``@.Statements] ifNone: [nil]) == nil'
		with: '(``@collection anySatisfy: [:`each | | `@temps | ``@.Statements]) not';
		
		replace: '(``@collection detect: [:`each | | `@temps | ``@.Statements] ifNone: [nil]) notNil'
		with: '``@collection anySatisfy: [:`each | | `@temps | ``@.Statements]';
		
		replace: '(``@collection detect: [:`each | | `@temps | ``@.Statements] ifNone: [nil]) ~= nil'
		with: '``@collection anySatisfy: [:`each | | `@temps | ``@.Statements]';
		
		replace: '(``@collection detect: [:`each | | `@temps | ``@.Statements] ifNone: [nil]) ~~ nil'
		with: '``@collection anySatisfy: [:`each | | `@temps | ``@.Statements]'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBDetectIfNoneRule>>name [
	^ '#detect:ifNone: or #contains: -> #anySatisfy:'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBDetectIfNoneRule>>rationale  [
	^ 'Replaces detect:ifNone: and contains: by anySatisfy:'
]
