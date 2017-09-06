"
I am a refactoring for moving a method from the class to one of its instance variable objects.

Moving a method moves it implementation to one or more classes and replaces the implementation in the original method by a delegation to one of the classes instance variable. 

I expect an option for selecting the type (classes) to which this method should be added.
A role typer RBRefactoryTyper is used to guess the possible classes used for this instance variables.
And an option for requesting the new method selector.

For all selected classes a method implementing the original method is created, and if the original code uses some references to self, a parameter needs to be added to provided the former implementor.

For example, moving the method #isBlack from class Color to its instvar #rgb for the type ""Integer"" creates a method 
Integer>>#isBlack
 ^ self = 0

and changes Colors implementation from: 
Color>>#isBlack
   ^ rgb = 0
to: 
Color>>#isBlack
   ^ rgb isBlack

"
Class {
	#name : #RBMoveMethodRefactoring,
	#superclass : #RBMethodRefactoring,
	#instVars : [
		'selector',
		'variable',
		'moveToClasses',
		'parseTree',
		'hasOnlySelfReturns',
		'selfVariableName'
	],
	#category : #Refactoring-Core-Refactorings,
	#timestamp : 'NicolaiHess 5/21/2016 15:58'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:24'
}
RBMoveMethodRefactoring class>>model: aRBSmalltalk selector: aSymbol class: aClass variable: aVariableName [
	^ self new
		model: aRBSmalltalk;
		selector: aSymbol class: aClass variable: aVariableName;
		yourself
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:24'
}
RBMoveMethodRefactoring class>>selector: aSymbol class: aClass variable: aVariableName [
	^ self new
		selector: aSymbol class: aClass variable: aVariableName;
		yourself
]

{
	#category : #transforming,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBMoveMethodRefactoring>>abstractVariables [
	self performComponentRefactoring: self abstractVariablesRefactoring.
	parseTree := self abstractVariablesRefactoring parseTree
]

{
	#category : #transforming,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBMoveMethodRefactoring>>abstractVariablesRefactoring [
	^RBAbstractVariablesRefactoring 
		model: self model
		abstractVariablesIn: parseTree
		from: class
		toAll: moveToClasses
		ignoring: variable
]

