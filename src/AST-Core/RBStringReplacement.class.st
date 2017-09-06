"
RBStringReplacement represents replacing source in the original method with a different string. These are used when reformatting code after a parse tree change has been made. Depending on the change, it may be possible to minimally change the parse tree without needing to format it.

Instance Variables:
	startPosition	<Integer>	the start position in the original source
	stopPosition	<Integer>	the end position in the original source
	string	<String>	replaces everything from the startPosition to the endPosition with this string


"
Class {
	#name : #RBStringReplacement,
	#superclass : #Object,
	#instVars : [
		'startPosition',
		'stopPosition',
		'string'
	],
	#category : #AST-Core-Nodes,
	#timestamp : '<historical>'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:40'
}
RBStringReplacement class>>replaceFrom: startInteger to: stopInteger with: aString  [
	^(self new)
		startPosition: startInteger;
		stopPosition: stopInteger;
		string: aString;
		yourself
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBStringReplacement>>startPosition [
	^startPosition
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBStringReplacement>>startPosition: anInteger  [
	startPosition := anInteger
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBStringReplacement>>stopPosition [
	^stopPosition
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBStringReplacement>>stopPosition: anInteger  [
	stopPosition := anInteger
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBStringReplacement>>string [
	^string
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBStringReplacement>>string: aString  [
	string := aString
]
