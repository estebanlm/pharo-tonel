"
I am used to create AST nodes. This class is reserved for the RBAST. 

methodClass <Behavior> behavior where the compiled method is installed.
"
Class {
	#name : #FBDASTBuilder,
	#superclass : #Object,
	#instVars : [
		'methodClass'
	],
	#category : #Flashback-Decompiler,
	#timestamp : 'ClementBera 6/19/2015 14:52'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:28'
}
FBDASTBuilder class>>newFor: class [
	^ self new
		methodClass: class;
		yourself
]

{
	#category : #constructor,
	#timestamp : ' 8/31/2017 05:26:28'
}
FBDASTBuilder>>codeAnyLitInd: anAssociation  [
	^ (RBVariableNode named: anAssociation key)
		binding: anAssociation;
		yourself
]

{
	#category : #building,
	#timestamp : ' 8/31/2017 05:26:28'
}
FBDASTBuilder>>codeArgument: tempName [
	^ RBArgumentNode named: tempName
]

{
	#category : #building,
	#timestamp : ' 8/31/2017 05:26:28'
}
FBDASTBuilder>>codeArray: array [
	^ RBArrayNode statements: array
]

{
	#category : #building,
	#timestamp : ' 8/31/2017 05:26:28'
}
FBDASTBuilder>>codeAssignment: value to: variable [
	^ RBAssignmentNode variable: variable value: value 
]

{
	#category : #building,
	#timestamp : ' 8/31/2017 05:26:28'
}
FBDASTBuilder>>codeBlock: body [
	^ self codeBlock: body arguments: #()
]

{
	#category : #building,
	#timestamp : ' 8/31/2017 05:26:28'
}
FBDASTBuilder>>codeBlock: body arguments: args [
	^ RBBlockNode arguments: args body: body 
]

{
	#category : #building,
	#timestamp : ' 8/31/2017 05:26:28'
}
FBDASTBuilder>>codeBlockFromStatements: statements [
	^ self codeBlock: ((self codeSequence: #()) statements: statements; yourself)
]

{
	#category : #building,
	#timestamp : ' 8/31/2017 05:26:28'
}
FBDASTBuilder>>codeCascade: messages [
	^ RBCascadeNode messages: messages 
]

{
	#category : #building,
	#timestamp : ' 8/31/2017 05:26:28'
}
FBDASTBuilder>>codeConditionalNode: expr trueSequence: seq1 falseSequence: seq2 [
	^ (self
		codeMessage: #ifTrue:ifFalse:
		receiver: expr
		arguments:
			{self codeBlock: seq1.
			self codeBlock: seq2})
		propertyAt: #reconstructed put: true;
		yourself
]

{
	#category : #building,
	#timestamp : ' 8/31/2017 05:26:28'
}
FBDASTBuilder>>codeEmptyBlock [
	^ RBBlockNode body: (self codeSequence: #()) 
]

{
	#category : #building,
	#timestamp : ' 8/31/2017 05:26:28'
}
FBDASTBuilder>>codeEmptySequence [
	^ self codeSequence: #()
]

{
	#category : #building,
	#timestamp : ' 8/31/2017 05:26:28'
}
FBDASTBuilder>>codeInstanceVariable: offset [
	^ RBVariableNode named: (methodClass allInstVarNames at: offset)
]

{
	#category : #building,
	#timestamp : ' 8/31/2017 05:26:28'
}
FBDASTBuilder>>codeLiteral: lit [
	^ RBLiteralNode value: lit 
]

{
	#category : #building,
	#timestamp : ' 8/31/2017 05:26:28'
}
FBDASTBuilder>>codeLiteralValue: lit [
	^ RBLiteralValueNode value: lit 
]

{
	#category : #building,
	#timestamp : ' 8/31/2017 05:26:28'
}
FBDASTBuilder>>codeLoopNode: bool condition: seq1 body: seq2 [
	^ (self
		codeMessage: (#while , bool class name , ':') asSymbol
		receiver: (self codeBlock: seq1)
		arguments: {self codeBlock: seq2})
		propertyAt: #reconstructed put: true;
		yourself
]

{
	#category : #building,
	#timestamp : ' 8/31/2017 05:26:28'
}
FBDASTBuilder>>codeMessage: selector receiver: rcvr arguments:args [
	^ RBMessageNode receiver: rcvr selector: selector arguments: args
]

{
	#category : #building,
	#timestamp : ' 8/31/2017 05:26:28'
}
FBDASTBuilder>>codeMethod: selector arguments: args body: body pragmas: pragmas class: class [
	^ (RBMethodNode selector: selector arguments: args body: body)
		pragmas: pragmas;
		methodClass: class;
		yourself
]

{
	#category : #building,
	#timestamp : ' 8/31/2017 05:26:28'
}
FBDASTBuilder>>codeReceiver [
	^ (RBSelfNode named: 'self')
]

{
	#category : #building,
	#timestamp : ' 8/31/2017 05:26:28'
}
FBDASTBuilder>>codeRepeatNode: body [
	^ (self
		codeMessage: #repeat
		receiver: (self codeBlock: body)
		arguments: #() ) 
			propertyAt: #reconstructed put: true;
			yourself
]

{
	#category : #building,
	#timestamp : ' 8/31/2017 05:26:28'
}
FBDASTBuilder>>codeReturn: value [
	^ RBReturnNode value: value
]

{
	#category : #building,
	#timestamp : ' 8/31/2017 05:26:28'
}
FBDASTBuilder>>codeSelf [
	^ (RBSelfNode named: 'self')
]

{
	#category : #building,
	#timestamp : ' 8/31/2017 05:26:28'
}
FBDASTBuilder>>codeSequence: temps [
	^ RBSequenceNode temporaries: temps statements: OrderedCollection new
]

{
	#category : #building,
	#timestamp : ' 8/31/2017 05:26:28'
}
FBDASTBuilder>>codeSuper [
	^ (RBSuperNode named: 'super')
]

{
	#category : #building,
	#timestamp : ' 8/31/2017 05:26:28'
}
FBDASTBuilder>>codeTemp: tempName [
	^ RBTemporaryNode named: tempName
]

{
	#category : #building,
	#timestamp : ' 8/31/2017 05:26:28'
}
FBDASTBuilder>>codeThisContext [
	^ RBThisContextNode named: 'thisContext'
]

{
	#category : #building,
	#timestamp : ' 8/31/2017 05:26:28'
}
FBDASTBuilder>>codeVariable: variable [
	^ RBVariableNode named: variable
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:28'
}
FBDASTBuilder>>methodClass [
	^ methodClass
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:28'
}
FBDASTBuilder>>methodClass: anObject [
	methodClass := anObject
]
