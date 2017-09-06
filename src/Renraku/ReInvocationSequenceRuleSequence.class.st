"
I simply hold the method names that have to be called before/after each other
"
Class {
	#name : #ReInvocationSequenceRuleSequence,
	#superclass : #Object,
	#instVars : [
		'before',
		'after'
	],
	#category : #Renraku-Rules,
	#timestamp : 'YuriyTymchuk 3/2/2016 10:46'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:37'
}
ReInvocationSequenceRuleSequence class>>before: beforeSymbol after: afterSymbol [

	^ self new
		initializeBefore: beforeSymbol
		           after: afterSymbol;
		yourself
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
ReInvocationSequenceRuleSequence>>after [
	^ after
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:37'
}
ReInvocationSequenceRuleSequence>>afterDescriptionString [

	^ self descriptionStringFor: after
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
ReInvocationSequenceRuleSequence>>afterMatches: aSymbol [
	^ after includes: aSymbol
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
ReInvocationSequenceRuleSequence>>before [
	^ before
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:37'
}
ReInvocationSequenceRuleSequence>>beforeDescriptionString [

	^ self descriptionStringFor: before
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
ReInvocationSequenceRuleSequence>>beforeMatches: aSymbol [
	^ before includes: aSymbol
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:37'
}
ReInvocationSequenceRuleSequence>>descriptionStringFor: aSet [

	^ aSet size = 1
		ifTrue: [ '#', aSet anyOne, ' message' ]
		ifFalse: [ 'any one of #', (aSet joinUsing: ', #'), ' messages' ]
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:37'
}
ReInvocationSequenceRuleSequence>>initializeBefore: beforeSymols after: afterSymbols [

	before :=
		 (beforeSymols isCollection and:
		[ beforeSymols isString not ])
			ifFalse: [ Array with: beforeSymols asSymbol ]
			ifTrue: [ beforeSymols ].
	after := 
		(afterSymbols isCollection and:
		[ afterSymbols isString not ])
			ifFalse: [ Array with: afterSymbols asSymbol ]
			ifTrue: [ afterSymbols ].
]
