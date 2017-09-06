"
I am a refactoring used by other refactoring operations for extracting direct inst var and pool var 
access to accessor methods.

For example RBMoveMethodRefactoring uses me.
"
Class {
	#name : #RBAbstractVariablesRefactoring,
	#superclass : #RBRefactoring,
	#instVars : [
		'tree',
		'fromClass',
		'instVarReaders',
		'instVarWriters',
		'classVarReaders',
		'classVarWriters',
		'toClasses',
		'ignore'
	],
	#category : #Refactoring-Core-Refactorings,
	#timestamp : 'NicolaiHess 5/21/2016 00:59'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:24'
}
RBAbstractVariablesRefactoring class>>model: aRBSmalltalk abstractVariablesIn: aBRProgramNode from: fromBehavior toAll: behaviorCollection  [
	^self 
		model: aRBSmalltalk
		abstractVariablesIn: aBRProgramNode
		from: fromBehavior
		toAll: behaviorCollection
		ignoring: nil
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:24'
}
RBAbstractVariablesRefactoring class>>model: aRBSmalltalk abstractVariablesIn: aBRProgramNode from: fromBehavior toAll: behaviorCollection ignoring: aVariableName  [
	^(self new)
		model: aRBSmalltalk;
		abstractVariablesIn: aBRProgramNode
			from: fromBehavior
			toAll: behaviorCollection
			ignoring: aVariableName;
		yourself
]

{
	#category : #transforming,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBAbstractVariablesRefactoring>>abstractClassVariable: aString  [
	| refactoring rewriter nonMetaClass |
	nonMetaClass := fromClass theNonMetaClass.
	refactoring := RBCreateAccessorsForVariableRefactoring 
		model: self model
		variable: aString
		class: nonMetaClass
		classVariable: true.
	self performComponentRefactoring: refactoring.
	rewriter := RBParseTreeRewriter new.
	fromClass isMeta 
		ifTrue: 
			[ rewriter
				replace: aString , ' := ``@object'
					with: ('self <1s> ``@object' expandMacrosWith: refactoring setterMethod);
				replace: aString
					with: 'self ' , refactoring getterMethod ]
		ifFalse: 
			[ rewriter
				replace: aString , ' := ``@object'
					with: ('self class <1s> ``@object' expandMacrosWith: refactoring setterMethod);
				replace: aString
					with: 'self class ' , refactoring getterMethod ].
	(rewriter executeTree: tree) ifTrue: [ tree := rewriter tree ]
]

{
	#category : #transforming,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBAbstractVariablesRefactoring>>abstractClassVariables [
	| variables |
	(classVarReaders isEmpty and: [ classVarWriters isEmpty ])
		ifTrue: [ ^ self ].
	variables := Set new.
	variables
		addAll: classVarReaders;
		addAll: classVarWriters.
	variables do: [ :each | self abstractClassVariable: each ]
]

{
	#category : #transforming,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBAbstractVariablesRefactoring>>abstractInstanceVariable: aString  [
	| refactoring rewriter |
	refactoring := RBCreateAccessorsForVariableRefactoring 
				model: self model
				variable: aString
				class: fromClass
				classVariable: false.
	self performComponentRefactoring: refactoring.
	rewriter := RBParseTreeRewriter new.
	rewriter
		replace: aString , ' := ``@object'
			with: ('self <1s> ``@object' expandMacrosWith: refactoring setterMethod);
		replace: aString with: 'self ' , refactoring getterMethod.
	(rewriter executeTree: tree) ifTrue: [tree := rewriter tree]
]

