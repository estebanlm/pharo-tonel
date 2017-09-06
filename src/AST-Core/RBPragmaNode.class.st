"
RBPragmaNode is an AST node that represents a method pragma.

We have a fixed set of allowed ""primitive"" pragma keywords. Every method implemented as a primitive call uses one of this pragmas.
And as we need some special treatment for methods implemented as primitive, the RBPragmaNode adds the #isPrimitive testing method.

Instance Variables:
	arguments <SequenceableCollection of: RBLiteralNode> our argument nodes
	left <Integer | nil> position of <
	right <Integer | nil> position of >
	selector	<Symbol>	the selector we're sending
	keywordsPositions	<IntegerArray | nil>	the positions of the selector keywords
"
Class {
	#name : #RBPragmaNode,
	#superclass : #RBProgramNode,
	#instVars : [
		'selector',
		'keywordsPositions',
		'arguments',
		'left',
		'right'
	],
	#category : #AST-Core-Nodes,
	#timestamp : 'NicolaiHess 8/2/2016 13:32'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:40'
}
RBPragmaNode class>>selector: aSymbol arguments: valueNodes [
	^ self selector: aSymbol keywordsPositions: nil arguments: valueNodes 
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:40'
}
RBPragmaNode class>>selector: aSymbol keywordsPositions: positionList arguments: valueNodes [
	^ self new selector: aSymbol keywordsPositions: positionList arguments: valueNodes 
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBPragmaNode>>= anObject  [
	self == anObject ifTrue: [^true].
	self class = anObject class ifFalse: [^false].
	self selector = anObject selector ifFalse: [^false].
	self arguments size = anObject arguments size ifFalse: [^false].
	self arguments
		with: anObject arguments
		do: [:first :second | first = second ifFalse: [^false]].
	^true
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBPragmaNode>>acceptVisitor: aProgramNodeVisitor  [
	^ aProgramNodeVisitor visitPragmaNode: self
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBPragmaNode>>argumentAt: keywordSelector [
	^ self 
		argumentAt: keywordSelector
		ifAbsent: [ KeyNotFound signalFor: keywordSelector ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBPragmaNode>>argumentAt: keywordSelector ifAbsent: absentBlock [
	self selectorParts with: self arguments do: [ :selectorPart :argument |
		selectorPart value = keywordSelector
			ifTrue: [ ^ argument ]].
	^ absentBlock value
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBPragmaNode>>arguments [
	^ arguments ifNil: [ #() ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBPragmaNode>>arguments: aLiteralCollection  [
	arguments := aLiteralCollection.
	arguments do: [ :each | each parent: self ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBPragmaNode>>children [
	^ self arguments
]

{
	#category : #matching,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBPragmaNode>>copyInContext: aDictionary  [
	^ self class
		selector: self selector
		arguments: (self arguments collect: [ :each | each copyInContext: aDictionary ])
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBPragmaNode>>defines: aName [
	^ self isPrimitive and: [ arguments anySatisfy: [ :each | each value = aName ] ]
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBPragmaNode>>equalTo: anObject withMapping: aDictionary  [
	self class = anObject class ifFalse: [ ^ false ].
	self selector = anObject selector ifFalse: [ ^ false ].
	self arguments size = anObject arguments size ifFalse: [ ^ false ].
	self arguments with: anObject arguments do: [ :first :second |
		(first equalTo: second withMapping: aDictionary) 
			ifFalse: [ ^ false ] ].
	^ true
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBPragmaNode>>hash [
	^ self selector hash bitXor: (self hashForCollection: self arguments)
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBPragmaNode>>initialize [

	super initialize.

	arguments := #().
	keywordsPositions := #().
	left := 0.
	right := 0.
	selector := nil.
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBPragmaNode>>isBinary [
	^ (self isUnary or: [self isKeyword]) not
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBPragmaNode>>isFaulty [
	^self arguments anySatisfy: #isFaulty.
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBPragmaNode>>isKeyword [
	^(selector indexOf: $:) ~= 0.
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBPragmaNode>>isPragma [
	^ true
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBPragmaNode>>isPrimitive [
	^ #(primitive: primitive:error: primitive:error:module: primitive:module: primitive:module:error:) includes: self selector
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBPragmaNode>>isUnary [
	^ arguments isEmpty
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBPragmaNode>>keywordsIntervals [
	^selector keywords
		with: self keywordsPositions 
		collect: [:keyword :start| start to: (start = 0 ifTrue: [ -1 ] ifFalse: [ start + keyword size - 1]) ].
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBPragmaNode>>keywordsPositions [
	^keywordsPositions ifNil: [ (selector keywords collect: [:char| 0 ]) asIntegerArray ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBPragmaNode>>keywordsPositions: aPositionsList [
	keywordsPositions := aPositionsList ifNotNil: [:list| list asIntegerArray ].
]

{
	#category : #accessing-token,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBPragmaNode>>left [
	^ left
]

{
	#category : #accessing-token,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBPragmaNode>>left: anInteger [
	left := anInteger
]

{
	#category : #matching,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBPragmaNode>>match: aNode inContext: aDictionary  [
	aNode class = self class
		ifFalse: [ ^ false ].
	self selector = aNode selector
		ifFalse: [ ^ false ].
	self arguments with: aNode arguments do: [ :first :second |
		(first match: second inContext: aDictionary)
			ifFalse: [ ^ false ] ].
	^ true
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBPragmaNode>>numArgs [
	^ self selector numArgs
]

{
	#category : #copying,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBPragmaNode>>postCopy [
	super postCopy.
	self arguments: (self arguments collect: [ :each | each copy ])
]

{
	#category : #replacing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBPragmaNode>>replaceNode: aNode withNode: anotherNode  [
	self arguments: (arguments collect: [ :each | 
		each == aNode 
			ifTrue: [ anotherNode ]
			ifFalse: [ each ] ])
]

{
	#category : #accessing-token,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBPragmaNode>>right [
	^ right
]

{
	#category : #accessing-token,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBPragmaNode>>right: anInteger [
	right := anInteger
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBPragmaNode>>selector [
	^ selector
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBPragmaNode>>selector: aSelector  [
	keywordsPositions := nil.
	selector := aSelector asSymbol.
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBPragmaNode>>selector: aSymbol keywordsPositions: positionList arguments: valueNodes [
	aSymbol numArgs == valueNodes size
		ifFalse: 
			[self error: 'Attempting to assign selector with wrong number of arguments.'].

	self 
		arguments: valueNodes;
		selector: aSymbol;
		keywordsPositions: positionList.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBPragmaNode>>selectorParts [
	^ selector keywords collect: [:keyword| keyword asSymbol ].
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBPragmaNode>>sentMessages [
	^ super sentMessages
		add: self selector;
		yourself
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBPragmaNode>>start [
	^ left
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBPragmaNode>>stop [
	^ right
]
