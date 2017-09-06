"
Literal arrays containing only characters can more efficiently represented as strings.
"
Class {
	#name : #RBLiteralArrayCharactersRule,
	#superclass : #RBParseTreeLintRule,
	#category : #Refactoring-Critics-ParseTreeRules,
	#timestamp : 'StephaneDucasse 11/29/2014 22:12'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBLiteralArrayCharactersRule class>>uniqueIdentifierName [
	"This number should be unique and should change only when the rule completely change semantics"
	
	^'LiteralArrayCharactersRule'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBLiteralArrayCharactersRule>>group [
	^ 'Optimization'
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBLiteralArrayCharactersRule>>initialize [
	super initialize.
	self matcher 
		matches: '`#literal'
		do: [ :node :answer | 
			answer isNil 
				ifTrue: [
					(node value class == Array and: [ self isArrayOfCharacters: node value ]) 
						ifTrue: [ node ]
						ifFalse: [ nil ] ]
				ifFalse: [ answer ] ]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBLiteralArrayCharactersRule>>isArrayOfCharacters: anArray  [
	anArray isEmpty ifTrue: [^false].
	1 to: anArray size
		do: [:each | (anArray at: each) class == Character ifFalse: [^false]].
	^true
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBLiteralArrayCharactersRule>>name [
	^ 'Literal array contains only characters'
]
