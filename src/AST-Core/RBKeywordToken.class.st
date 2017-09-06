"
RBKeywordToken is the first-class representation of a keyword token (e.g. add:)
"
Class {
	#name : #RBKeywordToken,
	#superclass : #RBValueToken,
	#instVars : [
		'stopPosition'
	],
	#category : #AST-Core-Tokens,
	#timestamp : 'md 8/9/2005 14:52'
}

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBKeywordToken>>isKeyword [
	^true
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBKeywordToken>>isPatternVariable [
	^value first = RBScanner patternVariableCharacter
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBKeywordToken>>isPrimitiveKeyword [
	^ self value = #primitive:
]
