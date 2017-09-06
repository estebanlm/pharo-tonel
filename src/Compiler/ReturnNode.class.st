"
I represent an expression of the form ^expr.
"
Class {
	#name : #ReturnNode,
	#superclass : #ParseNode,
	#instVars : [
		'expr'
	],
	#category : #Compiler-ParseNodes,
	#timestamp : '<historical>'
}

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:32'
}
ReturnNode>>accept: aVisitor [
	^aVisitor visitReturnNode: self
]

{
	#category : #'code generation (closures)',
	#timestamp : ' 8/31/2017 07:16:32'
}
ReturnNode>>analyseTempsWithin: scopeBlock "<BlockNode>" rootNode: rootNode "<MethodNode>" assignmentPools: assignmentPools "<Dictionary>" [
	"Note we could do this:
		scopeBlock ~~ rootNode block ifTrue:
			[scopeBlock noteNonLocalReturn].
	 and pass up the flag in <BlockNode>>>analyseTempsWithin:rootNode:
	 which may be fast but will also give less information the debugger.
	 For now we consider clean blocks a premature optimization."
	self flag: 'consider clean blocks'.
	expr analyseTempsWithin: scopeBlock rootNode: rootNode assignmentPools: assignmentPools
]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 07:16:32'
}
ReturnNode>>asReturnNode [

]

{
	#category : #'code generation',
	#timestamp : ' 8/31/2017 07:16:32'
}
ReturnNode>>code [

	^expr code
]

{
	#category : #'code generation',
	#timestamp : ' 8/31/2017 07:16:32'
}
ReturnNode>>emitCodeForReturn: stack encoder: encoder [

	expr emitCodeForReturn: stack encoder: encoder.
	pc := encoder methodStreamPosition
]

{
	#category : #'code generation',
	#timestamp : ' 8/31/2017 07:16:32'
}
ReturnNode>>emitCodeForValue: stack encoder: encoder [

	expr emitCodeForReturn: stack encoder: encoder.
	pc := encoder methodStreamPosition
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:32'
}
ReturnNode>>expr [

	^ expr.

]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 07:16:32'
}
ReturnNode>>expr: e [

	expr := e
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 07:16:32'
}
ReturnNode>>expr: e encoder: encoder sourceRange: range [

	expr := e.
	encoder noteSourceRange: range forNode: self
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:32'
}
ReturnNode>>isReturn [
	^true
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:32'
}
ReturnNode>>isReturnSelf [

	^expr == NodeSelf
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:32'
}
ReturnNode>>isSpecialConstant [

	^expr isSpecialConstant
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:32'
}
ReturnNode>>isVariableReference [

	^expr isVariableReference
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:32'
}
ReturnNode>>printOn: aStream indent: level [

	aStream nextPutAll: '^ '. 
	expr printOn: aStream indent: level.
	expr printCommentOn: aStream indent: level
]

{
	#category : #'code generation',
	#timestamp : ' 8/31/2017 07:16:32'
}
ReturnNode>>sizeCodeForReturn: encoder [

	^expr sizeCodeForReturn: encoder
]

{
	#category : #'code generation',
	#timestamp : ' 8/31/2017 07:16:32'
}
ReturnNode>>sizeCodeForValue: encoder [

	^expr sizeCodeForReturn: encoder
]
