"
Fix the IR nodes.

Transforms:

store, pop => popInto
some returns => quick returns
"
Class {
	#name : #IRFix,
	#superclass : #IRVisitor,
	#instVars : [
		'prevInstr',
		'storePopToFix',
		'retToFix'
	],
	#category : #OpalCompiler-Core-IR-Manipulation,
	#timestamp : 'ClementBera 10/27/2014 10:59'
}

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRFix>>convertRet: assoc forSeq: seq  [
	| push ret |
	push := assoc key.
	ret := assoc value.
	seq replaceNode: push withNode: (push quickRetNode sourceNode: ret sourceNode).
	seq remove: ret.
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRFix>>convertStorePop: assoc forSeq: seq  [
	| store pop |
	store := assoc key.
	pop := assoc value.
	seq replaceNode: store withNode: (store popIntoNode sourceNode: store sourceNode).
	seq remove: pop.
]

{
	#category : #initialize,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRFix>>initialize [

	super initialize.

	storePopToFix := OrderedCollection new.
	retToFix := OrderedCollection new.
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRFix>>visitInstruction: instr [
	self visitNode: instr.
	prevInstr := instr.
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRFix>>visitPop: pop [
	prevInstr ifNil: [ ^ self ].
	prevInstr isStore ifFalse: [ ^ self ].
	"store then pop, however, cannot remove instr while iterating over the collection"
	storePopToFix add: prevInstr -> pop.
	
	
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRFix>>visitReturn: ret [
	prevInstr ifNil: [ ^ self ].
	prevInstr canBeQuickReturn ifFalse: [ ^ self ].
	retToFix add: prevInstr -> ret.
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRFix>>visitSequence: instructionSequence [
	prevInstr := nil.
	storePopToFix reset.
	retToFix reset.
	super visitSequence: instructionSequence.
	retToFix do: [ :each | self convertRet: each forSeq: instructionSequence ].
	storePopToFix do: [ :each | self convertStorePop: each forSeq: instructionSequence ]
]
