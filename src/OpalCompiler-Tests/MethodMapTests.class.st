"

"
Class {
	#name : #MethodMapTests,
	#superclass : #TestCase,
	#category : #OpalCompiler-Tests-Misc,
	#timestamp : ''
}

{
	#category : #util,
	#timestamp : ' 8/31/2017 05:26:31'
}
MethodMapTests>>compileAndRunExample: aSelector [
	| cm |
	
	cm := self compileMethod:  MethodMapExamples>>aSelector.
	^cm valueWithReceiver:  MethodMapExamples new arguments: #().
]

{
	#category : #util,
	#timestamp : ' 8/31/2017 05:26:31'
}
MethodMapTests>>compileMethod: aMethod [

	^aMethod parseTree generate: aMethod trailer.
	
]

{
	#category : #'testing - ast mapping',
	#timestamp : ' 8/31/2017 05:26:31'
}
MethodMapTests>>deadContext [
	^ thisContext
]

{
	#category : #'testing - ast mapping',
	#timestamp : ' 8/31/2017 05:26:31'
}
MethodMapTests>>inlinedBlockSourceNode [
	1 to: 1 do: [ :i | ^ thisContext sourceNode ]. 


]

{
	#category : #'testing - ast mapping',
	#timestamp : ' 8/31/2017 05:26:31'
}
MethodMapTests>>testBlockAndContextSourceNode [
		
	|block blockNodeViaContext blockNodeViaClosure |


	block := [blockNodeViaContext := thisContext sourceNode].
	block value.
	blockNodeViaClosure := block sourceNode.

	self assert: blockNodeViaContext == blockNodeViaClosure
	


]

{
	#category : #'testing - ast mapping',
	#timestamp : ' 8/31/2017 05:26:31'
}
MethodMapTests>>testBlockSourceNode [
	| sourceNode |
	sourceNode := [ 1 + 2 ] sourceNode.
	self assert: sourceNode equals: (RBParser parseExpression: '[ 1 + 2 ]').


]

{
	#category : #'testing - ast mapping',
	#timestamp : ' 8/31/2017 05:26:31'
}
MethodMapTests>>testBlockWithArgAndEnclosedBlockSourceNode [
	| sourceNode |
	sourceNode := [ :arg |  [ arg ] ] sourceNode.
	self assert: sourceNode equals: (RBParser parseExpression: '[ :arg | [ arg ] ]').

]

{
	#category : #'testing - ast mapping',
	#timestamp : ' 8/31/2017 05:26:31'
}
MethodMapTests>>testBlockWithEnclosedBlockSourceNode [
	| sourceNode |
	sourceNode := [ [ ] ] sourceNode.
	self assert: sourceNode equals: (RBParser parseExpression: '[ [ ] ]').

]

{
	#category : #'testing - ast mapping',
	#timestamp : ' 8/31/2017 05:26:31'
}
MethodMapTests>>testBlockWithTempsSourceNode [
	| sourceNode |
	sourceNode := [ | t1 t2 | ] sourceNode.
	self assert: sourceNode equals: (RBParser parseExpression: '[ | t1 t2 | ]').

]

