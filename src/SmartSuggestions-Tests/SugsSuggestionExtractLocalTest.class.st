"
SUnit tests for extract locale suggestion
"
Class {
	#name : #SugsSuggestionExtractLocalTest,
	#superclass : #SugsSuggestionTest,
	#category : #SmartSuggestions-Tests
}

{ #category : #valid }
SugsSuggestionExtractLocalTest >> testExtractLocalInALiteralNodeIsValid [
	| literal context suggestion |

	literal := RBLiteralValueNode  new.
	context := SugsMockContext withNode: literal.
	suggestion := SugsSuggestionFactory createExtractToLocalVariable context: context.	
	self assert: suggestion isValidForContext .
]

{ #category : #valid }
SugsSuggestionExtractLocalTest >> testExtractLocalInAMessageNodeIsValid [
	| context suggestion |
	context := SugsMockContext withMessageName: 'justAName'.
	suggestion := SugsSuggestionFactory createExtractToLocalVariable context: context.
	self assert: suggestion isValidForContext

]

{ #category : #valid }
SugsSuggestionExtractLocalTest >> testExtractLocalInASequenceNodeWithMoreSentencesIsNotValid [
	| multipleLines context suggestion |
	
	multipleLines := RBSequenceNode new.
	multipleLines addNode: (RBVariableNode named: 'varName').
	multipleLines addNode: (RBVariableNode named: 'otherName').
	context := SugsMockContext withNode: multipleLines.
	
	suggestion := SugsSuggestionFactory createExtractToLocalVariable context: context.
	
	self deny: suggestion isValidForContext .
	
]

{ #category : #valid }
SugsSuggestionExtractLocalTest >> testExtractLocalInASequenceNodeWithOneSentenceIsValid [
	| oneLine context suggestion |
	
	oneLine := RBSequenceNode new.
	oneLine addNode: (RBVariableNode named: 'varName').
	context := SugsMockContext withNode: oneLine.
	
	suggestion := SugsSuggestionFactory createExtractToLocalVariable context: context.
	
	self assert: suggestion isValidForContext .
]
