"
I represent a set of settings that the BlueInk prettyprinter uses. 
I'm useful to set a prettyPrinter. 
"
Class {
	#name : #BIPrettyPrinterContext,
	#superclass : #Object,
	#instVars : [
		'formatCommentWithStatements',
		'indentString',
		'indentsForKeywords',
		'keepBlockInMessage',
		'lineUpBlockBrackets',
		'maxLineLength',
		'methodSignatureOnMultipleLines',
		'minimumNewLinesBetweenStatements',
		'multiLineMessages',
		'newLineAfterCascade',
		'newLineBeforeFirstCascade',
		'newLineBeforeFirstKeyword',
		'newLinesAfterMethodComment',
		'newLinesAfterMethodPattern',
		'newLinesAfterTemporaries',
		'numberOfArgumentsForMultiLine',
		'oneLineMessages',
		'periodsAtEndOfBlock',
		'periodsAtEndOfMethod',
		'retainBlankLinesBetweenStatements',
		'retainBlankLinesBeforeComments',
		'stringFollowingReturn',
		'stringInsideBlocks',
		'stringInsideParentheses',
		'useTraditionalBinaryPrecedenceForParentheses',
		'selectorAndArgumentCombinedMaxSize',
		'useBasicCommentFormat',
		'traditionalBinaryPrecedenceArray'
	],
	#category : #BlueInk-Core,
	#timestamp : 'StephaneDucasse 3/31/2015 15:43'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
