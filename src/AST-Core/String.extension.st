Extension {
	#name : #String
}

{
	#category : #'*AST-Core-Parser',
	#timestamp : ' 8/31/2017 07:16:40'
}
String>>asNumber  [
	"Answer the Number created by interpreting the receiver as the string 
	representation of a number."

	^Number readFromString: self
]
