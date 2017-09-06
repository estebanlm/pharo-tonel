"
RBBlockNode is an AST node that represents a block ""[...]"".

Like RBMethodNode, the scope attribute is only valid after doing a semantic analyzing step.

Instance Variables:
	arguments	<SequenceableCollection of: RBVariableNode>	the arguments for the block
	bar	<Integer | nil>	position of the | after the arguments
	body	<RBSequenceNode>	the code inside the block
	colons	<SequenceableCollection of: Integer>	positions of each : before each argument
	left	<Integer>	position of [
	right	<Integer>	position of ]
	scope	<OCBlockScope | OCOptimizedBlockScope | nil> the scope associated with this code of this block


"
Class {
	#name : #RBBlockNode,
	#superclass : #RBValueNode,
	#instVars : [
		'left',
		'right',
		'colons',
		'arguments',
		'bar',
		'body',
		'scope'
	],
	#category : #AST-Core-Nodes,
	#timestamp : 'NicolaiHess 8/2/2016 13:37'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:40'
}
RBBlockNode class>>arguments: argNodes body: sequenceNode  [
	^(self new)
		arguments: argNodes;
		body: sequenceNode;
		yourself
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:40'
}
RBBlockNode class>>body: sequenceNode  [
	^self arguments: #() body: sequenceNode
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBBlockNode>>= anObject  [
	self == anObject ifTrue: [^true].
	self class = anObject class ifFalse: [^false].
	self body = anObject body ifFalse: [^false].
	self arguments size = anObject arguments size ifFalse: [^false].
	self arguments with: anObject arguments do: [:first :second | first = second ifFalse: [^false]].
	^true
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBBlockNode>>acceptVisitor: aProgramNodeVisitor  [
	^aProgramNodeVisitor visitBlockNode: self
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBBlockNode>>allArgumentVariables [
	^(self argumentNames asOrderedCollection)
		addAll: super allArgumentVariables;
		yourself
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBBlockNode>>allDefinedVariables [
	^(self argumentNames asOrderedCollection)
		addAll: super allDefinedVariables;
		yourself
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBBlockNode>>argumentNames [
	^ self arguments collect: [:each | each name] as: Array 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBBlockNode>>arguments [
	^arguments
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBBlockNode>>arguments: argCollection  [
	arguments := argCollection.
	arguments do: [:each | each parent: self]
]

{
	#category : #accessing-token,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBBlockNode>>bar [
	^ bar
]

{
	#category : #accessing-token,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBBlockNode>>bar: anInteger [
	bar := anInteger
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBBlockNode>>blockVariables [
	| vars |
	vars := super blockVariables asOrderedCollection.
	vars addAll: self argumentNames.
	^vars
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBBlockNode>>body [
	^body
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBBlockNode>>body: stmtsNode  [
	body := stmtsNode.
	body parent: self
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBBlockNode>>children [
	^self arguments copyWith: self body
]

{
	#category : #accessing-token,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBBlockNode>>colons [
	^ colons
]

{
	#category : #accessing-token,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBBlockNode>>colons: anArray  [
	colons := anArray
]

{
	#category : #matching,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBBlockNode>>copyInContext: aDictionary  [
	^ self class new
		arguments: (self copyList: self arguments inContext: aDictionary);
		body: (self body copyInContext: aDictionary);
		yourself
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBBlockNode>>defines: aName  [
	^arguments anySatisfy: [:each | each name = aName]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBBlockNode>>directlyUses: aNode  [
	^false
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBBlockNode>>equalTo: anObject withMapping: aDictionary  [
	self class = anObject class ifFalse: [^false].
	self arguments size = anObject arguments size ifFalse: [^false].
	self arguments
		with: anObject arguments
		do: [:first :second |	(first equalTo: second withMapping: aDictionary) ifFalse: [^false]].
	(self body equalTo: anObject body withMapping: aDictionary)
		ifFalse: [^false].
	self arguments do: [:each | aDictionary removeKey: each name].
	^true
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBBlockNode>>hasArgumentNamed: aString	 [
	^ self arguments anySatisfy: [ :argument| argument name = aString ]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBBlockNode>>hasTemporaryNamed: aString	 [
	^ self temporaries anySatisfy: [ :temp| temp name = aString ]
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBBlockNode>>hash [
	^ (self hashForCollection: self arguments) bitXor: self body hash
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBBlockNode>>initialize [

	super initialize.

	arguments := #().
	bar := nil.
	body := nil.
	colons := #().
	left := 0.
	right := 0.
	scope := nil.
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBBlockNode>>isBlock [
	^true
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBBlockNode>>isFaulty [
	^(self arguments anySatisfy:  #isFaulty ) or: [ self body isFaulty]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBBlockNode>>isImmediateNode [
	^true
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBBlockNode>>isLast: aNode  [
	^body isLast: aNode
]

{
	#category : #accessing-token,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBBlockNode>>left [
	^ left
]

{
	#category : #accessing-token,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBBlockNode>>left: anInteger [
	left := anInteger
]

{
	#category : #matching,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBBlockNode>>match: aNode inContext: aDictionary  [
	aNode class = self class ifFalse: [^false].
	^(self 
		matchList: arguments
		against: aNode arguments
		inContext: aDictionary) 
			and: [body match: aNode body inContext: aDictionary]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBBlockNode>>needsParenthesis [
	^false
]

{
	#category : #copying,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBBlockNode>>postCopy [
	super postCopy.
	self arguments: (self arguments collect: [ :each | each copy ]).
	self body: self body copy
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBBlockNode>>precedence [
	^0
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBBlockNode>>references: aVariableName  [
	^body references: aVariableName
]

{
	#category : #replacing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBBlockNode>>replaceNode: aNode withNode: anotherNode  [
	body == aNode ifTrue: [self body: anotherNode].
	self arguments: (arguments 
				collect: [:each | each == aNode ifTrue: [anotherNode] ifFalse: [each]])
]

{
	#category : #accessing-token,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBBlockNode>>right [
	^ right
]

{
	#category : #accessing-token,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBBlockNode>>right: anInteger [
	right := anInteger
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBBlockNode>>scope [
	^ scope
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBBlockNode>>scope: aScopedNode [
	scope := aScopedNode
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBBlockNode>>startWithoutParentheses [
	^ left
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBBlockNode>>statementComments [
	"this is used for formatting comments for this node as a statement, but I don't have a single statement comment, my comments are place within the block code"

	^ ''
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBBlockNode>>statements [
	^ self body statements
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBBlockNode>>stopWithoutParentheses [
	^ right
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBBlockNode>>temporaries [
	^ self body temporaries
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBBlockNode>>temporaryNames [
	^ self body temporaryNames
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBBlockNode>>uses: aNode  [
	aNode = body ifFalse: [^false].
	^parent isMessage 
		ifTrue: 
			[(#(#ifTrue:ifFalse: #ifTrue: #ifFalse: #ifFalse:ifTrue:) 
				includes: parent selector) not 
				or: [parent isUsed]]
		ifFalse: [self isUsed]
]