{
	#category : #transforming,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBAbstractVariablesRefactoring>>abstractInstanceVariables [
	| variables |
	(instVarReaders isEmpty and: [ instVarWriters isEmpty ])
		ifTrue: [ ^ self].
	variables := Set new.
	variables
		addAll: instVarReaders;
		addAll: instVarWriters.
	variables do: [ :each | self abstractInstanceVariable: each ]
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBAbstractVariablesRefactoring>>abstractVariablesIn: aBRProgramNode from: fromBehavior toAll: behaviorCollection ignoring: aVariableName  [
	| poolRefactoring |
	tree := aBRProgramNode.
	fromClass := self classObjectFor: fromBehavior.
	toClasses := behaviorCollection 
				collect: [:each | self classObjectFor: each].
	ignore := aVariableName.
	poolRefactoring := RBExpandReferencedPoolsRefactoring 
				model: self model
				forMethod: tree
				fromClass: fromClass
				toClasses: toClasses.
	self performComponentRefactoring: poolRefactoring.
	self computeVariablesToAbstract
]

{
	#category : #transforming,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBAbstractVariablesRefactoring>>classVariableNames [
	| nonMetaClass |
	nonMetaClass := fromClass theNonMetaClass.
	^ (nonMetaClass allClassVariableNames collect: [ :each | each asString ]) asSet
]

{
	#category : #transforming,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBAbstractVariablesRefactoring>>computeVariablesToAbstract [
	| searcher |
	instVarReaders := Set new.
	instVarWriters := Set new.
	classVarReaders := Set new.
	classVarWriters := Set new.
	searcher := RBParseTreeSearcher new.
	searcher
		matches: '`var := ``@anything'
			do: [:aNode :answer | self processAssignmentNode: aNode];
		matches: '`var' do: [:aNode :answer | self processReferenceNode: aNode].
	searcher executeTree: tree.
	self removeDefinedClassVariables
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBAbstractVariablesRefactoring>>hasVariablesToAbstract [
	^ instVarReaders notEmpty or: [ instVarWriters notEmpty or: [ classVarReaders notEmpty or: [ classVarWriters notEmpty ] ] ]
]

{
	#category : #transforming,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBAbstractVariablesRefactoring>>instanceVariableNames [
	^fromClass allInstanceVariableNames asSet
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBAbstractVariablesRefactoring>>parseTree [
	^tree
]

{
	#category : #preconditions,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBAbstractVariablesRefactoring>>preconditions [
	^RBCondition empty
]

{
	#category : #transforming,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBAbstractVariablesRefactoring>>processAssignmentNode: aNode  [
	| varName |
	varName := aNode variable name.
	ignore = varName ifTrue: [^self].
	(aNode whoDefines: varName) notNil ifTrue: [^self].
	(self instanceVariableNames includes: varName) 
		ifTrue: [instVarWriters add: varName].
	(self classVariableNames includes: varName) 
		ifTrue: [classVarWriters add: varName]
]

{
	#category : #transforming,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBAbstractVariablesRefactoring>>processReferenceNode: aNode  [
	| varName |
	varName := aNode name.
	ignore = varName ifTrue: [^self].
	(aNode whoDefines: varName) notNil ifTrue: [^self].
	(self instanceVariableNames includes: varName) 
		ifTrue: [instVarReaders add: varName].
	(self classVariableNames includes: varName) 
		ifTrue: [classVarReaders add: varName]
]

{
	#category : #transforming,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBAbstractVariablesRefactoring>>removeDefinedClassVariables [
	| selectionBlock nonMetaClass |
	nonMetaClass := fromClass theNonMetaClass.
	selectionBlock := 
	[ :varName | 
	(toClasses 
		detect: 
			[ :each | 
			(each theNonMetaClass includesClass: (nonMetaClass whoDefinesClassVariable: varName)) not ]
		ifNone: [ nil ]) notNil ].
	classVarReaders := classVarReaders select: selectionBlock.
	classVarWriters := classVarWriters select: selectionBlock
]

{
	#category : #transforming,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBAbstractVariablesRefactoring>>transform [
	self hasVariablesToAbstract 
		ifTrue: 
			[self 
				refactoringWarning: 'This method has direct variable references which<n>will need to be converted to getter/setters.' 
						expandMacros].
	self abstractInstanceVariables.
	self abstractClassVariables
]
