"

"
Class {
	#name : #IRVisitorTest,
	#superclass : #TestCase,
	#category : #OpalCompiler-Tests-IR,
	#timestamp : ''
}

{
	#category : #helper,
	#timestamp : ' 8/31/2017 05:26:31'
}
IRVisitorTest>>interpret: ir [
	IRVisitor new visitNode: ir
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:31'
}
IRVisitorTest>>testDup [
	| ir |
	ir := IRBuilderTest new testDup.
	self interpret: ir
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:31'
}
IRVisitorTest>>testInstVar [
	| ir |
	ir := IRBuilderTest new testInstVar.
	self interpret: ir
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:31'
}
IRVisitorTest>>testJumpAheadTo [
	| ir |
	ir := IRBuilderTest new testJumpAheadTo.
	self interpret: ir
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:31'
}
IRVisitorTest>>testJumpAheadToIf [
	| ir |
	ir := IRBuilderTest new testJumpAheadToIf.
	self interpret: ir
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:31'
}
IRVisitorTest>>testJumpBackTo [
	| ir |
	ir := IRBuilderTest new testJumpBackTo.
	self interpret: ir
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:31'
}
IRVisitorTest>>testLiteralArray [
	| ir |
	ir := IRBuilderTest new testLiteralArray.
	self interpret: ir
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:31'
}
IRVisitorTest>>testLiteralVariableClass [
	| ir |
	ir := IRBuilderTest new testLiteralVariableClass.
	self interpret: ir
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:31'
}
IRVisitorTest>>testPopTop [
	| ir |
	ir := IRBuilderTest new testPopTop.
	self interpret: ir
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:31'
}
IRVisitorTest>>testPushClosureCopyNoCopied [
	| ir |
	ir := IRBuilderTest new testPushClosureCopyNoCopied.
	self interpret: ir
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:31'
}
IRVisitorTest>>testPushConsArray [
	| ir |
	ir := IRBuilderTest new testPushConsArray.
	self interpret: ir
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:31'
}
IRVisitorTest>>testPushNewArray [
	| ir |
	ir := IRBuilderTest new testPushNewArray.
	self interpret: ir
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:31'
}
IRVisitorTest>>testPushSelf [
	| ir |
	ir := IRBuilderTest new testPushSelf.
	self interpret: ir
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:31'
}
IRVisitorTest>>testPushTempArgument [
	| ir |
	ir := IRBuilderTest new testPushTempArgument.
	self interpret: ir
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:31'
}
IRVisitorTest>>testPushTempTemp [
	| ir |
	ir := IRBuilderTest new testPushTempTemp.
	self interpret: ir
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:31'
}
IRVisitorTest>>testPushThisContext [
	| ir |
	ir := IRBuilderTest new testPushThisContext.
	self interpret: ir
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:31'
}
IRVisitorTest>>testRemoteTemp [
	| ir |
	ir := IRBuilderTest new testRemoteTemp.
	self interpret: ir
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:31'
}
IRVisitorTest>>testRemoteTempNested [
	| ir |
	ir := IRBuilderTest new testRemoteTempNested.
	self interpret: ir
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:31'
}
IRVisitorTest>>testReturnTop [
	| ir |
	ir := IRBuilderTest new testReturnTop.
	self interpret: ir
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:31'
}
IRVisitorTest>>testSendSuper [
	| ir |
	ir := IRBuilderTest new testSendSuper.
	self interpret: ir
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:31'
}
IRVisitorTest>>testStoreIntoVariable [
	| ir |
	ir := IRBuilderTest new testStoreIntoVariable.
	self interpret: ir
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:31'
}
IRVisitorTest>>testStoreTemp [
	| ir |
	ir := IRBuilderTest new testStoreTemp.
	self interpret: ir
]
