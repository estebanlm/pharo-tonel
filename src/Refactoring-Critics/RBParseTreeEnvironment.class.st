"

"
Class {
	#name : #RBParseTreeEnvironment,
	#superclass : #RBSelectorEnvironment,
	#instVars : [
		'matcher'
	],
	#category : #Refactoring-Critics,
	#timestamp : ''
}

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBParseTreeEnvironment>>matcher: aParseTreeSearcher [
	matcher := aParseTreeSearcher
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBParseTreeEnvironment>>selectionIntervalFor: aString  [
	| parseTree node |
	matcher isNil 
		ifTrue: [ ^ super selectionIntervalFor: aString ].
	parseTree := RBParser
		parseMethod: aString
		onError: [ :error :position | ^ super selectionIntervalFor: aString ].
	node := matcher executeTree: parseTree initialAnswer: nil.
	^ (node isKindOf: RBProgramNode)
		ifTrue: [ node sourceInterval ]
		ifFalse: [ super selectionIntervalFor: aString ]
]
