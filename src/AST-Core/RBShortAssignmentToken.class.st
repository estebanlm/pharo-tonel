"
I was used for the left arrow assignment (the ASCII underscore character) operator.
In the current scanner/parser, this assignment operator is not used or allowed anymore.
"
Class {
	#name : #RBShortAssignmentToken,
	#superclass : #RBAssignmentToken,
	#category : #AST-Core-Tokens,
	#timestamp : 'NicolaiHess 8/22/2016 15:46'
}

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBShortAssignmentToken>>length [
	^ 1
]
