"
RBMethodNode is the node that that represents AST of a Smalltalk method.

Some properties aren't known to the parser creating this Object. For example, the scope value isn't known by parsing the code but only after doing a
semantic analysis. Likewise the compilation context isn't needed until we try to do the semantic analysis. 

Instance Variables:
	arguments	<SequenceableCollection of: RBVariableNode>	the arguments to the method
	body	<BRSequenceNode>	the body/statements of the method
	nodeReplacements	<Dictionary>	a dictionary of oldNode -> newNode replacements
	replacements	<Collection of: RBStringReplacement>	the collection of string replacements for each node replacement in the parse tree
	selector	<Symbol>	the method name
	keywordsPositions	<IntegerArray | nil>	the positions of the selector keywords
	source	<String>	the source we compiled
	scope	<OCMethodScope | nil> the scope associated with this code of this method
	pragmas	< SequenceableCollection of: RBPragmaNodes > Nodes representing the pragma statements in this method
	compilationContext	<CCompilationContext | CompilationContext>

"
Class {
	#name : #RBMethodNode,
	#superclass : #RBProgramNode,
	#instVars : [
		'scope',
		'selector',
		'keywordsPositions',
		'body',
		'source',
		'arguments',
		'pragmas',
		'replacements',
		'nodeReplacements',
		'compilationContext'
	],
	#category : #AST-Core-Nodes,
	#timestamp : 'NicolaiHess 8/2/2016 13:27'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:40'
}
RBMethodNode class>>selector: aSymbol arguments: valueNodes [
	^(self new)
		selector: aSymbol;
		arguments: valueNodes;
		yourself
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:40'
}
RBMethodNode class>>selector: aSymbol arguments: variableNodes body: aSequenceNode  [
	^(self new)
		arguments: variableNodes;
		selector: aSymbol;
		body: aSequenceNode;
		yourself
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:40'
}
RBMethodNode class>>selector: aSymbol body: aSequenceNode  [
	^self 
		selector: aSymbol
		arguments: #()
		body: aSequenceNode
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:40'
}
RBMethodNode class>>selector: aSymbol keywordsPositions: positionList arguments: valueNodes [
	^(self new)
		selector: aSymbol
			keywordsPositions: positionList 
			arguments: valueNodes;
		yourself.
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBMethodNode>>= anObject  [
	self == anObject ifTrue: [ ^ true ].
	self class = anObject class ifFalse: [ ^ false ].
	(self selector = anObject selector
		and: [ self pragmas size = anObject pragmas size
		and: [ self body = anObject body ] ])
			ifFalse: [ ^ false ].
	self arguments with: anObject arguments do: [ :first :second |
		first = second 
			ifFalse: [ ^ false ] ].
	self pragmas with: anObject pragmas do: [ :first :second |
		first = second 
			ifFalse: [ ^ false ] ].
	^ true
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBMethodNode>>acceptVisitor: aProgramNodeVisitor  [
	^aProgramNodeVisitor visitMethodNode: self
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBMethodNode>>addNode: aNode [
	^ body addNode: aNode
]

{
	#category : #replacing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBMethodNode>>addReplacement: aStringReplacement  [
	replacements ifNil: [^self].
	replacements add: aStringReplacement
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBMethodNode>>addReturn [
	^ body addReturn
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBMethodNode>>addSelfReturn [
	^ body addSelfReturn
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBMethodNode>>allArgumentVariables [
	^(self argumentNames asOrderedCollection)
		addAll: super allArgumentVariables;
		yourself
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBMethodNode>>allDefinedVariables [
	^(self argumentNames asOrderedCollection)
		addAll: super allDefinedVariables;
		yourself
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBMethodNode>>argumentNames [
	^ self arguments collect: [:each | each name] as: Array
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBMethodNode>>arguments [
	^arguments
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBMethodNode>>arguments: variableNodes  [
	arguments := variableNodes.
	arguments do: [:each | each parent: self]
]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBMethodNode>>asSequenceNode [
	^body
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBMethodNode>>assignmentNodes [
	^self allChildren select: [:each | each isAssignment].
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBMethodNode>>blockNodes [
	^self allChildren select: [:each | each isBlock].
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBMethodNode>>body [
	^body
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBMethodNode>>body: stmtsNode  [
	body := stmtsNode.
	body parent: self
]

{
	#category : #private-replacing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBMethodNode>>changeSourceSelector: oldSelector keywordsIntervals: oldIntervals arguments: oldArguments [
	"If this is the same number of arguments, we try a one to one replacement of selector parts and arguments. If this is not the c
ase try to rewrite the signature as a whole, what unfortunately drops the comments within the signature."

	[ (oldIntervals size = self keywordsPositions size and: [ oldArguments size = arguments size ])
		ifTrue: [
			self selectorParts keysAndValuesDo: [ :index :part |
				self addReplacement: (RBStringReplacement 
					replaceFrom: (oldIntervals at: index) first
					to: (oldIntervals at: index) last
					with: part) ].
			oldArguments with: arguments do: [ :old :new | 
				self addReplacement: (RBStringReplacement 
					replaceFrom: old start
					to: old stop
					with: new name) ] ]
		ifFalse: [
			self addReplacement: (RBStringReplacement
				replaceFrom: oldIntervals first first
				to: (oldArguments notEmpty
					ifTrue: [ oldArguments last stop ]
					ifFalse: [ oldIntervals last last ])
				with: (String streamContents: [ :stream |
					self selectorParts keysAndValuesDo: [ :index :part |
						index = 1 ifFalse: [ stream space ].
						stream nextPutAll: part.
						index <= arguments size
							ifTrue: [ stream space; nextPutAll: (arguments at: index) name ] ] ])) ] ]
		on: Error
		do: [ :ex | ex return ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBMethodNode>>children [
	^ OrderedCollection new
		addAll: self arguments;
		addAll: self pragmas;
		add: self body;
		yourself
]

{
	#category : #replacing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBMethodNode>>clearReplacements [
	replacements := nil
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBMethodNode>>compilationContext [
	^ compilationContext
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBMethodNode>>compilationContext: aCompilationContext [
	compilationContext := aCompilationContext.
]

{
	#category : #matching,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBMethodNode>>copyInContext: aDictionary [
	^ self class new
		selector: self selector;
		arguments: (self arguments collect: [ :each | each copyInContext: aDictionary ]);
		pragmas: (self pragmas isEmpty
			ifTrue: [ aDictionary at: '-pragmas-' ifAbsent: [ #() ] ]
			ifFalse: [ self copyList: self pragmas inContext: aDictionary ]);
		body: (self body copyInContext: aDictionary);
		source: (aDictionary at: '-source-' ifAbsentPut: [ self source ]);
		yourself
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBMethodNode>>defines: aName [
^ (arguments anySatisfy: [ :each | each name = aName ])

		or: [ self pragmas anySatisfy: [ :pragma | pragma defines: aName ] ]
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBMethodNode>>equalTo: anObject withMapping: aDictionary  [
	self class = anObject class ifFalse: [ ^ false ].
	(self selector = anObject selector
		and: [ self pragmas size = anObject pragmas size
		and: [ self body equalTo: anObject body withMapping: aDictionary ] ]) 
			ifFalse: [ ^ false ].
	self arguments with: anObject arguments do: [ :first :second |
		(first equalTo: second	withMapping: aDictionary)
			ifFalse: [ ^ false ].
		aDictionary removeKey: first name ].
	self pragmas with: anObject pragmas do: [ :first :second |
		(first equalTo: second	withMapping: aDictionary) 
			ifFalse: [ ^ false ] ].
	^ true
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBMethodNode>>firstPrecodeComment [
	| comment  | 
	self comments ifEmpty: [ ^nil ].
	comment :=  self comments first.
	^self source copyFrom: comment start to: comment stop.
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBMethodNode>>hasArgumentNamed: aString	 [
	^ self arguments anySatisfy: [ :argument| argument name = aString ]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBMethodNode>>hasPragmaNamed: aSymbol	 [
	self pragmaNamed: aSymbol ifAbsent: [ ^ false ].
	^ true
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBMethodNode>>hasTemporaryNamed: aString	 [
	^ self temporaries anySatisfy: [ :temp| temp name = aString ]
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBMethodNode>>hash [
	^ ((self selector hash bitXor: (self hashForCollection: self arguments)) bitXor: (self hashForCollection: self pragmas)) bitXor: self body hash
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBMethodNode>>initialize [
	replacements := SortedCollection sortBlock: 
					[:a :b | 
					a startPosition < b startPosition 
						or: [a startPosition = b startPosition and: [a stopPosition < b stopPosition]]].
	nodeReplacements := IdentityDictionary new
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBMethodNode>>instanceVariableReadNodes [
		^self variableReadNodes select: [:each | each isInstance]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBMethodNode>>instanceVariableWriteNodes [
		^self variableWriteNodes select: [:each | each isInstance]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBMethodNode>>isFaulty [
	(self arguments anySatisfy: #isFaulty) ifTrue:[ ^true].
	(self pragmas anySatisfy: #isFaulty) ifTrue:[ ^true].
	^self body isFaulty
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBMethodNode>>isLast: aNode  [
	^body isLast: aNode
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBMethodNode>>isMethod [
	^true
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBMethodNode>>isPrimitive [
	^ self pragmas anySatisfy: [ :each | each isPrimitive ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBMethodNode>>keywords [
	^ selector keywords.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBMethodNode>>keywordsIntervals [
	^selector keywords
		with: self keywordsPositions 
		collect: [:keyword :start| start to: (start = 0 ifTrue: [ -1 ] ifFalse: [ start + keyword size - 1]) ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBMethodNode>>keywordsPositions [
	^keywordsPositions ifNil: [ (selector keywords collect: [:char| 0 ]) asIntegerArray ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBMethodNode>>keywordsPositions: aPositionsList [
	keywordsPositions := aPositionsList ifNotNil: [:list| list asIntegerArray ]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBMethodNode>>lastIsReturn [
	^body lastIsReturn
]

{
	#category : #replacing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBMethodNode>>map: oldNode to: newNode  [
	nodeReplacements at: oldNode put: newNode
]

{
	#category : #replacing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBMethodNode>>mappingFor: oldNode  [
	^nodeReplacements at: oldNode ifAbsent: [oldNode]
]

{
	#category : #matching,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBMethodNode>>match: aNode inContext: aDictionary  [
	self class = aNode class ifFalse: [ ^ false ].
	aDictionary at: '-source-' put: aNode source.
	self selector = aNode selector ifFalse: [ ^ false ].
	^ (self matchList: arguments against: aNode arguments inContext: aDictionary)
		and: [ (self matchPragmas: self pragmas against: aNode pragmas inContext: aDictionary)
		and: [ body match: aNode body inContext: aDictionary ] ]
]

{
	#category : #matching,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBMethodNode>>matchPragmas: matchNodes against: pragmaNodes inContext: aDictionary [
	matchNodes isEmpty ifTrue: [ 
		aDictionary at: '-pragmas-' put: pragmaNodes.
		^ true ].
	^ matchNodes allSatisfy: [ :matchNode |
		pragmaNodes anySatisfy: [ :pragmaNode |
			matchNode match: pragmaNode inContext: aDictionary ] ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBMethodNode>>methodClass [
	^self compilationContext getClass 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBMethodNode>>methodClass: aClass	 [
	compilationContext ifNil: [compilationContext := aClass compiler compilationContext].
	self compilationContext class: aClass
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBMethodNode>>methodComments [
	| methodComments |
	methodComments := OrderedCollection withAll: self comments.
	arguments do: [:each | methodComments addAll: each comments].
	^methodComments asSortedCollection: [:a :b | a start < b start]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBMethodNode>>methodNode [
	^self
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBMethodNode>>newSource [
	replacements ifNil: [^self formattedCode].
	^[self reformatSource] on: Error do: [:ex | ex return: self formattedCode]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBMethodNode>>numArgs [
	^self selector numArgs
]

{
	#category : #copying,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBMethodNode>>postCopy [
	super postCopy.
	self arguments: (self arguments collect: [ :each | each copy ]).
	self pragmas: (self pragmas collect: [ :each | each copy ]).
	self body: self body copy
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBMethodNode>>pragmaNamed: aSymbol	 [
	^ self pragmaNamed: aSymbol ifAbsent: [ KeyNotFound signalFor: aSymbol  ]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBMethodNode>>pragmaNamed: aSymbol ifAbsent: absentBlock [
	^ self pragmas 
		detect: [ :pragma| pragma selector = aSymbol ]
		ifNone: absentBlock
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBMethodNode>>pragmaNamed: aSymbol ifPresent: foundBlock [
	^ self pragmas 
		detect: [ :pragma| pragma selector = aSymbol ]
		ifFound: foundBlock
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBMethodNode>>pragmas [
	^ pragmas ifNil: [ #() ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBMethodNode>>pragmas: aCollection [
	pragmas := aCollection.
	pragmas do: [ :each | each parent: self ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBMethodNode>>primitiveSources [
	^ self pragmas collect: [ :each | self source copyFrom: each first to: each last ]
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBMethodNode>>printOn: aStream  [
	aStream nextPutAll: self formattedCode
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBMethodNode>>references: aVariableName  [
	^body references: aVariableName
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBMethodNode>>reformatSource [
	| stream newSource newTree |
	stream := (String new: source size + 100) writeStream.
	stream
		nextPutAll: (source
			copyFrom: (replacements
				inject: 1
				into: [ :sum :each | 
					stream
						nextPutAll: (source copyFrom: sum to: each startPosition - 1);
						nextPutAll: (each string).
					each stopPosition + 1 ])
			to: source size).
	newSource := stream contents.
	newTree := RBParser 
		parseMethod: newSource 
		onError: [ :msg :pos | ^ self formattedCode ].
	self = newTree
		ifFalse: [ ^ self formattedCode ].
	^ newSource
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBMethodNode>>renameSelector: newSelector andArguments: varNodeCollection  [
	| oldIntervals oldArguments oldSelector |
	oldSelector := selector.
	oldIntervals := self keywordsIntervals.
	oldArguments := arguments.
	self
		arguments: varNodeCollection;
		selector: newSelector.
	self changeSourceSelector: oldSelector keywordsIntervals: oldIntervals arguments: oldArguments
]

{
	#category : #replacing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBMethodNode>>replaceNode: aNode withNode: anotherNode  [
	aNode == body ifTrue: [self body: anotherNode].
	self arguments: (arguments 
				collect: [:each | each == aNode ifTrue: [anotherNode] ifFalse: [each]])
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBMethodNode>>scope [
	^ scope
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBMethodNode>>scope: aScopedNode [
	scope := aScopedNode
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBMethodNode>>selector [
	^ selector
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBMethodNode>>selector: aSelector [
	keywordsPositions := nil.
	selector := aSelector asSymbol.
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBMethodNode>>selector: aSymbol keywordsPositions: positionList arguments: valueNodes [
	self 
		arguments: valueNodes;
		selector: aSymbol;
		keywordsPositions: positionList.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBMethodNode>>selectorAndArgumentNames [
	"Returns the selector and argument names portion of a method as a string"

	^ self arguments
		ifEmpty: [self keywords first]
		ifNotEmpty: [| lastArgument |
			lastArgument := self arguments last.
			self source first: lastArgument start + (lastArgument name size - 1)]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBMethodNode>>selectorParts [
	^ self keywords collect: #asSymbol.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBMethodNode>>sendNodes [
	^self allChildren select: [:each | each isMessage].
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBMethodNode>>source [
	^source
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBMethodNode>>source: anObject [
	source := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBMethodNode>>sourceCode [
	"compatibility to MethodNode"
	^source
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBMethodNode>>start [
	^ 1
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBMethodNode>>statements [
	^ self body statements
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBMethodNode>>statements: aCollection [
	self body statements: aCollection 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBMethodNode>>stop [
	^ self newSource size
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBMethodNode>>tempVariableReadNodes [
		^self variableReadNodes select: [:each | each isTemp]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBMethodNode>>temporaries [
	^ self body temporaries
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBMethodNode>>temporaryNames [
	^ self body temporaryNames
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBMethodNode>>uses: aNode  [
	^body == aNode and: [aNode lastIsReturn]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBMethodNode>>variableNodes [
		^self allChildren select: [:each | 
			each isVariable and: [each isDefinition not]].
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBMethodNode>>variableReadNodes [
	^self variableNodes select: [:each | each isRead]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBMethodNode>>variableWriteNodes [
		^self variableNodes select: [:each | each isWrite]
]
