"
I am a filter for a token.

If a node item contains my token I accept it
"
Class {
	#name : #TokenTreeFilter,
	#superclass : #AbstractTreeFilter,
	#instVars : [
		'token'
	],
	#category : #Spec-Core-Widgets-Support,
	#timestamp : '<historical>'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:18'
}
TokenTreeFilter class>>token: token [

	^ self new
		token: token;
		yourself
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:18'
}
TokenTreeFilter>>initialize [

	super initialize.

	token := ''.
]

{
	#category : #filtering,
	#timestamp : ' 8/31/2017 05:26:18'
}
TokenTreeFilter>>keepTreeNode: aNode [

	^ aNode matchTokenFilter: self
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
TokenTreeFilter>>token [
	^ token
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
TokenTreeFilter>>token: anObject [
	
	token := anObject
]
