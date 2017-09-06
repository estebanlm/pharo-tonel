"

"
Class {
	#name : #IRPrinterTest,
	#superclass : #TestCase,
	#category : #OpalCompiler-Tests-IR,
	#timestamp : ''
}

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:31'
}
IRPrinterTest>>testDup [
	| ir |
	ir := IRBuilderTest new testDup.
	self assert: ir longPrintString = '
label: 1
pushLiteral: 3
pushDup
send: #=
returnTop
'
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:31'
}
IRPrinterTest>>testInstVar [
	| ir |
	ir := IRBuilderTest new testInstVar.
	self assert: ir longPrintString = 
 '
label: 1
pushInstVar: 1
pushInstVar: 2
send: #+
returnTop
'
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:31'
}
IRPrinterTest>>testJumpAheadTo [
	| ir |
	ir := IRBuilderTest new testJumpAheadTo.
	self assert: ir longPrintString =  '
label: 1
pushLiteral: 2
pushLiteral: 1
send: #+
goto: 2

label: 2
returnTop
'
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:31'
}
IRPrinterTest>>testJumpAheadToIf [
	| ir |
	ir := IRBuilderTest new testJumpAheadToIf.
	self assert: ir longPrintString =  '
label: 1
pushReceiver
pushLiteral: true
if: true goto: 3 else: 2

label: 2
returnTop

label: 3
returnTop
'
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:31'
}
IRPrinterTest>>testJumpBackTo [
	| ir |
	ir := IRBuilderTest new testJumpBackTo.
	self assert: ir longPrintString =  '
label: 1
pushReceiver
pushLiteral: false
goto: 2

label: 2
if: true goto: 4 else: 3

label: 3
pushLiteral: true
goto: 2

label: 4
returnTop
'
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:31'
}
IRPrinterTest>>testLiteralArray [
	| ir |
	ir := IRBuilderTest new testLiteralArray.  
	self assert: ir longPrintString =  '
label: 1
returnLiteral: #(#test 4 #you)
'
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:31'
}
IRPrinterTest>>testLiteralVariableClass [
	| ir |
	ir := IRBuilderTest new testLiteralVariableClass.
	self assert: ir longPrintString =  '
label: 1
pushLiteralVariable: Object
returnTop
'
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:31'
}
IRPrinterTest>>testPopTop [
	| ir |
	ir := IRBuilderTest new testPopTop.
	self assert: ir longPrintString =  '
label: 1
pushReceiver
pushLiteral: false
popTop
returnTop
'
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:31'
}
IRPrinterTest>>testPushClosureCopyNoCopied [
	| ir |
	ir := IRBuilderTest new testPushClosureCopyNoCopied.
	self assert: ir longPrintString =  '
label: 1
pushReceiver
pushClosureCopyCopiedValues: #() args: #()

label: 2
pushLiteral: 1
pushLiteral: 2
send: #+
blockReturnTop

label: 3
send: #value
returnTop
'
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:31'
}
IRPrinterTest>>testPushConsArray [
	| ir |
	ir := IRBuilderTest new testPushConsArray.
	self assert: ir longPrintString =  '
label: 1
pushReceiver
pushConsArray: 1
returnTop
'
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:31'
}
IRPrinterTest>>testPushNewArray [
	| ir |
	ir := IRBuilderTest new testPushNewArray.
	self assert: ir longPrintString  =  '
label: 1
pushNewArray: 1
returnTop
'
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:31'
}
IRPrinterTest>>testPushSelf [
	| ir |
	ir := IRBuilderTest new testPushSelf.
	self assert: ir longPrintString =  '
label: 1
pushReceiver
send: #class
returnTop
'
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:31'
}
IRPrinterTest>>testPushTempArgument [
	| ir |
	ir := IRBuilderTest new testPushTempArgument.
	self assert: ir longPrintString = '
label: 1
pushTemp: #a
pushTemp: #b
send: #+
returnTop
'
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:31'
}
IRPrinterTest>>testPushTempTemp [
	| ir |
	ir := IRBuilderTest new testPushTempTemp.
	self assert: ir longPrintString =  '
label: 1
pushTemp: #a
returnTop
'
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:31'
}
IRPrinterTest>>testPushThisContext [
	| ir |
	ir := IRBuilderTest new testPushThisContext.
	self assert: ir longPrintString =  '
label: 1
pushThisContext
send: #receiver
returnTop
'
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:31'
}
IRPrinterTest>>testRemoteTemp [
	| ir |
	ir := IRBuilderTest new testRemoteTemp.
	self assert: ir longPrintString equals: '
label: 1
createTempVectorNamed: #methodVector withVars: #(#b)
pushLiteral: 1
popIntoTemp: #a
pushClosureCopyCopiedValues: #(#a #c #methodVector) args: #()

label: 2
pushTemp: #a
pushLiteral: 1
send: #+
storeRemoteTemp: #b inVector: #methodVector
blockReturnTop

label: 3
send: #value
pushRemoteTemp: #b inVector: #methodVector
returnTop
'
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:31'
}
IRPrinterTest>>testRemoteTempNested [
	| ir |
	ir := IRBuilderTest new testRemoteTempNested.
	self assert: ir longPrintString =   '
label: 1
createTempVectorNamed: #methodVector withVars: #(#b)
pushLiteral: 1
popIntoTemp: #a
pushClosureCopyCopiedValues: #(#methodVector #a) args: #()

label: 2
createTempVectorNamed: #blockVector withVars: #(#f)
pushTemp: #a
pushClosureCopyCopiedValues: #(#methodVector) args: #()

label: 3
pushLiteral: 1
storeRemoteTemp: #b inVector: #methodVector
blockReturnTop

label: 4
send: #value
send: #+
storeRemoteTemp: #b inVector: #methodVector
blockReturnTop

label: 5
send: #value
pushRemoteTemp: #b inVector: #methodVector
returnTop
'
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:31'
}
IRPrinterTest>>testReturnTop [
	| ir |
	ir := IRBuilderTest new testReturnTop.
	self assert: ir longPrintString =  '
label: 1
returnLiteral: false
'
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:31'
}
IRPrinterTest>>testSendSuper [
	| ir |
	ir := IRBuilderTest new testSendSuper.
	self assert: ir longPrintString =  '
label: 1
pushReceiver
send: #isThisEverCalled toSuperOf: IRBuilderTest
returnTop
'
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:31'
}
IRPrinterTest>>testStoreIntoVariable [
	| ir |
	ir := IRBuilderTest new testStoreIntoVariable.
	self assert: ir longPrintString =  '
label: 1
pushLiteral: 4
storeLiteralVariable: TestToPush
returnTop
'
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:31'
}
IRPrinterTest>>testStoreTemp [
	| ir |
	ir := IRBuilderTest new testStoreTemp.
	self assert: ir longPrintString = '
label: 1
pushLiteral: 34
popIntoTemp: #a
pushTemp: #a
returnTop
'
]
