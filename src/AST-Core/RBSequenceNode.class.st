"
RBSequenceNode is an AST node that represents a sequence of statements. Both RBBlockNodes and RBMethodNodes contain these.

Instance Variables:
	leftBar	<Integer | nil>	the position of the left | in the temporaries definition
	rightBar	<Integer | nil>	the position of the right | in the temporaries definition
	statements	<SequenceableCollection of: RBStatementNode>	the statement nodes
	periods	<SequenceableCollection of: Integer>	the positions of all the periods that separate the statements
	temporaries	<SequenceableCollection of: RBVariableNode>	the temporaries defined


"
Class {
	#name : #RBSequenceNode,
	#superclass : #RBProgramNode,
	#instVars : [
		'leftBar',
		'rightBar',
		'statements',
		'periods',
		'temporaries'
	],
	#category : #AST-Core-Nodes,
	#timestamp : 'NicolaiHess 8/2/2016 13:33'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:40'
}
RBSequenceNode class>>leftBar: leftInteger temporaries: variableNodes rightBar: rightInteger  [
	^(self new)
		leftBar: leftInteger
			temporaries: variableNodes
			rightBar: rightInteger;
		yourself
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:40'
}
RBSequenceNode class>>statements: statementNodes  [
	^self temporaries: #() statements: statementNodes
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:40'
}
RBSequenceNode class>>temporaries: variableNodes statements: statementNodes  [
	^(self new)
		temporaries: variableNodes;
		statements: statementNodes;
		yourself
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBSequenceNode>>= anObject  [
	"Can't send = to the temporaries and statements collection since they might change from arrays to OCs"

	self == anObject ifTrue: [^true].
	self class = anObject class ifFalse: [^false].
	self temporaries size = anObject temporaries size ifFalse: [^false].
	self temporaries
		with: anObject temporaries
		do: [:first :second | first = second ifFalse: [^false]].
	self statements size = anObject statements size ifFalse: [^false].
	self statements
		with: anObject statements
		do: [:first :second | first = second ifFalse: [^false]].
	^true
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBSequenceNode>>acceptVisitor: aProgramNodeVisitor  [
	^aProgramNodeVisitor visitSequenceNode: self
]

{
	#category : #'adding nodes',
	#timestamp : ' 8/31/2017 07:16:40'
}
RBSequenceNode>>addFaultyNode: aNode [
"just like addNode, but ignore if we already include a return node, as we are faulty"
	aNode parent: self.
	statements := statements asOrderedCollection
		add: aNode;
		yourself.
	^ aNode
]

{
	#category : #'adding nodes',
	#timestamp : ' 8/31/2017 07:16:40'
}
RBSequenceNode>>addNode: aNode [
	aNode parent: self.
	(statements notEmpty and: [ statements last isReturn ])
		ifTrue: [ self error: 'Cannot add statement after return node' ].
	statements := statements asOrderedCollection
		add: aNode;
		yourself.
	^ aNode
]

{
	#category : #'adding nodes',
	#timestamp : ' 8/31/2017 07:16:40'
}
RBSequenceNode>>addNode: aNode before: anotherNode [
	| index |
	index := self indexOfNode: anotherNode.
	index = 0
		ifTrue: [ ^ self addNode: aNode ].
	statements := statements asOrderedCollection
		add: aNode beforeIndex: index;
		yourself.
	aNode parent: self.
	^ aNode
]

{
	#category : #'adding nodes',
	#timestamp : ' 8/31/2017 07:16:40'
}
RBSequenceNode>>addNodeFirst: aNode [
	aNode parent: self.
	statements := statements asOrderedCollection
		addFirst: aNode;
		yourself.
	^ aNode
]

{
	#category : #'adding nodes',
	#timestamp : ' 8/31/2017 07:16:40'
}
RBSequenceNode>>addNodes: aCollection [
	aCollection do: [ :each | each parent: self ].
	(statements notEmpty and: [ statements last isReturn ])
		ifTrue: [ self error: 'Cannot add statement after return node' ].
	statements := statements asOrderedCollection
		addAll: aCollection;
		yourself.
	^ aCollection
]

{
	#category : #'adding nodes',
	#timestamp : ' 8/31/2017 07:16:40'
}
RBSequenceNode>>addNodes: aCollection before: anotherNode [
	aCollection do: [ :each | self addNode: each before: anotherNode ].
	^ aCollection
]

{
	#category : #'adding nodes',
	#timestamp : ' 8/31/2017 07:16:40'
}
RBSequenceNode>>addNodesFirst: aCollection [
	aCollection do: [ :each | each parent: self ].
	statements := statements asOrderedCollection
		addAllFirst: aCollection;
		yourself.
	^ aCollection
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBSequenceNode>>addReturn [
	| node |
	statements isEmpty
		ifTrue: [ ^ nil ].
	statements last isReturn
		ifTrue: [ ^ statements last ].
	node := RBReturnNode value: statements last.
	statements at: statements size put: node.
	node parent: self.
	^ node
]

{
	#category : #'adding nodes',
	#timestamp : ' 8/31/2017 07:16:40'
}
RBSequenceNode>>addSelfReturn [
	| node |
	self lastIsReturn
		ifTrue: [ ^ self statements last ].
	node := RBReturnNode value: (RBVariableNode named: 'self').
	^ self addNode: node
]

{
	#category : #'adding nodes',
	#timestamp : ' 8/31/2017 07:16:40'
}
RBSequenceNode>>addTemporariesNamed: aCollection [
	^ aCollection collect: [ :each | self addTemporaryNamed: each ]
]

{
	#category : #'adding nodes',
	#timestamp : ' 8/31/2017 07:16:40'
}
RBSequenceNode>>addTemporaryNamed: aString  [
	| variableNode |
	variableNode := RBVariableNode named: aString.
	variableNode parent: self.
	temporaries := temporaries copyWith: variableNode.
	^ variableNode
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBSequenceNode>>allDefinedVariables [
	^(self temporaryNames asOrderedCollection)
		addAll: super allDefinedVariables;
		yourself
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBSequenceNode>>allTemporaryVariables [
	^(self temporaryNames asOrderedCollection)
		addAll: super allTemporaryVariables;
		yourself
]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBSequenceNode>>asSequenceNode [
	^self
]

{
	#category : #querying,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBSequenceNode>>bestNodeFor: anInterval  [
	| node |
	node := super bestNodeFor: anInterval.
	node == self 
		ifTrue: 
			[(temporaries isEmpty and: [statements size == 1]) 
				ifTrue: [^statements first]].
	^node
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBSequenceNode>>children [
	^(OrderedCollection new)
		addAll: self temporaries;
		addAll: self statements;
		yourself
]

{
	#category : #matching,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBSequenceNode>>copyInContext: aDictionary  [
	^ self class new
		temporaries: (self copyList: self temporaries inContext: aDictionary);
		statements: (self copyList: self statements inContext: aDictionary);
		yourself
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBSequenceNode>>defines: aName  [
	^temporaries anySatisfy: [:each | each name = aName]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBSequenceNode>>directlyUses: aNode  [
	^false
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBSequenceNode>>equalTo: anObject withMapping: aDictionary  [
	self class = anObject class ifFalse: [^false].
	self statements size = anObject statements size ifFalse: [^false].
	self statements
		with: anObject statements
		do: [:first :second | (first equalTo: second withMapping: aDictionary) ifFalse: [^false]].
	aDictionary values asSet size = aDictionary size ifFalse: [^false].	"Not a one-to-one mapping"
	self temporaries
		do: [:each | aDictionary removeKey: each name ifAbsent: []].
	^true
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBSequenceNode>>hash [
	^ (self hashForCollection: self temporaries) bitXor: (self hashForCollection: self statements)
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBSequenceNode>>indexOfNode: aNode  [
	"Try to find the node by first looking for ==, and then for ="

	^(1 to: statements size) detect: [:each | (statements at: each) == aNode]
		ifNone: [statements indexOf: aNode]
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBSequenceNode>>initialize [
	super initialize.
	periods := statements := temporaries := #()
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBSequenceNode>>isFaulty [
	^self statements anySatisfy: #isFaulty.
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBSequenceNode>>isLast: aNode  [
	| last |
	statements isEmpty ifTrue: [^false].
	last := statements last.
	^last == aNode or: 
			[last isMessage and: 
					[(#(#ifTrue:ifFalse: #ifFalse:ifTrue:) includes: last selector) 
						and: [last arguments anySatisfy: [:each | each isLast: aNode]]]]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBSequenceNode>>isSequence [
	^true
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBSequenceNode>>lastIsReturn [
	^statements notEmpty and: [statements last lastIsReturn]
]

{
	#category : #accessing-token,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBSequenceNode>>leftBar [
	^ leftBar
]

{
	#category : #accessing-token,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBSequenceNode>>leftBar: anInteger [
	leftBar := anInteger
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBSequenceNode>>leftBar: leftInteger temporaries: variableNodes rightBar: rightInteger  [
	leftBar := leftInteger.
	self temporaries: variableNodes.
	rightBar := rightInteger
]

{
	#category : #matching,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBSequenceNode>>match: aNode inContext: aDictionary  [
	self class = aNode class ifFalse: [^false].
	^(self 
		matchList: temporaries
		against: aNode temporaries
		inContext: aDictionary) and: 
				[self 
					matchList: statements
					against: aNode statements
					inContext: aDictionary]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBSequenceNode>>methodComments [
	| methodComments |
	methodComments := OrderedCollection withAll: self comments.
	temporaries do: [:each | methodComments addAll: each comments].
	(parent notNil and: [parent isBlock]) 
		ifTrue: [parent arguments do: [:each | methodComments addAll: each comments]].
	^methodComments asSortedCollection: [:a :b | a start < b start]
]

{
	#category : #accessing-token,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBSequenceNode>>periods [
	^ periods
]

{
	#category : #accessing-token,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBSequenceNode>>periods: anArray [
	periods := anArray
]

{
	#category : #copying,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBSequenceNode>>postCopy [
	super postCopy.
	self temporaries: (self temporaries collect: [ :each | each copy ]).
	self statements: (self statements collect: [ :each | each copy ])
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBSequenceNode>>references: aVariableName  [
	^statements anySatisfy: [:each | each references: aVariableName]
]

{
	#category : #replacing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBSequenceNode>>removeDeadCode [
	(self isUsed ifTrue: [statements size - 1] ifFalse: [statements size]) 
		to: 1
		by: -1
		do: 
			[:i | 
			(statements at: i) isImmediateNode 
				ifTrue: 
					[self clearReplacements.
					statements removeAt: i]].
	super removeDeadCode
]

{
	#category : #replacing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBSequenceNode>>removeNode: aNode [
	self replaceNode: aNode withNodes: #()
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBSequenceNode>>removeTemporaryNamed: aName  [
	temporaries := temporaries reject: [:each | each name = aName]
]

{
	#category : #replacing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBSequenceNode>>replaceNode: aNode withNode: anotherNode  [
	self statements: (statements 
				collect: [:each | each == aNode ifTrue: [anotherNode] ifFalse: [each]]).
	self temporaries: (temporaries 
				collect: [:each | each == aNode ifTrue: [anotherNode] ifFalse: [each]])
]

{
	#category : #replacing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBSequenceNode>>replaceNode: aNode withNodes: aCollection  [
	| index newStatements |
	self clearReplacements.
	index := self indexOfNode: aNode.
	newStatements := OrderedCollection new: statements size + aCollection size.
	1 to: index - 1 do: [:i | newStatements add: (statements at: i)].
	newStatements addAll: aCollection.
	index + 1 to: statements size
		do: [:i | newStatements add: (statements at: i)].
	aCollection do: [:each | each parent: self].
	statements := newStatements
]

{
	#category : #accessing-token,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBSequenceNode>>rightBar [
	^ rightBar
]

{
	#category : #accessing-token,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBSequenceNode>>rightBar: anInteger [
	rightBar := anInteger
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBSequenceNode>>start [
	^ leftBar 
		ifNil: [statements isEmpty ifTrue: [1] ifFalse: [statements first start]]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBSequenceNode>>statements [
	^statements
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBSequenceNode>>statements: stmtCollection  [
	statements := stmtCollection.
	statements do: [:each | each parent: self]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBSequenceNode>>stop [
	^(periods isEmpty ifTrue: [0] ifFalse: [periods last]) 
		max: (statements isEmpty ifTrue: [0] ifFalse: [statements last stop])
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBSequenceNode>>temporaries [
	^temporaries
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBSequenceNode>>temporaries: tempCollection  [
	temporaries := tempCollection.
	temporaries do: [:each | each parent: self]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBSequenceNode>>temporaryNames [
	^temporaries collect: [:each | each name]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBSequenceNode>>temporaryVariables [
	^(super temporaryVariables asOrderedCollection)
		addAll: self temporaryNames;
		yourself
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBSequenceNode>>uses: aNode  [
	statements isEmpty ifTrue: [^false].
	aNode == statements last ifFalse: [^false].
	^self isUsed
]

{
	#category : #querying,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBSequenceNode>>whichNodeIsContainedBy: anInterval  [
	| node |
	node := super whichNodeIsContainedBy: anInterval.
	node == self 
		ifTrue: 
			[(temporaries isEmpty and: [statements size == 1]) 
				ifTrue: [^statements first]].
	^node
]
