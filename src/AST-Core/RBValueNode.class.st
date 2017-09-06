"
RBValueNode is an abstract class that represents a node that returns some value.

Subclasses must implement the following messages:
	accessing
		startWithoutParentheses
		stopWithoutParentheses
	testing
		needsParenthesis

Instance Variables:
	parentheses	<SequenceableCollection of: Inteval>	the positions of the parethesis around this node. We need a collection of intervals for stupid code such as ""((3 + 4))"" that has multiple parethesis around the same expression.


"
Class {
	#name : #RBValueNode,
	#superclass : #RBProgramNode,
	#instVars : [
		'parentheses'
	],
	#category : #AST-Core-Nodes,
	#timestamp : '<historical>'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBValueNode>>addParenthesis: anInterval  [
	parentheses ifNil: [parentheses := OrderedCollection new: 1].
	parentheses add: anInterval
]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBValueNode>>asSequenceNode [
	^RBSequenceNode statements: {self} 
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBValueNode>>containedBy: anInterval  [
	^anInterval first <= self startWithoutParentheses 
		and: [anInterval last >= self stopWithoutParentheses]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBValueNode>>hasParentheses [
	^self parentheses notEmpty
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBValueNode>>isValue [
	^true
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBValueNode>>needsParenthesis [
	^self subclassResponsibility
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBValueNode>>parentheses [
	^parentheses ifNil: [#()] ifNotNil: [parentheses]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBValueNode>>start [
	^ parentheses ifNil: [ self startWithoutParentheses ] ifNotNil: [ parentheses last first ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBValueNode>>startWithoutParentheses [
	^self subclassResponsibility
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBValueNode>>stop [
	^ parentheses ifNil: [ self stopWithoutParentheses ] ifNotNil: [ parentheses last last ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBValueNode>>stopWithoutParentheses [
	^self subclassResponsibility
]
