"

"
Class {
	#name : #FBDDecompilerTest,
	#superclass : #TestCase,
	#instVars : [
		'decompiler'
	],
	#category : #Flashback-Decompiler-Tests,
	#timestamp : ''
}

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDDecompilerTest>>checkCorrectDecompilation: aSelector [
	self checkCorrectMethodDecompilation: (self getMethod: aSelector)
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDDecompilerTest>>checkCorrectMethodDecompilation: originalMethod [
	| newMethod |
	newMethod := self decompileThenRecompile: originalMethod.
	self compare: originalMethod with: newMethod.
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDDecompilerTest>>compare: originalMethod with: newMethod [
	| gp1 gp2 gp1Result gp2Result |
	gp1 := self exampleClass new. 
	gp2 := self exampleClass new.
	gp1Result := gp1 withArgs: #() executeMethod: newMethod.
	gp2Result := gp2 withArgs: #() executeMethod: originalMethod.
	self compareResult: gp1Result with: gp2Result.
	self comparePigs: gp1 with: gp2
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDDecompilerTest>>comparePigs: gp1 with: gp2 [
	self assert: gp1 iVar equals: gp2 iVar
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDDecompilerTest>>compareResult: result1 with: result2 [
	self assert: result1 class equals: result2 class.
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDDecompilerTest>>decompileThenRecompile: originalMethod [
	| methodNode |
	methodNode := FBDDecompiler new decompile: originalMethod.
	methodNode ifNil: [ ^ nil ].
	^ self exampleClass compiler compile: methodNode formattedCode.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDDecompilerTest>>exampleClass [
	^ FBDExamples 
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDDecompilerTest>>getMethod: selector [
	^ self exampleClass >> selector
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDDecompilerTest>>test2Loops [
	self checkCorrectDecompilation: #example2Loops.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDDecompilerTest>>test2Loops2 [
	self checkCorrectDecompilation: #example2Loops2.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDDecompilerTest>>testAnd [
	self checkCorrectDecompilation: #exampleAnd.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDDecompilerTest>>testAnd2 [
	self checkCorrectDecompilation: #exampleAnd2.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDDecompilerTest>>testAndOr [
	self checkCorrectDecompilation: #exampleAndOr.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDDecompilerTest>>testAndOr2 [
	self checkCorrectDecompilation: #exampleAndOr2.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDDecompilerTest>>testAndOr3 [
	self checkCorrectDecompilation: #exampleAndOr3.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDDecompilerTest>>testAndOr4 [
	self checkCorrectDecompilation: #exampleAndOr4.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDDecompilerTest>>testAndOr5 [
	self checkCorrectDecompilation: #exampleAndOr5.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDDecompilerTest>>testAndOr6 [
	self checkCorrectDecompilation: #exampleAndOr6.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDDecompilerTest>>testBlockArgument [
	self checkCorrectDecompilation: #exampleBlockArgument.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDDecompilerTest>>testBlockExternal [
	self checkCorrectDecompilation: #exampleBlockExternal.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDDecompilerTest>>testBlockExternal2 [
	self checkCorrectDecompilation: #exampleBlockExternal2.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDDecompilerTest>>testBlockExternalArg [
	self checkCorrectDecompilation: #exampleBlockExternalArg.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDDecompilerTest>>testBlockExternalNested [
	self checkCorrectDecompilation: #exampleBlockExternalNested.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDDecompilerTest>>testBlockInternal [
	self checkCorrectDecompilation: #exampleBlockInternal.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDDecompilerTest>>testBlockIntoCascade [
	self checkCorrectDecompilation: #exampleBlockIntoCascade.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDDecompilerTest>>testBlockNested [
	self checkCorrectDecompilation: #exampleBlockNested
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDDecompilerTest>>testBlockNumCopied [
	self checkCorrectDecompilation: #exampleBlockNumCopied
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDDecompilerTest>>testBlockWithArg [
	self checkCorrectDecompilation: #exampleBlockWithArg.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDDecompilerTest>>testCascade [

	self checkCorrectDecompilation: #exampleCascade.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDDecompilerTest>>testCascade2 [

	self checkCorrectDecompilation: #exampleCascade2.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDDecompilerTest>>testCascade3 [

	self checkCorrectDecompilation: #exampleCascade3.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDDecompilerTest>>testCascade4 [

	self checkCorrectDecompilation: #exampleCascade4.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDDecompilerTest>>testCascadeIfFalse [

	self checkCorrectDecompilation: #exampleCascadeIfFalse.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDDecompilerTest>>testCascadeIfNil [
	self checkCorrectDecompilation: #exampleCascadeIfNil.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDDecompilerTest>>testCascadeIfTrueIfFalse [

	self checkCorrectDecompilation: #exampleCascadeIfTrueIfFalse.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDDecompilerTest>>testCascadeIntoBlockIntoCascade [
	self checkCorrectDecompilation: #exampleCascadeIntoBlockIntoCascade.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDDecompilerTest>>testCascadeIntoBlockWithTempIfTrueIfFalse [
	self checkCorrectDecompilation: #exampleCascadeIntoBlockWithTempIfTrueIfFalse.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDDecompilerTest>>testCascadeIntoBlockWithTempIntoCascade [
	self checkCorrectDecompilation: #exampleCascadeIntoBlockWithTempIntoCascade.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDDecompilerTest>>testCascadeNested [
	self checkCorrectDecompilation: #exampleCascadeNested.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDDecompilerTest>>testCaseOf [
	self checkCorrectDecompilation: #exampleCaseOf.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDDecompilerTest>>testCaseOf2 [
	self checkCorrectDecompilation: #exampleCaseOf2.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDDecompilerTest>>testCaseOf3 [
	self checkCorrectDecompilation: #exampleCaseOf3.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDDecompilerTest>>testCaseOf4 [
	self checkCorrectDecompilation: #exampleCaseOf4.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDDecompilerTest>>testCaseOf5 [
	self checkCorrectDecompilation: #exampleCaseOf5.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDDecompilerTest>>testCaseOf6 [
	self checkCorrectDecompilation: #exampleCaseOf6.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDDecompilerTest>>testCaseOf7 [
	self checkCorrectDecompilation: #exampleCaseOf7.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDDecompilerTest>>testCaseOf8 [
	self checkCorrectDecompilation: #exampleCaseOf8.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDDecompilerTest>>testCaseOfOtherwise [
	self checkCorrectDecompilation: #exampleCaseOfOtherwise.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDDecompilerTest>>testClassVar [
	self checkCorrectDecompilation: #exampleClassVar
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDDecompilerTest>>testCopyingBlock [
	self checkCorrectDecompilation: #exampleCopyingBlock.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDDecompilerTest>>testDoublePrimitive [
	self checkCorrectDecompilation: #exampleDoublePrimitive
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDDecompilerTest>>testDoubleRemoteAnidatedBlocks [
	self checkCorrectDecompilation: #doubleRemoteAnidatedBlocks.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDDecompilerTest>>testEffectValues [
	self checkCorrectDecompilation: #exampleEffectValues
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDDecompilerTest>>testEmptyMethod [
	self checkCorrectDecompilation: #exampleEmptyMethod.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDDecompilerTest>>testFullBlock [
	self checkCorrectDecompilation: #exampleFullBlock.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDDecompilerTest>>testIV [
	self checkCorrectDecompilation: #exampleIV
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDDecompilerTest>>testIfFalse [
	self checkCorrectDecompilation: #exampleIfFalse
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDDecompilerTest>>testIfFalse2 [
	self checkCorrectDecompilation: #exampleIfFalse2
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDDecompilerTest>>testIfFalse3 [
	self checkCorrectDecompilation: #exampleIfFalse3
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDDecompilerTest>>testIfFalseIfTrue [
	self checkCorrectDecompilation: #exampleIfFalseIfTrue.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDDecompilerTest>>testIfFalseIfTrue2 [
	self checkCorrectDecompilation: #exampleIfFalseIfTrue2.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDDecompilerTest>>testIfFalseIfTrue3 [
	self checkCorrectDecompilation: #exampleIfFalseIfTrue3.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDDecompilerTest>>testIfFalseIfTrue4 [
	self checkCorrectDecompilation: #exampleIfFalseIfTrue4.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDDecompilerTest>>testIfFalseIfTrue5 [
	self checkCorrectDecompilation: #exampleIfFalseIfTrue5.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDDecompilerTest>>testIfFalseIfTrue6 [
	self checkCorrectDecompilation: #exampleIfFalseIfTrue6
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDDecompilerTest>>testIfNil [
	self checkCorrectDecompilation: #exampleIfNil
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDDecompilerTest>>testIfNilClosure [
	self checkCorrectDecompilation: #exampleIfNilClosure
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDDecompilerTest>>testIfNilDup [
	self checkCorrectDecompilation: #exampleIfNilDup
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDDecompilerTest>>testIfNilIfNotNil [
	self checkCorrectDecompilation: #exampleIfNilIfNotNil
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDDecompilerTest>>testIfNotNilArg [
	self checkCorrectDecompilation: #exampleIfNotNilArg
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDDecompilerTest>>testIfNotNilDup [
	self checkCorrectDecompilation: #exampleIfNotNilDup
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDDecompilerTest>>testIfNotNilReturnNil [
	self checkCorrectDecompilation: #exampleIfNotNilReturnNil
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDDecompilerTest>>testIfTrue [
	self checkCorrectDecompilation: #exampleIfTrue
	
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDDecompilerTest>>testIfTrue2 [
	self checkCorrectDecompilation: #exampleIfTrue2
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDDecompilerTest>>testIfTrue3 [
	self checkCorrectDecompilation: #exampleIfTrue3
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDDecompilerTest>>testIfTrueForEffectNested [
	self checkCorrectDecompilation: #exampleIfTrueForEffectNested
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDDecompilerTest>>testIfTrueIfFalse [
	self checkCorrectDecompilation: #exampleIfTrueIfFalse.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDDecompilerTest>>testIfTrueIfFalse2 [
	self checkCorrectDecompilation: #exampleIfTrueIfFalse2.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDDecompilerTest>>testIfTrueIfFalse3 [
	self checkCorrectDecompilation: #exampleIfTrueIfFalse3.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDDecompilerTest>>testIfTrueIfFalseLikeAnd [
	self checkCorrectDecompilation: #exampleIfTrueIfFalseLikeAnd.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDDecompilerTest>>testIfTrueIfFalseNested [
	self checkCorrectDecompilation: #exampleIfTrueIfFalseNested
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDDecompilerTest>>testIfTrueIfFalseNested2 [
	self checkCorrectDecompilation: #exampleIfTrueIfFalseNested2
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDDecompilerTest>>testIfTrueIfFalseNested3 [
	self checkCorrectDecompilation: #exampleIfTrueIfFalseNested3
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDDecompilerTest>>testIfTrueNested [
	self checkCorrectDecompilation: #exampleIfTrueNested
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDDecompilerTest>>testIfTrueWithNilAssertion [
	self checkCorrectDecompilation: #exampleIfTrueWithNilAssertion
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDDecompilerTest>>testIfTrueWithOr [
	self checkCorrectDecompilation: #exampleIfTrueWithOr
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDDecompilerTest>>testInlineBlockCollectionLR3 [
	self checkCorrectDecompilation: #exampleInlineBlockCollectionLR3
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDDecompilerTest>>testMethodTempInNestedBlock [
	self checkCorrectDecompilation: #exampleMethodTempInNestedBlock
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDDecompilerTest>>testMethodWithOptimizedBlocksA [
	self checkCorrectDecompilation: #exampleMethodWithOptimizedBlocksA
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDDecompilerTest>>testNestedBlockScoping [
	self checkCorrectDecompilation: #exampleNestedBlockScoping
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDDecompilerTest>>testNestedBlocksRemoteInBlockCase1 [
	self checkCorrectDecompilation: #nestedBlocksRemoteInBlockCase1
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDDecompilerTest>>testNestedBlocksRemoteInBlockCase2 [
	self checkCorrectDecompilation: #nestedBlocksRemoteInBlockCase2
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDDecompilerTest>>testNestedBlocksRemoteInBlockCase3 [
	self checkCorrectDecompilation: #nestedBlocksRemoteInBlockCase3
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDDecompilerTest>>testNestedIfNilIfNotNil [
	self checkCorrectDecompilation: #exampleNestedIfNilIfNotNil.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDDecompilerTest>>testNewArray [
	self checkCorrectDecompilation: #exampleNewArray.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDDecompilerTest>>testNoRemoteBlockArgument [
	self checkCorrectDecompilation: #noRemoteBlockArgument
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDDecompilerTest>>testNoRemoteBlockTemp [
	self checkCorrectDecompilation: #noRemoteBlockTemp
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDDecompilerTest>>testNoRemoteReadInBlock [
	self checkCorrectDecompilation: #noRemoteReadInBlock
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDDecompilerTest>>testNoRemoteReadNestedBlocks [
	self checkCorrectDecompilation: #noRemoteReadNestedBlocks   
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDDecompilerTest>>testOptimizedBlockWrittenAfterClosedOverCase1 [
	self checkCorrectDecompilation: #optimizedBlockWrittenAfterClosedOverCase1
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDDecompilerTest>>testOptimizedBlockWrittenAfterClosedOverCase2 [
	self checkCorrectDecompilation: #optimizedBlockWrittenAfterClosedOverCase2
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDDecompilerTest>>testOr [
	self checkCorrectDecompilation: #exampleOr.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDDecompilerTest>>testPrimitiveErrorCode [
	self checkCorrectDecompilation: #examplePrimitiveErrorCode
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDDecompilerTest>>testPrimitiveErrorCodeModule [
	| newMethod |
	newMethod := self decompileThenRecompile: (self getMethod: #examplePrimitiveErrorCodeModule).
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDDecompilerTest>>testPrimitiveErrorCodeModule2 [
	| newMethod |
	newMethod := self decompileThenRecompile: (self getMethod: #examplePrimitiveErrorCodeModule2).
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDDecompilerTest>>testPushArray [
	self checkCorrectDecompilation: #examplePushArray
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDDecompilerTest>>testPushBigArray [
	self checkCorrectDecompilation: #examplePushBigArray
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDDecompilerTest>>testRepeatEffect [
	self checkCorrectDecompilation: #exampleRepeatEffect
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDDecompilerTest>>testRepeatValue [
	self checkCorrectDecompilation: #exampleRepeatValue
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDDecompilerTest>>testReturn1 [
	self checkCorrectDecompilation: #exampleReturn1
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDDecompilerTest>>testReturn1plus2 [
	self checkCorrectDecompilation: #exampleReturn1plus2
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDDecompilerTest>>testReturn42 [
	self checkCorrectDecompilation: #exampleReturn42
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDDecompilerTest>>testSelf [
	self checkCorrectDecompilation: #exampleSelf
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDDecompilerTest>>testSend [
	self checkCorrectDecompilation: #exampleSend
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDDecompilerTest>>testSend2Args [
	self checkCorrectDecompilation: #exampleSend2Args
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDDecompilerTest>>testSimpleBlock [
	self checkCorrectDecompilation: #exampleSimpleBlock
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDDecompilerTest>>testSimpleBlockArgument1 [
	self checkCorrectDecompilation: #exampleSimpleBlockArgument1
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDDecompilerTest>>testSimpleBlockArgument2 [
	self checkCorrectDecompilation: #exampleSimpleBlockArgument2
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDDecompilerTest>>testSimpleBlockArgument3 [
	self checkCorrectDecompilation: #exampleSimpleBlockArgument3
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDDecompilerTest>>testSimpleBlockArgument4 [
	self checkCorrectDecompilation: #exampleSimpleBlockArgument4
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDDecompilerTest>>testSimpleBlockArgument5 [
	self checkCorrectDecompilation: #exampleSimpleBlockArgument5
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDDecompilerTest>>testSimpleBlockEmpty [
	self checkCorrectDecompilation: #exampleSimpleBlockEmpty
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDDecompilerTest>>testSimpleBlockLocal [
	self checkCorrectDecompilation: #exampleSimpleBlockLocal
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDDecompilerTest>>testSimpleBlockLocalIf [
	self checkCorrectDecompilation: #exampleSimpleBlockLocalIf
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDDecompilerTest>>testSimpleBlockLocalIfNested [
	self checkCorrectDecompilation: #exampleSimpleBlockLocalIfNested
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDDecompilerTest>>testSimpleBlockLocalWhile [
	self checkCorrectDecompilation: #exampleSimpleBlockLocalWhile
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDDecompilerTest>>testSimpleBlockNested [
	self checkCorrectDecompilation: #exampleSimpleBlockNested
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDDecompilerTest>>testSimpleBlockReturn [
	self checkCorrectDecompilation: #exampleSimpleBlockReturn
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDDecompilerTest>>testSimpleBlockiVar [
	self checkCorrectDecompilation: #exampleSimpleBlockiVar
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDDecompilerTest>>testSuper [
	self checkCorrectDecompilation: #exampleSuper
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDDecompilerTest>>testThisContext [
	self checkCorrectDecompilation: #exampleThisContext
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDDecompilerTest>>testTimesRepeatEffect [
	self checkCorrectDecompilation: #exampleTimesRepeatEffect
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDDecompilerTest>>testTimesRepeatValue [
	self checkCorrectDecompilation: #exampleTimesRepeatValue
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDDecompilerTest>>testToByDo [
	self decompileThenRecompile: (self getMethod: #exampleToByDo).
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDDecompilerTest>>testToByDoNegativeLoop [
	self decompileThenRecompile: (self getMethod: #exampleToByDoNegativeLoop).
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDDecompilerTest>>testToDo [
	self checkCorrectDecompilation: #exampleToDo
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDDecompilerTest>>testToDo2 [
	self checkCorrectDecompilation: #exampleToDo2
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDDecompilerTest>>testToDo3 [
	self checkCorrectDecompilation: #exampleToDo3
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDDecompilerTest>>testToDo4 [
	self checkCorrectDecompilation: #exampleToDo4
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDDecompilerTest>>testToDo5 [
	self checkCorrectDecompilation: #exampleToDo5
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDDecompilerTest>>testToDoArgument [
	self checkCorrectDecompilation: #exampleToDoArgument
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDDecompilerTest>>testToDoArgumentLimitIsExpression [
	self checkCorrectDecompilation: #exampleToDoArgumentLimitIsExpression
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDDecompilerTest>>testToDoArgumentNotInlined [
	self checkCorrectDecompilation: #exampleToDoArgumentNotInlined
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDDecompilerTest>>testToDoInsideBlock [
	self checkCorrectDecompilation: #exampleToDoInsideBlock
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDDecompilerTest>>testToDoInsideTemp [
	self checkCorrectDecompilation: #exampleToDoInsideTemp
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDDecompilerTest>>testToDoInsideTempNotInlined [
	self checkCorrectDecompilation: #exampleToDoInsideTempNotInlined
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDDecompilerTest>>testToDoOutsideTemp [
	self checkCorrectDecompilation: #exampleToDoOutsideTemp
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDDecompilerTest>>testToDoOutsideTempNotInlined [
	self checkCorrectDecompilation: #exampleToDoOutsideTempNotInlined
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDDecompilerTest>>testToDoValue [
	self checkCorrectDecompilation: #exampleToDoValue
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDDecompilerTest>>testToDoValueLimitExpression [
	self checkCorrectDecompilation: #exampleToDoValueLimitExpression
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDDecompilerTest>>testToDoWithMessage [
	self checkCorrectDecompilation: #exampleToDoWithMessage
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDDecompilerTest>>testWhileFalse [
	self checkCorrectDecompilation: #exampleWhileFalse
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDDecompilerTest>>testWhileFalse2 [
	self checkCorrectDecompilation: #exampleWhileFalse2
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDDecompilerTest>>testWhileModificationAfterNotInlined [
	self checkCorrectDecompilation: #exampleWhileModificationAfterNotInlined
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDDecompilerTest>>testWhileModificationBefore [
	self checkCorrectDecompilation: #exampleWhileModificationBefore
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDDecompilerTest>>testWhileModificationBeforeNotInlined [
	self checkCorrectDecompilation: #exampleWhileModificationBeforeNotInlined
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDDecompilerTest>>testWhileNoModification [
	self checkCorrectDecompilation: #exampleWhileNoModification
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDDecompilerTest>>testWhileTrue [
	self checkCorrectDecompilation: #exampleWhileTrue
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDDecompilerTest>>testWhileTrue2 [
	self checkCorrectDecompilation: #exampleWhileTrue2
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDDecompilerTest>>testWhileTrue3 [
	self checkCorrectDecompilation: #exampleWhileTrue3
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDDecompilerTest>>testWhileTrueSameJumpTarget [
	self checkCorrectDecompilation: #exampleWhileTrueSameJumpTarget
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDDecompilerTest>>testWhileTrueSameJumpTarget2 [
	self checkCorrectDecompilation: #exampleWhileTrueSameJumpTarget2
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDDecompilerTest>>testWhileWithTemp [
	self checkCorrectDecompilation: #exampleWhileWithTemp
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDDecompilerTest>>testWhileWithTempNotInlined [
	self checkCorrectDecompilation: #exampleWhileWithTempNotInlined
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDDecompilerTest>>testWithArgsAnd [
	self decompileThenRecompile: (self getMethod: #exampleWithArgs:and:).
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:42'
}
FBDDecompilerTest>>testWithArgsAndTempsAnd [
	self decompileThenRecompile: (self getMethod: #exampleWithArgsAndTemps:and:).
]
