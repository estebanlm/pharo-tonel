"
A RBArrayNode is an AST node for runtime arrays.

Instance Variables
	left:	 <Integer | nil> position of {
	periods: <SequenceableCollection of: Integer> the positions of all the periods that separate the statements
	right: <Integer | nil> position of }
	statements: <SequenceableCollection of: RBStatementNode> the statement nodes
"
Class {
	#name : #RBArrayNode,
	#superclass : #RBValueNode,
	#instVars : [
		'left',
		'right',
		'statements',
		'periods'
	],
	#category : #AST-Core-Nodes,
	#timestamp : '<historical>'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:40'
}
RBArrayNode class>>statements: statements [
	^ self new statements: statements
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBArrayNode>>= anObject  [
	self == anObject ifTrue: [ ^ true ].
	self class = anObject class ifFalse: [ ^ false ].
	self statements size = anObject statements size ifFalse: [ ^ false ].
	self statements with: anObject statements do: [ :first :second | first = second ifFalse: [ ^ false ] ].
	^ true
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBArrayNode>>acceptVisitor: aProgramNodeVisitor [
	^ aProgramNodeVisitor visitArrayNode: self
]

{
	#category : #'adding nodes',
	#timestamp : ' 8/31/2017 07:16:40'
}
RBArrayNode>>addNode: aNode [
	statements := statements asOrderedCollection
		add: aNode;
		yourself.
	aNode parent: self.
	^ aNode
]

{
	#category : #'adding nodes',
	#timestamp : ' 8/31/2017 07:16:40'
}
RBArrayNode>>addNode: aNode before: anotherNode  [
	| index |
	aNode isReturn 
		ifTrue: [ self error: 'Cannot add return node' ].
	index := self indexOfNode: anotherNode.
	index = 0 ifTrue: [ ^ self addNode: aNode ].
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
RBArrayNode>>addNodeFirst: aNode [
	statements := statements asOrderedCollection
		addFirst: aNode;
		yourself.
	aNode parent: self.
	^ aNode
]

{
	#category : #'adding nodes',
	#timestamp : ' 8/31/2017 07:16:40'
}
RBArrayNode>>addNodes: aCollection [
	statements := statements asOrderedCollection
		addAll: aCollection;
		yourself.
	aCollection do: [ :each | each parent: self ].
	^ aCollection
]

{
	#category : #'adding nodes',
	#timestamp : ' 8/31/2017 07:16:40'
}
RBArrayNode>>addNodes: aCollection before: anotherNode  [
	aCollection do: [ :each | self addNode: each before: anotherNode ].
	^ aCollection
]

{
	#category : #'adding nodes',
	#timestamp : ' 8/31/2017 07:16:40'
}
RBArrayNode>>addNodesFirst: aCollection [
	statements := statements asOrderedCollection
		addAllFirst: aCollection;
		yourself.
	aCollection do: [ :each | each parent: self ].
	^ aCollection
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBArrayNode>>children [
	^ self statements
]

{
	#category : #matching,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBArrayNode>>copyInContext: aDictionary  [
	^ self class statements: (self copyList: self statements inContext: aDictionary)
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBArrayNode>>equalTo: anObject withMapping: aDictionary  [
	self class = anObject class 
		ifFalse: [ ^ false ].
	self statements size = anObject statements size 
		ifFalse: [ ^ false ].
	self statements with: anObject statements do: [ :first :second |
		(first equalTo: second withMapping: aDictionary)
			ifFalse: [ ^ false ] ].
	aDictionary values asSet size = aDictionary size 
		ifFalse: [ ^ false ].
	^ true
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBArrayNode>>hash [
	^ self hashForCollection: self statements
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBArrayNode>>indexOfNode: aNode  [
	"Try to find the node by first looking for ==, and then for ="

	^ (1 to: statements size) 
		detect: [ :each | (statements at: each) == aNode ]
		ifNone: [ statements indexOf: aNode ]
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBArrayNode>>initialize [
	super initialize.
	statements := periods := #().
	left := right := 0.
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBArrayNode>>isDynamicArray [
	^ true
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBArrayNode>>isFaulty [
	^self statements anySatisfy: #isFaulty
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBArrayNode>>lastIsReturn [
	statements isEmpty ifTrue:[ ^false ].
	^statements last lastIsReturn
]

{
	#category : #accessing-token,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBArrayNode>>left [
	^ left
]

{
	#category : #accessing-token,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBArrayNode>>left: anInteger [
	left := anInteger
]

{
	#category : #matching,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBArrayNode>>match: aNode inContext: aDictionary  [
	aNode class = self class ifFalse: [ ^ false ].
	^ self matchList: statements against: aNode statements inContext: aDictionary
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBArrayNode>>needsParenthesis [
	^ false
]

{
	#category : #accessing-token,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBArrayNode>>periods [
	^ periods
]

{
	#category : #accessing-token,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBArrayNode>>periods: anArray [
	periods := anArray
]

{
	#category : #copying,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBArrayNode>>postCopy [
	super postCopy.
	self statements: (self statements collect: [ :each | each copy ])
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBArrayNode>>precedence [
	^0
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBArrayNode>>references: aVariableName  [
	^ statements anySatisfy: [ :each | each references: aVariableName ]
]

{
	#category : #replacing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBArrayNode>>replaceNode: oldNode  withNode: newNode [
	self statements: (statements collect: [ :statement |
		statement == oldNode 
			ifTrue: [ newNode ]
			ifFalse: [ statement ] ])
]

{
	#category : #accessing-token,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBArrayNode>>right [
	^ right
]

{
	#category : #accessing-token,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBArrayNode>>right: anInteger [
	right := anInteger
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBArrayNode>>startWithoutParentheses  [
	^ left
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBArrayNode>>statementComments [
	^self comments
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBArrayNode>>statements [
	^statements
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBArrayNode>>statements: statements0  [
	statements := statements0.
	statements do: [:statement | statement parent: self]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBArrayNode>>stopWithoutParentheses  [
	^ right
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBArrayNode>>uses: aNode  [
	^ (statements anySatisfy: [ :each | each == aNode ]) or: [ self isUsed ]
]
