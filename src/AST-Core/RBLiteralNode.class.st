"
RBLiteralNode is an AST node that represents literals.

Instance Variables
	start: <Integer | nil> source position for the literal's beginning
	stop: <Integer | nil> source position for the literal's end
"
Class {
	#name : #RBLiteralNode,
	#superclass : #RBValueNode,
	#instVars : [
		'start',
		'stop'
	],
	#category : #AST-Core-Nodes,
	#timestamp : '<historical>'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:40'
}
RBLiteralNode class>>value: aValue  [
	^((aValue class == Array or: [aValue class == ByteArray]) 
		ifTrue: [RBLiteralArrayNode]
		ifFalse: [RBLiteralValueNode]) value: aValue
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBLiteralNode>>= anObject  [
	self == anObject ifTrue: [^true].
	^self class = anObject class
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBLiteralNode>>hash [
	^self value hash
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBLiteralNode>>initialize [

	super initialize.

	start := 0.
	stop := 0.
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBLiteralNode>>isImmediateNode [
	^true
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBLiteralNode>>isLiteralNode [
	^true
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBLiteralNode>>needsParenthesis [
	^false
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBLiteralNode>>precedence [
	^0
]

{
	#category : #private-replacing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBLiteralNode>>replaceSourceFrom: aNode  [
	self addReplacement: (RBStringReplacement 
				replaceFrom: aNode start
				to: aNode stop
				with: self formattedCode)
]

{
	#category : #private-replacing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBLiteralNode>>replaceSourceWith: aNode  [
	self addReplacement: (RBStringReplacement 
				replaceFrom: self start
				to: self stop
				with: aNode formattedCode)
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBLiteralNode>>start: anInteger [
	start := anInteger
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBLiteralNode>>startWithoutParentheses [
	^start
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBLiteralNode>>stop: anInteger [
	stop := anInteger
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBLiteralNode>>stopWithoutParentheses [
	^stop
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBLiteralNode>>value [
	^self subclassResponsibility
]
