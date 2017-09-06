"
I visit an IRMethod instructions and write them out to a print stream.
"
Class {
	#name : #IRVisitor,
	#superclass : #Object,
	#category : #OpalCompiler-Core-IR-Manipulation,
	#timestamp : 'ClementBer 10/14/2014 13:58'
}

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRVisitor>>visitBlockReturnTop: blockReturnTop [

]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRVisitor>>visitInstruction: instr [
	 
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRVisitor>>visitJump: jump [

]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRVisitor>>visitJumpIf: jumpIf [

]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRVisitor>>visitMethod: method [
	self visitNodes: method allSequences.
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRVisitor>>visitNode: elem [
	^ elem accept: self
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRVisitor>>visitNodes: col [
	col do: [ :each | self visitNode: each ]
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRVisitor>>visitPop: pop [

]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRVisitor>>visitPopIntoInstVar: instVar [

]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRVisitor>>visitPopIntoLiteralVariable: litVar [

]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRVisitor>>visitPopIntoRemoteTemp: remoteTemp [

]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRVisitor>>visitPopIntoTemp: tmp [

]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRVisitor>>visitPushArray: pushArray [

]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRVisitor>>visitPushClosureCopy: pushClosureCopy [

]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRVisitor>>visitPushDup: pushDup [

]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRVisitor>>visitPushFullClosure: fullBlock [

]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRVisitor>>visitPushInstVar: pushInstVar [

]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRVisitor>>visitPushLiteral: pushLiteral [

]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRVisitor>>visitPushLiteralVariable: pushLiteralVariable [

]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRVisitor>>visitPushReceiver: receiver [

]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRVisitor>>visitPushRemoteTemp: pushRemoteTemp [

]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRVisitor>>visitPushTemp: pushTemp [

]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRVisitor>>visitPushThisContext: pushThisContext [

]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRVisitor>>visitReturn: return [

]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRVisitor>>visitReturnInstVar: instVar [

]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRVisitor>>visitReturnLiteral: lit [

]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRVisitor>>visitReturnReceiver: rec [

]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRVisitor>>visitSend: send [

]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRVisitor>>visitSequence: sequence [
	sequence do: [ :instr | self visitInstruction: instr].
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRVisitor>>visitStoreInstVar: storeInstVar [

]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRVisitor>>visitStoreLiteralVariable: storeLiteralVariable [

]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRVisitor>>visitStoreRemoteTemp: storeRemoteTemp [

]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRVisitor>>visitStoreTemp: storeTemp [

]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRVisitor>>visitTempVector: tempVector [

]
