"
This class represents syntax errors in regular expressions.
"
Class {
	#name : #RegexSyntaxError,
	#superclass : #RegexError,
	#instVars : [
		'position'
	],
	#category : #Regex-Core-Exceptions,
	#timestamp : 'Tbn 11/12/2010 22:38'
}

{
	#category : #signaling,
	#timestamp : ' 8/31/2017 07:16:22'
}
RegexSyntaxError class>>signal: anErrorMessage at: errorPosition [
	^ (self new)
		position: errorPosition;
		signal: anErrorMessage
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:22'
}
RegexSyntaxError>>position [
	"return the parsing error location"
	^ position
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:22'
}
RegexSyntaxError>>position: anInteger [
	position := anInteger.
]
