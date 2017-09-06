"
Instruction ""if: boolean goto: labelNum1 otherwise: labelNum2""
"
Class {
	#name : #IRJumpIf,
	#superclass : #IRJump,
	#instVars : [
		'boolean',
		'otherwise'
	],
	#category : #OpalCompiler-Core-IR-Nodes,
	#timestamp : 'ajh 3/24/2003 23:56'
}

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRJumpIf>>accept: aVisitor [
	^ aVisitor visitJumpIf: self
]

{
	#category : #acessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRJumpIf>>boolean [

	^ boolean
]

{
	#category : #acessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRJumpIf>>boolean: bool [

	boolean := bool
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRJumpIf>>isGoto [
	"is unconditional jump"

	^ false
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRJumpIf>>isIf [

	^ true
]

{
	#category : #acessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRJumpIf>>nextBytecodeOffsetAfterJump [
	"check if we are in ifTrue:ifFalse: / ifFalse:ifTrue: or in ifTrue: / ifFalse: and answers the next byte code offset"
	^destination last isJump 
		ifTrue: [ destination last destination first bytecodeOffset ]
		ifFalse: [ 
			(destination sequence at: ((destination size - 1) max: 1)) bytecodeOffset ]
]

{
	#category : #acessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRJumpIf>>nonBodySuccessorSequences [

	^ {destination}
]

{
	#category : #acessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRJumpIf>>otherwise [

	^ otherwise
]

{
	#category : #acessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRJumpIf>>otherwise: aSequence [

	otherwise := aSequence
]

{
	#category : #acessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRJumpIf>>successorSequences [

	^ {destination. otherwise}
]
