"
I am the abstract base class for refactoring operations. 

I define the common workflow for a refactoring:
check precondition, 
primitive execute - a dry run collecting the changes without applying them,
and execute - run and apply changes.

I provide many utility methods used by my subclasses. 
Every  concrete subclass implements a single refactoring. They have to implement the methods
preconditions and transform.


Instance Variables

options:
Some refactorings may need user interactions or some extra data for performing
the operation, the code for requesting this data is stored in a block associated with a ""refacotring option""
(see RBRefactoring>>#setOption:toUse:  and RBRefactoring class>>#initializeRefactoringOptions).

model:
My model - a RBNamespace - defines the environment in which my refactoring is applied and collects all changes (RBRefactoryChange).

A RBRefactoringManager  is used to collect the executed refactorings and provides an undo and redo facility.

"
Class {
	#name : #RBRefactoring,
	#superclass : #Object,
	#instVars : [
		'model',
		'options'
	],
	#classVars : [
		'RefactoringOptions'
	],
	#category : #Refactoring-Core-Refactorings,
	#timestamp : 'NicolaiHess 5/21/2016 01:47'
}

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:24'
}
RBRefactoring class>>cleanUp [
	"RefactoringOptions holds on to blocks, we should make sure to recreate them so the block references the current method"
	self initializeRefactoringOptions.
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBRefactoring class>>initialize [
	self initializeRefactoringOptions
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBRefactoring class>>initializeRefactoringOptions [
	RefactoringOptions := IdentityDictionary new.
	RefactoringOptions
		at: #implementorToInline
		put: [ :ref :imps | self error: #implementorToInline ];
		
		at: #methodName
		put: [ :ref :methodName | self error: #methodName ];
		
		at: #selfArgumentName
		put: [ :ref | self error: #selfArgumentName ];
		
		at: #selectVariableToMoveTo
		put: [ :ref :class :selector | self error: #selectVariableToMoveTo ];	
			
		at: #variableTypes
		put: [ :ref :types :selected | self error: #variableTypes ];
		
		at: #extractAssignment
		put: [ :ref :varName | self error: #extractAssignment ];
		
		at: #inlineExpression
		put: [ :ref :string | self error: #inlineExpression ];
		
		at: #alreadyDefined
		put: [ :ref :cls :selector |  self error: #alreadyDefined ];
		
		at: #useExistingMethod
		put: [ :ref :selector |  self error: #useExistingMethod ];
		
		at: #openBrowser
		put: [ :ref :env |  self error: #openBrowser ]
]

{
	#category : #'accessing signal',
	#timestamp : ' 8/31/2017 05:26:24'
}
RBRefactoring class>>preconditionSignal [
	^ RBRefactoringError , RBRefactoringWarning
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBRefactoring class>>refactoringOptions [
	^ RefactoringOptions
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBRefactoring class>>setDefaultOption: aSymbol to: aBlock  [
	self refactoringOptions at: aSymbol put: aBlock
]

{
	#category : #utilities,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBRefactoring>>associationForClassVariable: aName in: aClass ifAbsent: aBlock  [
	^aClass realClass classPool associationAt: aName asSymbol
		ifAbsent: [aClass realClass classPool associationAt: aName asString ifAbsent: aBlock]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBRefactoring>>canReferenceVariable: aString in: aClass  [
	(aClass definesVariable: aString) ifTrue: [^true].
	(self model includesGlobal: aString asSymbol) ifTrue: [^true].
	^(self poolVariableNamesFor: aClass) includes: aString
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBRefactoring>>changes [
	^self model changes
]

{
	#category : #support,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBRefactoring>>checkClass: aRBClass selector: aSelector using: aMatcher  [
	| parseTree |
	parseTree := aRBClass parseTreeFor: aSelector.
	parseTree notNil ifTrue: [aMatcher executeTree: parseTree].
	^aMatcher answer
]

{
	#category : #utilities,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBRefactoring>>checkInstanceVariableName: aName in: aClass  [
	^RBCondition checkInstanceVariableName: aName in: aClass
]

{
	#category : #utilities,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBRefactoring>>checkMethodName: aName in: aClass  [
	^RBCondition checkMethodName: aName in: aClass
]

{
	#category : #preconditions,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBRefactoring>>checkPreconditions [
	| conditions block |
	conditions := self preconditions.
	conditions check
		ifFalse: [ block := conditions errorBlock.
			block
				ifNotNil: [ self refactoringError: conditions errorString with: block ]
				ifNil: [ self refactoringError: conditions errorString ] ]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBRefactoring>>classObjectFor: anObject  [
	(anObject isBehavior or: [anObject isTrait]) ifTrue: [^self model classFor: anObject].
	anObject isSymbol ifTrue: [^self model classNamed: anObject].
	^anObject
]

{
	#category : #support,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBRefactoring>>convertAllReferencesTo: aSymbol using: searchReplacer  [
	self model allReferencesTo: aSymbol
		do: 
			[:method | 
			self 
				convertMethod: method selector
				for: method modelClass
				using: searchReplacer]
]

{
	#category : #support,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBRefactoring>>convertAllReferencesToClass: aRBClass using: searchReplacer  [
	self model allReferencesToClass: aRBClass
		do: 
			[:method | 
			self 
				convertMethod: method selector
				for: method modelClass
				using: searchReplacer]
]

{
	#category : #support,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBRefactoring>>convertClasses: classSet select: aBlock using: searchReplacer  [
	classSet do: 
			[:aClass | 
			(aBlock value: aClass) do: 
					[:selector | 
					self 
						convertMethod: selector
						for: aClass
						using: searchReplacer]]
]

{
	#category : #support,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBRefactoring>>convertMethod: selector for: aClass using: searchReplacer  [
	"Convert the parse tree for selector using the searchReplacer. If a
	change is made then compile it into the changeBuilder."

	| parseTree |
	parseTree := aClass parseTreeFor: selector.
	parseTree isNil ifTrue: [^self].
	(searchReplacer executeTree: parseTree) 
		ifTrue: [aClass compileTree: searchReplacer tree]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBRefactoring>>copyOptionsFrom: aDictionary  [
	| dict |
	dict := self options.
	dict == self class refactoringOptions 
		ifTrue: [^self options: aDictionary copy].
	dict keysAndValuesDo: 
			[:key :value | 
			value == (self class refactoringOptions at: key) 
				ifTrue: [dict at: key put: (aDictionary at: key)]].
	self options: dict
]

{
	#category : #transforming,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBRefactoring>>defaultEnvironment [
	^RBBrowserEnvironment new
]

{
	#category : #transforming,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBRefactoring>>execute [
	self primitiveExecute.
	RBRefactoringManager instance addRefactoring: self
]

{
	#category : #transforming,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBRefactoring>>model [
	^ model isNil 
		ifTrue: 
			[model := (RBClassModelFactory rbNamespace onEnvironment: self defaultEnvironment)
						name: self printString;
						yourself]
		ifFalse: [model]
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBRefactoring>>model: aRBNamespace  [
	model := aRBNamespace
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBRefactoring>>onError: aBlock do: errorBlock  [
	^aBlock on: self class preconditionSignal
		do: 
			[:ex | 
			errorBlock value.
			ex return: nil]
]

{
	#category : #requests,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBRefactoring>>openBrowserOn: anEnvironment  [
	^(self options at: #openBrowser) value: self value: anEnvironment
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBRefactoring>>options [
	^options isNil ifTrue: [self class refactoringOptions] ifFalse: [options]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBRefactoring>>options: aDictionary  [
	options := aDictionary
]

{
	#category : #transforming,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBRefactoring>>performComponentRefactoring: aRefactoring  [
	aRefactoring copyOptionsFrom: self options.
	aRefactoring primitiveExecute
]

{
	#category : #utilities,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBRefactoring>>poolVariableNamesFor: aClass  [
	| pools |
	pools := Set new.
	aClass withAllSuperclasses do: 
			[:each | 
			each allPoolDictionaryNames do: 
					[:pool | 
					pools addAll: ((Smalltalk globals at: pool asSymbol) classPool keys 
								collect: [:name | name asString])]].
	^pools
]

{
	#category : #preconditions,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBRefactoring>>preconditions [
	self subclassResponsibility
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBRefactoring>>primitiveExecute [
	self checkPreconditions.
	self transform
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBRefactoring>>refactoringConfirmWarning: aString [
	| ret |
	ret := UIManager default confirm: aString orCancel: [ ^ RBRefactoringFailure signal: 'aborted' ].
	^ ret
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBRefactoring>>refactoringError: aString  [
	^ RBRefactoringError signal: aString
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBRefactoring>>refactoringError: aString with: aBlock  [
	^ RBRefactoringError signal: aString with: aBlock
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBRefactoring>>refactoringFailure: aString  [
	^ RBRefactoringFailure signal: aString
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBRefactoring>>refactoringFailure: aString with: aBlock [
	^ RBRefactoringFailure signal: aString with: aBlock
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBRefactoring>>refactoringWarning: aString  [
	^ RBRefactoringWarning signal: aString
]

{
	#category : #requests,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBRefactoring>>requestImplementorToInline: implementorsCollection  [
	^(self options at: #implementorToInline) value: self
		value: implementorsCollection
]

{
	#category : #requests,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBRefactoring>>requestMethodNameFor: aMethodName  [
	^(self options at: #methodName) value: self value: aMethodName
]

{
	#category : #requests,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBRefactoring>>requestSelfArgumentName [
	^(self options at: #selfArgumentName) value: self
]

{
	#category : #utilities,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBRefactoring>>safeMethodNameFor: aClass basedOn: aString  [
	"Creates an unused method name containing aString"

	| baseString newString hasParam i |
	baseString := aString copy.
	baseString at: 1 put: baseString first asLowercase.
	newString := baseString.
	hasParam := newString last = $:.
	hasParam 
		ifTrue: [baseString := newString copyFrom: 1 to: newString size - 1].
	i := 0.
	[aClass hierarchyDefinesMethod: newString asSymbol] whileTrue: 
			[i := i + 1.
			newString := baseString , i printString 
						, (hasParam ifTrue: [':'] ifFalse: [''])].
	^newString asSymbol
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBRefactoring>>safeVariableNameFor: aClass temporaries: allTempVars basedOn: aString [
	| baseString i newString |
	newString := baseString := aString.
	i := 0.
	[ (allTempVars includes: newString) or: [ aClass definesInstanceVariable: newString ] ] 
		whileTrue: [ 
			i := i + 1.
			newString := baseString , i printString ].
	^ newString
]

{
	#category : #requests,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBRefactoring>>selectVariableToMoveMethodTo: aSelector class: aClass  [
	^(self options at: #selectVariableToMoveTo) 
		value: self
		value: aClass
		value: aSelector
]

{
	#category : #requests,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBRefactoring>>selectVariableTypesFrom: initialTypeCollection selected: selectedTypeCollection  [
	^ (self options at: #variableTypes) 
		value: self
		value: initialTypeCollection
		value: selectedTypeCollection

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBRefactoring>>setOption: aSymbol toUse: aBlock  [
	| dict |
	dict := self options.
	dict == self class refactoringOptions ifTrue: [dict := dict copy].
	dict at: aSymbol put: aBlock.
	self options: dict
]

{
	#category : #requests,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBRefactoring>>shouldExtractAssignmentTo: aString  [
	^(self options at: #extractAssignment) value: self value: aString
]

{
	#category : #requests,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBRefactoring>>shouldInlineExpression: aString  [
	^(self options at: #inlineExpression) value: self value: aString
]

{
	#category : #requests,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBRefactoring>>shouldOverride: aSelector in: aClass  [
	^(self options at: #alreadyDefined) 
		value: self
		value: aClass
		value: aSelector
]

{
	#category : #requests,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBRefactoring>>shouldUseExistingMethod: aSelector  [
	^(self options at: #useExistingMethod) value: self value: aSelector
]

{
	#category : #transforming,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBRefactoring>>transform [
	self subclassResponsibility
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBRefactoring>>uniqueMethodNameFor: anInteger  [
	| before after index name |
	before := 'a'.
	after := ''.
	anInteger timesRepeat: [after := after , 'z:'].
	index := 0.
	
	[name := before , index printString , after.
	(Symbol findInterned: name) notNil] 
			whileTrue: [index := index + 1].
	^name asSymbol
]

{
	#category : #utilities,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBRefactoring>>whichVariableNode: aParseTree inInterval: anInterval name: aName  [
	| matcher block |
	matcher := RBParseTreeSearcher new.
	block := 
			[:aNode :answer | 
			(aNode intersectsInterval: anInterval) ifTrue: [aNode] ifFalse: [answer]].
	matcher
		matches: aName do: block;
		matchesArgument: aName do: block.
	^matcher executeTree: aParseTree initialAnswer: nil
]
