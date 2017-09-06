"
RBReturnNode is an AST node that represents a return expression.

Instance Variables:
	return	<Integer>	the position of the ^ character
	value	<RBValueNode>	the value that is being returned


"
Class {
	#name : #RBReturnNode,
	#superclass : #RBProgramNode,
	#instVars : [
		'return',
		'value'
	],
	#category : #AST-Core-Nodes,
	#timestamp : '<historical>'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:40'
}
RBReturnNode class>>return: returnInteger value: aValueNode  [
	^self new return: returnInteger value: aValueNode
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:40'
}
RBReturnNode class>>value: aNode [
	^self return: 0 value: aNode
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBReturnNode>>= anObject  [
	self == anObject ifTrue: [^true].
	self class = anObject class ifFalse: [^false].
	^self value = anObject value
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBReturnNode>>acceptVisitor: aProgramNodeVisitor  [
	^aProgramNodeVisitor visitReturnNode: self
]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBReturnNode>>asSequenceNode [
	^RBSequenceNode statements: {self} 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBReturnNode>>children [
	^Array with: value
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBReturnNode>>containsReturn [
	^true
]

{
	#category : #matching,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBReturnNode>>copyInContext: aDictionary  [
	^ self class new
		value: (self value copyInContext: aDictionary);
		yourself
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBReturnNode>>equalTo: anObject withMapping: aDictionary  [
	^self class = anObject class 
		and: [self value equalTo: anObject value withMapping: aDictionary]
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBReturnNode>>hash [
	^self value hash
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBReturnNode>>initialize [

	super initialize.

	return := 0.
	value := nil.
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBReturnNode>>isFaulty [
	^self value isFaulty.
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBReturnNode>>isReturn [
	^true
]

{
	#category : #matching,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBReturnNode>>match: aNode inContext: aDictionary  [
	aNode class = self class ifFalse: [^false].
	^value match: aNode value inContext: aDictionary
]

{
	#category : #copying,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBReturnNode>>postCopy [
	super postCopy.
	self value: self value copy
]

{
	#category : #replacing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBReturnNode>>replaceNode: aNode withNode: anotherNode  [
	value == aNode ifTrue: [self value: anotherNode]
]

{
	#category : #accessing-token,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBReturnNode>>return [
	^ return
]

{
	#category : #accessing-token,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBReturnNode>>return: anInteger [
	return := anInteger
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBReturnNode>>return: returnInteger value: aValueNode  [
	return := returnInteger.
	self value: aValueNode
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBReturnNode>>start [
	^return
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBReturnNode>>stop [
	value ifNil:[^ 0].
	^ value stop
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBReturnNode>>stop: anInteger [
	self value stop: anInteger
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBReturnNode>>value [
	^value
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBReturnNode>>value: valueNode  [
	value := valueNode.
	value parent: self
]
