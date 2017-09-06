"
A RBLiteralArrayNode is an AST node that represents literal arrays and literal byte arrays.

Instance Variables
	contents: <Array of: RBLiteralNode> literal nodes of the array
	isByteArray: <Boolean> if the receiver is a literal byte array

"
Class {
	#name : #RBLiteralArrayNode,
	#superclass : #RBLiteralNode,
	#instVars : [
		'isByteArray',
		'contents'
	],
	#category : #AST-Core-Nodes,
	#timestamp : '<historical>'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:40'
}
RBLiteralArrayNode class>>startPosition: startInteger contents: anArray stopPosition: stopInteger isByteArray: aBoolean  [
	^(self new)
		startPosition: startInteger
			contents: anArray
			stopPosition: stopInteger
			isByteArray: aBoolean;
		yourself
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:40'
}
RBLiteralArrayNode class>>value: aValue  [
	^(self new)
		startPosition: 0
			contents: (aValue asArray collect: [:each | RBLiteralNode value: each])
			stopPosition: -1
			isByteArray: aValue class ~~ Array;
		yourself
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBLiteralArrayNode>>= anObject  [
	super = anObject ifFalse: [^false].
	self isForByteArray = anObject isForByteArray ifFalse: [^false].
	self contents size = anObject contents size ifFalse: [^false].
	self contents
		with: anObject contents
		do: [:first :second | first = second ifFalse: [^false]].
	^true
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBLiteralArrayNode>>acceptVisitor: aProgramNodeVisitor  [
	^aProgramNodeVisitor visitLiteralArrayNode: self
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBLiteralArrayNode>>children [
	^contents
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBLiteralArrayNode>>contents [
	^contents
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBLiteralArrayNode>>contents: aRBLiteralNodeCollection  [
	contents := aRBLiteralNodeCollection.
	contents do: [:each | each parent: self]
]

{
	#category : #matching,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBLiteralArrayNode>>copyInContext: aDictionary  [
	^ self class 
		startPosition: 0
		contents: (self copyList: self contents inContext: aDictionary)
		stopPosition: -1
		isByteArray: isByteArray
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBLiteralArrayNode>>equalTo: anObject withMapping: aDictionary  [
	self class = anObject class ifFalse: [^false].
	self isForByteArray = anObject isForByteArray ifFalse: [^false].
	self contents size = anObject contents size ifFalse: [^false].
	self contents
		with: anObject contents
		do: [:first :second | (first equalTo: second withMapping: aDictionary) ifFalse: [^false]].
	^true
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBLiteralArrayNode>>isFaulty [
	^self contents anySatisfy: #isFaulty
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBLiteralArrayNode>>isForByteArray [
	^isByteArray
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBLiteralArrayNode>>isLiteralArray [
	^true
]

{
	#category : #matching,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBLiteralArrayNode>>match: aNode inContext: aDictionary  [
	aNode class = self class ifFalse: [^false].
	self isForByteArray = aNode isForByteArray ifFalse: [^false].
	^self 
		matchList: contents
		against: aNode contents
		inContext: aDictionary
]

{
	#category : #copying,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBLiteralArrayNode>>postCopy [
	super postCopy.
	self contents: (self contents collect: [ :each | each copy ])
]

{
	#category : #replacing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBLiteralArrayNode>>replaceNode: aNode withNode: anotherNode  [
	self contents: (contents 
				collect: [:each | each == aNode ifTrue: [anotherNode] ifFalse: [each]])
]

{
	#category : #private-replacing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBLiteralArrayNode>>replaceSourceWith: aNode  [
	(self class = aNode class and: 
			[self isForByteArray = aNode isForByteArray 
				and: [self contents size = aNode contents size]]) 
		ifFalse: [^super replaceSourceWith: aNode].
	self contents
		with: aNode contents 
		do: [:first :second | first = second ifFalse: [ first replaceSourceWith: second]]
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBLiteralArrayNode>>startPosition: startInteger contents: anArray stopPosition: stopInteger isByteArray: aBoolean  [
	start := startInteger.
	self contents: anArray.
	stop := stopInteger.
	isByteArray := aBoolean
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBLiteralArrayNode>>value [
	| array |
	array := (isByteArray ifTrue: [ByteArray] ifFalse: [Array]) 
				new: contents size.
	1 to: contents size
		do: [:each | array at: each put: (contents at: each) value].
	^array
]
