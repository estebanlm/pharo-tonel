"
RBCascadeNode is an AST node for cascaded messages (e.g., ""self print1 ; print2"").

Instance Variables:
	messages	<SequenceableCollection of: RBMessageNode>	the messages 
	semicolons	<SequenceableCollection of: Integer>	positions of the ; between messages


"
Class {
	#name : #RBCascadeNode,
	#superclass : #RBValueNode,
	#instVars : [
		'messages',
		'semicolons'
	],
	#category : #AST-Core-Nodes,
	#timestamp : '<historical>'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:40'
}
RBCascadeNode class>>messages: messageNodes  [
	^self new messages: messageNodes
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:40'
}
RBCascadeNode class>>messages: messageNodes semicolons: integerCollection  [
	^self new messages: messageNodes semicolons: integerCollection
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBCascadeNode>>= anObject  [
	self == anObject ifTrue: [^true].
	self class = anObject class ifFalse: [^false].
	self messages size = anObject messages size ifFalse: [^false].
	self messages with: anObject messages do: [:first :second | first = second ifFalse: [^false]].
	^true
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBCascadeNode>>acceptVisitor: aProgramNodeVisitor  [
	^aProgramNodeVisitor visitCascadeNode: self
]

{
	#category : #querying,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBCascadeNode>>bestNodeFor: anInterval  [
	| selectedChildren |
	(self intersectsInterval: anInterval) ifFalse: [^nil].
	(self containedBy: anInterval) ifTrue: [^self].
	messages 
		reverseDo: [:each | (each containedBy: anInterval) ifTrue: [^each]].
	selectedChildren := (messages 
				collect: [:each | each bestNodeFor: anInterval]) 
					reject: [:each | each isNil].
	^selectedChildren detect: [:each | true] ifNone: [nil]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBCascadeNode>>children [
	^self messages
]

{
	#category : #matching,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBCascadeNode>>copyInContext: aDictionary  [
	^ self class new
		messages: (self copyList: self messages inContext: aDictionary);
		yourself
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBCascadeNode>>directlyUses: aNode  [
	^messages last = aNode and: [self isDirectlyUsed]
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBCascadeNode>>equalTo: anObject withMapping: aDictionary  [
	self class = anObject class ifFalse: [^false].
	self messages size = anObject messages size ifFalse: [^false].
	self messages
		with: anObject messages
		do: [:first :second | (first equalTo: second withMapping: aDictionary) ifFalse: [^false]].
	^true
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBCascadeNode>>hash [
	^ self hashForCollection: self messages
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBCascadeNode>>isCascade [
	^true
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBCascadeNode>>isFaulty [
	^self messages anySatisfy: #isFaulty
]

{
	#category : #matching,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBCascadeNode>>match: aNode inContext: aDictionary  [
	aNode class = self class ifFalse: [^false].
	^self 
		matchList: messages
		against: aNode messages
		inContext: aDictionary
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBCascadeNode>>messages [
	^messages
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBCascadeNode>>messages: messageNodeCollection  [
	messages := messageNodeCollection.
	messages do: [:each | each parent: self]
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBCascadeNode>>messages: messageNodes semicolons: integerCollection  [
	self messages: messageNodes.
	semicolons := integerCollection
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBCascadeNode>>needsParenthesis [
	^parent 
		ifNil: [false]
		ifNotNil: [self precedence > parent precedence]
]

{
	#category : #copying,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBCascadeNode>>postCopy [
	super postCopy.
	self messages: (self messages collect: [ :each | each copy ])
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBCascadeNode>>precedence [
	^4
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBCascadeNode>>receiver [
	^self messages first receiver
]

{
	#category : #replacing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBCascadeNode>>replaceNode: aNode withNode: anotherNode  [
	self messages: (messages 
				collect: [:each | each == aNode ifTrue: [anotherNode] ifFalse: [each]])
]

{
	#category : #accessing-token,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBCascadeNode>>semicolons [
	^ semicolons
]

{
	#category : #accessing-token,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBCascadeNode>>semicolons: anArray [
	semicolons := anArray
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBCascadeNode>>startWithoutParentheses [
	^messages first start
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBCascadeNode>>statementComments [
	| statementComments |
	statementComments := OrderedCollection withAll: self comments.
	statementComments addAll: messages first receiver statementComments.
	messages do: 
			[:each | 
			each arguments 
				do: [:arg | statementComments addAll: arg statementComments]].
	^statementComments asSortedCollection: [:a :b | a start < b start]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBCascadeNode>>stopWithoutParentheses [
	^messages last stop
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBCascadeNode>>uses: aNode  [
	^messages last = aNode and: [self isUsed]
]

{
	#category : #querying,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBCascadeNode>>whichNodeIsContainedBy: anInterval  [
	| selectedChildren |
	(self intersectsInterval: anInterval) ifFalse: [^nil].
	(self containedBy: anInterval) ifTrue: [^self].
	messages 
		reverseDo: [:each | (each containedBy: anInterval) ifTrue: [^each]].
	selectedChildren := (messages 
				collect: [:each | each whichNodeIsContainedBy: anInterval]) 
					reject: [:each | each isNil].
	^selectedChildren detect: [:each | true] ifNone: [nil]
]
