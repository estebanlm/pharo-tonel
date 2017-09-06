"
Check for code that checks that a collection is non-empty before sending it an iteration message (e.g., do:, collect:, etc.). Since the collection iteration messages work for empty collections, we do not need to clutter up our method with the extra size check.
"
Class {
	#name : #RBSizeCheckRule,
	#superclass : #RBParseTreeLintRule,
	#category : #Refactoring-Critics-ParseTreeRules,
	#timestamp : 'StephaneDucasse 11/29/2014 23:00'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBSizeCheckRule class>>uniqueIdentifierName [
	"This number should be unique and should change only when the rule completely change semantics"
	
	^'SizeCheckRule'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBSizeCheckRule>>group [
	^ 'Optimization'
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBSizeCheckRule>>initialize [
	| patterns |
	super initialize.
	patterns := OrderedCollection new.
	patterns addAll: (self selectors
		collect: [ :each | '`@object size > 0 ifTrue: [`@object' , (self genericPatternForSelector: each) , '. `@.Statements2]' ]).
	patterns addAll: (self selectors
		collect: [ :each | '`@object isEmpty ifFalse: [`@object' , (self genericPatternForSelector: each) , '. `@.Statements2]' ]).
	patterns addAll: (self selectors
		collect: [ :each | '`@object notEmpty ifTrue: [`@object' , (self genericPatternForSelector: each) , '. `@.Statements2]' ]).
	patterns addAll: (self selectors
		collect: [ :each | '`@object size = 0 ifFalse: [`@object' , (self genericPatternForSelector: each) , '. `@.Statements2]' ]).
	self matcher
		matchesAnyOf: patterns
		do: [ :node :answer | node ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBSizeCheckRule>>name [
	^ 'Unnecessary size check'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBSizeCheckRule>>rationale [
	^ 'Check for code that checks that a collection is non-empty before sending it an iteration message (e.g., do:, collect:, etc.).'
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBSizeCheckRule>>selectors [
	^ #( collect: do: reject: select: )
]
