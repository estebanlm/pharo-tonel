"

"
Class {
	#name : #OCBytecodeDecompilerExamplesTest,
	#superclass : #TestCase,
	#category : #OpalCompiler-Tests-Bytecode,
	#timestamp : ''
}

{
	#category : #tests-blocks,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCBytecodeDecompilerExamplesTest>>testExampleBlockArgument [
	| ir method newMethod instance |
	
	method := (OCOpalExamples>>#exampleBlockArgument) parseTree generate.
	instance := OCOpalExamples new.
	
	ir := IRBytecodeDecompiler new decompile: method.
	newMethod := ir compiledMethod.
	
	self assert: (newMethod valueWithReceiver: instance arguments: #()) = instance exampleBlockArgument.

]

{
	#category : #tests-blocks,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCBytecodeDecompilerExamplesTest>>testExampleBlockExternal [
	| ir method newMethod instance |
	
	method := (OCOpalExamples>>#exampleBlockExternal) parseTree generate.
	instance := OCOpalExamples new.
	
	ir := IRBytecodeDecompiler new decompile: method.
	newMethod := ir compiledMethod.
	
	self assert: (newMethod valueWithReceiver: instance arguments: #()) = instance exampleBlockExternal.

]

{
	#category : #tests-blocks,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCBytecodeDecompilerExamplesTest>>testExampleBlockExternal2 [
	| ir method newMethod instance |
	
	method := (OCOpalExamples>>#exampleBlockExternal2) parseTree generate.
	instance := OCOpalExamples new.
	
	ir := IRBytecodeDecompiler new decompile: method.
	newMethod := ir compiledMethod.
	
	self assert: (newMethod valueWithReceiver: instance arguments: #()) = instance exampleBlockExternal2.

]

{
	#category : #tests-blocks,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCBytecodeDecompilerExamplesTest>>testExampleBlockExternalArg [
	| ir method newMethod instance |
	
	method := (OCOpalExamples>>#exampleBlockExternalArg) parseTree generate.
	instance := OCOpalExamples new.
	
	ir := IRBytecodeDecompiler new decompile: method.
	newMethod := ir compiledMethod.
	
	self assert: (newMethod valueWithReceiver: instance arguments: #()) = instance exampleBlockExternalArg.

]

{
	#category : #tests-blocks,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCBytecodeDecompilerExamplesTest>>testExampleBlockExternalNested [
	| ir method newMethod instance |
	
	method := (OCOpalExamples>>#exampleBlockExternalNested) parseTree generate.
	instance := OCOpalExamples new.
	
	ir := IRBytecodeDecompiler new decompile: method.
	newMethod := ir compiledMethod.
	
	self assert: (newMethod valueWithReceiver: instance arguments: #()) = instance exampleBlockExternalNested.

]

{
	#category : #tests-blocks,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCBytecodeDecompilerExamplesTest>>testExampleBlockInternal [
	| ir method newMethod instance |
	
	method := (OCOpalExamples>>#exampleBlockInternal) parseTree generate.
	instance := OCOpalExamples new.
	
	ir := IRBytecodeDecompiler new decompile: method.
	newMethod := ir compiledMethod.
	
	self assert: (newMethod valueWithReceiver: instance arguments: #()) = instance exampleBlockInternal.
]

{
	#category : #tests-blocks,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCBytecodeDecompilerExamplesTest>>testExampleBlockNested [
	| ir method newMethod instance |
	
	method := (OCOpalExamples>>#exampleBlockNested) parseTree generate.
	instance := OCOpalExamples new.
	
	ir := IRBytecodeDecompiler new decompile: method.
	newMethod := ir compiledMethod.
	
	self assert: (newMethod valueWithReceiver: instance arguments: #()) = instance exampleBlockNested.
]

{
	#category : #tests-simple,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCBytecodeDecompilerExamplesTest>>testExampleEmptyMethod [
	| ir method newMethod instance |
	
	method := (OCOpalExamples>>#exampleEmptyMethod) parseTree generate.
	instance := OCOpalExamples new.
	
	ir := IRBytecodeDecompiler new decompile: method.
	newMethod := ir compiledMethod.
	
	self assert: (newMethod valueWithReceiver: instance arguments: #()) = instance exampleEmptyMethod.
]

{
	#category : #tests-blocks-optimized,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCBytecodeDecompilerExamplesTest>>testExampleIfFalse [
	| ir method newMethod instance |
	
	method := (OCOpalExamples>>#exampleIfFalse) parseTree generate.
	instance := OCOpalExamples new.
	
	ir := IRBytecodeDecompiler new decompile: method.
	newMethod := ir compiledMethod.
	
	self assert: (newMethod valueWithReceiver: instance arguments: #()) = instance exampleIfFalse.
]

{
	#category : #tests-blocks-optimized,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCBytecodeDecompilerExamplesTest>>testExampleIfFalseIfTrue [
	| ir method newMethod instance |
	
	method := (OCOpalExamples>>#exampleIfFalseIfTrue) parseTree generate.
	instance := OCOpalExamples new.
	
	ir := IRBytecodeDecompiler new decompile: method.
	newMethod := ir compiledMethod.
	
	self assert: (newMethod valueWithReceiver: instance arguments: #()) = instance exampleIfFalseIfTrue.
]

{
	#category : #tests-blocks-optimized,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCBytecodeDecompilerExamplesTest>>testExampleIfIfNotNilReturnNil [
	| ir method newMethod instance |
	
	method := (OCOpalExamples>>#exampleIfNotNilReturnNil) parseTree generate.
	instance := OCOpalExamples new.
	
	ir := IRBytecodeDecompiler new decompile: method.
	newMethod := ir compiledMethod.
	
	self assert: (newMethod valueWithReceiver: instance arguments: #()) = instance exampleIfNotNilReturnNil
]

{
	#category : #tests-blocks-optimized,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCBytecodeDecompilerExamplesTest>>testExampleIfNotNilArg [
	| ir method newMethod instance |
	
	method := (OCOpalExamples>>#exampleIfNotNilArg) parseTree generate.
	instance := OCOpalExamples new.
	
	ir := IRBytecodeDecompiler new decompile: method.
	newMethod := ir compiledMethod.
	
	self assert: (newMethod valueWithReceiver: instance arguments: #()) = instance exampleIfNotNilArg.
]

{
	#category : #tests-blocks-optimized,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCBytecodeDecompilerExamplesTest>>testExampleIfTrue [
	| ir method newMethod instance |
	
	method := (OCOpalExamples>>#exampleIfTrue) parseTree generate.
	instance := OCOpalExamples new.
	
	ir := IRBytecodeDecompiler new decompile: method.
	newMethod := ir compiledMethod.
	
	self assert: (newMethod valueWithReceiver: instance arguments: #()) = instance exampleIfTrue
]

{
	#category : #tests-blocks-optimized,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCBytecodeDecompilerExamplesTest>>testExampleIfTrueIfFalse [
	| ir method newMethod instance |
	
	method := (OCOpalExamples>>#exampleIfTrueIfFalse) parseTree generate.
	instance := OCOpalExamples new.
	
	ir := IRBytecodeDecompiler new decompile: method.
	newMethod := ir compiledMethod.
	
	self assert: (newMethod valueWithReceiver: instance arguments: #()) = instance exampleIfTrueIfFalse
]

{
	#category : #tests-blocks,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCBytecodeDecompilerExamplesTest>>testExampleMethodTempInNestedBlock [
	| ir method newMethod instance |
	
	method := (OCOpalExamples>>#exampleMethodTempInNestedBlock) parseTree generate.
	instance := OCOpalExamples new.
	
	ir := IRBytecodeDecompiler new decompile: method.
	newMethod := ir compiledMethod.
	
	self assert: (newMethod valueWithReceiver: instance arguments: #()) = instance exampleMethodTempInNestedBlock
]

{
	#category : #tests-blocks-optimized,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCBytecodeDecompilerExamplesTest>>testExampleMethodWithOptimizedBlocksA [
	| ir method newMethod instance |
	
	method := (OCOpalExamples>>#exampleMethodWithOptimizedBlocksA) parseTree generate.
	instance := OCOpalExamples new.
	
	ir := IRBytecodeDecompiler new decompile: method.
	newMethod := ir compiledMethod.
	
	self assert: (newMethod valueWithReceiver: instance arguments: #()) = instance exampleMethodWithOptimizedBlocksA
]

{
	#category : #tests-blocks,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCBytecodeDecompilerExamplesTest>>testExampleNestedBlockScoping [
	| ir method newMethod instance |
	
	method := (OCOpalExamples>>#exampleNestedBlockScoping) parseTree generate.
	instance := OCOpalExamples new.
	
	ir := IRBytecodeDecompiler new decompile: method.
	newMethod := ir compiledMethod.
	
	self assert: (newMethod valueWithReceiver: instance arguments: #()) = instance exampleNestedBlockScoping
]

{
	#category : #tests-simple,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCBytecodeDecompilerExamplesTest>>testExampleNewArray [
	| ir method newMethod instance |
	
	method := (OCOpalExamples>>#exampleNewArray) parseTree generate.
	instance := OCOpalExamples new.
	
	ir := IRBytecodeDecompiler new decompile: method.
	newMethod := ir compiledMethod.
	
	self assert: (newMethod valueWithReceiver: instance arguments: #()) = instance exampleNewArray
]

{
	#category : #tests-misc,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCBytecodeDecompilerExamplesTest>>testExamplePushArray [
	| ir method newMethod instance |
	
	method := (OCOpalExamples>>#examplePushArray) parseTree generate.
	instance := OCOpalExamples new.
	
	ir := IRBytecodeDecompiler new decompile: method.
	newMethod := ir compiledMethod.
	
	self assert: (newMethod valueWithReceiver: instance arguments: #()) = instance examplePushArray
]

{
	#category : #tests-simple,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCBytecodeDecompilerExamplesTest>>testExampleReturn1 [
	| ir method newMethod instance |
	
	method := (OCOpalExamples>>#exampleReturn1) parseTree generate.
	instance := OCOpalExamples new.
	
	ir := IRBytecodeDecompiler new decompile: method.
	newMethod := ir compiledMethod.
	
	self assert: (newMethod valueWithReceiver: instance arguments: #()) = instance exampleReturn1
]

{
	#category : #tests-simple,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCBytecodeDecompilerExamplesTest>>testExampleReturn1plus2 [
	| ir method newMethod instance |
	
	method := (OCOpalExamples>>#exampleReturn1plus2) parseTree generate.
	instance := OCOpalExamples new.
	
	ir := IRBytecodeDecompiler new decompile: method.
	newMethod := ir compiledMethod.
	
	self assert: (newMethod valueWithReceiver: instance arguments: #()) = instance exampleReturn1plus2
]

{
	#category : #tests-variables,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCBytecodeDecompilerExamplesTest>>testExampleSelf [
	| ir method newMethod instance |
	
	method := (OCOpalExamples>>#exampleSelf) parseTree generate.
	instance := OCOpalExamples new.
	
	ir := IRBytecodeDecompiler new decompile: method.
	newMethod := ir compiledMethod.
	
	self assert: (newMethod valueWithReceiver: instance arguments: #()) = instance exampleSelf
]

{
	#category : #tests-blocks,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCBytecodeDecompilerExamplesTest>>testExampleSimpleBlock [
	| ir method newMethod instance |
	
	method := (OCOpalExamples>>#exampleSimpleBlock) parseTree generate.
	instance := OCOpalExamples new.
	
	ir := IRBytecodeDecompiler new decompile: method.
	newMethod := ir compiledMethod.
	
	self assert: (newMethod valueWithReceiver: instance arguments: #()) value = instance exampleSimpleBlock value
]

{
	#category : #tests-blocks,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCBytecodeDecompilerExamplesTest>>testExampleSimpleBlockArgument1 [
	| ir method newMethod instance |
	
	method := (OCOpalExamples>>#exampleSimpleBlockArgument1) parseTree generate.
	instance := OCOpalExamples new.
	
	ir := IRBytecodeDecompiler new decompile: method.
	newMethod := ir compiledMethod.
	
	self assert: (newMethod valueWithReceiver: instance arguments: #()) = instance exampleSimpleBlockArgument1
]

{
	#category : #tests-blocks,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCBytecodeDecompilerExamplesTest>>testExampleSimpleBlockArgument2 [
	| ir method newMethod instance |
	
	method := (OCOpalExamples>>#exampleSimpleBlockArgument2) parseTree generate.
	instance := OCOpalExamples new.
	
	ir := IRBytecodeDecompiler new decompile: method.
	newMethod := ir compiledMethod.
	
	self assert: (newMethod valueWithReceiver: instance arguments: #()) = instance exampleSimpleBlockArgument2
]

{
	#category : #tests-blocks,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCBytecodeDecompilerExamplesTest>>testExampleSimpleBlockArgument3 [
	| ir method newMethod instance |
	
	method := (OCOpalExamples>>#exampleSimpleBlockArgument3) parseTree generate.
	instance := OCOpalExamples new.
	
	ir := IRBytecodeDecompiler new decompile: method.
	newMethod := ir compiledMethod.
	
	self assert: (newMethod valueWithReceiver: instance arguments: #()) = instance exampleSimpleBlockArgument3
]

{
	#category : #tests-blocks,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCBytecodeDecompilerExamplesTest>>testExampleSimpleBlockArgument4 [
	| ir method newMethod instance |
	
	method := (OCOpalExamples>>#exampleSimpleBlockArgument4) parseTree generate.
	instance := OCOpalExamples new.
	
	ir := IRBytecodeDecompiler new decompile: method.
	newMethod := ir compiledMethod.
	
	self assert: (newMethod valueWithReceiver: instance arguments: #()) = instance exampleSimpleBlockArgument4
]

{
	#category : #tests-blocks,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCBytecodeDecompilerExamplesTest>>testExampleSimpleBlockArgument5 [
	| ir method newMethod instance |
	
	method := (OCOpalExamples>>#exampleSimpleBlockArgument5) parseTree generate.
	instance := OCOpalExamples new.
	
	ir := IRBytecodeDecompiler new decompile: method.
	newMethod := ir compiledMethod.
	
	self assert: (newMethod valueWithReceiver: instance arguments: #()) = instance exampleSimpleBlockArgument5
]

{
	#category : #tests-blocks,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCBytecodeDecompilerExamplesTest>>testExampleSimpleBlockEmpty [
	| ir method newMethod instance |
	
	method := (OCOpalExamples>>#exampleSimpleBlockEmpty) parseTree generate.
	instance := OCOpalExamples new.
	
	ir := IRBytecodeDecompiler new decompile: method.
	newMethod := ir compiledMethod.
	
	self assert: (newMethod valueWithReceiver: instance arguments: #()) = instance exampleSimpleBlockEmpty
]

{
	#category : #tests-blocks,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCBytecodeDecompilerExamplesTest>>testExampleSimpleBlockLocal [
	| ir method newMethod instance |
	
	method := (OCOpalExamples>>#exampleSimpleBlockLocal) parseTree generate.
	instance := OCOpalExamples new.
	
	ir := IRBytecodeDecompiler new decompile: method.
	newMethod := ir compiledMethod.
	
	self assert: (newMethod valueWithReceiver: instance arguments: #()) = instance exampleSimpleBlockLocal
]

{
	#category : #tests-blocks-optimized,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCBytecodeDecompilerExamplesTest>>testExampleSimpleBlockLocalIf [
	| ir method newMethod instance |
	
	method := (OCOpalExamples>>#exampleSimpleBlockLocalIf) parseTree generate.
	instance := OCOpalExamples new.
	
	ir := IRBytecodeDecompiler new decompile: method.
	newMethod := ir compiledMethod.
	
	self assert: (newMethod valueWithReceiver: instance arguments: #()) = instance exampleSimpleBlockLocalIf
]

{
	#category : #tests-blocks,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCBytecodeDecompilerExamplesTest>>testExampleSimpleBlockLocalNested [
	| ir method newMethod instance |
	
	method := (OCOpalExamples>>#exampleSimpleBlockNested) parseTree generate.
	instance := OCOpalExamples new.
	
	ir := IRBytecodeDecompiler new decompile: method.
	newMethod := ir compiledMethod.
	
	self assert: (newMethod valueWithReceiver: instance arguments: #()) = instance exampleSimpleBlockNested
]

{
	#category : #tests-blocks-optimized,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCBytecodeDecompilerExamplesTest>>testExampleSimpleBlockLocalWhile [
	| ir method newMethod instance |
	
	method := (OCOpalExamples>>#exampleSimpleBlockLocalWhile) parseTree generate.
	instance := OCOpalExamples new.
	
	ir := IRBytecodeDecompiler new decompile: method.
	newMethod := ir compiledMethod.
	
	self assert: (newMethod valueWithReceiver: instance arguments: #()) = instance exampleSimpleBlockLocalWhile
]

{
	#category : #tests-blocks,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCBytecodeDecompilerExamplesTest>>testExampleSimpleBlockNested [
	| ir method newMethod instance |
	
	method := (OCOpalExamples>>#exampleSimpleBlockNested) parseTree generate.
	instance := OCOpalExamples new.
	
	ir := IRBytecodeDecompiler new decompile: method.
	newMethod := ir compiledMethod.
	
	self assert: (newMethod valueWithReceiver: instance arguments: #()) = instance exampleSimpleBlockNested
]

{
	#category : #tests-blocks,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCBytecodeDecompilerExamplesTest>>testExampleSimpleBlockReturn [
	| ir method newMethod instance |
	
	method := (OCOpalExamples>>#exampleSimpleBlockReturn) parseTree generate.
	instance := OCOpalExamples new.
	
	ir := IRBytecodeDecompiler new decompile: method.
	newMethod := ir compiledMethod.
	
	self assert: (newMethod valueWithReceiver: instance arguments: #()) = instance exampleSimpleBlockReturn
]

{
	#category : #tests-blocks,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCBytecodeDecompilerExamplesTest>>testExampleSimpleBlockiVar [
	| ir method newMethod instance |
	
	method := (OCOpalExamples>>#exampleSimpleBlockiVar) parseTree generate.
	instance := OCOpalExamples new.
	
	ir := IRBytecodeDecompiler new decompile: method.
	newMethod := ir compiledMethod.
	
	self assert: (newMethod valueWithReceiver: instance arguments: #()) = instance exampleSimpleBlockiVar
]

{
	#category : #tests-variables,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCBytecodeDecompilerExamplesTest>>testExampleSuper [
	| ir method newMethod instance |
	
	method := (OCOpalExamples>>#exampleSuper) parseTree generate.
	instance := OCOpalExamples new.
	
	ir := IRBytecodeDecompiler new decompile: method.
	newMethod := ir compiledMethod.
	
	self assert: (newMethod valueWithReceiver: instance arguments: #()) = instance exampleSuper
]

{
	#category : #tests-variables,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCBytecodeDecompilerExamplesTest>>testExampleThisContext [
	| ir method newMethod instance |
	
	method := (OCOpalExamples>>#exampleThisContext) parseTree generate.
	
	ir := IRBytecodeDecompiler new decompile: method.
	newMethod := ir compiledMethod.
	
	self assert: (newMethod valueWithReceiver: instance arguments: #()) isContext
]

{
	#category : #tests-blocks-optimized,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCBytecodeDecompilerExamplesTest>>testExampleToDoArgument [
	| ir method newMethod instance |
	
	method := (OCOpalExamples>>#exampleToDoArgument) parseTree generate.
	instance := OCOpalExamples new.
	
	ir := IRBytecodeDecompiler new decompile: method.
	newMethod := ir compiledMethod.
	
	self assert: (newMethod valueWithReceiver: instance arguments: #()) = instance exampleToDoArgument
]

{
	#category : #tests-blocks-optimized,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCBytecodeDecompilerExamplesTest>>testExampleToDoArgumentNotInlined [
	| ir method newMethod instance |
	
	method := (OCOpalExamples>>#exampleToDoArgumentNotInlined) parseTree generate.
	instance := OCOpalExamples new.
	
	ir := IRBytecodeDecompiler new decompile: method.
	newMethod := ir compiledMethod.
	
	self assert: (newMethod valueWithReceiver: instance arguments: #()) = instance exampleToDoArgumentNotInlined
]

{
	#category : #tests-blocks-optimized,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCBytecodeDecompilerExamplesTest>>testExampleToDoInsideTemp [
	| ir method newMethod instance |
	
	method := (OCOpalExamples>>#exampleToDoInsideTemp) parseTree generate.
	instance := OCOpalExamples new.
	
	ir := IRBytecodeDecompiler new decompile: method.
	newMethod := ir compiledMethod.
	
	self assert: (newMethod valueWithReceiver: instance arguments: #()) = instance exampleToDoInsideTemp
]

{
	#category : #tests-blocks-optimized,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCBytecodeDecompilerExamplesTest>>testExampleToDoInsideTempNotInlined [
	| ir method newMethod instance |
	
	method := (OCOpalExamples>>#exampleToDoInsideTempNotInlined) parseTree generate.
	instance := OCOpalExamples new.
	
	ir := IRBytecodeDecompiler new decompile: method.
	newMethod := ir compiledMethod.
	
	self assert: (newMethod valueWithReceiver: instance arguments: #()) = instance exampleToDoInsideTempNotInlined
]

{
	#category : #tests-blocks-optimized,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCBytecodeDecompilerExamplesTest>>testExampleToDoOutsideTemp [
	| ir method newMethod instance |
	
	method := (OCOpalExamples>>#exampleToDoOutsideTemp) parseTree generate.
	instance := OCOpalExamples new.
	
	ir := IRBytecodeDecompiler new decompile: method.
	newMethod := ir compiledMethod.
	
	self assert: (newMethod valueWithReceiver: instance arguments: #()) = instance exampleToDoOutsideTemp
]

{
	#category : #tests-blocks-optimized,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCBytecodeDecompilerExamplesTest>>testExampleToDoOutsideTempNotInlined [
	| ir method newMethod instance |
	
	method := (OCOpalExamples>>#exampleToDoOutsideTempNotInlined) parseTree generate.
	instance := OCOpalExamples new.
	
	ir := IRBytecodeDecompiler new decompile: method.
	newMethod := ir compiledMethod.
	
	self assert: (newMethod valueWithReceiver: instance arguments: #()) = instance exampleToDoOutsideTempNotInlined
]

{
	#category : #tests-misc,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCBytecodeDecompilerExamplesTest>>testExampleToDoValue [
	| ir method newMethod instance |
	
	method := (OCOpalExamples>>#exampleToDoValue) parseTree generate.
	instance := OCOpalExamples new.
	
	ir := IRBytecodeDecompiler new decompile: method.
	newMethod := ir compiledMethod.
	
	self assert: (newMethod valueWithReceiver: instance arguments: #()) = instance exampleToDoValue
]

{
	#category : #tests-blocks-optimized,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCBytecodeDecompilerExamplesTest>>testExampleWhileModificationAfterNotInlined [
	| ir method newMethod instance |
	
	method := (OCOpalExamples>>#exampleWhileModificationAfterNotInlined) parseTree generate.
	instance := OCOpalExamples new.
	
	ir := IRBytecodeDecompiler new decompile: method.
	newMethod := ir compiledMethod.
	
	self assert: (newMethod valueWithReceiver: instance arguments: #()) = instance exampleWhileModificationAfterNotInlined
]

{
	#category : #tests-blocks-optimized,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCBytecodeDecompilerExamplesTest>>testExampleWhileModificationBefore [
	| ir method newMethod instance |
	
	method := (OCOpalExamples>>#exampleWhileModificationBefore) parseTree generate.
	instance := OCOpalExamples new.
	
	ir := IRBytecodeDecompiler new decompile: method.
	newMethod := ir compiledMethod.
	
	self assert: (newMethod valueWithReceiver: instance arguments: #()) = instance exampleWhileModificationBefore
]

{
	#category : #tests-blocks-optimized,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCBytecodeDecompilerExamplesTest>>testExampleWhileModificationBeforeNotInlined [
	| ir method newMethod instance |
	
	method := (OCOpalExamples>>#exampleWhileModificationBeforeNotInlined) parseTree generate.
	instance := OCOpalExamples new.
	
	ir := IRBytecodeDecompiler new decompile: method.
	newMethod := ir compiledMethod.
	
	self assert: (newMethod valueWithReceiver: instance arguments: #()) = instance exampleWhileModificationBeforeNotInlined
]

{
	#category : #tests-blocks-optimized,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCBytecodeDecompilerExamplesTest>>testExampleWhileWithTemp [
	| ir method newMethod instance |
	
	method := (OCOpalExamples>>#exampleWhileWithTemp) parseTree generate.
	instance := OCOpalExamples new.
	
	ir := IRBytecodeDecompiler new decompile: method.
	newMethod := ir compiledMethod.
	
	self assert: (newMethod valueWithReceiver: instance arguments: #()) = instance exampleWhileWithTemp
]

{
	#category : #tests-blocks-optimized,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCBytecodeDecompilerExamplesTest>>testExampleWhileWithTempNotInlined [
	| ir method newMethod instance |
	
	method := (OCOpalExamples>>#exampleWhileWithTempNotInlined) parseTree generate.
	instance := OCOpalExamples new.
	
	ir := IRBytecodeDecompiler new decompile: method.
	newMethod := ir compiledMethod.
	
	self assert: (newMethod valueWithReceiver: instance arguments: #()) = instance exampleWhileWithTempNotInlined
]

{
	#category : #tests-variables,
	#timestamp : ' 8/31/2017 05:26:31'
}
OCBytecodeDecompilerExamplesTest>>testExampleiVar [
	| ir method newMethod instance |
	
	method := (OCOpalExamples>>#exampleiVar) parseTree generate.
	instance := OCOpalExamples new.
	
	ir := IRBytecodeDecompiler new decompile: method.
	newMethod := ir compiledMethod.
	
	self assert: (newMethod valueWithReceiver: instance arguments: #()) = instance exampleiVar
]
