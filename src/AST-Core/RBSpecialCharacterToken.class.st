"
RBSpecialCharacterToken is the first class representation of special characters.


"
Class {
	#name : #RBSpecialCharacterToken,
	#superclass : #RBValueToken,
	#category : #AST-Core-Tokens,
	#timestamp : 'md 8/9/2005 14:53'
}

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBSpecialCharacterToken>>isSpecial [
	^true
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBSpecialCharacterToken>>length [
	^1
]
