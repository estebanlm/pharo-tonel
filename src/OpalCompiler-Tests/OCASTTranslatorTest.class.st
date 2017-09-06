"

"
Class {
	#name : #OCASTTranslatorTest,
	#superclass : #TestCase,
	#category : #OpalCompiler-Tests-AST,
	#timestamp : ''
}

{
	#category : #'testing - simple',
	#timestamp : ' 8/31/2017 05:26:31'
}
OCASTTranslatorTest>>testEmptyMethod [
	| ast ir aCompiledMethod instance |
	ast := (OCOpalExamples>>#exampleEmptyMethod) parseTree.
	ir := (ast doSemanticAnalysisIn: OCOpalExamples) ir.
	instance := OCOpalExamples new .
	
	aCompiledMethod := ir compiledMethod.
	self assert: (aCompiledMethod valueWithReceiver: instance arguments: #()) = instance exampleEmptyMethod.
	
	
]

{
	#category : #'testing - blocks - optimized',
	#timestamp : ' 8/31/2017 05:26:31'
}
OCASTTranslatorTest>>testExampleAndOr [
	| ir ast aCompiledMethod instance |
	ast := (OCOpalExamples>>#exampleAndOr) parseTree.
	ir := (ast doSemanticAnalysisIn: OCOpalExamples) ir.
	instance := OCOpalExamples new.
	
	aCompiledMethod := ir compiledMethod.
	self assert: (aCompiledMethod valueWithReceiver: instance arguments: #()) = instance exampleAndOr.
	
	
]

{
	#category : #'testing - blocks - optimized',
	#timestamp : ' 8/31/2017 05:26:31'
}
OCASTTranslatorTest>>testExampleAndOr2 [
	| ir ast aCompiledMethod instance |
	ast := (OCOpalExamples>>#exampleAndOr2) parseTree.
	ir := (ast doSemanticAnalysisIn: OCOpalExamples) ir.
	instance := OCOpalExamples new.
	
	aCompiledMethod := ir compiledMethod.
	self assert: (aCompiledMethod valueWithReceiver: instance arguments: #()) = instance exampleAndOr2.
	
	
]

{
	#category : #'testing - blocks - optimized',
	#timestamp : ' 8/31/2017 05:26:31'
}
OCASTTranslatorTest>>testExampleAndOr3 [
	| ir ast aCompiledMethod instance |
	ast := (OCOpalExamples>>#exampleAndOr3) parseTree.
	ir := (ast doSemanticAnalysisIn: OCOpalExamples) ir.
	instance := OCOpalExamples new.
	
	aCompiledMethod := ir compiledMethod.
	self assert: (aCompiledMethod valueWithReceiver: instance arguments: #()) = instance exampleAndOr3.
	
	
]

{
	#category : #'testing - blocks - optimized',
	#timestamp : ' 8/31/2017 05:26:31'
}
OCASTTranslatorTest>>testExampleAndOr4 [
	| ir ast aCompiledMethod instance |
	ast := (OCOpalExamples>>#exampleAndOr4) parseTree.
	ir := (ast doSemanticAnalysisIn: OCOpalExamples) ir.
	instance := OCOpalExamples new.
	
	aCompiledMethod := ir compiledMethod.
	self assert: (aCompiledMethod valueWithReceiver: instance arguments: #()) = instance exampleAndOr4.
	
	
]

{
	#category : #'testing - blocks - optimized',
	#timestamp : ' 8/31/2017 05:26:31'
}
OCASTTranslatorTest>>testExampleAndOr5 [
	| ir ast aCompiledMethod instance |
	ast := (OCOpalExamples>>#exampleAndOr5) parseTree.
	ir := (ast doSemanticAnalysisIn: OCOpalExamples) ir.
	instance := OCOpalExamples new.
	
	aCompiledMethod := ir compiledMethod.
	self assert: (aCompiledMethod valueWithReceiver: instance arguments: #()) = instance exampleAndOr5.
	
	
]

{
	#category : #'testing - blocks - optimized',
	#timestamp : ' 8/31/2017 05:26:31'
}
OCASTTranslatorTest>>testExampleAndOr6 [
	| ir ast aCompiledMethod instance |
	ast := (OCOpalExamples>>#exampleAndOr6) parseTree.
	ir := (ast doSemanticAnalysisIn: OCOpalExamples) ir.
	instance := OCOpalExamples new.
	
	aCompiledMethod := ir compiledMethod.
	self assert: (aCompiledMethod valueWithReceiver: instance arguments: #()) = instance exampleAndOr6.
	
	
]

{
	#category : #'testing - blocks',
	#timestamp : ' 8/31/2017 05:26:31'
}
OCASTTranslatorTest>>testExampleBlockArgument [
	| ir ast aCompiledMethod instance |
	ast := (OCOpalExamples>>#exampleBlockArgument) parseTree.
	ir := ast doSemanticAnalysis ir.
	instance := OCOpalExamples new.
	
	aCompiledMethod := ir compiledMethod.
	self assert: (aCompiledMethod valueWithReceiver: instance arguments: #()) = instance exampleBlockArgument.
	
]

{
	#category : #'testing - blocks',
	#timestamp : ' 8/31/2017 05:26:31'
}
OCASTTranslatorTest>>testExampleBlockExternal [
	| ir ast aCompiledMethod instance |
	ast := (OCOpalExamples>>#exampleBlockExternal) parseTree.
	ir := (ast doSemanticAnalysisIn: OCOpalExamples) ir.
	instance := OCOpalExamples new. 
	
	aCompiledMethod := ir compiledMethod.
	self assert: (aCompiledMethod valueWithReceiver: instance arguments: #()) = instance exampleBlockExternal.
	
]

{
	#category : #'testing - blocks',
	#timestamp : ' 8/31/2017 05:26:31'
}
OCASTTranslatorTest>>testExampleBlockExternal2 [
	| ir ast aCompiledMethod instance |
	ast := (OCOpalExamples>>#exampleBlockExternal2) parseTree.
	ir := (ast doSemanticAnalysisIn: OCOpalExamples) ir.
	instance := OCOpalExamples new.
	
	aCompiledMethod := ir compiledMethod.
	self assert: (aCompiledMethod valueWithReceiver: instance arguments: #()) = instance exampleBlockExternal2.
	
]

{
	#category : #'testing - blocks',
	#timestamp : ' 8/31/2017 05:26:31'
}
OCASTTranslatorTest>>testExampleBlockExternalArg [
	| ir ast aCompiledMethod instance |
	ast := (OCOpalExamples>>#exampleBlockExternalArg) parseTree.
	ir := (ast doSemanticAnalysisIn: OCOpalExamples) ir.
	instance := OCOpalExamples new.
	
	aCompiledMethod := ir compiledMethod.
	self assert: (aCompiledMethod valueWithReceiver: instance arguments: #()) = instance exampleBlockExternalArg.
	
]

{
	#category : #'testing - blocks',
	#timestamp : ' 8/31/2017 05:26:31'
}
OCASTTranslatorTest>>testExampleBlockExternalNested [
	| ir ast aCompiledMethod instance |
	ast := (OCOpalExamples>>#exampleBlockExternalNested) parseTree.
	ir := (ast doSemanticAnalysisIn: OCOpalExamples) ir.
	instance := OCOpalExamples new.
	
	aCompiledMethod := ir compiledMethod.
	self assert: (aCompiledMethod valueWithReceiver: instance arguments: #()) = instance exampleBlockExternalNested.
	
]

{
	#category : #'testing - blocks',
	#timestamp : ' 8/31/2017 05:26:31'
}
OCASTTranslatorTest>>testExampleBlockInternal [
	| ir ast aCompiledMethod instance |
	ast := (OCOpalExamples>>#exampleBlockInternal) parseTree.
	ir := (ast doSemanticAnalysisIn: OCOpalExamples) ir.
	instance := OCOpalExamples new.
	
	aCompiledMethod := ir compiledMethod.
	self assert: (aCompiledMethod valueWithReceiver: instance arguments: #()) = instance exampleBlockInternal.
	
]

{
	#category : #'testing - blocks',
	#timestamp : ' 8/31/2017 05:26:31'
}
OCASTTranslatorTest>>testExampleBlockMethodArgument [
	| ir ast aCompiledMethod instance |
	ast := (OCOpalExamples>>#exampleBlockMethodArgument:) parseTree.
	ir := (ast doSemanticAnalysisIn: OCOpalExamples) ir.
	instance := OCOpalExamples new.
	
	aCompiledMethod := ir compiledMethod.
	self assert: (aCompiledMethod valueWithReceiver: instance arguments: #(2)) = 4.
	
]

{
	#category : #'testing - blocks',
	#timestamp : ' 8/31/2017 05:26:31'
}
OCASTTranslatorTest>>testExampleBlockNested [
	| ir ast aCompiledMethod instance |
	ast := (OCOpalExamples>>#exampleBlockNested) parseTree.
	ir := (ast doSemanticAnalysisIn: OCOpalExamples) ir.
	instance := OCOpalExamples new.
	
	aCompiledMethod := ir compiledMethod.
	self assert: (aCompiledMethod valueWithReceiver: instance arguments: #()) = instance exampleBlockNested.
	
]

{
	#category : #'testing - misc',
	#timestamp : ' 8/31/2017 05:26:31'
}
OCASTTranslatorTest>>testExampleEffectValues [
	| cm |
	cm := OCOpalExamples compiler compile: (OCOpalExamples>>#exampleEffectValues) sourceCode.
	self assert: (cm literals includes: #getMe).
	self assert: (cm literals includes: Class binding).
	self assert: (cm literals includes: #( got that ? )).
]

{
	#category : #'testing - simple',
	#timestamp : ' 8/31/2017 05:26:31'
}
OCASTTranslatorTest>>testExampleIfFalse [
	| ir ast aCompiledMethod instance |
	ast := (OCOpalExamples>>#exampleIfFalse) parseTree.
	ir := (ast doSemanticAnalysisIn: OCOpalExamples) ir.
	instance := OCOpalExamples new.
	
	aCompiledMethod := ir compiledMethod.
	self assert: (aCompiledMethod valueWithReceiver: instance arguments: #()) = instance exampleIfFalse.
	
	
]

{
	#category : #'testing - simple',
	#timestamp : ' 8/31/2017 05:26:31'
}
OCASTTranslatorTest>>testExampleIfFalseIfTrue [
	| ir ast aCompiledMethod instance |
	ast := (OCOpalExamples>>#exampleIfFalseIfTrue) parseTree.
	ir := (ast doSemanticAnalysisIn: OCOpalExamples) ir.
	instance := OCOpalExamples new.
	
	aCompiledMethod := ir compiledMethod.
	self assert: (aCompiledMethod valueWithReceiver: instance arguments: #()) = instance exampleIfFalseIfTrue.
	
	
]

{
	#category : #'testing - blocks - optimized',
	#timestamp : ' 8/31/2017 05:26:31'
}
OCASTTranslatorTest>>testExampleIfNotNilArg [
	| ir ast aCompiledMethod instance |
	ast := (OCOpalExamples>>#exampleIfNotNilArg) parseTree.
	ir := (ast doSemanticAnalysisIn: OCOpalExamples) ir.
	instance := OCOpalExamples new.
	
	aCompiledMethod := ir compiledMethod.
	self assert: (aCompiledMethod valueWithReceiver: instance arguments: #()) = instance exampleIfNotNilArg.
	
]

{
	#category : #'testing - blocks - optimized',
	#timestamp : ' 8/31/2017 05:26:31'
}
OCASTTranslatorTest>>testExampleIfNotNilReturnNil [
	| ir ast aCompiledMethod instance |
	ast := (OCOpalExamples>>#exampleIfNotNilReturnNil) parseTree.
	ir := (ast doSemanticAnalysisIn: OCOpalExamples) ir.
	instance := OCOpalExamples new.
	
	aCompiledMethod := ir compiledMethod.
	self assert: (aCompiledMethod valueWithReceiver: instance arguments: #()) = instance exampleIfNotNilReturnNil.
	
]

{
	#category : #'testing - blocks - optimized',
	#timestamp : ' 8/31/2017 05:26:31'
}
OCASTTranslatorTest>>testExampleIfTrue [
	| ir ast aCompiledMethod instance |
	ast := (OCOpalExamples>>#exampleIfTrue) parseTree.
	ir := (ast doSemanticAnalysisIn: OCOpalExamples) ir.
	instance := OCOpalExamples new.
	aCompiledMethod := ir compiledMethod.
	self assert: (aCompiledMethod valueWithReceiver: instance arguments: #()) = 'result'.
	
]

{
	#category : #'testing - blocks - optimized',
	#timestamp : ' 8/31/2017 05:26:31'
}
OCASTTranslatorTest>>testExampleIfTrueAssign [
	| ir ast aCompiledMethod instance |
	ast := (OCOpalExamples>>#exampleIfTrueAssign) parseTree.
	ir := (ast doSemanticAnalysisIn: OCOpalExamples) ir.
	instance := OCOpalExamples new.
	
	aCompiledMethod := ir compiledMethod.
	self assert: (aCompiledMethod valueWithReceiver: instance arguments: #()) = 1.
	
]

{
	#category : #'testing - blocks - optimized',
	#timestamp : ' 8/31/2017 05:26:31'
}
OCASTTranslatorTest>>testExampleIfTrueIfFalse [
	| ir ast aCompiledMethod instance |
	ast := (OCOpalExamples>>#exampleIfTrueIfFalse) parseTree.
	ir := (ast doSemanticAnalysisIn: OCOpalExamples) ir.
	instance := OCOpalExamples new.
	aCompiledMethod := ir compiledMethod.
	self assert: (aCompiledMethod valueWithReceiver: instance arguments: #()) = 'result'.
	
]

{
	#category : #'testing - blocks',
	#timestamp : ' 8/31/2017 05:26:31'
}
OCASTTranslatorTest>>testExampleInlineBlockCollectionLR3 [
	| ir ast aCompiledMethod instance |
	ast := (OCOpalExamples>>#exampleInlineBlockCollectionLR3) parseTree.
	ir := (ast doSemanticAnalysisIn: OCOpalExamples) ir.
	instance := OCOpalExamples new.
	
	aCompiledMethod := ir compiledMethod.
	self assert: (aCompiledMethod valueWithReceiver: instance arguments: #()) = (2 to: 12) asArray.
	
]

{
	#category : #'testing - blocks',
	#timestamp : ' 8/31/2017 05:26:31'
}
OCASTTranslatorTest>>testExampleMethodTempInNestedBlock [
	| ir ast aCompiledMethod instance |
	ast := (OCOpalExamples>>#exampleMethodTempInNestedBlock) parseTree.
	ir := (ast doSemanticAnalysisIn: OCOpalExamples) ir.
	instance := OCOpalExamples new.
	
	aCompiledMethod := ir compiledMethod.
	self assert: ((aCompiledMethod valueWithReceiver: instance arguments: #()) = instance exampleMethodTempInNestedBlock)
	
]

{
	#category : #'testing - blocks - optimized',
	#timestamp : ' 8/31/2017 05:26:31'
}
OCASTTranslatorTest>>testExampleMethodWithOptimizedBlocksA [
	| ir ast aCompiledMethod instance |
	ast  := (OCOpalExamples>>#exampleMethodWithOptimizedBlocksA) parseTree.
	ir := (ast doSemanticAnalysisIn: OCOpalExamples) ir.
	instance := OCOpalExamples new .
	
	aCompiledMethod := ir compiledMethod.
	self assert: (aCompiledMethod valueWithReceiver: instance arguments: #()) = instance exampleMethodWithOptimizedBlocksA.
	
	
]

{
	#category : #'testing - blocks',
	#timestamp : ' 8/31/2017 05:26:31'
}
OCASTTranslatorTest>>testExampleNestedBlockScoping [
	| ir ast aCompiledMethod instance |
	ast := (OCOpalExamples>>#exampleNestedBlockScoping) parseTree.
	ir := (ast doSemanticAnalysisIn: OCOpalExamples) ir.
	instance := OCOpalExamples new.
	
	aCompiledMethod := ir compiledMethod.
	self assert: (aCompiledMethod valueWithReceiver: instance arguments: #()) = instance exampleNestedBlockScoping.
	
]

{
	#category : #'testing - blocks - optimized',
	#timestamp : ' 8/31/2017 05:26:31'
}
OCASTTranslatorTest>>testExampleOptimizedBlockWrittenAfterClosedOverCase1 [
	| ir ast aCompiledMethod instance |
	ast  := (OCOpalExamples>>#optimizedBlockWrittenAfterClosedOverCase1) parseTree.
	ir := (ast doSemanticAnalysisIn: OCOpalExamples) ir.
	instance := OCOpalExamples new .
	
	aCompiledMethod := ir compiledMethod.
	self assert: (aCompiledMethod valueWithReceiver: instance arguments: #()) = instance optimizedBlockWrittenAfterClosedOverCase1.
	
	
]

{
	#category : #'testing - primitives',
	#timestamp : ' 8/31/2017 05:26:31'
}
OCASTTranslatorTest>>testExamplePrimitiveErrorCode [
	| method ast ir newMethod |
	method := (OCOpalExamples>>#examplePrimitiveErrorCode).
	ast := method parseTree.
	ir := (ast doSemanticAnalysisIn: OCOpalExamples) ir.

	newMethod := ir compiledMethod.
	self assert: method primitive = newMethod primitive. 

	

	
	

	
]

{
	#category : #'testing - primitives',
	#timestamp : ' 8/31/2017 05:26:31'
}
OCASTTranslatorTest>>testExamplePrimitiveErrorCodeModule [
	| method ast ir newMethod |
	method := (OCOpalExamples>>#examplePrimitiveErrorCodeModule).
	ast := method parseTree.
	ir := (ast doSemanticAnalysisIn: OCOpalExamples) ir.

	newMethod := ir compiledMethod.
	
	self assert: method primitive = newMethod primitive. 
	self assert: method pragmas printString  = newMethod pragmas printString
	

	
	

	
]

{
	#category : #'testing - primitives',
	#timestamp : ' 8/31/2017 05:26:31'
}
OCASTTranslatorTest>>testExamplePrimitiveErrorModule [
"test for primitive declaration
  <primitive: 'primFunction'  error: errorCode module: 'primModule'  >
"
	| method ast ir |
	method := OCOpalExamples >> #examplePrimitiveErrorModule.
	ast := method parseTree.
	ir := (ast doSemanticAnalysisIn: OCOpalExamples) ir.
	self assert: ir tempKeys equals: #(#errorCode)
]

{
	#category : #'testing - primitives',
	#timestamp : ' 8/31/2017 05:26:31'
}
OCASTTranslatorTest>>testExamplePrimitiveModuleError [
"teset for primitive declaration
  <primitive: 'primFunction'  module: 'primModule' error: errorCode >
"
	| method ast ir |
	method := OCOpalExamples >> #examplePrimitiveModuleError.
	ast := method parseTree.
	ir := (ast doSemanticAnalysisIn: OCOpalExamples) ir.
	self assert: ir tempKeys equals: #(#errorCode)
]

{
	#category : #'testing - variables',
	#timestamp : ' 8/31/2017 05:26:31'
}
OCASTTranslatorTest>>testExampleSelf [
	| ir ast aCompiledMethod instance |
	ast := (OCOpalExamples>>#exampleSelf) parseTree.
	ir := (ast doSemanticAnalysisIn: OCOpalExamples) ir.
	instance := OCOpalExamples new.
	
	aCompiledMethod := ir compiledMethod.
	self assert: (aCompiledMethod valueWithReceiver: instance arguments: #()) = instance exampleSelf.
	
	
]

{
	#category : #'testing - blocks',
	#timestamp : ' 8/31/2017 05:26:31'
}
OCASTTranslatorTest>>testExampleSimpleBlock [
	| ir ast aCompiledMethod instance |
	ast := (OCOpalExamples>>#exampleSimpleBlock) parseTree.
	ir := (ast doSemanticAnalysisIn: OCOpalExamples) ir.
	instance := OCOpalExamples new.
	
	aCompiledMethod := ir compiledMethod.
	self assert: (aCompiledMethod valueWithReceiver: instance arguments: #()) value = instance exampleSimpleBlock value.
	
]

{
	#category : #'testing - blocks',
	#timestamp : ' 8/31/2017 05:26:31'
}
OCASTTranslatorTest>>testExampleSimpleBlockArgument1 [
	| ir ast aCompiledMethod instance |
	ast := (OCOpalExamples>>#exampleSimpleBlockArgument1) parseTree.
	ir := (ast doSemanticAnalysisIn: OCOpalExamples) ir.
	instance := OCOpalExamples new.
	
	aCompiledMethod := ir compiledMethod.
	self assert: (aCompiledMethod valueWithReceiver: instance arguments: #()) = instance exampleSimpleBlockArgument1.
	
]

{
	#category : #'testing - blocks',
	#timestamp : ' 8/31/2017 05:26:31'
}
OCASTTranslatorTest>>testExampleSimpleBlockArgument2 [
	| ir ast aCompiledMethod instance |
	ast := (OCOpalExamples>>#exampleSimpleBlockArgument2) parseTree.
	ir := (ast doSemanticAnalysisIn: OCOpalExamples) ir.
	instance := OCOpalExamples new.
	
	aCompiledMethod := ir compiledMethod.
	self assert: (aCompiledMethod valueWithReceiver: instance arguments: #()) = instance exampleSimpleBlockArgument2.
	
]

{
	#category : #'testing - blocks',
	#timestamp : ' 8/31/2017 05:26:31'
}
OCASTTranslatorTest>>testExampleSimpleBlockArgument3 [
	| ir ast aCompiledMethod instance |
	ast := (OCOpalExamples>>#exampleSimpleBlockArgument3) parseTree.
	ir := (ast doSemanticAnalysisIn: OCOpalExamples) ir.
	instance := OCOpalExamples new.
	
	aCompiledMethod := ir compiledMethod.
	self assert: (aCompiledMethod valueWithReceiver: instance arguments: #()) = instance exampleSimpleBlockArgument3.
	
]

{
	#category : #'testing - blocks',
	#timestamp : ' 8/31/2017 05:26:31'
}
OCASTTranslatorTest>>testExampleSimpleBlockArgument4 [
	| ir ast aCompiledMethod instance |
	ast := (OCOpalExamples>>#exampleSimpleBlockArgument4) parseTree.
	ir := (ast doSemanticAnalysisIn: OCOpalExamples) ir.
	instance := OCOpalExamples new.
	
	aCompiledMethod := ir compiledMethod.
	self assert: (aCompiledMethod valueWithReceiver: instance arguments: #()) = instance exampleSimpleBlockArgument4 .
	
]

{
	#category : #'testing - blocks',
	#timestamp : ' 8/31/2017 05:26:31'
}
OCASTTranslatorTest>>testExampleSimpleBlockArgument5 [
	| ir ast aCompiledMethod instance |
	ast := (OCOpalExamples>>#exampleSimpleBlockArgument5) parseTree.
	ir := (ast doSemanticAnalysisIn: OCOpalExamples) ir.
	instance := OCOpalExamples new.
	
	aCompiledMethod := ir compiledMethod.
	self assert: (aCompiledMethod valueWithReceiver: instance arguments: #()) = instance exampleSimpleBlockArgument5 .
	
]

{
	#category : #'testing - blocks',
	#timestamp : ' 8/31/2017 05:26:31'
}
OCASTTranslatorTest>>testExampleSimpleBlockEmpty [
	| ir ast aCompiledMethod instance |
	ast := (OCOpalExamples>>#exampleSimpleBlockEmpty) parseTree.
	ir := (ast doSemanticAnalysisIn: OCOpalExamples) ir.
	instance := OCOpalExamples new.
	
	aCompiledMethod := ir compiledMethod.
	self assert: (aCompiledMethod valueWithReceiver: instance arguments: #()) = instance exampleSimpleBlockEmpty .
	
]

{
	#category : #'testing - blocks',
	#timestamp : ' 8/31/2017 05:26:31'
}
OCASTTranslatorTest>>testExampleSimpleBlockLocal [
	| ir ast aCompiledMethod instance |
	ast := (OCOpalExamples>>#exampleSimpleBlockLocal) parseTree.
	ir := (ast doSemanticAnalysisIn: OCOpalExamples) ir.
	instance := OCOpalExamples new.
	
	aCompiledMethod := ir compiledMethod.
	self assert: (aCompiledMethod valueWithReceiver: instance arguments: #()) = instance exampleSimpleBlockLocal .
	
]

{
	#category : #'testing - blocks - optimized',
	#timestamp : ' 8/31/2017 05:26:31'
}
OCASTTranslatorTest>>testExampleSimpleBlockLocalIf [
	| ir ast aCompiledMethod instance |
	ast := (OCOpalExamples>>#exampleSimpleBlockLocalIf) parseTree.
	ir := (ast doSemanticAnalysisIn: OCOpalExamples) ir.
	instance := OCOpalExamples new.
	
	aCompiledMethod := ir compiledMethod.
	self assert: (aCompiledMethod valueWithReceiver: instance arguments: #()) = instance exampleSimpleBlockLocalIf.
	
	
]

{
	#category : #'testing - blocks',
	#timestamp : ' 8/31/2017 05:26:31'
}
OCASTTranslatorTest>>testExampleSimpleBlockLocalIfNested [
	| ir ast aCompiledMethod instance |
	ast := (OCOpalExamples>>#exampleSimpleBlockLocalIfNested) parseTree.
	ir := (ast doSemanticAnalysisIn: OCOpalExamples) ir.
	instance := OCOpalExamples new.
	
	aCompiledMethod := ir compiledMethod.
	self assert: (aCompiledMethod valueWithReceiver: instance arguments: #()) = instance exampleSimpleBlockLocalIfNested.
	
]

{
	#category : #'testing - blocks - optimized',
	#timestamp : ' 8/31/2017 05:26:31'
}
OCASTTranslatorTest>>testExampleSimpleBlockLocalWhile [
	| ir ast aCompiledMethod instance |
	ast := (OCOpalExamples>>#exampleSimpleBlockLocalWhile) parseTree.
	ir := (ast doSemanticAnalysisIn: OCOpalExamples) ir.
	instance := OCOpalExamples new.
	
	aCompiledMethod := ir compiledMethod.
	self assert: (aCompiledMethod valueWithReceiver: instance arguments: #()) = instance exampleSimpleBlockLocalWhile.
	
	
]

{
	#category : #'testing - blocks',
	#timestamp : ' 8/31/2017 05:26:31'
}
OCASTTranslatorTest>>testExampleSimpleBlockNested [
	| ir ast aCompiledMethod instance |
	ast := (OCOpalExamples>>#exampleSimpleBlockNested) parseTree.
	ir := (ast doSemanticAnalysisIn: OCOpalExamples) ir.
	instance := OCOpalExamples new.
	
	aCompiledMethod := ir compiledMethod.
	self assert: (aCompiledMethod valueWithReceiver: instance arguments: #()) = instance exampleSimpleBlockNested.
	
]

{
	#category : #'testing - blocks',
	#timestamp : ' 8/31/2017 05:26:31'
}
OCASTTranslatorTest>>testExampleSimpleBlockReturn [
	| ir ast aCompiledMethod instance |
	ast := (OCOpalExamples>>#exampleSimpleBlockReturn) parseTree.
	ir := (ast doSemanticAnalysisIn: OCOpalExamples) ir.
	instance := OCOpalExamples new.
	
	aCompiledMethod := ir compiledMethod.
	self assert: (aCompiledMethod valueWithReceiver: instance arguments: #()) = instance exampleSimpleBlockReturn.
	
]

{
	#category : #'testing - blocks',
	#timestamp : ' 8/31/2017 05:26:31'
}
OCASTTranslatorTest>>testExampleSimpleBlockiVar [
	| ir ast aCompiledMethod instance |
	ast := (OCOpalExamples>>#exampleSimpleBlockiVar) parseTree.
	ir := (ast doSemanticAnalysisIn: OCOpalExamples) ir.
	instance := OCOpalExamples new.
	
	aCompiledMethod := ir compiledMethod.
	self assert: ((aCompiledMethod valueWithReceiver: instance arguments: #()) = instance exampleSimpleBlockiVar)
	
]

{
	#category : #'testing - variables',
	#timestamp : ' 8/31/2017 05:26:31'
}
OCASTTranslatorTest>>testExampleSuper [
	| ir ast aCompiledMethod instance |
	ast := (OCOpalExamples>>#exampleSuper) parseTree.
	ir := (ast doSemanticAnalysisIn: OCOpalExamples) ir.
	instance := OCOpalExamples new.
	
	aCompiledMethod := ir compiledMethod.
	self assert: (aCompiledMethod valueWithReceiver: instance arguments: #()) = instance exampleSuper.
	
	
]

{
	#category : #'testing - variables',
	#timestamp : ' 8/31/2017 05:26:31'
}
OCASTTranslatorTest>>testExampleThisContext [
	| ir ast aCompiledMethod instance |
	ast := (OCOpalExamples>>#exampleThisContext) parseTree.
	ir := (ast doSemanticAnalysisIn: OCOpalExamples) ir.
	instance := OCOpalExamples new.
	
	aCompiledMethod := ir compiledMethod.
	self assert: OCOpalExamples new exampleThisContext isContext.
	self assert: ((OCOpalExamples>>#exampleThisContext) valueWithReceiver: instance arguments: #()) isContext.
	self assert: (aCompiledMethod valueWithReceiver: instance arguments: #()) isContext.
	
	
]

{
	#category : #'testing - blocks - optimized',
	#timestamp : ' 8/31/2017 05:26:31'
}
OCASTTranslatorTest>>testExampleTimesRepeatEffect [
	| ir ast aCompiledMethod instance |
	ast := (OCOpalExamples>>#exampleTimesRepeatEffect) parseTree.
	ir := (ast doSemanticAnalysisIn: OCOpalExamples) ir.
	instance := OCOpalExamples new.
	
	aCompiledMethod := ir compiledMethod.
	self assert: (aCompiledMethod valueWithReceiver: instance arguments: #()) = instance exampleTimesRepeatEffect.
	
	
]

{
	#category : #'testing - blocks - optimized',
	#timestamp : ' 8/31/2017 05:26:31'
}
OCASTTranslatorTest>>testExampleTimesRepeatValue [
	| ir ast aCompiledMethod instance |
	ast := (OCOpalExamples>>#exampleTimesRepeatValue) parseTree.
	ir := (ast doSemanticAnalysisIn: OCOpalExamples) ir.
	instance := OCOpalExamples new.
	
	aCompiledMethod := ir compiledMethod.
	self assert: (aCompiledMethod valueWithReceiver: instance arguments: #()) = instance exampleTimesRepeatValue.
	
	
]

{
	#category : #'testing - blocks - optimized',
	#timestamp : ' 8/31/2017 05:26:31'
}
OCASTTranslatorTest>>testExampleToDoArgument [
	| ir ast aCompiledMethod instance |
	ast := (OCOpalExamples>>#exampleToDoArgument) parseTree.
	ir := (ast doSemanticAnalysisIn: OCOpalExamples) ir.
	instance := OCOpalExamples new.
	
	aCompiledMethod := ir compiledMethod.
	self assert: (aCompiledMethod valueWithReceiver: instance arguments: #()) = instance exampleToDoArgument.
	
	
]

{
	#category : #'testing - blocks - optimized',
	#timestamp : ' 8/31/2017 05:26:31'
}
OCASTTranslatorTest>>testExampleToDoArgumentLimitIsExpression [
	| ir ast aCompiledMethod instance |
	ast := (OCOpalExamples>>#exampleToDoArgumentLimitIsExpression) parseTree.
	ir := (ast doSemanticAnalysisIn: OCOpalExamples) ir.
	instance := OCOpalExamples new.
	
	aCompiledMethod := ir compiledMethod.
	self assert: (aCompiledMethod valueWithReceiver: instance arguments: #()) = instance exampleToDoArgumentLimitIsExpression.
	
	
]

{
	#category : #'testing - blocks - optimized',
	#timestamp : ' 8/31/2017 05:26:31'
}
OCASTTranslatorTest>>testExampleToDoArgumentNotInlined [
	| ir ast aCompiledMethod instance |
	ast := (OCOpalExamples>>#exampleToDoArgumentNotInlined) parseTree.
	ir := (ast doSemanticAnalysisIn: OCOpalExamples) ir.
	instance := OCOpalExamples new.
	
	aCompiledMethod := ir compiledMethod.
	self assert: (aCompiledMethod valueWithReceiver: instance arguments: #()) = instance exampleToDoArgumentNotInlined.
	
	
]

{
	#category : #'testing - blocks - optimized',
	#timestamp : ' 8/31/2017 05:26:31'
}
OCASTTranslatorTest>>testExampleToDoInsideTemp [
	| ir ast aCompiledMethod instance |
	ast := (OCOpalExamples>>#exampleToDoInsideTemp) parseTree.
	ir := (ast doSemanticAnalysisIn: OCOpalExamples) ir.
	instance := OCOpalExamples new.
	
	aCompiledMethod := ir compiledMethod.
	self assert: (aCompiledMethod valueWithReceiver: instance arguments: #()) = instance exampleToDoInsideTemp.
	
	
]

{
	#category : #'testing - blocks - optimized',
	#timestamp : ' 8/31/2017 05:26:31'
}
OCASTTranslatorTest>>testExampleToDoInsideTempNotInlined [
	| ir ast aCompiledMethod instance |
	ast := (OCOpalExamples>>#exampleToDoInsideTempNotInlined) parseTree.
	ir := (ast doSemanticAnalysisIn: OCOpalExamples) ir.
	instance := OCOpalExamples new.
	
	aCompiledMethod := ir compiledMethod.
	self assert: (aCompiledMethod valueWithReceiver: instance arguments: #()) = instance exampleToDoInsideTempNotInlined.
	
	
]

{
	#category : #'testing - blocks - optimized',
	#timestamp : ' 8/31/2017 05:26:31'
}
OCASTTranslatorTest>>testExampleToDoOutsideTemp [
	| ir ast aCompiledMethod instance |
	ast := (OCOpalExamples>>#exampleToDoOutsideTemp) parseTree.
	ir := (ast doSemanticAnalysisIn: OCOpalExamples) ir.
	instance := OCOpalExamples new.
	
	aCompiledMethod := ir compiledMethod.
	self assert: (aCompiledMethod valueWithReceiver: instance arguments: #()) = instance exampleToDoOutsideTemp.
	
	
]

{
	#category : #'testing - blocks - optimized',
	#timestamp : ' 8/31/2017 05:26:31'
}
OCASTTranslatorTest>>testExampleToDoOutsideTempNotInlined [
	| ir ast aCompiledMethod instance |
	ast := (OCOpalExamples>>#exampleToDoOutsideTempNotInlined) parseTree.
	ir := (ast doSemanticAnalysisIn: OCOpalExamples) ir.
	instance := OCOpalExamples new.
	
	aCompiledMethod := ir compiledMethod.
	self assert: (aCompiledMethod valueWithReceiver: instance arguments: #()) = instance exampleToDoOutsideTempNotInlined.
	
	
]

{
	#category : #'testing - blocks - optimized',
	#timestamp : ' 8/31/2017 05:26:31'
}
OCASTTranslatorTest>>testExampleWhileModificationAfterNotInlined [
	| ir ast aCompiledMethod instance |
	ast := (OCOpalExamples>>#exampleWhileModificationAfterNotInlined) parseTree.
	ir := (ast doSemanticAnalysisIn: OCOpalExamples) ir.
	instance := OCOpalExamples new.
	
	aCompiledMethod := ir compiledMethod.
	self assert: (aCompiledMethod valueWithReceiver: instance arguments: #()) = instance exampleWhileModificationAfterNotInlined.
	
	
]

{
	#category : #'testing - blocks',
	#timestamp : ' 8/31/2017 05:26:31'
}
OCASTTranslatorTest>>testExampleWhileModificationBefore [
	| ir ast aCompiledMethod instance |
	ast := (OCOpalExamples>>#exampleWhileModificationBefore) parseTree.
	ir := (ast doSemanticAnalysisIn: OCOpalExamples) ir.
	instance := OCOpalExamples new.
	
	aCompiledMethod := ir compiledMethod.
	self assert: (aCompiledMethod valueWithReceiver: OCOpalExamples new arguments: #()) = instance exampleWhileModificationBefore.
	
]

{
	#category : #'testing - blocks - optimized',
	#timestamp : ' 8/31/2017 05:26:31'
}
OCASTTranslatorTest>>testExampleWhileModificationBeforeNotInlined [
	| ir ast aCompiledMethod instance |
	ast := (OCOpalExamples>>#exampleWhileModificationBeforeNotInlined) parseTree.
	ir := (ast doSemanticAnalysisIn: OCOpalExamples) ir.
	instance := OCOpalExamples new.
	
	aCompiledMethod := ir compiledMethod.
	self assert: (aCompiledMethod valueWithReceiver: instance arguments: #()) = instance exampleWhileModificationBeforeNotInlined.
	
	
]

{
	#category : #'testing - blocks',
	#timestamp : ' 8/31/2017 05:26:31'
}
OCASTTranslatorTest>>testExampleWhileWithTemp [
	| ir ast aCompiledMethod instance |
	ast := (OCOpalExamples>>#exampleWhileWithTemp) parseTree.
	ir := (ast doSemanticAnalysisIn: OCOpalExamples) ir.
	instance := OCOpalExamples new.
	
	aCompiledMethod := ir compiledMethod.
	self assert: (aCompiledMethod valueWithReceiver: instance arguments: #()) = instance exampleWhileWithTemp.
	
	
]

{
	#category : #'testing - blocks',
	#timestamp : ' 8/31/2017 05:26:31'
}
OCASTTranslatorTest>>testExampleWhileWithTempNotInlined [
	| ir ast aCompiledMethod instance |
	ast := (OCOpalExamples>>#exampleWhileWithTempNotInlined) parseTree.
	ir := (ast doSemanticAnalysisIn: OCOpalExamples) ir.
	instance := OCOpalExamples new.
	
	aCompiledMethod := ir compiledMethod.
	self assert: (aCompiledMethod valueWithReceiver: instance arguments: #()) = instance exampleWhileWithTempNotInlined.
	
	
]

{
	#category : #'testing - simple',
	#timestamp : ' 8/31/2017 05:26:31'
}
OCASTTranslatorTest>>testNewArray [
	| ir ast aCompiledMethod instance |
	ast := (OCOpalExamples>>#exampleNewArray) parseTree.
	ir := (ast doSemanticAnalysisIn: OCOpalExamples) ir.
	instance := OCOpalExamples new.
	
	aCompiledMethod := ir compiledMethod.
	self assert: (aCompiledMethod valueWithReceiver: instance arguments: #()) = instance exampleNewArray.
	
	
]

{
	#category : #'testing - simple',
	#timestamp : ' 8/31/2017 05:26:31'
}
OCASTTranslatorTest>>testOnePlusTwo [
	| ast ir aCompiledMethod instance |
	ast  := (OCOpalExamples>>#exampleReturn1plus2) parseTree.
	ir := (ast doSemanticAnalysisIn: OCOpalExamples) ir.
	instance := OCOpalExamples new.
	
	aCompiledMethod := ir compiledMethod.
	self assert: (aCompiledMethod valueWithReceiver: instance arguments: #()) = instance exampleReturn1plus2.
	
	
]

{
	#category : #'testing - misc',
	#timestamp : ' 8/31/2017 05:26:31'
}
OCASTTranslatorTest>>testPushArray [
	| ast ir aCompiledMethod instance |
	ast := (OCOpalExamples>>#examplePushArray) parseTree.
	ir := (ast doSemanticAnalysisIn: OCOpalExamples) ir.
	instance := OCOpalExamples new .
	
	aCompiledMethod := ir compiledMethod.
	self assert: (aCompiledMethod valueWithReceiver: instance arguments: #()) = instance examplePushArray.
]

{
	#category : #'testing - misc',
	#timestamp : ' 8/31/2017 05:26:31'
}
OCASTTranslatorTest>>testPushBigArray [
	| ast ir aCompiledMethod instance |
	ast := (OCOpalExamples>>#examplePushBigArray) parseTree.
	ir := (ast doSemanticAnalysisIn: OCOpalExamples) ir.
	instance := OCOpalExamples new .
	
	aCompiledMethod := ir compiledMethod.
	self assert: (aCompiledMethod valueWithReceiver: instance arguments: #()) = instance examplePushBigArray.
]

{
	#category : #'testing - simple',
	#timestamp : ' 8/31/2017 05:26:31'
}
OCASTTranslatorTest>>testReturn1 [
	| ir ast aCompiledMethod instance |
	ast := (OCOpalExamples>>#exampleReturn1) parseTree.
	ir := (ast doSemanticAnalysisIn: OCOpalExamples) ir.
	instance := OCOpalExamples new.
	
	aCompiledMethod := ir compiledMethod.
	self assert: (aCompiledMethod valueWithReceiver: instance arguments: #()) = instance exampleReturn1.
	
	
]

{
	#category : #'testing - misc',
	#timestamp : ' 8/31/2017 05:26:31'
}
OCASTTranslatorTest>>testTodoValue [
	| ast ir aCompiledMethod instance |
	ast := (OCOpalExamples>>#exampleToDoValue) parseTree.
	ir := (ast doSemanticAnalysisIn: OCOpalExamples) ir.
	instance := OCOpalExamples new .
	aCompiledMethod := ir compiledMethod.
	self assert: (aCompiledMethod valueWithReceiver: instance arguments: #()) = instance exampleToDoValue.
]

{
	#category : #'testing - misc',
	#timestamp : ' 8/31/2017 05:26:31'
}
OCASTTranslatorTest>>testTodoValueLimitExpression [
	| ast ir aCompiledMethod instance |
	ast := (OCOpalExamples>>#exampleToDoValueLimitExpression) parseTree.
	ir := (ast doSemanticAnalysisIn: OCOpalExamples) ir.
	instance := OCOpalExamples new .
	aCompiledMethod := ir compiledMethod.
	self assert: (aCompiledMethod valueWithReceiver: instance arguments: #()) = instance exampleToDoValueLimitExpression.
]

{
	#category : #'testing - variables',
	#timestamp : ' 8/31/2017 05:26:31'
}
OCASTTranslatorTest>>testiVar [
	| ir ast aCompiledMethod instance |
	ast := (OCOpalExamples>>#exampleiVar) parseTree.
	ir := (ast doSemanticAnalysisIn: OCOpalExamples) ir.
	instance := OCOpalExamples new.
	
	aCompiledMethod := ir compiledMethod.
	self assert: (aCompiledMethod valueWithReceiver: instance arguments: #()) = instance exampleiVar.
	
	
]
