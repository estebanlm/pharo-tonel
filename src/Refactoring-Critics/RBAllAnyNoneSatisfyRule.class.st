"
Replace ad-hoc implementations (using explicit logic based on do:) of ==allSatisfy:==, ==anySatisfy:== and ==noneSatisfy:== by the adequate calls to ==allSatisfy:==, ==anySatisfy:== or ==noneSatisfy:==. 

For example 

[[[  
collection do: [ :each |
				...
				condition
					ifFalse: [ ^ false ] ]
]]]
is transformed into 

[[[  
collection allSatisfy: [ :each | condition ]
]]]
"
Class {
	#name : #RBAllAnyNoneSatisfyRule,
	#superclass : #RBTransformationRule,
	#category : #Refactoring-Critics-TransformationRules,
	#timestamp : 'StephaneDucasse 11/29/2014 17:33'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBAllAnyNoneSatisfyRule class>>uniqueIdentifierName [
	"This number should be unique and should change only when the rule completely change semantics"
	
	^'AllAnyNoneSatisfyRule'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBAllAnyNoneSatisfyRule>>group [
	^ 'Coding Idiom Violation'
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBAllAnyNoneSatisfyRule>>initialize [
	super initialize.
	self rewriteRule
	
		" allSatisfy: "
		replaceMethod: '`@method: `@args
			| `@temps |
			`@.statements.
			`@collection do: [ :`each |
				| `@blocktemps |
				`@.blockstatements.
				`@condition
					ifFalse: [ ^ false ] ].
			^ true'
		with: '`@method: `@args
			| `@temps |
			`@.statements. 
			^ `@collection allSatisfy: [ :`each |
				| `@blocktemps |
				`@.blockstatements.
				`@condition ]';

		" anySatisfy: "
		replaceMethod: '`@method: `@args
			| `@temps |
			`@.statements.
			`@collection do: [ :`each |
				| `@blocktemps |
				`@.blockstatements.
				`@condition
					ifTrue: [ ^ true ] ].
			^ false'
		with: '`@method: `@args
			| `@temps |
			`@.statements.
			^ `@collection anySatisfy: [ :`each | 
				| `@blocktemps |
				`@.blockstatements.
				`@condition ]';

		" noneSatisfy: "
		replaceMethod: '`@method: `@args
			| `@temps |
			`@.statements.
			`@collection do: [ :`each |
				| `@blocktemps |
				`@.blockstatements.
				`@condition
					ifTrue: [ ^ false ] ].
			^ true'
		with: '`@method: `@args
			| `@temps |
			`@.statements.
			^ `@collection noneSatisfy: [ :`each | 
				| `@blocktemps |
				`@.blockstatements.				
				`@condition ]'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBAllAnyNoneSatisfyRule>>name [
	^ 'Replace with #allSatisfy:, #anySatisfy: or #noneSatisfy:'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBAllAnyNoneSatisfyRule>>rationale [
	^ 'Replace ad-hoc implementations (using explicit logic based on do:) of allSatisfy:, anySatisfy: and noneSatisfy: by the adequate calls to #allSatisfy:, #anySatisfy: or #noneSatisfy:. '
]
