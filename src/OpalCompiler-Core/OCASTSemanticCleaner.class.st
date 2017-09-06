"
I am cleaning the semantic analysis of the AST.

-> scopes of Blocks and Methpd
-> binding from Variables
"
Class {
	#name : #OCASTSemanticCleaner,
	#superclass : #RBProgramNodeVisitor,
	#category : #OpalCompiler-Core-Semantics,
	#timestamp : 'MarcusDenker 2/10/2016 16:41'
}

{
	#category : #api,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCASTSemanticCleaner class>>clean: aMethodNode [
	self new visitNode: aMethodNode.
	^aMethodNode
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCASTSemanticCleaner>>visitBlockNode: aBlockNode [
	aBlockNode removeProperty: #scope ifAbsent: [ ].
	super visitBlockNode: aBlockNode.
	
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCASTSemanticCleaner>>visitMethodNode: aMethodNode [
	aMethodNode removeProperty: #scope ifAbsent: [ ].
	super visitMethodNode: aMethodNode
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCASTSemanticCleaner>>visitVariableNode: aVariableNode [
	aVariableNode removeProperty: #binding ifAbsent: [].
	aVariableNode primitiveChangeClassTo: RBVariableNode new.
]
