"
RBIdentifierToken is the first class representation of an identifier token (e.g. Class)

"
Class {
	#name : #RBIdentifierToken,
	#superclass : #RBValueToken,
	#instVars : [
		'stopPosition'
	],
	#category : #AST-Core-Tokens,
	#timestamp : 'md 8/9/2005 14:51'
}

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBIdentifierToken>>isIdentifier [
	^true
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBIdentifierToken>>isKeywordPattern [
	^ self isPatternVariable	and: [ value second = RBScanner keywordPatternCharacter
				and: [ value third ~= RBScanner cascadePatternCharacter ] ]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBIdentifierToken>>isPatternVariable [
	^value first = RBScanner patternVariableCharacter
]
