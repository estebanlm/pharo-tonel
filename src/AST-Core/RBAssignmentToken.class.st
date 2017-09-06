"
RBAssignmentToken is the first-class representation of the assignment token ':='

"
Class {
	#name : #RBAssignmentToken,
	#superclass : #RBToken,
	#category : #AST-Core-Tokens,
	#timestamp : 'md 8/9/2005 14:51'
}

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBAssignmentToken>>isAssignment [
	^true
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBAssignmentToken>>length [
	^2
]