{
	#category : #transforming,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBMoveMethodRefactoring>>addSelfReturn [
	self hasOnlySelfReturns ifTrue: [^self].
	parseTree addSelfReturn
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBMoveMethodRefactoring>>buildParseTree [
	parseTree := (class parseTreeFor: selector) copy.
	parseTree isNil ifTrue: [self refactoringFailure: 'Could not parse method']
]

{
	#category : #preconditions,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBMoveMethodRefactoring>>checkAssignmentsToVariable [
	| searcher |
	variable
		ifNotNil:
			[ 
			searcher := RBParseTreeSearcher new.
			searcher
				matches: variable , ' := `@object'
				do: [ :aNode :answer | true ].
			(searcher executeTree: parseTree initialAnswer: false)
				ifTrue:
					[ 
					self
						refactoringError:
							('Cannot move the method into <1s> since it is assigned'
								expandMacrosWith: variable) ] ]
]

{
	#category : #preconditions,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBMoveMethodRefactoring>>checkForPrimitiveMethod [
	parseTree isPrimitive 
		ifTrue: [self refactoringError: 'Cannot move primitive methods']
]

{
	#category : #preconditions,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBMoveMethodRefactoring>>checkForSuperReferences [
	| searcher |
	searcher := RBParseTreeSearcher new.
	searcher matches: 'super `@message: `@args' do: [:aNode :answer | true].
	(searcher executeTree: parseTree initialAnswer: false) 
		ifTrue: 
			[self refactoringError: 'Cannot move the method since it has a super message send.']
]

{
	#category : #preconditions,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBMoveMethodRefactoring>>checkTemporaryVariableNames [
	| varNames |
	varNames := parseTree allDefinedVariables.
	selfVariableName notNil ifTrue: [varNames add: selfVariableName].
	varNames do: 
			[:name | 
			moveToClasses do: 
					[:each | 
					(self canReferenceVariable: name in: each) 
						ifTrue: 
							[self refactoringError: ('<1p> already defines a variable called <2s>' 
										expandMacrosWith: each
										with: name)]]]
]

{
	#category : #transforming,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBMoveMethodRefactoring>>compileDelegatorMethod [
	| statementNode delegatorNode tree |
	delegatorNode := RBMessageNode 
				receiver: (RBVariableNode named: variable)
				selector: parseTree selector
				keywordsPositions: parseTree keywordsPositions
				arguments: (parseTree argumentNames collect: 
							[:each | 
							RBVariableNode 
								named: (each = selfVariableName ifTrue: ['self'] ifFalse: [each])]).
	self hasOnlySelfReturns 
		ifFalse: [delegatorNode := RBReturnNode value: delegatorNode].
	statementNode := RBSequenceNode temporaries: #()
				statements: (Array with: delegatorNode).
	(tree := class parseTreeFor: selector) body: statementNode.
	class compileTree: tree
]

{
	#category : #transforming,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBMoveMethodRefactoring>>compileNewMethods [
	moveToClasses 
		do: [:each | each compile: parseTree newSource withAttributesFrom: (class methodFor: selector)]
]

{
	#category : #transforming,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBMoveMethodRefactoring>>getArgumentNameForSelf [
	self needsToReplaceSelfReferences ifFalse: [^self].
	
	[selfVariableName := self requestSelfArgumentName.
	(self checkInstanceVariableName: selfVariableName in: class) 
		ifTrue: 
			[self verifyTemporaryVariableDoesNotOverride 
				ifFalse: 
					[self 
						refactoringWarning: 'The variable is already defined in one of the classes you''re moving the method to.<n>Try another?' 
								expandMacros.
					selfVariableName := nil]]
		ifFalse: 
			[self 
				refactoringWarning: 'The variable name is not a valid Smalltalk temporary variable name<n>Try again?' 
						expandMacros.
			selfVariableName := nil].
	selfVariableName isNil] 
			whileTrue: []
]

{
	#category : #private-accessing,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBMoveMethodRefactoring>>getClassForGlobalOrClassVariable [
	| definingClass type |
	definingClass := class whoDefinesClassVariable: (variable ifNil: ['']).
	definingClass ifNil: [ 
			type := self model classNamed: variable.
			type ifNil: [ type := self model classNamed: #Object ] ]
		ifNotNil: [ type := definingClass typeOfClassVariable: variable ].
	moveToClasses := self selectVariableTypesFrom: (Array with: type) selected: (Array with: type).
	moveToClasses ifNil: [ self refactoringFailure: 'Method not moved' ]
]

{
	#category : #private-accessing,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBMoveMethodRefactoring>>getClassesForInstanceVariable [
	| definingClass typer types |
	definingClass := class whoDefinesInstanceVariable: variable.
	typer := RBRefactoryTyper newFor: self model.
	typer runOn: definingClass.
	types := typer typesFor: variable.
	types isEmpty 
		ifTrue: [types := OrderedCollection with: (self model classNamed: #Object)].
	moveToClasses := self selectVariableTypesFrom: types
				selected: (typer guessTypesFor: variable).
	moveToClasses isNil ifTrue: [self refactoringFailure: 'Method not moved']
]

{
	#category : #private-accessing,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBMoveMethodRefactoring>>getClassesForTemporaryVariable [
	| types |
	types := RBRefactoryTyper 
				typesFor: variable
				in: parseTree
				model: self model.
	types isEmpty 
		ifTrue: [types := OrderedCollection with: (self model classNamed: #Object)].
	moveToClasses := self selectVariableTypesFrom: types selected: types.
	moveToClasses isNil ifTrue: [self refactoringFailure: 'Method not moved']
]

{
	#category : #private-accessing,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBMoveMethodRefactoring>>getClassesToMoveTo [
	self isMovingToArgument 
		ifTrue: [self getClassesForTemporaryVariable]
		ifFalse: 
			[self isMovingToInstVar 
				ifTrue: [self getClassesForInstanceVariable]
				ifFalse: [self getClassForGlobalOrClassVariable]].
	moveToClasses isEmpty 
		ifTrue: [self refactoringFailure: 'No classes selected, method not moved.']
]

{
	#category : #preconditions,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBMoveMethodRefactoring>>getNewMethodName [
	| newSelector parameters alreadyDefined methodName newMethodName |
	self removeArgument.
	parameters := parseTree argumentNames asOrderedCollection.
	"parameters remove: variable ifAbsent: []."
	self needsToReplaceSelfReferences 
		ifTrue: [parameters add: selfVariableName].
	methodName := RBMethodName selector: (self uniqueMethodNameFor: parameters size) arguments: parameters.
	
	[newMethodName := self requestMethodNameFor: methodName.
	newMethodName isNil ifTrue: [self refactoringFailure: 'Did not move method'].
	newMethodName isValid 
		ifTrue: [newSelector := newMethodName selector]
		ifFalse: [self refactoringWarning: 'Invalid method name'].
	parameters := newMethodName arguments.
	(self checkMethodName: newSelector in: class) 
		ifFalse: 
			[self refactoringWarning: newSelector , ' is not a valid selector name.'.
			newSelector := nil].
	alreadyDefined := moveToClasses 
				detect: [:each | each hierarchyDefinesMethod: newSelector]
				ifNone: [nil].
	alreadyDefined notNil 
		ifTrue: 
			[self 
				refactoringWarning: ('<1s> is already defined by <2p> or a super/subclass<n>Try another?' 
						expandMacrosWith: newSelector
						with: alreadyDefined).
			newSelector := nil].
	newSelector isNil] 
			whileTrue: [].
	parseTree
		renameSelector: newSelector
		andArguments: (parameters collect: [:each | RBVariableNode named: each]) 
			asArray
]

{
	#category : #transforming,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBMoveMethodRefactoring>>hasOnlySelfReturns [
	^hasOnlySelfReturns isNil 
		ifTrue: 
			[| searcher |
			searcher := RBParseTreeSearcher new.
			searcher
				matches: '^self' do: [:aNode :answer | answer];
				matches: '^`@object' do: [:aNode :answer | false].
			hasOnlySelfReturns := searcher executeTree: parseTree initialAnswer: true]
		ifFalse: [hasOnlySelfReturns]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBMoveMethodRefactoring>>hasSelfReferences [
	| searcher |
	searcher := RBParseTreeSearcher new.
	searcher matches: 'self' do: [:aNode :answer | true].
	self hasOnlySelfReturns 
		ifTrue: [searcher matches: '^self' do: [:aNode :answer | answer]].
	^searcher executeTree: parseTree initialAnswer: false
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBMoveMethodRefactoring>>isMovingToArgument [
	^(parseTree arguments collect: [:each | each name]) includes: variable
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBMoveMethodRefactoring>>isMovingToInstVar [
	^self isMovingToArgument not 
		and: [(class whoDefinesInstanceVariable: variable) notNil]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBMoveMethodRefactoring>>needsToReplaceSelfReferences [
	^self hasSelfReferences 
		or: [self abstractVariablesRefactoring hasVariablesToAbstract]
]

{
	#category : #preconditions,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBMoveMethodRefactoring>>preconditions [
	^(RBCondition definesSelector: selector in: class) 
		& (RBCondition withBlock: 
					[self buildParseTree.
					self checkForPrimitiveMethod.
					self checkForSuperReferences.
					self checkAssignmentsToVariable.
					self getClassesToMoveTo.
					self getArgumentNameForSelf.
					self checkTemporaryVariableNames.
					self getNewMethodName.
					true])
]

{
	#category : #transforming,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBMoveMethodRefactoring>>removeArgument [
	"Removes the excess argument if any.
	This argument is the variable which is
	referenced by self in the classes the
	method is moved to. "
	| removeIndex |
	removeIndex := parseTree argumentNames indexOf: variable.
	removeIndex = 0 ifFalse: 
		[parseTree 
			selector: ('' join: ((parseTree selector keywords asOrderedCollection) 
									removeAt: removeIndex; yourself)) asSymbol
			keywordsPositions: ((parseTree keywordsPositions asOrderedCollection) 
									removeAt: removeIndex; yourself) asIntegerArray
			arguments: ((parseTree arguments asOrderedCollection)  
									removeAt: removeIndex; yourself) asArray].
]

{
	#category : #transforming,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBMoveMethodRefactoring>>replaceSelfReferences [
	| replacer |
	self needsToReplaceSelfReferences ifTrue: [
		replacer := RBParseTreeRewriter new.
		replacer replace: 'self' with: selfVariableName.
		self hasOnlySelfReturns ifTrue: 
			[replacer replace: '^self' with: '^self'].
		replacer executeTree: parseTree.
		parseTree := replacer tree].
]

{
	#category : #transforming,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBMoveMethodRefactoring>>replaceVariableReferences [
	| replacer |
	replacer := RBParseTreeRewriter new.
	replacer replace: variable with: 'self'.
	replacer executeTree: parseTree.
	parseTree := replacer tree
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBMoveMethodRefactoring>>selector: aSymbol class: aClass variable: aVariableName  [
	selector := aSymbol.
	class := self classObjectFor: aClass.
	variable := aVariableName
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBMoveMethodRefactoring>>storeOn: aStream  [
	aStream nextPut: $(.
	self class storeOn: aStream.
	aStream
		nextPutAll: ' selector: #';
		nextPutAll: selector;
		nextPutAll: ' class: '.
	class storeOn: aStream.
	aStream
		nextPutAll: ' variable: ''';
		nextPutAll: variable;
		nextPutAll: ''')'
]

{
	#category : #transforming,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBMoveMethodRefactoring>>transform [
	self
		abstractVariables;
		addSelfReturn;
		replaceSelfReferences;
		replaceVariableReferences;
		compileNewMethods;
		compileDelegatorMethod
]

{
	#category : #transforming,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBMoveMethodRefactoring>>verifyTemporaryVariableDoesNotOverride [
	(parseTree allDefinedVariables includes: selfVariableName)
		ifTrue: [ ^ false ].
	^ moveToClasses 
		noneSatisfy: [ :each | each definesVariable: selfVariableName ]
]
