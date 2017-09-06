"
This class is used to test method critics.
"
Class {
	#name : #RBSmalllintTestObject,
	#superclass : #RBSmalllintTestSuperclassObject,
	#instVars : [
		'temporaryVariable'
	],
	#category : #Refactoring-Tests-Critics,
	#timestamp : 'monty 10/11/2016 00:26'
}

{
	#category : #'accessing - good',
	#timestamp : ' 8/31/2017 05:26:45'
}
RBSmalllintTestObject>>abstractUnaryAccessingMethodWithoutReturn [
	"shouldn't trigger the RBUnaryAccessingMethodWithoutReturnRule rule"

	self subclassResponsibility
]

{
	#category : #methods,
	#timestamp : ' 8/31/2017 05:26:45'
}
RBSmalllintTestObject>>asOrderedCollectionNotNeeded [
	self foo addAll: (1 to: 10) asOrderedCollection
]

{
	#category : #methods,
	#timestamp : ' 8/31/2017 05:26:45'
}
RBSmalllintTestObject>>assignmentInBlock [
	[^self printString] ensure: [self close]
]

{
	#category : #methods,
	#timestamp : ' 8/31/2017 05:26:45'
}
RBSmalllintTestObject>>assignmentInIfTrue [
	| variable |
	self isVariable 
		ifTrue: [variable := self]
		ifFalse: [variable := self printString].
	^variable
]

{
	#category : #methods,
	#timestamp : ' 8/31/2017 05:26:45'
}
RBSmalllintTestObject>>assignmentWithoutEffect [
	| a |
	a := 1.
	a := a
]