{
	#category : #'testing - temp access',
	#timestamp : ' 8/31/2017 05:26:31'
}
MethodMapTests>>testCopiedVarFromDeadContext [
	self assert:  (self compileAndRunExample:  #exampleCopiedVarFromDeadContext) equals: 2.
]

{
	#category : #'testing - ast mapping',
	#timestamp : ' 8/31/2017 05:26:31'
}
MethodMapTests>>testDeadContextSourceNode [
	| deadContext |
	deadContext := self deadContext.
	self assert: deadContext isDead. 
	self assert: deadContext sourceNode equals: (self class>>#deadContext) ast

]

{
	#category : #'testing - temp access',
	#timestamp : ' 8/31/2017 05:26:31'
}
MethodMapTests>>testExampleSimpleTemp [
	self assert: (self compileAndRunExample: #exampleSimpleTemp) equals: 1
]

{
	#category : #'testing - temp access',
	#timestamp : ' 8/31/2017 05:26:31'
}
MethodMapTests>>testExampleTempNamedCopying [
	self assert: (self compileAndRunExample: #exampleTempNamedCopying) equals: 1
]

{
	#category : #'testing - temp access',
	#timestamp : ' 8/31/2017 05:26:31'
}
MethodMapTests>>testExampleTempNamedCopying2 [
	self assert: (self compileAndRunExample: #exampleTempNamedCopying2) equals: 1
]

{
	#category : #'testing - temp access',
	#timestamp : ' 8/31/2017 05:26:31'
}
MethodMapTests>>testExampleTempNamedPutCopying [
	self assert: (self compileAndRunExample: #exampleTempNamedPutCopying) equals: 2.
]

{
	#category : #'testing - temp access',
	#timestamp : ' 8/31/2017 05:26:31'
}
MethodMapTests>>testExampleTempNamedPutCopying2 [
"modifying a copied temp variable will *not* modify the value in the outer context. 
(See other test case OCClosureCompilerTest>>#testDebuggerTempAccess and notes on fogbugz issue 17702"
	self assert: (self compileAndRunExample: #exampleTempNamedPutCopying2) equals: 1
]

{
	#category : #'testing - temp access',
	#timestamp : ' 8/31/2017 05:26:31'
}
MethodMapTests>>testExampleTempNamedPutTempVector [
	self assert: (self compileAndRunExample: #exampleTempNamedPutTempVector) equals: 3.
]

{
	#category : #'testing - temp access',
	#timestamp : ' 8/31/2017 05:26:31'
}
MethodMapTests>>testExampleTempNamedPutTempVector2 [
	self assert: (self compileAndRunExample: #exampleTempNamedPutTempVector2) equals: 3
]

{
	#category : #'testing - temp access',
	#timestamp : ' 8/31/2017 05:26:31'
}
MethodMapTests>>testExampleTempNamedTempVector [
	self assert: (self compileAndRunExample: #exampleTempNamedTempVector) equals: 2
]

{
	#category : #'testing - temp access',
	#timestamp : ' 8/31/2017 05:26:31'
}
MethodMapTests>>testExampleTempNamedTempVector2 [
	self assert: (self compileAndRunExample: #exampleTempNamedTempVector2) equals: 2
]

{
	#category : #'testing - temp access',
	#timestamp : ' 8/31/2017 05:26:31'
}
MethodMapTests>>testExampleTempNamedTempVectorInOptimizedBlock [
	self assert:  (self compileAndRunExample:  #exampleTempNamedTempVectorInOptimizedBlock ) equals: 2.
]

{
	#category : #'testing - temp access',
	#timestamp : ' 8/31/2017 05:26:31'
}
MethodMapTests>>testExampleTempNamedTempVectorInlinedLoop [
	self assert:  (self compileAndRunExample:  #exampleTempNamedTempVectorInlinedLoop ) equals: 42.
]

{
	#category : #'testing - temp access',
	#timestamp : ' 8/31/2017 05:26:31'
}
MethodMapTests>>testExampleTempNamedTempVectorNestedBlock [
	self assert:  (self compileAndRunExample:  #exampleTempNamedTempVectorNestedBlock ) equals: 2.
]

{
	#category : #'testing - ast mapping',
	#timestamp : ' 8/31/2017 05:26:31'
}
MethodMapTests>>testMethodSourceNodeAtInitialPC [

	| method actual |
	method := self class >> testSelector.
	actual := method sourceNodeForPC: method initialPC.
	
	self assert: actual equals: method ast sendNodes first receiver receiver

]

{
	#category : #'testing - ast mapping',
	#timestamp : ' 8/31/2017 05:26:31'
}
MethodMapTests>>testMethodSourceNodeAtPC [
	self assert: (((Object>>#halt) sourceNodeForPC:  22) isKindOf: RBMessageNode).

]

{
	#category : #'testing - ast mapping',
	#timestamp : ' 8/31/2017 05:26:31'
}
MethodMapTests>>testPrimitiveMethodSourceNodeAtInitialPC [

	| method actual |
	method := SmallInteger >> #+.
	actual := method sourceNodeForPC: method initialPC.
	
	self assert: actual equals: method ast

]

{
	#category : #'testing - source mapping',
	#timestamp : ' 8/31/2017 05:26:31'
}
MethodMapTests>>testSimpleSourceMapping [
	| method range highlight |

	method := Object>>('ha', 'lt') asSymbol.

	range := (DebuggerMethodMapOpal forMethod: (self compileMethod: method)) rangeForPC: 23.
	highlight := method sourceCode copyFrom:  range first to: range last.
	self assert: highlight equals: 'now'.


	
]

{
	#category : #'testing - source mapping',
	#timestamp : ' 8/31/2017 05:26:31'
}
MethodMapTests>>testSourceMappingBlock [
	| method range highlight |

	method := MethodMapExamples>>#exampleTempNamedCopying.

	range := (DebuggerMethodMapOpal forMethod: (self compileMethod: method)) rangeForPC: 42.
	highlight := method sourceCode copyFrom:  range first to: range last.
	self assert: highlight equals: 'b'.

	range := (DebuggerMethodMapOpal forMethod: (self compileMethod: method)) rangeForPC: 43.
	highlight := method sourceCode copyFrom:  range first to: range last.
	self assert: highlight equals: 'a := b'.
	
	range := (DebuggerMethodMapOpal forMethod: (self compileMethod: method)) rangeForPC: 44.
	highlight := method sourceCode copyFrom:  range first to: range last.
	self assert: highlight equals:'DebuggerMethodMapOpal'.
	
	range := (DebuggerMethodMapOpal forMethod: (self compileMethod: method)) rangeForPC: 45.
	highlight := method sourceCode copyFrom:  range first to: range last.
	self assert: highlight equals:'thisContext'.
	
	range := (DebuggerMethodMapOpal forMethod: (self compileMethod: method)) rangeForPC: 46.
	highlight := method sourceCode copyFrom:  range first to: range last.
	self assert: highlight equals: 'method'.
]

{
	#category : #'testing - temp access',
	#timestamp : ' 8/31/2017 05:26:31'
}
MethodMapTests>>testTempNamedTempCopyingNestedBlock [
	self assert: (self compileAndRunExample:  #exampleTempNamedTempCopyingNestedBlock) equals: 1.
]

{
	#category : #'testing - temp access',
	#timestamp : ' 8/31/2017 05:26:31'
}
MethodMapTests>>testTempNamedTempCopyingNestedBlockPROBLEM [
	self assert:  (self compileAndRunExample:  #exampleTempNamedTempCopyingNestedBlockPROBLEM) equals: 1.
]

{
	#category : #'testing - ast mapping',
	#timestamp : ' 8/31/2017 05:26:31'
}
MethodMapTests>>testThisContextSourceNode [
	self assert: (thisContext sourceNode isKindOf: RBMethodNode).
	self assert: ([thisContext sourceNode] value isKindOf: RBBlockNode).
	self assert: ([true ifTrue: [thisContext sourceNode]]value isKindOf: RBBlockNode).



]

{
	#category : #'testing - ast mapping',
	#timestamp : ' 8/31/2017 05:26:31'
}
MethodMapTests>>testThisContextSourceNodeInInlinedMessage [
	| inlinedBlockSourceNode |
	inlinedBlockSourceNode := self inlinedBlockSourceNode.
	self assert: (inlinedBlockSourceNode isKindOf: RBBlockNode).
	self assert: inlinedBlockSourceNode equals: (RBParser parseExpression: '[ :i | ^ thisContext sourceNode ]')
]
