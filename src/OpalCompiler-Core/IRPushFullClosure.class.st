"
I represent the creation and the push on stack of a FullBlockClosure.


"
Class {
	#name : #IRPushFullClosure,
	#superclass : #IRInstruction,
	#instVars : [
		'compiledBlock',
		'copiedValues'
	],
	#category : #OpalCompiler-Core-IR-Nodes,
	#timestamp : 'ClementBera 6/27/2016 11:11'
}

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRPushFullClosure>>accept: aVisitor [
	^ aVisitor visitPushFullClosure: self
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRPushFullClosure>>compiledBlock [
	^ compiledBlock
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRPushFullClosure>>compiledBlock: anObject [
	compiledBlock := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRPushFullClosure>>copiedValues [
	^ copiedValues
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRPushFullClosure>>copiedValues: anObject [
	copiedValues := anObject
]

{
	#category : #debugging,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRPushFullClosure>>indexForVarNamed: aName [
	^ sourceNode ir indexForVarNamed: aName
]
