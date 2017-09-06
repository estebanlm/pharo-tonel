"
I am a parse tree leaf representing an instance variable.
"
Class {
	#name : #InstanceVariableNode,
	#superclass : #VariableNode,
	#category : #Compiler-ParseNodes,
	#timestamp : 'TorstenBergmann 1/31/2014 11:19'
}

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:32'
}
InstanceVariableNode>>accept: aVisitor [
	^aVisitor visitInstanceVariableNode: self
]

{
	#category : #'code generation',
	#timestamp : ' 8/31/2017 07:16:32'
}
InstanceVariableNode>>emitCodeForStore: stack encoder: encoder [
	encoder genStoreInstVar: index
]

{
	#category : #'code generation',
	#timestamp : ' 8/31/2017 07:16:32'
}
InstanceVariableNode>>emitCodeForStorePop: stack encoder: encoder [
	encoder genStorePopInstVar: index.
	stack pop: 1
]

{
	#category : #'code generation',
	#timestamp : ' 8/31/2017 07:16:32'
}
InstanceVariableNode>>emitCodeForValue: stack encoder: encoder [
	stack push: 1.
	^encoder genPushInstVar: index
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 07:16:32'
}
InstanceVariableNode>>name: varName index: varIndex [
	^self name: varName index: varIndex-1 type: LdInstType
]

{
	#category : #'code generation',
	#timestamp : ' 8/31/2017 07:16:32'
}
InstanceVariableNode>>sizeCodeForStore: encoder [
	^encoder sizeStoreInstVar: index
]

{
	#category : #'code generation',
	#timestamp : ' 8/31/2017 07:16:32'
}
InstanceVariableNode>>sizeCodeForStorePop: encoder [
	^encoder sizeStorePopInstVar: index
]

{
	#category : #'code generation',
	#timestamp : ' 8/31/2017 07:16:32'
}
InstanceVariableNode>>sizeCodeForValue: encoder [
	^encoder sizePushInstVar: index
]
