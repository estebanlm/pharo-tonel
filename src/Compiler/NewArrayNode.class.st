"
I represent a node for the genPushNewArray: opcode.
"
Class {
	#name : #NewArrayNode,
	#superclass : #ParseNode,
	#instVars : [
		'numElements'
	],
	#category : #Compiler-ParseNodes,
	#timestamp : '<historical>'
}

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:32'
}
NewArrayNode>>accept: aVisitor [
	^aVisitor visitNewArrayNode: self
]

{
	#category : #'code generation (closures)',
	#timestamp : ' 8/31/2017 07:16:32'
}
NewArrayNode>>analyseTempsWithin: scopeBlock "<BlockNode>" rootNode: rootNode "<MethodNode>" assignmentPools: assignmentPools "<Dictionary>" [
	"This is a no-op except in TempVariableNode"
	^self
]

{
	#category : #'code generation',
	#timestamp : ' 8/31/2017 07:16:32'
}
NewArrayNode>>emitCodeForValue: stack encoder: encoder [
	encoder genPushNewArray: numElements.
	stack push: 1
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:32'
}
NewArrayNode>>numElements [
	^numElements
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:32'
}
NewArrayNode>>numElements: n [
	numElements := n
]

{
	#category : #'code generation',
	#timestamp : ' 8/31/2017 07:16:32'
}
NewArrayNode>>sizeCodeForValue: encoder [
	^encoder sizePushNewArray: numElements
]
