"
RBVariableNode is an AST node that represent a variable (global, inst var, temp, etc.).

Although this is the basic class for the concrete variable types, this is not an abstract class and is actually used
by the parser for all variables that aren't special builtin types like self/super/thisContext. All other variables are
just RBVariableNodes until the semantic analyser can deduce thte type.

Instance Variables:
	name	<RBValueToken>	the variable's name I represent
	nameStart <Integer>	the position where I was found at the source code

"
Class {
	#name : #RBVariableNode,
	#superclass : #RBValueNode,
	#instVars : [
		'name',
		'start'
	],
	#category : #AST-Core-Nodes,
	#timestamp : 'NicolaiHess 8/2/2016 14:22'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:40'
}
RBVariableNode class>>identifierNamed: anIdentifierName at: aPosition [
	
	anIdentifierName = 'self'
		ifTrue: [ ^ RBSelfNode named: anIdentifierName start: aPosition ].
	anIdentifierName = 'thisContext'
		ifTrue: [ ^ RBThisContextNode named: anIdentifierName start: aPosition ].
	anIdentifierName = 'super'
		ifTrue: [ ^ RBSuperNode named: anIdentifierName start: aPosition ].
	^ self named: anIdentifierName start: aPosition.
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:40'
}
RBVariableNode class>>named: aName [
	^self named: aName start: 0.
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:40'
}
RBVariableNode class>>named: aName start: aPosition [
	^self new 
		named: aName start: aPosition; 
		yourself.
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBVariableNode>>= anObject  [
	self == anObject ifTrue: [^true].
	((anObject isKindOf: self class) or: [self isKindOf: anObject class]) 
		ifFalse: [^false].
	^self name = anObject name
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBVariableNode>>acceptVisitor: aProgramNodeVisitor  [
	^aProgramNodeVisitor visitVariableNode: self
]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBVariableNode>>adaptToSemanticNode [
	
	self primitiveChangeClassTo: self binding semanticNodeClass new
]

{
	#category : #matching,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBVariableNode>>copyInContext: aDictionary  [
	^ self class named: name.
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBVariableNode>>equalTo: anObject withMapping: aDictionary  [
	^self class = anObject class and: 
			[(aDictionary at: self name ifAbsentPut: [anObject name]) = anObject name]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBVariableNode>>hasIncompleteIdentifier [
	^ self binding isUndeclared
		ifTrue: [ (self scope findVariable: [ :v | v name beginsWith: self name ] ifNone: [ nil ]) notNil]
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBVariableNode>>hash [
	^self name hash
]

{
	#category : #initialize,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBVariableNode>>initialize [
	super initialize.
	name := ''.
	start := 0
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBVariableNode>>isDefinition [
	^self parent isSequence
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBVariableNode>>isFaulty [
	^false
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBVariableNode>>isImmediateNode [
	^true
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBVariableNode>>isRead [
	^ self isWrite not and: [ self isUsed ]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBVariableNode>>isVariable [
	^true
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBVariableNode>>isWrite [
	^ self parent notNil and: [ self parent isAssignment and: [ self parent variable == self ] ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBVariableNode>>name [
	^ name
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBVariableNode>>name: aName [
	name := aName asSymbol.
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBVariableNode>>named: aName start: aPosition [

	self name: aName.
	self start: aPosition.
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBVariableNode>>needsParenthesis [
	^false
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBVariableNode>>precedence [
	^0
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBVariableNode>>references: aVariableName  [
	^self name = aVariableName
]

{
	#category : #replacing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBVariableNode>>replaceSourceFrom: aNode  [
	self addReplacement: (RBStringReplacement 
				replaceFrom: aNode start
				to: aNode stop
				with: self name)
]

{
	#category : #replacing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBVariableNode>>replaceSourceWith: aNode [
	self addReplacement: (RBStringReplacement 
				replaceFrom: self start
				to: self stop
				with: aNode formattedCode)
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBVariableNode>>start [
	^ start
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBVariableNode>>start: aPosition [
	start := aPosition
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBVariableNode>>startForReplacement [
	"Return the start of the variable,  taking into account characters before the variable.
	This method is used when unused temporary variables are removed"
	| src t |
	src := self source.
	t := self start - 1.
	[ (src at: t) isSeparator ] whileTrue: [ t := t - 1 ].
	^ t + 1
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBVariableNode>>startWithoutParentheses [
	^ start
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBVariableNode>>stopWithoutParentheses [
	^ start + name size - 1.
]
