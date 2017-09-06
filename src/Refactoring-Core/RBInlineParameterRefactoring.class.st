"
I am a refactoring for removing and inlining method arguments.

If all callers of a method with arguments, call that method with the same literal argument expression, you can 
remove that argument and inline the literal into that method.

My precondition verifies that the method name without that argument isn't already used and that all callers
supplied the same literal expression.

For example, a method foo: anArg

foo: anArg
	anArg doSomething.

and all senders supply the same argument: 	     

method1
	anObject foo: 'text'.

method2
	anObject foo: 'text'.
	
the method argument can be inlined:

foo
 | anArg |
 anArg := 'text'.
	anArg doSomething.

and the callers just call the method without any arguments:
method1
	anObject foo.

method1
	anObject foo.

"
Class {
	#name : #RBInlineParameterRefactoring,
	#superclass : #RBRemoveParameterRefactoring,
	#instVars : [
		'expressions'
	],
	#category : #Refactoring-Core-Refactorings,
	#timestamp : 'NicolaiHess 5/21/2016 12:56'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:24'
}
RBInlineParameterRefactoring class>>inlineParameter: aString in: aClass selector: aSelector  [
	^self new 
		inlineParameter: aString
		in: aClass
		selector: aSelector
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:24'
}
RBInlineParameterRefactoring class>>model: aRBSmalltalk inlineParameter: aString in: aClass selector: aSelector  [
	^(self new)
		model: aRBSmalltalk;
		inlineParameter: aString
			in: aClass
			selector: aSelector;
		yourself
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBInlineParameterRefactoring>>allExpressionsToInline [
	| coll |
	coll := Set new.
	self model allReferencesTo: oldSelector
		do: 
			[:each | 
			| tree |
			tree := each parseTree.
			tree notNil ifTrue: [coll addAll: (self expressionsToInlineFrom: tree)]].
	^coll asOrderedCollection
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBInlineParameterRefactoring>>expressionsToInlineFrom: aTree  [
	| searcher |
	searcher := RBParseTreeSearcher new.
	searcher matches: '``@obj ' , (self buildSelectorString: oldSelector)
		do: 
			[:aNode :answer | 
			answer
				add: (aNode arguments at: parameterIndex);
				yourself].
	^searcher executeTree: aTree initialAnswer: OrderedCollection new
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBInlineParameterRefactoring>>inlineParameter: aString in: aClass selector: aSelector [
	oldSelector := aSelector.
	class := self classObjectFor: aClass.
	argument := aString
]

{
	#category : #transforming,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBInlineParameterRefactoring>>modifyImplementorParseTree: parseTree in: aClass  [
	| node assignment |
	node := (parseTree arguments at: parameterIndex) copy.
	parseTree body addTemporaryNamed: node name.
	assignment := RBAssignmentNode variable: node copy value: expressions first.
	parseTree body addNodeFirst: assignment.
	super modifyImplementorParseTree: parseTree in: aClass
]

{
	#category : #preconditions,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBInlineParameterRefactoring>>myConditions [
	self getNewSelector.
	expressions := self allExpressionsToInline.
	^(RBCondition definesSelector: oldSelector in: class) 
		& ((RBCondition withBlock: [expressions isEmpty not]) 
				errorMacro: 'No callers. Use Remove Method instead.') 
			& ((RBCondition withBlock: [expressions size = 1]) 
					errorMacro: 'All values passed as this argument must be identical.') 
			& ((RBCondition withBlock: [expressions first isLiteralNode]) 
					errorMacro: 'All values passed must be literal.')
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBInlineParameterRefactoring>>storeOn: aStream  [
	aStream nextPut: $(.
	self class storeOn: aStream.
	aStream
		nextPutAll: ' inlineParameter: ''';
		nextPutAll: argument;
		nextPutAll: ''' in: '.
	class storeOn: aStream.
	aStream
		nextPutAll: ' selector: #';
		nextPutAll: oldSelector;
		nextPut: $)
]
