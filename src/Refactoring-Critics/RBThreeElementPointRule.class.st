"
Checks arithmetic statements for possible three element points (i.e., a point that has another point in its x or y part).
"
Class {
	#name : #RBThreeElementPointRule,
	#superclass : #RBParseTreeLintRule,
	#category : #Refactoring-Critics-ParseTreeRules,
	#timestamp : 'StephaneDucasse 11/29/2014 22:58'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBThreeElementPointRule class>>uniqueIdentifierName [
	"This number should be unique and should change only when the rule completely change semantics"
	
	^'ThreeElementPointRule'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBThreeElementPointRule>>group [
	^ 'Potential Bugs'
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBThreeElementPointRule>>initialize [
	super initialize.
	self matcher
		matches: '``@x @ ``@y'
		do: [ :node :answer | 
			answer isNil 
				ifTrue: [
					| current |
					current := node parent.
					[ current isNil or: [ current isMessage and: [ current selector = #@ or: [ current selector isInfix not ] ] ] ] 
						whileFalse: [ current := current parent ].
					(current isNil or: [ current isMessage and: [ current selector isInfix not ] ]) 
						ifTrue: [ nil ]
						ifFalse: [ node ] ]
				ifFalse: [ answer ] ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBThreeElementPointRule>>name [
	^ 'Possible three element point (e.g., x @ y + q @ r)'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBThreeElementPointRule>>rationale [
	^ 'Checks arithmetic statements for possible three element points (i.e., a point that has another point in its x or y part).'
]
