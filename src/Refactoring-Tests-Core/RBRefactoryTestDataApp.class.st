"

"
Class {
	#name : #RBRefactoryTestDataApp,
	#superclass : #Object,
	#instVars : [
		'temporaryVariable'
	],
	#category : #Refactoring-Tests-Core-Data,
	#timestamp : ''
}

{
	#category : #lint,
	#timestamp : ' 8/31/2017 05:26:31'
}
RBRefactoryTestDataApp>>asOrderedCollectionNotNeeded [
	self foo addAll: (1 to: 10) asOrderedCollection
]

{
	#category : #lint,
	#timestamp : ' 8/31/2017 05:26:31'
}
RBRefactoryTestDataApp>>assignmentInBlock [
	[^self printString] ensure: [self close]
]

{
	#category : #lint,
	#timestamp : ' 8/31/2017 05:26:31'
}
RBRefactoryTestDataApp>>assignmentInIfTrue [
	| variable |
	self isVariable 
		ifTrue: [variable := self]
		ifFalse: [variable := self printString].
	^variable
]

{
	#category : #lint,
	#timestamp : ' 8/31/2017 05:26:31'
}
RBRefactoryTestDataApp>>atIfAbsent [
	^ Smalltalk at: #MyTest
		ifAbsent: 
			[| collection |
			collection := #().
			Smalltalk at: #MyTest put: collection]
]

{
	#category : #lint,
	#timestamp : ' 8/31/2017 05:26:31'
}
RBRefactoryTestDataApp>>badMessage [
	self become: String new
]

{
	#category : #lint,
	#timestamp : ' 8/31/2017 05:26:31'
}
RBRefactoryTestDataApp>>booleanPrecedence [
	^true & 4 = 45
]

{
	#category : #test,
	#timestamp : ' 8/31/2017 05:26:31'
}
RBRefactoryTestDataApp>>callFoo [
	^self testFoo: 5
]

{
	#category : #test,
	#timestamp : ' 8/31/2017 05:26:31'
}
RBRefactoryTestDataApp>>callMethod [
	^self renameThisMethod: 5
]

{
	#category : #inline,
	#timestamp : ' 8/31/2017 05:26:31'
}
RBRefactoryTestDataApp>>called: anObject on1: aBlock  [
	| each |
	each := anObject printString.
	Transcript
		show: each;
		cr.
	aBlock value: each
]

{
	#category : #inline,
	#timestamp : ' 8/31/2017 05:26:31'
}
RBRefactoryTestDataApp>>called: anObject on: aBlock  [
	Transcript
		show: anObject printString;
		cr.
	aBlock value
]

{
	#category : #inline,
	#timestamp : ' 8/31/2017 05:26:31'
}
RBRefactoryTestDataApp>>caller [
	| anObject |
	anObject := 5.
	self 
		called: anObject + 1
		on: [^anObject]
]

{
	#category : #inline,
	#timestamp : ' 8/31/2017 05:26:31'
}
RBRefactoryTestDataApp>>caller1 [
	| anObject |
	anObject := 5.
	self called: anObject + 1
		on1: 
			[:each | 
			each printString.
			^anObject]
]

{
	#category : #inline,
	#timestamp : ' 8/31/2017 05:26:31'
}
RBRefactoryTestDataApp>>caller2 [
	^(1 to: 10) inject: 1 into: [:sum :each | sum * (self foo: each)]
]

{
	#category : #lint,
	#timestamp : ' 8/31/2017 05:26:31'
}
RBRefactoryTestDataApp>>collectSelectNotUsed [
	(1 to: 10) select: [:each | each = 4]
]

{
	#category : #lint,
	#timestamp : ' 8/31/2017 05:26:31'
}
RBRefactoryTestDataApp>>collectionMessagesToExternalObject [
	self someObject collection remove: 10
]

{
	#category : #lint,
	#timestamp : ' 8/31/2017 05:26:31'
}
RBRefactoryTestDataApp>>collectionProtocol [
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
	#category : #lint,
	#timestamp : ' 8/31/2017 05:26:31'
}
RBRefactoryTestDataApp>>consistencyCheck [
	^(1 to: 10) size > 0
]

{
	#category : #lint,
	#timestamp : ' 8/31/2017 05:26:31'
}
RBRefactoryTestDataApp>>contains [
	^((1 to: 10) detect: [:each | each > 2] ifNone: [nil]) isNil
]

{
	#category : #lint,
	#timestamp : ' 8/31/2017 05:26:31'
}
RBRefactoryTestDataApp>>cruft [
	self halt
]

{
	#category : #test,
	#timestamp : ' 8/31/2017 05:26:31'
}
RBRefactoryTestDataApp>>demoExampleCall [
	^ self demoRenameMethod: 1 PermuteArgs: 2
]

{
	#category : #test,
	#timestamp : ' 8/31/2017 05:26:31'
}
RBRefactoryTestDataApp>>demoMethodWithDuplicates [
	| a b result1 result2 answer |
	a := 3.
	b := a + 5.
	result1 := a + b.
	result2 := a + 5.
	answer := result1 + result2 + (a + 5).
	^ answer
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:31'
}
RBRefactoryTestDataApp>>demoRenameMethod: arg1 PermuteArgs: arg2 [
	self do: arg1. 
	self do: arg2.
	^ arg1 > arg2
]

{
	#category : #lint,
	#timestamp : ' 8/31/2017 05:26:31'
}
RBRefactoryTestDataApp>>detectContains [
	^(1 to: 10) do: [:each | each > 2 ifTrue: [^each]]
]

{
	#category : #lint,
	#timestamp : ' 8/31/2017 05:26:31'
}
RBRefactoryTestDataApp>>endTrueFalse [
	self isVariable 
		ifTrue: 
			[self printString.
			self isVariable printString]
		ifFalse: 
			[self printString.
			^4]
]

{
	#category : #lint,
	#timestamp : ' 8/31/2017 05:26:31'
}
RBRefactoryTestDataApp>>equalNotUsed [
	| string |
	string = '' yourself.
	(1 to: 10) do: [:i | string := i printString].
	^string
]

{
	#category : #lint,
	#timestamp : ' 8/31/2017 05:26:31'
}
RBRefactoryTestDataApp>>equalsTrue [
	^true == self
]

{
	#category : #test,
	#timestamp : ' 8/31/2017 05:26:31'
}
RBRefactoryTestDataApp>>exampleCall [
	^self rename: 1 two: 2
]

{
	#category : #lint,
	#timestamp : ' 8/31/2017 05:26:31'
}
RBRefactoryTestDataApp>>extraBlock [
	^[:arg | arg + 43] value: 45
]

{
	#category : #lint,
	#timestamp : ' 8/31/2017 05:26:31'
}
RBRefactoryTestDataApp>>fileBlocks [
	| file |
	^
	[file := 'asdf' asFileReference readStream.
	file contents] ensure: [file close]
]

{
	#category : #inline,
	#timestamp : ' 8/31/2017 05:26:31'
}
RBRefactoryTestDataApp>>foo: aValue [
	^(1 to: 10) inject: aValue into: [:sum :each | sum + each]
]

{
	#category : #lint,
	#timestamp : ' 8/31/2017 05:26:31'
}
RBRefactoryTestDataApp>>fullBlocks [
	^[thisContext]
]

{
	#category : #lint,
	#timestamp : ' 8/31/2017 05:26:31'
}
RBRefactoryTestDataApp>>guardingClause [
	self isSymbol 
		ifFalse: 
			[self printString.
			self isSymbol printString]
]

{
	#category : #lint,
	#timestamp : ' 8/31/2017 05:26:31'
}
RBRefactoryTestDataApp>>ifTrueReturns [
	self isSymbol ifFalse: [^true].
	^false
]

{
	#category : #inline,
	#timestamp : ' 8/31/2017 05:26:31'
}
RBRefactoryTestDataApp>>inlineComponent [
	| a |
	a := 5.
	^a class
		superclass;
		hasImmediateInstances;
		yourself
]

{
	#category : #inline,
	#timestamp : ' 8/31/2017 05:26:31'
}
RBRefactoryTestDataApp>>inlineFailed [
	| x y q |
	x := 5.
	y := 10.
	q := x + 1 fooMax: y.
	^q
]

{
	#category : #test,
	#timestamp : ' 8/31/2017 05:26:31'
}
RBRefactoryTestDataApp>>inlineFoo: aBlock  [
	| bar baz asdf |
	bar := aBlock value: self.
	baz := bar + bar.
	asdf := baz + bar.
	^asdf
]

{
	#category : #test,
	#timestamp : ' 8/31/2017 05:26:31'
}
RBRefactoryTestDataApp>>inlineJunk [
	| asdf |
	asdf := self inlineFoo: 
					[:each | 
					| temp |
					temp := each.
					temp , temp].
	^asdf foo: 
			[:bar | 
			| baz |
			baz := bar.
			baz * baz]
]

{
	#category : #inline,
	#timestamp : ' 8/31/2017 05:26:31'
}
RBRefactoryTestDataApp>>inlineLast [
	5 = 3 ifTrue: [^self caller] ifFalse: [^self caller2]
]

{
	#category : #inline,
	#timestamp : ' 8/31/2017 05:26:31'
}
RBRefactoryTestDataApp>>inlineMax [
	| x y q |
	x := 5.
	y := 10.
	q := x + 1 max: y.
	^q
]

{
	#category : #test,
	#timestamp : ' 8/31/2017 05:26:31'
}
RBRefactoryTestDataApp>>inlineMethod [
	| temp |
	temp := self
				foo;
				inlineMethod;
				bar.
	^temp
]

{
	#category : #test,
	#timestamp : ' 8/31/2017 05:26:31'
}
RBRefactoryTestDataApp>>inlineParameterMethod: aSymbol [
	^aSymbol isSymbol
]

{
	#category : #inline,
	#timestamp : ' 8/31/2017 05:26:31'
}
RBRefactoryTestDataApp>>inlineTemporary [
	| temp |
	self isNil ifTrue: [temp := 4].
	^temp
]

{
	#category : #lint,
	#timestamp : ' 8/31/2017 05:26:31'
}
RBRefactoryTestDataApp>>justSendsSuper [
	super justSendsSuper
]

{
	#category : #lint,
	#timestamp : ' 8/31/2017 05:26:31'
}
RBRefactoryTestDataApp>>literalArrayCharacters [
	^#($a $b $c) includes: $a
]

{
	#category : #lint,
	#timestamp : ' 8/31/2017 05:26:31'
}
RBRefactoryTestDataApp>>literalArrayWithTrueFalseOrNil [
	| a b c |
	a := #(true false nil).
	b := #(#true #false #nil).
	c := {true. false. nil}.
	^{a. b. c}
]

{
	#category : #lint,
	#timestamp : ' 8/31/2017 05:26:31'
}
RBRefactoryTestDataApp>>literalArrayWithTrueFalseOrNil2 [
	| b c |
	b := #(#true #false #nil).
	c := #(#true (#true #false #nil) #false #nil).
^b
]

{
	#category : #lint,
	#timestamp : ' 8/31/2017 05:26:31'
}
RBRefactoryTestDataApp>>longMethods [
	self printString.
	self printString.
	self isVariable ifTrue: [self printString].
	self isVariable ifTrue: [self printString].
	self isVariable ifTrue: [self printString].
	self isVariable ifTrue: [self printString]
]

{
	#category : #lint,
	#timestamp : ' 8/31/2017 05:26:31'
}
RBRefactoryTestDataApp>>minMax [
	"Bug in 3<5 ifTrue: [3]  ifFalse: [5]"

^3<5 ifTrue: [3]  ifFalse: [5]
"	| var |
	var := 4.
	var < 5 ifTrue: [var := 5].
	^var"
]

{
	#category : #lint,
	#timestamp : ' 8/31/2017 05:26:31'
}
RBRefactoryTestDataApp>>missingYourself [
	^(OrderedCollection new)
		add: 1;
		add: 2;
		removeFirst
]

{
	#category : #lint,
	#timestamp : ' 8/31/2017 05:26:31'
}
RBRefactoryTestDataApp>>modifiesCollection [
	| collection |
	collection := (1 to: 10) asOrderedCollection.
	collection do: [:each | each > 5 ifTrue: [collection remove: each]].
	^collection
]

{
	#category : #test,
	#timestamp : ' 8/31/2017 05:26:31'
}
RBRefactoryTestDataApp>>moveDefinition [
	| temp |
	^(self collect: 
			[:each | 
			temp := each printString.
			temp , temp]) 
		select: 
			[:each | 
			temp := each size.
			temp odd]
]

{
	#category : #inline,
	#timestamp : ' 8/31/2017 05:26:31'
}
RBRefactoryTestDataApp>>multipleCalls [
	self caller2.
	self caller2
]

{
	#category : #test,
	#timestamp : ' 8/31/2017 05:26:31'
}
RBRefactoryTestDataApp>>noMoveDefinition [
	| temp |
	^(self collect: 
			[:each | 
			temp := each printString.
			temp , temp]) 
		select: [:each | temp := each size + temp]
]

{
	#category : #lint,
	#timestamp : ' 8/31/2017 05:26:31'
}
RBRefactoryTestDataApp>>precedence [
	^self isArray ifFalse: [self block + 5 * 34] ifTrue: [self printString = 10]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:31'
}
RBRefactoryTestDataApp>>referencesConditionFor: aClass  [
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
	#category : #lint,
	#timestamp : ' 8/31/2017 05:26:31'
}
RBRefactoryTestDataApp>>refersToClass [
	^ RBRefactoryTestDataApp
]

{
	#category : #lint,
	#timestamp : ' 8/31/2017 05:26:31'
}
RBRefactoryTestDataApp>>release [
	self printString
]

{
	#category : #test,
	#timestamp : ' 8/31/2017 05:26:31'
}
RBRefactoryTestDataApp>>rename: this two: argumentMethod [
	^self printString , this , argumentMethod
]

{
	#category : #test,
	#timestamp : ' 8/31/2017 05:26:31'
}
RBRefactoryTestDataApp>>renameThisMethod: anArg [
	^self
]

{
	#category : #lint,
	#timestamp : ' 8/31/2017 05:26:31'
}
RBRefactoryTestDataApp>>returnInEnsure [
	[self error: 'asdf'] ensure: [^4]
]

{
	#category : #lint,
	#timestamp : ' 8/31/2017 05:26:31'
}
RBRefactoryTestDataApp>>returnsBooleanAndOther [
	self isVariable ifTrue: [^false].
	self printString
]

{
	#category : #lint,
	#timestamp : ' 8/31/2017 05:26:31'
}
RBRefactoryTestDataApp>>returnsIfTrue [
	^self isNil ifTrue: [4]
]

{
	#category : #lint,
	#timestamp : ' 8/31/2017 05:26:31'
}
RBRefactoryTestDataApp>>searchingLiteral [
	^self printString = #a or: [#() = self printString | ( #() == self printString)]
]

{
	#category : #test,
	#timestamp : ' 8/31/2017 05:26:31'
}
RBRefactoryTestDataApp>>selectorNotReferenced [
	^self selectorNotReferenced + 4
]

{
	#category : #test,
	#timestamp : ' 8/31/2017 05:26:31'
}
RBRefactoryTestDataApp>>sendInlineParameterMethod [
	^self inlineParameterMethod: #(#asdf)
]

{
	#category : #lint,
	#timestamp : ' 8/31/2017 05:26:31'
}
RBRefactoryTestDataApp>>sendsDifferentSuper [
	super printString
]

{
	#category : #lint,
	#timestamp : ' 8/31/2017 05:26:31'
}
RBRefactoryTestDataApp>>sizeCheck [
	self isEmpty
		ifFalse: [self do: 
					[:each | 
					Transcript
						show: each;
						cr]]
]

{
	#category : #lint,
	#timestamp : ' 8/31/2017 05:26:31'
}
RBRefactoryTestDataApp>>stringConcatenation [
	| string |
	string := '' yourself.
	(1 to: 10) do: [:i | string := string , i printString].
	^string
]

{
	#category : #test,
	#timestamp : ' 8/31/2017 05:26:31'
}
RBRefactoryTestDataApp>>symbolReference [
	^#(#renameThisMethod: #(4 #renameThisMethod:))
]

{
	#category : #lint,
	#timestamp : ' 8/31/2017 05:26:31'
}
RBRefactoryTestDataApp>>tempVarOverridesInstVar [
	| temporaryVariable |
	temporaryVariable := 4.
	^temporaryVariable
]

{
	#category : #lint,
	#timestamp : ' 8/31/2017 05:26:31'
}
RBRefactoryTestDataApp>>tempsReadBeforeWritten [
	| temp |
	self isVariable ifTrue: [temp := 4].
	^temp
]

{
	#category : #test,
	#timestamp : ' 8/31/2017 05:26:31'
}
RBRefactoryTestDataApp>>testFoo: anObject [
	^self class + anObject
]

{
	#category : #test,
	#timestamp : ' 8/31/2017 05:26:31'
}
RBRefactoryTestDataApp>>testMethod [
	^self class
]

{
	#category : #test,
	#timestamp : ' 8/31/2017 05:26:31'
}
RBRefactoryTestDataApp>>testMethod1 [
	^self testMethod1 
		, ([:each | each testMethod1] value: #(#(#testMethod1) 2 #testMethod1))
]

{
	#category : #lint,
	#timestamp : ' 8/31/2017 05:26:31'
}
RBRefactoryTestDataApp>>threeElementPoint [
	^5 @ 5 + 6 @ 6
]

{
	#category : #lint,
	#timestamp : ' 8/31/2017 05:26:31'
}
RBRefactoryTestDataApp>>toDo [
	1 to: self size do: [:i | (self at: i) printString]
]

{
	#category : #lint,
	#timestamp : ' 8/31/2017 05:26:31'
}
RBRefactoryTestDataApp>>toDoCollect [
	| array |
	array := Array new: 10.
	1 to: 10 do: [:i | array at: i put: i * i].
	^array
]

{
	#category : #lint,
	#timestamp : ' 8/31/2017 05:26:31'
}
RBRefactoryTestDataApp>>toDoWithIncrement [
	| counter |
	counter := 0.
	1 to: 10
		by: 2
		do: [:i | counter := counter + 2].
	^counter
]

{
	#category : #lint,
	#timestamp : ' 8/31/2017 05:26:31'
}
RBRefactoryTestDataApp>>usesAdd [
	^(1 to: 10) asOrderedCollection addAll: (11 to: 20)
]

{
	#category : #lint,
	#timestamp : ' 8/31/2017 05:26:31'
}
RBRefactoryTestDataApp>>variableAssignedLiteral [
	temporaryVariable := #() 
]

{
	#category : #lint,
	#timestamp : ' 8/31/2017 05:26:31'
}
RBRefactoryTestDataApp>>whileTrue [
	| i |
	i := 1.
	[i < self size] whileTrue: 
			[(self at: i) printString.
			i := i + 1]
]

{
	#category : #lint,
	#timestamp : ' 8/31/2017 05:26:31'
}
RBRefactoryTestDataApp>>yourselfNotUsed [
	self
		printString;
		printString;
		yourself
]
