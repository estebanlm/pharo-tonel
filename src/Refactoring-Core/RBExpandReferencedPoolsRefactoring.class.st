"
I am a refactoring operations for finding direct pool variables  references.

I am used by other refactorings, for example to push down/ pull up a method.
Moving a method from class A to class B, that referes to some pool variables of class A, 
this refactoring will add the pool definition to class B.


"
Class {
	#name : #RBExpandReferencedPoolsRefactoring,
	#superclass : #RBRefactoring,
	#instVars : [
		'pools',
		'fromClass',
		'parseTree',
		'toClasses'
	],
	#category : #Refactoring-Core-Refactorings,
	#timestamp : 'NicolaiHess 5/21/2016 11:46'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:24'
}
RBExpandReferencedPoolsRefactoring class>>forMethod: aParseTree fromClass: aClass toClasses: classCollection  [
	^(self new)
		forMethod: aParseTree
			fromClass: aClass
			toClasses: classCollection;
		yourself
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:24'
}
RBExpandReferencedPoolsRefactoring class>>model: aRBNamespace forMethod: aParseTree fromClass: aClass toClasses: classCollection  [
	^(self new)
		model: aRBNamespace;
		forMethod: aParseTree
			fromClass: aClass
			toClasses: classCollection;
		yourself
]

{
	#category : #transforming,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBExpandReferencedPoolsRefactoring>>computePoolsToMove [
	| poolVariables searcher |
	poolVariables := self poolVariableNamesFor: fromClass.
	pools := Set new.
	searcher := RBParseTreeSearcher new.
	searcher matches: '`var'
		do: 
			[:aNode :answer | 
			| varName pool |
			varName := aNode name.
			(aNode whoDefines: varName) isNil 
				ifTrue: 
					[(poolVariables includes: varName) 
						ifTrue: 
							[pool := self whichPoolDefines: varName.
							pool notNil ifTrue: [pools add: pool]]]].
	searcher executeTree: parseTree
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBExpandReferencedPoolsRefactoring>>forMethod: aParseTree fromClass: aClass toClasses: classCollection  [
	fromClass := self model classFor: aClass.
	parseTree := aParseTree.
	toClasses := classCollection collect: [:each | self model classFor: each]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBExpandReferencedPoolsRefactoring>>hasPoolsToMove [
	^pools isEmpty not
]

{
	#category : #transforming,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBExpandReferencedPoolsRefactoring>>movePool: aSymbol toClass: aClass  [
	| nonMetaClass |
	nonMetaClass := aClass theNonMetaClass.
	(nonMetaClass definesPoolDictionary: aSymbol) ifFalse: [ nonMetaClass addPoolDictionary: aSymbol ]
]

{
	#category : #transforming,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBExpandReferencedPoolsRefactoring>>movePoolVariables [
	pools 
		do: [:poolDict | toClasses do: [:each | self movePool: poolDict toClass: each]]
]

{
	#category : #transforming,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBExpandReferencedPoolsRefactoring>>poolVariableNamesIn: poolName  [
	^(Smalltalk globals at: poolName ifAbsent: [Dictionary new]) classPool keys 
		collect: [:name | name asString]
]

{
	#category : #preconditions,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBExpandReferencedPoolsRefactoring>>preconditions [
	^RBCondition empty
]

{
	#category : #transforming,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBExpandReferencedPoolsRefactoring>>transform [
	self computePoolsToMove.
	self hasPoolsToMove 
		ifTrue: 
			[self 
				refactoringWarning: 'This method contains references to pools<n>which may need to be moved.' 
						expandMacros].
	self movePoolVariables
]

{
	#category : #transforming,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBExpandReferencedPoolsRefactoring>>whichPoolDefines: varName  [
	| currentClass |
	currentClass := fromClass.
	[currentClass isNil] whileFalse: 
			[currentClass allPoolDictionaryNames 
				do: [:each | ((self poolVariableNamesIn: each) includes: varName) ifTrue: [^each]].
			currentClass := currentClass superclass].
	^nil
]