BIPrettyPrinterContext>>formatCommentWithStatements [
	^ formatCommentWithStatements
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
BIPrettyPrinterContext>>formatCommentWithStatements: anObject [
	formatCommentWithStatements := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
BIPrettyPrinterContext>>indentString [
	^ indentString
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
BIPrettyPrinterContext>>indentString: aString [
	indentString := aString
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
BIPrettyPrinterContext>>indentsForKeywords [
	^ indentsForKeywords
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
BIPrettyPrinterContext>>indentsForKeywords: anObject [
	indentsForKeywords := anObject
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:21'
}
BIPrettyPrinterContext>>initialize [
	useBasicCommentFormat := true.
	formatCommentWithStatements := true.
	indentString := String with: Character tab.
	indentsForKeywords := 1.
	keepBlockInMessage := true.
	lineUpBlockBrackets := false.
	maxLineLength := 70.
	methodSignatureOnMultipleLines := false.
	minimumNewLinesBetweenStatements := 1.
	multiLineMessages := #(#ifTrue:ifFalse: #ifFalse:ifTrue: #ifTrue: #ifFalse: #on:do: #ensure: #ifCurtailed:).
	newLineAfterCascade := true.
	newLineBeforeFirstCascade := true.
	newLineBeforeFirstKeyword := false.
	newLinesAfterMethodComment := 2.
	newLinesAfterMethodPattern := 1.
	newLinesAfterTemporaries := 1.
	numberOfArgumentsForMultiLine := 4.
	oneLineMessages := #(#to: #to:do: #to:by: #to:by:do:).
	periodsAtEndOfBlock := false.
	periodsAtEndOfMethod := false.
	retainBlankLinesBetweenStatements := false.
	retainBlankLinesBeforeComments := true.
	selectorAndArgumentCombinedMaxSize := 40.
	stringFollowingReturn := ' '.
	stringInsideBlocks := ' '.
	stringInsideParentheses := ''.
	traditionalBinaryPrecedenceArray := #(#($| $& $?) #($= $~ $< $>) #($- $+) #($* $/ $% $\) #($@)).
	useTraditionalBinaryPrecedenceForParentheses := true
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
BIPrettyPrinterContext>>keepBlockInMessage [
	^ keepBlockInMessage
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
BIPrettyPrinterContext>>keepBlockInMessage: anObject [
	keepBlockInMessage := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
BIPrettyPrinterContext>>lineUpBlockBrackets [
	^ lineUpBlockBrackets
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
BIPrettyPrinterContext>>lineUpBlockBrackets: anObject [
	lineUpBlockBrackets := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
BIPrettyPrinterContext>>maxLineLength [
	^ maxLineLength
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
BIPrettyPrinterContext>>maxLineLength: anObject [
	maxLineLength := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
BIPrettyPrinterContext>>methodSignatureOnMultipleLines [
	^ methodSignatureOnMultipleLines
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
BIPrettyPrinterContext>>methodSignatureOnMultipleLines: anObject [
	methodSignatureOnMultipleLines := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
BIPrettyPrinterContext>>minimumNewLinesBetweenStatements [
	^ minimumNewLinesBetweenStatements
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
BIPrettyPrinterContext>>minimumNewLinesBetweenStatements: anObject [
	minimumNewLinesBetweenStatements := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
BIPrettyPrinterContext>>multiLineMessages [
	^ multiLineMessages
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
BIPrettyPrinterContext>>multiLineMessages: anArray [
	multiLineMessages := (self class compiler evaluate: anArray asString)
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
BIPrettyPrinterContext>>newLineAfterCascade [
	^ newLineAfterCascade
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
BIPrettyPrinterContext>>newLineAfterCascade: anObject [
	newLineAfterCascade := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
BIPrettyPrinterContext>>newLineBeforeFirstCascade [
	^ newLineBeforeFirstCascade
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
BIPrettyPrinterContext>>newLineBeforeFirstCascade: anObject [
	newLineBeforeFirstCascade := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
BIPrettyPrinterContext>>newLineBeforeFirstKeyword [
	^ newLineBeforeFirstKeyword
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
BIPrettyPrinterContext>>newLineBeforeFirstKeyword: anObject [
	newLineBeforeFirstKeyword := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
BIPrettyPrinterContext>>newLinesAfterMethodComment [
	^ newLinesAfterMethodComment
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
BIPrettyPrinterContext>>newLinesAfterMethodComment: anObject [
	newLinesAfterMethodComment := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
BIPrettyPrinterContext>>newLinesAfterMethodPattern [
	^ newLinesAfterMethodPattern
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
BIPrettyPrinterContext>>newLinesAfterMethodPattern: anObject [
	newLinesAfterMethodPattern := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
BIPrettyPrinterContext>>newLinesAfterTemporaries [
	^ newLinesAfterTemporaries
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
BIPrettyPrinterContext>>newLinesAfterTemporaries: anObject [
	newLinesAfterTemporaries := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
BIPrettyPrinterContext>>numberOfArgumentsForMultiLine [
	^ numberOfArgumentsForMultiLine
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
BIPrettyPrinterContext>>numberOfArgumentsForMultiLine: anObject [
	numberOfArgumentsForMultiLine := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
BIPrettyPrinterContext>>oneLineMessages [
	^ oneLineMessages
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
BIPrettyPrinterContext>>oneLineMessages: anArray [
	oneLineMessages := (self class compiler evaluate: anArray asString)
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
BIPrettyPrinterContext>>periodsAtEndOfBlock [
	^ periodsAtEndOfBlock
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
BIPrettyPrinterContext>>periodsAtEndOfBlock: anObject [
	periodsAtEndOfBlock := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
BIPrettyPrinterContext>>periodsAtEndOfMethod [
	^ periodsAtEndOfMethod
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
BIPrettyPrinterContext>>periodsAtEndOfMethod: anObject [
	periodsAtEndOfMethod := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
BIPrettyPrinterContext>>retainBlankLinesBeforeComments [
	^ retainBlankLinesBeforeComments
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
BIPrettyPrinterContext>>retainBlankLinesBeforeComments: anObject [
	retainBlankLinesBeforeComments := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
BIPrettyPrinterContext>>retainBlankLinesBetweenStatements [
	^ retainBlankLinesBetweenStatements
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
BIPrettyPrinterContext>>retainBlankLinesBetweenStatements: anObject [
	retainBlankLinesBetweenStatements := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
BIPrettyPrinterContext>>selectorAndArgumentCombinedMaxSize [
	^ selectorAndArgumentCombinedMaxSize
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
BIPrettyPrinterContext>>selectorAndArgumentCombinedMaxSize: anInteger [
	selectorAndArgumentCombinedMaxSize := anInteger
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
BIPrettyPrinterContext>>stringFollowingReturn [
	^ stringFollowingReturn
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
BIPrettyPrinterContext>>stringFollowingReturn: anObject [
	stringFollowingReturn := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
BIPrettyPrinterContext>>stringInsideBlocks [
	^ stringInsideBlocks
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
BIPrettyPrinterContext>>stringInsideBlocks: anObject [
	stringInsideBlocks := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
BIPrettyPrinterContext>>stringInsideParentheses [
	^ stringInsideParentheses
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
BIPrettyPrinterContext>>stringInsideParentheses: anObject [
	stringInsideParentheses := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
BIPrettyPrinterContext>>traditionalBinaryPrecedenceArray [
	^ traditionalBinaryPrecedenceArray
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
BIPrettyPrinterContext>>traditionalBinaryPrecedenceArray: anArray [
	traditionalBinaryPrecedenceArray := (self class compiler evaluate: anArray asString)
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
BIPrettyPrinterContext>>useBasicCommentFormat [
	^ useBasicCommentFormat
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
BIPrettyPrinterContext>>useBasicCommentFormat: aBoolean [
	useBasicCommentFormat := aBoolean
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
BIPrettyPrinterContext>>useTraditionalBinaryPrecedenceForParentheses [
	^ useTraditionalBinaryPrecedenceForParentheses
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
BIPrettyPrinterContext>>useTraditionalBinaryPrecedenceForParentheses: anObject [
	useTraditionalBinaryPrecedenceForParentheses := anObject
]
