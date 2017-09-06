"
RBMessageNode is an AST node that represents a message send.

Instance Variables:
	arguments	<SequenceableCollection of: RBValueNode>	 our argument nodes
	receiver	<RBValueNode>	the receiver's node
	selector	<Symbol>	the selector we're sending
	keywordsPositions	<IntegerArray | nil>	the positions of the selector keywords


"
Class {
	#name : #RBMessageNode,
	#superclass : #RBValueNode,
	#instVars : [
		'receiver',
		'selector',
		'keywordsPositions',
		'arguments'
	],
	#category : #AST-Core-Nodes,
	#timestamp : 'NicolaiHess 8/2/2016 14:11'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:40'
}
RBMessageNode class>>receiver: aValueNode selector: aSelector  [
	^self 
		receiver: aValueNode
		selector: aSelector
		arguments: #()
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:40'
}
RBMessageNode class>>receiver: aValueNode selector: aSelector arguments: valueNodes  [
	^self
		receiver: aValueNode
		selector: aSelector
		keywordsPositions: nil
		arguments: valueNodes.
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:40'
}
RBMessageNode class>>receiver: aValueNode selector: aSelector keywordsPositions: positionList arguments: valueNodes [
	^(self new)
		receiver: aValueNode
			selector: aSelector
			keywordsPositions: positionList 
			arguments: valueNodes;
		yourself.
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBMessageNode>>= anObject  [
	self == anObject ifTrue: [^true].
	self class = anObject class ifFalse: [^false].
	(self receiver = anObject receiver 
		and: [self selector = anObject selector]) ifFalse: [^false].
	self arguments
		with: anObject arguments
		do: [:first :second | first = second ifFalse: [^false]].
	^true
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBMessageNode>>acceptVisitor: aProgramNodeVisitor  [
	^aProgramNodeVisitor visitMessageNode: self
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBMessageNode>>arguments [
	^arguments ifNil: [#()] ifNotNil: [arguments]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBMessageNode>>arguments: argCollection  [
	arguments := argCollection.
	arguments do: [:each | each parent: self]
]

{
	#category : #querying,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBMessageNode>>bestNodeFor: anInterval  [
	(self intersectsInterval: anInterval) ifFalse: [^nil].
	(self containedBy: anInterval) ifTrue: [^self].
	self keywordsIntervals do:
			[:each | 
			((each rangeIncludes: anInterval first) 
				or: [anInterval rangeIncludes:  each first]) 
					ifTrue: [^self]].
	self children do: 
			[:each | 
			| node |
			node := each bestNodeFor: anInterval.
			node notNil ifTrue: [^node]]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBMessageNode>>children [
	^(OrderedCollection with: self receiver)
		addAll: self arguments;
		yourself
]

{
	#category : #matching,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBMessageNode>>copyInContext: aDictionary  [
	^self class
		receiver: (self receiver copyInContext: aDictionary)
		selector: self selector
		arguments: (self arguments collect: [ :each | each copyInContext: aDictionary ]).
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBMessageNode>>debugHighlightStart [

	^ self  keywordsPositions first
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBMessageNode>>debugHighlightStop [

	^ self stopWithoutParentheses
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBMessageNode>>equalTo: anObject withMapping: aDictionary  [
	self class = anObject class ifFalse: [^false].
	((self receiver equalTo: anObject receiver withMapping: aDictionary)
		and: [self selector = anObject selector]) ifFalse: [^false].
	self arguments
		with: anObject arguments
		do: [:first :second | (first equalTo: second withMapping: aDictionary) ifFalse: [^false]].
	^true
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBMessageNode>>hash [
	^ (self receiver hash bitXor: self selector hash) bitXor: (self hashForCollection: self arguments)
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBMessageNode>>isBinary [
	^(self isUnary or: [self isKeyword]) not
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBMessageNode>>isCascaded [
	^parent notNil and: [parent isCascade]
]

{
	#category : #private-replacing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBMessageNode>>isContainmentReplacement: aNode  [
	^(self mappingFor: self receiver) = aNode 
		or: [self arguments anySatisfy: [:each | (self mappingFor: each) = aNode]]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBMessageNode>>isFaulty [
	^self receiver isFaulty or: [self arguments anySatisfy: #isFaulty]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBMessageNode>>isFirstCascaded [
	^self isCascaded and: [parent messages first == self]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBMessageNode>>isKeyword [
	^(selector indexOf: $:) ~= 0.
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBMessageNode>>isMessage [
	^true
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBMessageNode>>isSelfSend [
	^ self receiver isVariable and: [ self receiver name = 'self' ]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBMessageNode>>isSuperSend [
	^ self receiver isVariable and: [ self receiver name = 'super' ]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBMessageNode>>isUnary [
	^arguments isEmpty
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBMessageNode>>keywords [
	^ selector keywords.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBMessageNode>>keywordsIntervals [
	^ selector keywords
		with: self keywordsPositions 
		collect: [ :keyword :start | start to: (start == 0 ifTrue: [ -1 ] ifFalse: [ start + keyword size - 1]) ].
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBMessageNode>>keywordsPositions [
	^keywordsPositions ifNil: [ (selector keywords collect: [:char| 0 ]) asIntegerArray ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBMessageNode>>keywordsPositions: aPositionsList [
	keywordsPositions := aPositionsList ifNotNil: [:list| list asIntegerArray ].
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBMessageNode>>lastIsReturn [
	(self isInlineIf or: [ self isInlineIfNil]) ifFalse: [^false  ].
	arguments size = 1 ifTrue: [ ^false ].
	^ arguments first isBlock and: [ arguments first body lastIsReturn 
		and: [ arguments last isBlock and: [ arguments last body lastIsReturn ] ] ] 
]

{
	#category : #matching,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBMessageNode>>match: aNode inContext: aDictionary  [
	aNode class = self class ifFalse: [^false].
	self selector = aNode selector ifFalse: [^false].
	(receiver match: aNode receiver inContext: aDictionary) ifFalse: [^false].
	self arguments
		with: aNode arguments
		do: [:first :second | (first match: second inContext: aDictionary) ifFalse: [^false]].
	^true
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBMessageNode>>needsParenthesis [
	^parent 
		ifNil: [false]
		ifNotNil: 
			[self precedence > parent precedence 
				or: [self precedence = parent precedence and: [self isUnary not]]]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBMessageNode>>numArgs [
	^self selector numArgs
]

{
	#category : #copying,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBMessageNode>>postCopy [
	super postCopy.
	self receiver: self receiver copy.
	self arguments: (self arguments collect: [ :each | each copy ])
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBMessageNode>>precedence [
	^self isUnary 
		ifTrue: [1]
		ifFalse: [self isKeyword ifTrue: [3] ifFalse: [2]]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBMessageNode>>receiver [
	^receiver
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBMessageNode>>receiver: aValueNode  [
	receiver := aValueNode.
	receiver parent: self
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBMessageNode>>receiver: aValueNode selector: aSelector keywordsPositions: positionList arguments: valueNodes [
	aSelector numArgs == valueNodes size
		ifFalse: 
			[self error: 'Attempting to assign selector with wrong number of arguments.'].

	self 
		receiver: aValueNode;
		arguments: valueNodes;
		selector: aSelector;
		keywordsPositions: positionList.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBMessageNode>>renameSelector: newSelector andArguments: varNodeCollection  [
	self
		arguments: varNodeCollection;
		selector: newSelector
]

{
	#category : #private-replacing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBMessageNode>>replaceContainmentSourceWith: aNode  [
	| originalNode needsParenthesis |
	needsParenthesis := aNode hasParentheses not and: [aNode needsParenthesis].
	originalNode := (self mappingFor: self receiver) = aNode 
				ifTrue: [self receiver]
				ifFalse: [self arguments detect: [:each | (self mappingFor: each) = aNode]].
	self
		addReplacement: (RBStringReplacement 
					replaceFrom: self start
					to: originalNode start - 1
					with: (needsParenthesis ifTrue: ['('] ifFalse: ['']));
		addReplacement: (RBStringReplacement 
					replaceFrom: originalNode stop + 1
					to: self stop
					with: (needsParenthesis ifTrue: [')'] ifFalse: ['']))
]

{
	#category : #replacing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBMessageNode>>replaceNode: aNode withNode: anotherNode  [
	"If we're inside a cascade node and are changing the receiver, change all the receivers"

	receiver == aNode 
		ifTrue: 
			[self receiver: anotherNode.
			(parent notNil and: [parent isCascade]) 
				ifTrue: [parent messages do: [:each | each receiver: anotherNode]]].
	self arguments: (arguments 
				collect: [:each | each == aNode ifTrue: [anotherNode] ifFalse: [each]])
]

{
	#category : #private-replacing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBMessageNode>>replaceSourceWith: aNode  [
	(self isContainmentReplacement: aNode) 
		ifTrue: [^self replaceContainmentSourceWith: aNode].
	aNode isMessage ifFalse: [^super replaceSourceWith: aNode].
	^self replaceSourceWithMessageNode: aNode
]

{
	#category : #private-replacing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBMessageNode>>replaceSourceWithMessageNode: aNode  [
	| isBinaryToKeyword newSelectorParts  oldkeywordsIntervals|
	self numArgs = aNode numArgs ifFalse: [^super replaceSourceWith: aNode].
	self arguments with: aNode arguments
		do: [:old :new | (self mappingFor: old) = new ifFalse: [^super replaceSourceWith: aNode]].
	(self mappingFor: self receiver) = aNode receiver 
		ifFalse:
			[(self receiver isVariable and: [aNode receiver isVariable])
				ifFalse:
					[^super replaceSourceWith: aNode].
			self addReplacement:
				(RBStringReplacement
					replaceFrom: self receiver start
					to: self receiver stop
					with: aNode receiver name)].
	(isBinaryToKeyword := self isBinary and: [aNode isKeyword]) 
		ifTrue: 
			[(self hasParentheses not and: [self parent precedence <= aNode precedence]) 
				ifTrue: 
					[self
						addReplacement: (RBStringReplacement 
									replaceFrom: self start
									to: self start - 1
									with: '(');
						addReplacement: (RBStringReplacement 
									replaceFrom: self stop + 1
									to: self stop
									with: ')')]].
							
	newSelectorParts := aNode selectorParts.
	oldkeywordsIntervals := self keywordsIntervals.
	
	self selectorParts keysAndValuesDo: [:index :oldPart| 
			(newSelectorParts at: index) ~= oldPart
				ifTrue: 
					[self addReplacement: (RBStringReplacement 
								replaceFrom: (oldkeywordsIntervals at: index) first
								to: (oldkeywordsIntervals at: index) last
								with: ((isBinaryToKeyword 
										and: [(self source at: (oldkeywordsIntervals at: index) first - 1) isSeparator not]) 
											ifTrue: [' ' , newSelectorParts at: index]
											ifFalse: [newSelectorParts at: index]))]].
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBMessageNode>>selector [
	^ selector.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBMessageNode>>selector: aSelector [
	keywordsPositions := nil.
	selector := aSelector asSymbol.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBMessageNode>>selectorParts [
	^ self keywords collect: #asSymbol.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBMessageNode>>sentMessages [
	^ super sentMessages
		add: self selector;
		yourself
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBMessageNode>>startWithoutParentheses [
	^receiver start
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBMessageNode>>stopWithoutParentheses [
	^arguments isEmpty 
		ifTrue: [self keywordsIntervals first last]
		ifFalse: [arguments last stop]
]
