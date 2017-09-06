"
Instruction ""goto: labelNum""
"
Class {
	#name : #IRJump,
	#superclass : #IRInstruction,
	#instVars : [
		'destination',
		'successor'
	],
	#category : #OpalCompiler-Core-IR-Nodes,
	#timestamp : 'ajh 3/24/2003 23:56'
}

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRJump>>accept: aVisitor [
	^ aVisitor visitJump: self
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRJump>>destination [

	^ destination
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRJump>>destination: aSequence [
	destination := aSequence
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRJump>>isGoto [
	"is unconditional jump"

	^ true
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRJump>>isJump [
	"goto or if"

	^ true
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRJump>>successor [
	^successor
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRJump>>successor: succ [
	successor := succ
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRJump>>successorSequences [

	^ {destination. successor} 
]
