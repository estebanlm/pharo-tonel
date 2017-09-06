"
Checks for the common code fragment: ""(aCollection detect: [:each | ''some condition''] ifNone: [nil]) ~= nil"". contains: can simplify this code to ""aCollection contains: [:each | ''some condition'']"". Not only is the contains: variant shorter, it better signifies what the code is doing
"
Class {
	#name : #RBContainsRule,
	#superclass : #RBParseTreeLintRule,
	#category : #Refactoring-Critics-ParseTreeRules,
	#timestamp : 'StephaneDucasse 11/29/2014 21:26'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBContainsRule class>>uniqueIdentifierName [
	"This number should be unique and should change only when the rule completely change semantics"
	
	^'ContainsRule'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBContainsRule>>group [
	^ 'Optimization'
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBContainsRule>>initialize [
	super initialize.
	self matcher 
		matchesAnyOf: #(
			'(`@object detect: [:`each | | `@temps| `@.Statements] ifNone: [nil]) isNil'
			'(`@object detect: [:`each | | `@temps| `@.Statements] ifNone: [nil]) notNil'
			'(`@object detect: [:`each | | `@temps| `@.Statements] ifNone: [nil]) = nil'
			'(`@object detect: [:`each | | `@temps| `@.Statements] ifNone: [nil]) == nil'
			'(`@object detect: [:`each | | `@temps| `@.Statements] ifNone: [nil]) ~= nil'
			'(`@object detect: [:`each | | `@temps| `@.Statements] ifNone: [nil]) ~~ nil'
			'`@object detect: [:`each | | `@temps| `@.Statements] ifNone: [| `@temps1 | `@.Statements2. ^`@anything]' )
		do: [ :node :answer | node ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBContainsRule>>name [
	^ 'Uses detect:ifNone: instead of contains:'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBContainsRule>>rationale [
	^ 'Checks for the common code fragment: "(aCollection detect: [:each | ''some condition''] ifNone: [nil]) ~= nil".'
]
