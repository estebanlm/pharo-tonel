"
I am a node representing a source code segement that could not be parsed. I am mainly used for source-code coloring where we should parse as far as possible and mark the rest as a failure.

Parsing faulty code without rasing a syntax error is done by 
RBParser parseFaultyExpression:
or
RBParser parseFaultyMethod: 

The return value are  either valid nodes representing the AST, or nodes representing the valid portion and a RBParseErrorNode for the remaining invalid code.


"
Class {
	#name : #RBParseErrorNode,
	#superclass : #RBValueNode,
	#instVars : [
		'errorMessage',
		'value',
		'start'
	],
	#category : #AST-Core-Nodes,
	#timestamp : 'NicolaiHess 8/2/2016 14:15'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:40'
}
RBParseErrorNode class>>errorMessage: aString value: aValue at: aPosition [

	^ self new
		errorMessage: aString;
		value: aValue;
		start: aPosition;
		yourself
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBParseErrorNode>>acceptVisitor: aProgramNodeVisitor [
	^ aProgramNodeVisitor visitParseErrorNode: self.
]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBParseErrorNode>>adaptToSemanticNode [
	" I can't provide more semantics "
]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBParseErrorNode>>asSyntaxErrorNotification [
	^SyntaxErrorNotification new
		setClass: self methodNode methodClass
		code: self methodNode source
		doitFlag: false
		errorMessage: errorMessage
		location: self start
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBParseErrorNode>>binding: anOCTempVariable  [
	"only for compatibility"
	
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBParseErrorNode>>body: aSequenceNode [
	"I am not a valid MethodNode, but go one with parsing"
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBParseErrorNode>>errorMessage [
	^ errorMessage
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBParseErrorNode>>errorMessage: anObject [
	errorMessage := anObject
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBParseErrorNode>>isFaulty [
	^true.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBParseErrorNode>>name [
	"be polymorphic with variable nodes"

	^ ''
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBParseErrorNode>>needsParenthesis [
	^ false
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBParseErrorNode>>source: aString [
	"I am not a valid MethodNode, but go one with parsing"
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBParseErrorNode>>start [
	^ start
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBParseErrorNode>>start: aPosition [
	start := aPosition
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBParseErrorNode>>startWithoutParentheses [
	^ start
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBParseErrorNode>>stop [
	^ start + value size - 1.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBParseErrorNode>>stopWithoutParentheses [
	^ self stop
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBParseErrorNode>>value [
	^value.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBParseErrorNode>>value: aString [
	value := aString.
]
