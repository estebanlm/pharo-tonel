"
RBPatternScanner is a subclass of RBScanner that allows the extended syntax of pattern matching trees.

"
Class {
	#name : #RBPatternScanner,
	#superclass : #RBScanner,
	#category : #AST-Core-Parser,
	#timestamp : '<historical>'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBPatternScanner>>scanToken [
	currentCharacter = PatternVariableCharacter 
		ifTrue: [^self scanPatternVariable].
	currentCharacter = $} ifTrue: [^self scanSpecialCharacter].
	^super scanToken
]
