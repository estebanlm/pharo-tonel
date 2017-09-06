"
I am a refactoring for inlining code of this method.

The call to this method in all other methods of this class is replaced by its implementation. The method itself will be removed.

For example, a method 
foo
	^ 'text'.
	
is called in
baz
	|a|
	a:= self foo.
	^ self foo.
	
inlining in all senders replaces the call to method foo, with its code:

baz
	|a|
	a:= 'text'.
	^ 'text'.


"
Class {
	#name : #RBInlineAllSendersRefactoring,
	#superclass : #RBMethodRefactoring,
	#instVars : [
		'selector',
		'numberReplaced',
		'numberNotReplaced'
	],
	#category : #Refactoring-Core-Refactorings,
	#timestamp : 'NicolaiHess 8/6/2016 13:41'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:24'
}
RBInlineAllSendersRefactoring class>>model: aRBSmalltalk sendersOf: aSelector in: aClass  [
	^(self new)
		model: aRBSmalltalk;
		sendersOf: aSelector in: aClass;
		yourself
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:24'
}
RBInlineAllSendersRefactoring class>>sendersOf: aSelector in: aClass  [
	^self new sendersOf: aSelector in: aClass
]

{
	#category : #transforming,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBInlineAllSendersRefactoring>>checkInlinedMethods [
	numberReplaced = 0 
		ifTrue: [self refactoringFailure: 'Could not inline any senders']
]

{
	#category : #transforming,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBInlineAllSendersRefactoring>>inlineMessagesInClass: aClass andSelector: aSelector  [
	| messagesToInline previousCountOfMessages |
	previousCountOfMessages := 4294967295.	"Some really large number > # of initial self sends."
	
	[messagesToInline := self 
				numberOfSelfSendsIn: (aClass parseTreeFor: aSelector).
	messagesToInline > 0 and: [previousCountOfMessages > messagesToInline]] 
			whileTrue: 
				[| node |
				previousCountOfMessages := messagesToInline.
				node := self selfSendIn: (aClass parseTreeFor: aSelector).
				self onError: 
						[self performComponentRefactoring: (RBInlineMethodRefactoring 
									model: self model
									inline: node sourceInterval
									inMethod: aSelector
									forClass: aClass).
						numberReplaced := numberReplaced + 1]
					do: []].
	numberNotReplaced := numberNotReplaced + messagesToInline
]

{
	#category : #transforming,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBInlineAllSendersRefactoring>>inlineSelfSends [
	class withAllSubclasses do: 
			[:each | 
			| selectors |
			selectors := each selectors.
			selectors remove: selector ifAbsent: [].
			selectors do: [:sel | self inlineMessagesInClass: each andSelector: sel]]
]

{
	#category : #transforming,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBInlineAllSendersRefactoring>>messagePattern [
	^'self ' , (self buildSelectorString: selector)
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBInlineAllSendersRefactoring>>messagesNotReplaced [
	^numberNotReplaced
]

{
	#category : #transforming,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBInlineAllSendersRefactoring>>numberOfSelfSendsIn: aParseTree  [
	| search |
	search := RBParseTreeSearcher new.
	search matches: self messagePattern do: [:aNode :answer | answer + 1].
	^search executeTree: aParseTree initialAnswer: 0
]

{
	#category : #preconditions,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBInlineAllSendersRefactoring>>preconditions [
	^RBCondition canUnderstand: selector in: class
]

{
	#category : #transforming,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBInlineAllSendersRefactoring>>removeMethod [
	self onError: 
			[self performComponentRefactoring: (RBRemoveMethodRefactoring 
						model: self model
						removeMethods: (Array with: selector)
						from: class)]
		do: []
]

{
	#category : #transforming,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBInlineAllSendersRefactoring>>selfSendIn: aTree  [
	| searcher |
	searcher := RBParseTreeSearcher new.
	searcher matches: self messagePattern do: [:aNode :answer | ^aNode].
	^searcher executeTree: aTree initialAnswer: nil
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBInlineAllSendersRefactoring>>sendersOf: aSelector in: aClass  [
	class := self classObjectFor: aClass.
	selector := aSelector.
	numberReplaced := numberNotReplaced := 0
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBInlineAllSendersRefactoring>>storeOn: aStream  [
	aStream nextPut: $(.
	self class storeOn: aStream.
	aStream
		nextPutAll: ' sendersOf: #';
		nextPutAll: selector;
		nextPutAll: ' in: '.
	class storeOn: aStream.
	aStream nextPut: $)
]

{
	#category : #transforming,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBInlineAllSendersRefactoring>>transform [
	self
		inlineSelfSends;
		removeMethod;
		checkInlinedMethods
]