{
	#category : #methods,
	#timestamp : ' 8/31/2017 05:26:45'
}
RBSmalllintTestObject>>atIfAbsent [
	^ Smalltalk at: #MyTest
		ifAbsent: 
			[| collection |
			collection := #().
			Smalltalk at: #MyTest put: collection]
]

{
	#category : #methods,
	#timestamp : ' 8/31/2017 05:26:45'
}
RBSmalllintTestObject>>badMessage [
	self become: String new
]

{
	#category : #methods,
	#timestamp : ' 8/31/2017 05:26:45'
}
RBSmalllintTestObject>>booleanPrecedence [
	^true & 4 = 45
]

{
	#category : #methods,
	#timestamp : ' 8/31/2017 05:26:45'
}
RBSmalllintTestObject>>codeCruftLeftInMethods [
	| a b c |
	a := b := c := 2.
	self halt.
	^ a > 0
		ifTrue: [ b ]
		ifFalse: [ c ]
		
]

{
	#category : #methods,
	#timestamp : ' 8/31/2017 05:26:45'
}
RBSmalllintTestObject>>collectSelectNotUsed [
	(1 to: 10) select: [:each | each = 4]
]

{
	#category : #methods,
	#timestamp : ' 8/31/2017 05:26:45'
}
RBSmalllintTestObject>>collectionMessagesToExternalObject [
	self someObject collection remove: 10
]

{
	#category : #methods,
	#timestamp : ' 8/31/2017 05:26:45'
}
RBSmalllintTestObject>>collectionProtocol [
	| newCollection |
	newCollection := OrderedCollection new.
	(1 to: 10) asOrderedCollection do: 
			[:each | 
			| new |
			new := each * 2.
			newCollection add: new].
	^newCollection
]

{
	#category : #methods,
	#timestamp : ' 8/31/2017 05:26:45'
}
RBSmalllintTestObject>>consistencyCheck [
	^(1 to: 10) size > 0
]

{
	#category : #methods,
	#timestamp : ' 8/31/2017 05:26:45'
}
RBSmalllintTestObject>>contains [
	^((1 to: 10) detect: [:each | each > 2] ifNone: [nil]) isNil
]

{
	#category : #methods,
	#timestamp : ' 8/31/2017 05:26:45'
}
RBSmalllintTestObject>>debbuggingMessageSent [
	self rearmOneShot
]

{
	#category : #methods,
	#timestamp : ' 8/31/2017 05:26:45'
}
RBSmalllintTestObject>>detectContains [
	^(1 to: 10) do: [:each | each > 2 ifTrue: [^each]]
]

{
	#category : #methods,
	#timestamp : ' 8/31/2017 05:26:45'
}
RBSmalllintTestObject>>emptyExceptionHandler [
	[ ] on: Error do: [ :err | ]
]

{
	#category : #methods,
	#timestamp : ' 8/31/2017 05:26:45'
}
RBSmalllintTestObject>>endTrueFalse [
	self isVariable 
		ifTrue: 
			[self printString.
			self isVariable printString]
		ifFalse: 
			[self printString.
			^4]
]

{
	#category : #methods,
	#timestamp : ' 8/31/2017 05:26:45'
}
RBSmalllintTestObject>>equalNotUsed [
	| string |
	string = '' yourself.
	(1 to: 10) do: [:i | string := i printString].
	^string
]

{
	#category : #methods,
	#timestamp : ' 8/31/2017 05:26:45'
}
RBSmalllintTestObject>>equalsTrue [
	^true == self
]

{
	#category : #methods,
	#timestamp : ' 8/31/2017 05:26:45'
}
RBSmalllintTestObject>>equivalentSuperclassMethods [
	"comments and formatting are ignored when comparing methods"
	^ (
		self
		identityHash
		).
]

{
	#category : #methods,
	#timestamp : ' 8/31/2017 05:26:45'
}
RBSmalllintTestObject>>extraBlock [
	^[:arg | arg + 43] value: 45
]

{
	#category : #methods,
	#timestamp : ' 8/31/2017 05:26:45'
}
RBSmalllintTestObject>>fileBlocks [
	| file |
	^
	[file := 'asdf' asFileReference readStream.
	file contents] ensure: [file close]
]

{
	#category : #methods,
	#timestamp : ' 8/31/2017 05:26:45'
}
RBSmalllintTestObject>>flagged [
	self flag: 'to do'.
]

{
	#category : #methods,
	#timestamp : ' 8/31/2017 05:26:45'
}
RBSmalllintTestObject>>floatEqualityComparison [
	^ 1.0 = 1
]

{
	#category : #methods,
	#timestamp : ' 8/31/2017 05:26:45'
}
RBSmalllintTestObject>>fullBlocks [
	^[thisContext]
]

{
	#category : #methods,
	#timestamp : ' 8/31/2017 05:26:45'
}
RBSmalllintTestObject>>guardingClause [
	self isSymbol 
		ifFalse: 
			[self printString.
			self isSymbol printString]
]

{
	#category : #methods,
	#timestamp : ' 8/31/2017 05:26:45'
}
RBSmalllintTestObject>>haltClassMentioned [
	Halt now
]

{
	#category : #methods,
	#timestamp : ' 8/31/2017 05:26:45'
}
RBSmalllintTestObject>>ifTrueBlocks [
	^ true ifFalse: self foo
]

{
	#category : #methods,
	#timestamp : ' 8/31/2017 05:26:45'
}
RBSmalllintTestObject>>ifTrueReturns [
	self isSymbol ifFalse: [^true].
	^false
]

{
	#category : #methods,
	#timestamp : ' 8/31/2017 05:26:45'
}
RBSmalllintTestObject>>inlineTemporary [
	| temp |
	self isNil ifTrue: [temp := 4].
	^temp
]

{
	#category : #methods,
	#timestamp : ' 8/31/2017 05:26:45'
}
RBSmalllintTestObject>>justSendsSuper [
	super justSendsSuper
]

{
	#category : #methods,
	#timestamp : ' 8/31/2017 05:26:45'
}
RBSmalllintTestObject>>literalArrayCharacters [
	^#($a $b $c) includes: $a
]

{
	#category : #methods,
	#timestamp : ' 8/31/2017 05:26:45'
}
RBSmalllintTestObject>>literalArrayContainsComma [
	^ #(#,)
]

{
	#category : #methods,
	#timestamp : ' 8/31/2017 05:26:45'
}
RBSmalllintTestObject>>longMethods [
	self printString.
	self printString.
	self printString.
	self printString.
	self printString.
	self printString.
	self printString.
	self isVariable ifTrue: [self printString].
	self isVariable ifTrue: [self printString].
	self isVariable ifTrue: [self printString].
	self isVariable ifTrue: [self printString].
	self isVariable ifTrue: [self printString].
	self isVariable ifTrue: [self printString].
	self isVariable ifTrue: [self printString].
	self isVariable ifTrue: [self printString].
	self isVariable ifTrue: [self printString].
	self isVariable ifTrue: [self printString].
	self isVariable ifTrue: [self printString]
]

{
	#category : #methods,
	#timestamp : ' 8/31/2017 05:26:45'
}
RBSmalllintTestObject>>minMax [
	"Bug in 3<5 ifTrue: [3]  ifFalse: [5]"

^3<5 ifTrue: [3]  ifFalse: [5]
"	| var |
	var := 4.
	var < 5 ifTrue: [var := 5].
	^var"
]

{
	#category : #methods,
	#timestamp : ' 8/31/2017 05:26:45'
}
RBSmalllintTestObject>>missingYourself [
	^(OrderedCollection new)
		add: 1;
		add: 2;
		removeFirst
]

{
	#category : #methods,
	#timestamp : ' 8/31/2017 05:26:45'
}
RBSmalllintTestObject>>modifiesCollection [
	| collection |
	collection := (1 to: 10) asOrderedCollection.
	collection do: [:each | each > 5 ifTrue: [collection remove: each]].
	^collection
]

{
	#category : #methods,
	#timestamp : ' 8/31/2017 05:26:45'
}
RBSmalllintTestObject>>multiplePeriodsTerminatingAssignmentStatement [
	| strings |

	strings := OrderedCollection..
	strings
		add: 'one';
		add: 'two'.
	^ strings.
	
]

{
	#category : #methods,
	#timestamp : ' 8/31/2017 05:26:45'
}
RBSmalllintTestObject>>multiplePeriodsTerminatingStatement [
	^ self..
]

{
	#category : #methods,
	#timestamp : ' 8/31/2017 05:26:45'
}
RBSmalllintTestObject>>noMoveDefinition [
	| temp |
	^(self collect: 
			[:each | 
			temp := each printString.
			temp , temp]) 
		select: [:each | temp := each size + temp]
]

{
	#category : #'accessing - good',
	#timestamp : ' 8/31/2017 05:26:45'
}
RBSmalllintTestObject>>nonUnaryAccessingBranchingStatementMethodWithoutReturn: anObject [
	"shouldn't trigger the RBUnaryAccessingMethodWithoutReturnRule rule"

	self value isString
		ifTrue: [ self value ]
		ifFalse: [ '' ]
]

{
	#category : #'accessing - good',
	#timestamp : ' 8/31/2017 05:26:45'
}
RBSmalllintTestObject>>nonUnaryAccessingMessageStatementMethodWithoutReturn: anObject [
	"shouldn't trigger the RBUnaryAccessingMethodWithoutReturnRule rule"

	self value
]

{
	#category : #'accessing - good',
	#timestamp : ' 8/31/2017 05:26:45'
}
RBSmalllintTestObject>>nonUnaryAccessingMethodWithoutReturn: anObject [
	"shouldn't trigger the RBUnaryAccessingMethodWithoutReturnRule rule"

	
]

{
	#category : #methods,
	#timestamp : ' 8/31/2017 05:26:45'
}
RBSmalllintTestObject>>onlyReadOrWrittenTemporary [
	| a |
	a := 1
]

{
	#category : #methods,
	#timestamp : ' 8/31/2017 05:26:45'
}
RBSmalllintTestObject>>precedence [
	^self isArray ifFalse: [self block + 5 * 34] ifTrue: [self printString = 10]
]

{
	#category : #methods,
	#timestamp : ' 8/31/2017 05:26:45'
}
RBSmalllintTestObject>>referencesConditionFor: aClass  [
	| environment association |
	^(RBCondition withBlock: 
			[association := Smalltalk associationAt: aClass name
						ifAbsent: [self refactoringError: 'Could not find class'].
			environment := (self environment referencesTo: association) 
						| (self environment referencesTo: aClass name).
			environment isEmpty])
		errorMacro: aClass , ' is referenced.<n>Browse references?';
		errorBlock: [environment openEditor];
		yourself
]

{
	#category : #methods,
	#timestamp : ' 8/31/2017 05:26:45'
}
RBSmalllintTestObject>>refersToClass [
	^ RBSmalllintTestObject
]

{
	#category : #methods,
	#timestamp : ' 8/31/2017 05:26:45'
}
RBSmalllintTestObject>>release [
	self printString
]

{
	#category : #methods,
	#timestamp : ' 8/31/2017 05:26:45'
}
RBSmalllintTestObject>>returnInEnsure [
	[self error: 'asdf'] ensure: [^4]
]

{
	#category : #methods,
	#timestamp : ' 8/31/2017 05:26:45'
}
RBSmalllintTestObject>>returnsBooleanAndOther [
	self isVariable ifTrue: [^false].
	self printString
]

{
	#category : #methods,
	#timestamp : ' 8/31/2017 05:26:45'
}
RBSmalllintTestObject>>returnsIfTrue [
	^self isNil ifTrue: [4]
]

{
	#category : #methods,
	#timestamp : ' 8/31/2017 05:26:45'
}
RBSmalllintTestObject>>searchingLiteral [
	^self printString = #a or: [#() = self printString | ( #() == self printString)]
]

{
	#category : #methods,
	#timestamp : ' 8/31/2017 05:26:45'
}
RBSmalllintTestObject>>sendsDifferentSuper [
	super printString
]

{
	#category : #methods,
	#timestamp : ' 8/31/2017 05:26:45'
}
RBSmalllintTestObject>>shouldntRaiseError [
	self shouldnt: [ 0/1 ] raise: Error
]

{
	#category : #methods,
	#timestamp : ' 8/31/2017 05:26:45'
}
RBSmalllintTestObject>>shouldntRaiseException [
	self shouldnt: [ 0/1 ] raise: Exception
]

{
	#category : #methods,
	#timestamp : ' 8/31/2017 05:26:45'
}
RBSmalllintTestObject>>sizeCheck [
	self isEmpty
		ifFalse: [self do: 
					[:each | 
					]]
]

{
	#category : #methods,
	#timestamp : ' 8/31/2017 05:26:45'
}
RBSmalllintTestObject>>stringConcatenation [
	| string |
	string := '' yourself.
	(1 to: 10) do: [:i | string := string , i printString].
	^string
]

{
	#category : #methods,
	#timestamp : ' 8/31/2017 05:26:45'
}
RBSmalllintTestObject>>tempVarOverridesInstVar [
	| temporaryVariable |
	temporaryVariable := 4.
	^temporaryVariable
]

{
	#category : #methods,
	#timestamp : ' 8/31/2017 05:26:45'
}
RBSmalllintTestObject>>temporaryVariableCapitalization [
	| Capital |
	Capital := 'Bern'.
	^ Capital
]

{
	#category : #methods,
	#timestamp : ' 8/31/2017 05:26:45'
}
RBSmalllintTestObject>>tempsReadBeforeWritten [
	| temp |
	self isVariable ifTrue: [temp := 4].
	^temp
]

{
	#category : #methods,
	#timestamp : ' 8/31/2017 05:26:45'
}
RBSmalllintTestObject>>testMethod1 [
	^self testMethod1 
		, ([:each | each testMethod1] value: #(#(#testMethod1) 2 #testMethod1))
]

{
	#category : #methods,
	#timestamp : ' 8/31/2017 05:26:45'
}
RBSmalllintTestObject>>threeElementPoint [
	^5 @ 5 + 6 @ 6
]

{
	#category : #methods,
	#timestamp : ' 8/31/2017 05:26:45'
}
RBSmalllintTestObject>>toDo [
	1 to: self size do: [:i | (self at: i) printString]
]

{
	#category : #methods,
	#timestamp : ' 8/31/2017 05:26:45'
}
RBSmalllintTestObject>>toDoCollect [
	| array |
	array := Array new: 10.
	1 to: 10 do: [:i | array at: i put: i * i].
	^array
]

{
	#category : #methods,
	#timestamp : ' 8/31/2017 05:26:45'
}
RBSmalllintTestObject>>toDoWithIncrement [
	| counter |
	counter := 0.
	1 to: 10
		by: 2
		do: [:i | counter := counter + 2].
	^counter
]

{
	#category : #methods,
	#timestamp : ' 8/31/2017 05:26:45'
}
RBSmalllintTestObject>>transcriptMentioned [
	Transcript show: 'message'
]

{
	#category : #'accessing - good',
	#timestamp : ' 8/31/2017 05:26:45'
}
RBSmalllintTestObject>>unaryAccessingBranchingStatementMethodWithReturn [
	"shouldn't trigger the RBUnaryAccessingMethodWithoutReturnRule rule"

	self value isString
		ifTrue: [ ^ self value ]
		ifFalse: [ ^ '' ]
]

{
	#category : #'accessing - bad',
	#timestamp : ' 8/31/2017 05:26:45'
}
RBSmalllintTestObject>>unaryAccessingBranchingStatementMethodWithoutReturn [
	"should trigger the RBUnaryAccessingMethodWithoutReturnRule rule"

	self value isString
		ifTrue: [ self value ]
		ifFalse: [ '' ]
]

{
	#category : #'accessing - good',
	#timestamp : ' 8/31/2017 05:26:45'
}
RBSmalllintTestObject>>unaryAccessingMessageStatementMethodWithReturn [
	"shouldn't trigger the RBUnaryAccessingMethodWithoutReturnRule rule"

	^ self value
]

{
	#category : #'accessing - bad',
	#timestamp : ' 8/31/2017 05:26:45'
}
RBSmalllintTestObject>>unaryAccessingMessageStatementMethodWithoutReturn [
	"should trigger the RBUnaryAccessingMethodWithoutReturnRule rule"

	self value
]

{
	#category : #'accessing - good',
	#timestamp : ' 8/31/2017 05:26:45'
}
RBSmalllintTestObject>>unaryAccessingMethodWithReturn [
	"shouldn't trigger the RBUnaryAccessingMethodWithoutReturnRule rule"

	^ self
]

{
	#category : #'accessing - bad',
	#timestamp : ' 8/31/2017 05:26:45'
}
RBSmalllintTestObject>>unaryAccessingMethodWithoutReturn [
	"should trigger the RBUnaryAccessingMethodWithoutReturnRule rule"

	
]

{
	#category : #non-accessing,
	#timestamp : ' 8/31/2017 05:26:45'
}
RBSmalllintTestObject>>unaryNonAccessingBranchingStatementMethodWithoutReturn [
	"shouldn't trigger the RBUnaryAccessingMethodWithoutReturnRule rule"

	self value isString
		ifTrue: [ self value ]
		ifFalse: [ '' ]
]

{
	#category : #non-accessing,
	#timestamp : ' 8/31/2017 05:26:45'
}
RBSmalllintTestObject>>unaryNonAccessingMessageStatementMethodWithoutReturn [
	"shouldn't trigger the RBUnaryAccessingMethodWithoutReturnRule rule"

	self value
]

{
	#category : #non-accessing,
	#timestamp : ' 8/31/2017 05:26:45'
}
RBSmalllintTestObject>>unaryNonAccessingMethodWithoutReturn [
	"shouldn't trigger the RBUnaryAccessingMethodWithoutReturnRule rule"

	
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:45'
}
RBSmalllintTestObject>>unclassifiedMethods [
	"intentionally unclassified method"
]

{
	#category : #methods,
	#timestamp : ' 8/31/2017 05:26:45'
}
RBSmalllintTestObject>>uncommonMessageSend [
	true false
]

{
	#category : #methods,
	#timestamp : ' 8/31/2017 05:26:45'
}
RBSmalllintTestObject>>uncommonMessageSend2 [
	|a|
	a:=3
	Object new.
	^ a
]

{
	#category : #methods,
	#timestamp : ' 8/31/2017 05:26:45'
}
RBSmalllintTestObject>>unoptimizedAndOr [
	^ (true and: [ false ]) and: [ true ]
]

{
	#category : #methods,
	#timestamp : ' 8/31/2017 05:26:45'
}
RBSmalllintTestObject>>usesAdd [
	^(1 to: 10) asOrderedCollection addAll: (11 to: 20)
]

{
	#category : #methods,
	#timestamp : ' 8/31/2017 05:26:45'
}
RBSmalllintTestObject>>usesTrue [
	^ True
]

{
	#category : #methods,
	#timestamp : ' 8/31/2017 05:26:45'
}
RBSmalllintTestObject>>variableAssignedLiteral [
	temporaryVariable := #() 
]

{
	#category : #methods,
	#timestamp : ' 8/31/2017 05:26:45'
}
RBSmalllintTestObject>>whileTrue [
	| i |
	i := 1.
	[i < self size] whileTrue: 
			[(self at: i) printString.
			i := i + 1]
]

{
	#category : #methods,
	#timestamp : ' 8/31/2017 05:26:45'
}
RBSmalllintTestObject>>yourselfNotUsed [
	self
		printString;
		printString;
		yourself
]
