"
RBAssignmentNode is an AST node for assignment statements

Instance Variables:
	assignment	<Integer>	position of the :=
	value	<RBValueNode>	the value that we're assigning
	variable	<RBVariableNode>	the variable being assigned


"
Class {
	#name : #RBAssignmentNode,
	#superclass : #RBValueNode,
	#instVars : [
		'variable',
		'assignment',
		'value'
	],
	#category : #AST-Core-Nodes,
	#timestamp : '<historical>'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:40'
}
RBAssignmentNode class>>variable: aVariableNode value: aValueNode  [
	^self 
		variable: aVariableNode
		value: aValueNode
		position: nil
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:40'
}
RBAssignmentNode class>>variable: aVariableNode value: aValueNode position: anInteger  [
	^(self new)
		variable: aVariableNode
			value: aValueNode
			position: anInteger;
		yourself
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBAssignmentNode>>= anObject  [
	self == anObject ifTrue: [^true].
	self class = anObject class ifFalse: [^false].
	^self variable = anObject variable and: [self value = anObject value]
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBAssignmentNode>>acceptVisitor: aProgramNodeVisitor  [
	^aProgramNodeVisitor visitAssignmentNode: self
]

{
	#category : #accessing-token,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBAssignmentNode>>assignment [
	^ assignment
]

{
	#category : #accessing-token,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBAssignmentNode>>assignment: anInteger [
	assignment := anInteger
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBAssignmentNode>>assignmentOperator [
	^  ':=' 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBAssignmentNode>>assignmentPosition [
	^ assignment
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBAssignmentNode>>assigns: aVariableName  [
	^variable name = aVariableName or: [value assigns: aVariableName]
]

{
	#category : #querying,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBAssignmentNode>>bestNodeFor: anInterval  [
	(self intersectsInterval: anInterval) ifFalse: [^nil].
	(self containedBy: anInterval) ifTrue: [^self].
	assignment ifNil: [^super bestNodeFor: anInterval].
	((anInterval first between: assignment and: assignment + 1) 
		or: [assignment between: anInterval first and: anInterval last]) 
			ifTrue: [^self].
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
RBAssignmentNode>>children [
	^Array with: value with: variable
]

{
	#category : #matching,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBAssignmentNode>>copyInContext: aDictionary  [
	^ self class new
		variable: (self variable copyInContext: aDictionary);
		value: (self value copyInContext: aDictionary);
		yourself
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBAssignmentNode>>directlyUses: aNode  [
	^aNode = value ifTrue: [true] ifFalse: [self isDirectlyUsed]
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBAssignmentNode>>equalTo: anObject withMapping: aDictionary  [
	^self class = anObject class and: 
			[(self variable equalTo: anObject variable withMapping: aDictionary) 
				and: [self value equalTo: anObject value withMapping: aDictionary]]
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBAssignmentNode>>hash [
	^self variable hash bitXor: self value hash
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBAssignmentNode>>isAssignment [
	^true
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBAssignmentNode>>isFaulty [
	^self variable isFaulty or: [ self value isFaulty].
]

{
	#category : #matching,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBAssignmentNode>>match: aNode inContext: aDictionary  [
	aNode class = self class ifFalse: [^false].
	^(variable match: aNode variable inContext: aDictionary)
		and: [value match: aNode value inContext: aDictionary]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBAssignmentNode>>needsParenthesis [
	^parent
		ifNil: [false]
		ifNotNil: [self precedence > parent precedence]
]

{
	#category : #copying,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBAssignmentNode>>postCopy [
	super postCopy.
	self variable: self variable copy.
	self value: self value copy
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBAssignmentNode>>precedence [
	^5
]

{
	#category : #replacing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBAssignmentNode>>replaceNode: aNode withNode: anotherNode  [
	value == aNode ifTrue: [self value: anotherNode].
	variable == aNode ifTrue: [self variable: anotherNode]
]

{
	#category : #replacing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBAssignmentNode>>replaceSourceWith: aNode  [
	"Check if we need to convert the assignment. Also check if we are being replaced with a setter message send. If so, create the replacements to edit the original source."

	(aNode isAssignment and: [ aNode assignmentOperator ~= self assignmentOperator ]) ifTrue: [
		self addReplacement: (RBStringReplacement 
			replaceFrom: self assignmentPosition
			to: self assignmentPosition + self assignmentOperator size - 1
			with: aNode assignmentOperator).
		(aNode variable = variable and: [ aNode value = value ])
			ifTrue: [ ^ self ] ].
	aNode isMessage ifFalse: [^super replaceSourceWith: aNode].
	aNode receiver isVariable ifFalse: [^super replaceSourceWith: aNode].
	aNode numArgs = 1 ifFalse: [^super replaceSourceWith: aNode].
	(self mappingFor: self value) = aNode arguments first 
		ifFalse: [^super replaceSourceWith: aNode].
	(self value hasParentheses not 
		and: [aNode arguments first precedence >= aNode precedence]) 
			ifTrue: 
				[self
					addReplacement: (RBStringReplacement 
								replaceFrom: self value start
								to: self value start - 1
								with: '(');
					addReplacement: (RBStringReplacement 
								replaceFrom: self value stop + 1
								to: self value stop
								with: ')')].
	self addReplacement: (RBStringReplacement 
				replaceFrom: self variable start
				to: self assignmentPosition + 1
				with: aNode receiver name , ' ' , aNode selector)
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBAssignmentNode>>startWithoutParentheses [
	^variable start
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBAssignmentNode>>stopWithoutParentheses [
	^value stop
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBAssignmentNode>>uses: aNode  [
	^aNode = value ifTrue: [true] ifFalse: [self isUsed]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBAssignmentNode>>value [
	^value
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBAssignmentNode>>value: aValueNode  [
	value := aValueNode.
	value parent: self
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBAssignmentNode>>variable [
	^variable
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBAssignmentNode>>variable: varNode  [
	variable := varNode.
	variable parent: self
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBAssignmentNode>>variable: aVariableNode value: aValueNode position: anInteger  [
	self variable: aVariableNode.
	self value: aValueNode.
	assignment := anInteger
]
