"
Check for a =, ==, ~=, or ~~ message being sent to true/false or with true/false as the argument. Many times these can be eliminated since their receivers are already booleans. For example, ""anObject isFoo == false"" could be replaced with ""anObject isFoo not"" if isFoo always returns a boolean. Sometimes variables might refer to true, false, and something else, but this is considered bad style since the variable has multiple types.
"
Class {
	#name : #RBEqualsTrueRule,
	#superclass : #RBParseTreeLintRule,
	#category : #Refactoring-Critics-ParseTreeRules,
	#timestamp : 'StephaneDucasse 11/29/2014 21:31'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBEqualsTrueRule class>>uniqueIdentifierName [
	"This number should be unique and should change only when the rule completely change semantics"
	
	^'EqualsTrueRule'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBEqualsTrueRule>>group [
	^ 'Optimization'
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBEqualsTrueRule>>initialize [
	super initialize.
	self matcher 
		matchesAnyOf: #('true' 'false')
		do: [ :node :answer | 
			answer isNil 
				ifTrue: [
					(node parent isMessage and: [ #(#= #== #~= #~~) includes: node parent selector ]) 
						ifTrue: [ node ]
						ifFalse: [ nil ] ]
				ifFalse: [ answer ] ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBEqualsTrueRule>>name [
	^ 'Unnecessary "= true"'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBEqualsTrueRule>>rationale [
	^ 'Check for a =, ==, ~=, or ~~ message being sent to true/false or with true/false as the argument.'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBEqualsTrueRule>>severity [
	^ #information
]
